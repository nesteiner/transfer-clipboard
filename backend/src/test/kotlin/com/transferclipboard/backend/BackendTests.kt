package com.transferclipboard.backend

import com.fasterxml.jackson.databind.ObjectMapper
import com.transferclipboard.backend.table.Files
import com.transferclipboard.backend.table.Images
import com.transferclipboard.backend.table.Texts
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.transaction
import org.junit.jupiter.api.Test

class BackendTests {
    @Test
    fun injectData() {
        Database.connect("jdbc:postgresql://localhost/transfer-clipboard", user = "steiner", password = "779151714", driver = "org.postgresql.Driver")
        transaction {
            addLogger(StdOutSqlLogger)
            SchemaUtils.create(Files, Images, Texts)
            Texts.deleteAll()
            Files.deleteAll()
            Images.deleteAll()

            Texts.insert {
                it[id] = 1
                it[text] = "hello world"
            }

            Files.insert {
                it[id] = 1
                it[name] = "hello"
                it[path] = "/home/steiner/disk/windows-data/Download/dotnet-install.sh"
                it[size] = "56.9 KB"
            }

            Images.insert {
                it[id] = 1
                it[name] = "hello"
                it[path] = "/home/steiner/disk/windows-data/Download/cake/[MFStar] VOL.013 娇艳小萝莉徐cake性感私房第二套高清写真美图录/2.jpg"
                it[size] = "221.3 KB"
            }
        }


    }

}