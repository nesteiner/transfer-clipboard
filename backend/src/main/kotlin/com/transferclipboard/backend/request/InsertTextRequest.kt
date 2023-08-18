package com.transferclipboard.backend.request

import jakarta.validation.constraints.NotNull

class InsertTextRequest(
    @NotNull(message = "text cannot be null")
    val text: String
)