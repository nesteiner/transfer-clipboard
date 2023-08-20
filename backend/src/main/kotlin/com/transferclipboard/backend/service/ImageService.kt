package com.transferclipboard.backend.service

import com.transferclipboard.backend.configure.FileStorageConfigure
import com.transferclipboard.backend.constant.oneKB
import com.transferclipboard.backend.constant.oneMB
import com.transferclipboard.backend.protobuf.ProtobufData.Image
import com.transferclipboard.backend.protobuf.image
import com.transferclipboard.backend.table.Images
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.deleteWhere
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.selectAll
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.io.File
import java.util.*

@Service
@Transactional
class ImageService {
    @Autowired
    lateinit var fileStorageConfigure: FileStorageConfigure

    fun insertOne(file: MultipartFile): Image {
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

        file.transferTo(File(path))

        val id = Images.insert {
            it[name] = filename
            it[this.path] = path
            it[this.size] = size
        } get Images.id

        return image {
            this.id = id.value
            this.name = filename
            this.path = path
            this.size = size
        }
    }

    fun deleteOne(name: String) {
        val path = Images.select(Images.name eq name).firstOrNull()?.let {
            it[Images.path]
        }

        if (path != null) {
            File(path).delete()
        }

        Images.deleteWhere {
            this.name eq name
        }
    }

    fun findAll(): List<Image> {
        return Images.selectAll()
            .map {
                image {
                    id = it[Images.id].value
                    name = it[Images.name]
                    path = it[Images.path]
                    size = it[Images.size]
                }
            }
    }

    fun findOne(name: String): Image? {
        return Images.select(Images.name eq name)
            .firstOrNull()?.let {
                image {
                    this.id = it[Images.id].value
                    this.name = it[Images.name]
                    path = it[Images.path]
                    size = it[Images.size]
                }
            }
    }
}