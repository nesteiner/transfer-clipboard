package com.transferclipboard.backend

import com.fasterxml.jackson.databind.ObjectMapper
import com.transferclipboard.backend.table.Files
import com.transferclipboard.backend.table.Images
import com.transferclipboard.backend.table.Texts
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.transaction
import org.junit.jupiter.api.Test
import java.io.File

class BackendTests {
    @Test
    fun injectData() {
        Database.connect("jdbc:postgresql://localhost/transfer-clipboard", user = "steiner", password = "779151714", driver = "org.postgresql.Driver")
        transaction {
            addLogger(StdOutSqlLogger)
            SchemaUtils.drop(Files, Images, Files)
            SchemaUtils.create(Files, Images, Texts)
            Files.selectAll().map {
                it[Files.path]
            }.forEach {
                File(it).delete()
            }

            Images.selectAll().map {
                it[Images.path]
            }.forEach {
                File(it).delete()
            }

            Texts.deleteAll()
            Files.deleteAll()
            Images.deleteAll()

            Texts.insert {
                it[id] = 1
                it[text] = "hello world"
            }
        }


    }
}