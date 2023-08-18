package com.transferclipboard.backend.configure

import org.springframework.boot.context.properties.ConfigurationProperties

@ConfigurationProperties(prefix = "file.storage")
class FileStorageConfigure(
    val url: String
)