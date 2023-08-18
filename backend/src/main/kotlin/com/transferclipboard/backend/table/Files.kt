package com.transferclipboard.backend.table

import org.jetbrains.exposed.dao.id.IntIdTable

object Files: IntIdTable() {
    val name = varchar("name", 128).uniqueIndex()
    val path = varchar("path", 128).uniqueIndex()
    val size = varchar("size", 16)
}