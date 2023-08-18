package com.transferclipboard.backend.service

import com.transferclipboard.backend.protobuf.ProtobufData.Text
import com.transferclipboard.backend.protobuf.text
import com.transferclipboard.backend.request.InsertTextRequest
import com.transferclipboard.backend.table.Texts
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.deleteWhere
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.selectAll
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional
class TextService {
    fun insertOne(request: InsertTextRequest): Text {
        val id = Texts.insert {
            it[text] = request.text
        } get Texts.id

        return text {
            this.id = id.value
            text = request.text
        }
    }

    fun deleteOne(id: Int) {
        Texts.deleteWhere {
            this.id eq id
        }
    }

    fun findAll(): List<Text> {
        return Texts.selectAll()
            .map {
                text {
                    id = it[Texts.id].value
                    text = it[Texts.text]
                }
            }
    }

    fun findOne(id: Int): Text? {
        return Texts.select(Texts.id eq id)
            .firstOrNull()?.let {
                text {
                    this.id = it[Texts.id].value
                    text = it[Texts.text]
                }
            }
    }
}