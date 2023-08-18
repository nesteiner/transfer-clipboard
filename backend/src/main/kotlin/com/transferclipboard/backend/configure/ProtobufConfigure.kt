package com.transferclipboard.backend.configure

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.converter.protobuf.ProtobufHttpMessageConverter
import org.springframework.web.client.RestTemplate
import java.util.Collections

@Configuration
class ProtobufConfigure {
    @Bean
    fun protobufHttpMessageConverter(): ProtobufHttpMessageConverter {
        return ProtobufHttpMessageConverter()
    }

    @Bean
    fun restTemplate(protobufHttpMessageConverter: ProtobufHttpMessageConverter): RestTemplate {
        return RestTemplate(listOf(protobufHttpMessageConverter))
    }
}