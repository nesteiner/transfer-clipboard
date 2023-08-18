package com.transferclipboard.backend.controller

import com.transferclipboard.backend.exception.BadRequestException
import com.transferclipboard.backend.protobuf.*
import com.transferclipboard.backend.protobuf.ProtobufData.OnlineUsers
import com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse
import com.transferclipboard.backend.request.InsertTextRequest
import com.transferclipboard.backend.service.FileService
import com.transferclipboard.backend.service.ImageService
import com.transferclipboard.backend.service.TextService
import jakarta.validation.Valid
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.validation.BindingResult
import org.springframework.validation.annotation.Validated
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.multipart.MultipartFile

@RestController
@RequestMapping("/clipboard")
@Validated
class ClipboardController {
    @Autowired
    lateinit var textService: TextService
    @Autowired
    lateinit var imageService: ImageService
    @Autowired
    lateinit var fileService: FileService

    @PostMapping("/text")
    fun insertText(@RequestBody @Valid request: InsertTextRequest, bindingResult: BindingResult): TransferQueryResponse {
        val result = textService.insertOne(request)
        return transferQueryResponse {
            type = TransferQueryResponse.DataType.TEXT
            text = result
        }
    }

    @GetMapping("/text")
    fun findTexts(): ProtobufData.TransferQueryAllResponse {
        return transferQueryAllResponse {
            type = ProtobufData.TransferQueryAllResponse.DataType.TEXT_LIST
            texts = textList {
                list += textService.findAll()
            }
        }
    }

    @GetMapping("/text/{id}")
    fun findText(@PathVariable("id") id: Int): ProtobufData.TransferQueryResponse {
        val text = textService.findOne(id)
        if (text == null) {
            throw BadRequestException("no such text")
        } else {
            return transferQueryResponse {
                type = ProtobufData.TransferQueryResponse.DataType.TEXT
                this.text = text
            }
        }
    }

    @DeleteMapping("/text/{id}")
    fun deleteText(@PathVariable id: Int) {
        textService.deleteOne(id)
    }

    @PostMapping("/image")
    fun insertImage(@RequestParam("file") file: MultipartFile): TransferQueryResponse {
        val result = imageService.insertOne(file)
        return transferQueryResponse {
            type = TransferQueryResponse.DataType.IMAGE
            this.image = result
        }
    }

    @GetMapping("/image")
    fun findImages(): ProtobufData.TransferQueryAllResponse {
        val result = imageService.findAll()
        return transferQueryAllResponse {
            type = ProtobufData.TransferQueryAllResponse.DataType.IMAGE_LIST
            images = imageList {
                list += result
            }
        }
    }

    @GetMapping("/image/{name}")
    fun findImage(@PathVariable("name") name: String): TransferQueryResponse {
        val image = imageService.findOne(name)
        if (image == null) {
            throw BadRequestException("no such image")
        } else {
            return transferQueryResponse {
                type = TransferQueryResponse.DataType.IMAGE
                this.image = image
            }
        }
    }

    @DeleteMapping("/image/{name}")
    fun deleteImage(@PathVariable("name") name: String) {
        imageService.deleteOne(name)
    }

    @PostMapping("/file")
    fun insertFile(@RequestParam("file") file: MultipartFile): TransferQueryResponse {
        val result = fileService.insertOne(file)
        return transferQueryResponse {
            type = TransferQueryResponse.DataType.FILE
            this.file = result
        }
    }

    @GetMapping("/file")
    fun findFiles(): ProtobufData.TransferQueryAllResponse {
        val result = fileService.findAll()
        return transferQueryAllResponse {
            type = ProtobufData.TransferQueryAllResponse.DataType.FILE_LIST
            files = fileList {
                list += result
            }
        }
    }

    @GetMapping("/file/{name}")
    fun findFile(@PathVariable("name") name: String): TransferQueryResponse {
        val image = fileService.findOne(name)
        if (image == null) {
            throw BadRequestException("no such file")
        } else {
            return transferQueryResponse {
                type = TransferQueryResponse.DataType.FILE
                this.file = file
            }
        }
    }

    @DeleteMapping("/file/{name}")
    fun deleteFile(@PathVariable("name") name: String) {
        fileService.deleteOne(name)
    }

    @GetMapping("/user")
    fun findOnlineUsers(): OnlineUsers {
        val users = TransferEndpoint.socketmap.keys.toList()
        return onlineUsers {
            this.users += users
        }
    }
}