package com.transferclipboard.backend.configure

import com.transferclipboard.backend.exception.BadRequestException
import com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse
import com.transferclipboard.backend.protobuf.transferQueryResponse
import com.transferclipboard.backend.util.Response
import jakarta.validation.ConstraintViolationException
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestControllerAdvice
import java.io.IOException
import java.lang.StringBuilder

@RestControllerAdvice
class GlobalExceptionHandler {
    @ExceptionHandler(ConstraintViolationException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleException(exception: ConstraintViolationException): TransferQueryResponse {
        val message = StringBuilder()
        val constraintViolations = exception.constraintViolations
        constraintViolations.forEach {
            val _message = it.message
            message.append("[").append(_message).append("]")
        }

        return transferQueryResponse {
            type = TransferQueryResponse.DataType.ERROR
            error = message.toString()
        }
    }

    @ExceptionHandler(IOException::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleException(exception: IOException): TransferQueryResponse {
        return exception.message.let {
            transferQueryResponse {
                type = TransferQueryResponse.DataType.ERROR
                error = it ?: "Fuck"
            }
        }
    }

    @ExceptionHandler(BadRequestException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleException(exception: BadRequestException): TransferQueryResponse {
        return exception.message.let {
            transferQueryResponse {
                type = TransferQueryResponse.DataType.ERROR
                error = it
            }
        }
    }

    @ExceptionHandler(Exception::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleException(exception: Exception): TransferQueryResponse {
        exception.printStackTrace()
        return exception.message.let {
            transferQueryResponse {
                type = TransferQueryResponse.DataType.ERROR
                error = it ?: "Fuck"
            }
        }
    }
}