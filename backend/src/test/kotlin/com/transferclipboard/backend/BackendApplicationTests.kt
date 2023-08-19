package com.transferclipboard.backend

import com.transferclipboard.backend.service.ImageService
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import java.awt.Toolkit
import java.awt.datatransfer.StringSelection

@SpringBootTest
class BackendApplicationTests {
	@Autowired
	lateinit var imageService: ImageService

	@Test
	fun findImage() {
		val name = "44.jpg"
		val image = imageService.findOne(name)
		print(image)
	}

}
