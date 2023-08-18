package com.transferclipboard.backend.table

import org.jetbrains.exposed.dao.id.IntIdTable

object Texts: IntIdTable() {
    val text = varchar("text", 1024)
}