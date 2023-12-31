package com.transferclipboard.backend.util

sealed class Response<T> {
    data class Ok<T>(val message: String, val data: T): Response<T>()
    data class Err(val message: String): Response<Unit>()
}