package com.transferclipboard.backend

import com.transferclipboard.backend.configure.FileStorageConfigure
import org.jetbrains.exposed.spring.autoconfigure.ExposedAutoConfiguration
import org.springframework.boot.autoconfigure.ImportAutoConfiguration
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication


@SpringBootApplication
@ImportAutoConfiguration(ExposedAutoConfiguration::class)
@EnableConfigurationProperties(FileStorageConfigure::class)
class BackendApplication

fun main(args: Array<String>) {
	runApplication<BackendApplication>(*args)
}
