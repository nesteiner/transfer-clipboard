package com.transferclipboard.backend

import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import java.awt.Toolkit
import java.awt.datatransfer.StringSelection

@SpringBootTest
class BackendApplicationTests {

	@Test
	fun copyToClipboard() {
		val info = "Hello World"
		val clipboard = Toolkit.getDefaultToolkit().systemClipboard
		val text = StringSelection(info)
		clipboard.setContents(text, null)
	}

}
