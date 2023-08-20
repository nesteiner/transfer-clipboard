package com.transferclipboard.backend.service

import com.transferclipboard.backend.configure.FileStorageConfigure
import com.transferclipboard.backend.constant.oneKB
import com.transferclipboard.backend.constant.oneMB
import com.transferclipboard.backend.protobuf.ProtobufData
import com.transferclipboard.backend.protobuf.file
import com.transferclipboard.backend.table.Files
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.deleteWhere
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.selectAll
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.io.File
import java.util.*

@Service
@Transactional
class FileService {
    @Autowired
    lateinit var fileStorageConfigure: FileStorageConfigure

    fun insertOne(file: MultipartFile): ProtobufData.File {
        val filename = if (file.originalFilename != null) {
            "${UUID.randomUUID().toString().slice(1..10)}_${file.originalFilename}"
        } else {
            "${UUID.randomUUID().toString().slice(1..10)}_untitled"
        }

        val path = "${fileStorageConfigure.url}/${UUID.randomUUID().toString().slice(1..10)}_${filename}"
        val size = file.size.let {
            if (it > oneKB && it < oneMB) {
                "${it/oneKB} KB"
            } else if (it > oneMB) {
                "${it/oneMB} MB"
            } else {
                "${it} B"
            }
        }

        val id = Files.insert {
            it[name] = filename
            it[this.path] = path
            it[this.size] = size
        } get Files.id

        file.transferTo(File(path))

        return file {
            this.id = id.value
            name = filename
            this.path = path
            this.size = size
        }
    }

    fun deleteOne(name: String) {
        val path = Files.select(Files.name eq name).firstOrNull()?.let {
            it[Files.path]
        }

        if (path != null) {
            File(path).delete()
        }

        Files.deleteWhere {
            this.name eq name
        }


    }

    fun findAll(): List<ProtobufData.File> {
        return Files.selectAll()
            .map {
                file {
                    id = it[Files.id].value
                    name = it[Files.name]
                    path = it[Files.path]
                    size = it[Files.size]
                }
            }
    }

    fun findOne(name: String): ProtobufData.File? {
        return Files.select(Files.name eq name)
            .firstOrNull()?.let {
                file {
                    this.id = it[Files.id].value
                    this.name = it[Files.name]
                    path = it[Files.path]
                    size = it[Files.size]
                }
            }
    }

}