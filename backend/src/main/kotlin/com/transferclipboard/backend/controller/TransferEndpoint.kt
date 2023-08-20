package com.transferclipboard.backend.controller

import com.transferclipboard.backend.protobuf.ProtobufData
import com.transferclipboard.backend.protobuf.ProtobufData.TransferData
import com.transferclipboard.backend.protobuf.transferData
import jakarta.websocket.OnClose
import jakarta.websocket.OnError
import jakarta.websocket.OnMessage
import jakarta.websocket.OnOpen
import jakarta.websocket.Session
import jakarta.websocket.server.PathParam
import jakarta.websocket.server.ServerEndpoint
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import java.nio.ByteBuffer

@Component
@ServerEndpoint("/transfer/{uid}")
class TransferEndpoint {
    companion object {
        val socketmap = mutableMapOf<String, TransferEndpoint>()
        val logger = LoggerFactory.getLogger(TransferEndpoint::class.java)
        const val SERVER_NAME = "server"
    }

    lateinit var uid: String
    lateinit var session: Session

    @OnOpen
    fun onOpen(@PathParam("uid") uid: String, session: Session) {
        logger.info("get connection which uid is ${uid}")

        if (socketmap.containsKey(uid) || uid == SERVER_NAME) {
            val data = transferData {
                fromuid = SERVER_NAME
                touid = uid
                type = ProtobufData.TransferData.DataType.ERROR
                error = "duplicate connection name"
            }.let {
                ByteBuffer.wrap(it.toByteArray())
            }

            session.basicRemote.sendBinary(data)
        } else {
            this.uid = uid
            this.session = session
            socketmap.put(uid, this)
        }
    }

    @OnMessage
    fun onMessage(message: ByteArray, session: Session) {
        val transferdata = TransferData.parseFrom(message)
        val touid = transferdata.touid
        val socket = socketmap.get(touid)
        if (socket != null) {
            val data = ByteBuffer.wrap(transferdata.toByteArray())
            socket.session.basicRemote.sendBinary(data)
        } else {
            val response = transferData {
                fromuid = SERVER_NAME
                this.touid = transferdata.fromuid
                type = TransferData.DataType.ERROR
                error = "target is not online"
            }.let {
                ByteBuffer.wrap(it.toByteArray())
            }

            session.basicRemote.sendBinary(response)
        }
    }

    @OnError
    fun onError(session: Session, throwable: Throwable, @PathParam("uid") uid: String) {
        val data = transferData {
            fromuid = SERVER_NAME
            touid = uid
            type = TransferData.DataType.ERROR
            error = throwable.message ?: "fuck"
        }.let {
            ByteBuffer.wrap(it.toByteArray())
        }

        session.basicRemote.sendBinary(data)
        logger.error("error occurs: ${throwable.message ?: "fuck"}")
        throwable.printStackTrace()
        socketmap.remove(uid)
    }

    @OnClose
    fun onClose(@PathParam("uid") uid: String) {
        socketmap.remove(uid)
        logger.info("connection of ${uid} closed")
    }

    fun notifyData() {
        val data = transferData {
            fromuid = SERVER_NAME
            touid = uid
            type = TransferData.DataType.NOTIFICATION
            notification = "there is new data update"
        }.let {
            ByteBuffer.wrap(it.toByteArray())
        }

        session.basicRemote.sendBinary(data)

        logger.info("sended notification to ${uid}")
    }
}