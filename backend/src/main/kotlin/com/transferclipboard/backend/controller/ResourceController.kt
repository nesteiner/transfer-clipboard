package com.transferclipboard.backend.controller

import com.transferclipboard.backend.service.FileService
import com.transferclipboard.backend.service.ImageService
import jakarta.servlet.http.HttpServletResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.io.BufferedInputStream
import java.io.File
import java.io.FileInputStream

@RestController
@RequestMapping("/download")
class ResourceController {
    @Autowired
    lateinit var imageService: ImageService
    @Autowired
    lateinit var fileService: FileService

    @GetMapping("/image/{name}")
    fun findImage(@PathVariable("name") name: String, response: HttpServletResponse) {
        findOne(name, response, imageService)
    }

    @GetMapping("/file/{name}")
    fun findFile(@PathVariable("name") name: String, response: HttpServletResponse) {
        findOne(name, response, fileService)
    }

    private fun findOne(name: String, response: HttpServletResponse, service: ImageService) {
        val item = service.findOne(name)

        if (item != null) {
            val file = File(item.path)
            if (file.exists()) {
                response.reset()
                val buffer = ByteArray(1024)
                val fis = FileInputStream(file)
                val bis = BufferedInputStream(fis)
                val os = response.outputStream
                response.setContentLengthLong(file.length())

                var result = bis.read(buffer)
                while (result != -1) {
                    os.write(buffer, 0, result)
                    result = bis.read(buffer)
                }

                os.flush()
                fis.close()
                bis.close()
                os.close()
            }
        }
    }

    private fun findOne(name: String, response: HttpServletResponse, service: FileService) {
        val item = service.findOne(name)

        if (item != null) {
            val file = File(item.path)
            if (file.exists()) {
                response.reset()
                val buffer = ByteArray(1024)
                val fis = FileInputStream(file)
                val bis = BufferedInputStream(fis)
                val os = response.outputStream
                response.setContentLengthLong(file.length())

                var result = bis.read(buffer)
                while (result != -1) {
                    os.write(buffer, 0, result)
                    result = bis.read(buffer)
                }

                os.flush()
                fis.close()
                bis.close()
                os.close()
            }
        }
    }

}