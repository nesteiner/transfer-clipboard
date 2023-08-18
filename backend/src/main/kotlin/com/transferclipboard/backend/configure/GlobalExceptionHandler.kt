package com.transferclipboard.backend.configure

import com.transferclipboard.backend.exception.BadRequestException
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
    fun handleException(exception: ConstraintViolationException): Response.Err {
        val message = StringBuilder()
        val constraintViolations = exception.constraintViolations
        constraintViolations.forEach {
            val _message = it.message
            message.append("[").append(_message).append("]")
        }

        return Response.Err(message.toString())
    }

    @ExceptionHandler(IOException::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleException(exception: IOException): Response.Err {
        return exception.message.let {
            Response.Err(it ?: "ioexception")
        }
    }

    @ExceptionHandler(BadRequestException::class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    fun handleException(exception: BadRequestException): Response.Err {
        return exception.message.let {
            Response.Err(it)
        }
    }

    @ExceptionHandler(Exception::class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    fun handleException(exception: Exception): Response.Err {
        exception.printStackTrace()
        return exception.message.let {
            Response.Err(it ?: "fuck")
        }
    }
}