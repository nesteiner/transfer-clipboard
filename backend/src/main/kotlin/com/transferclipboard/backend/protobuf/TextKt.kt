// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: .proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package com.transferclipboard.backend.protobuf;

@kotlin.jvm.JvmName("-initializetext")
public inline fun text(block: com.transferclipboard.backend.protobuf.TextKt.Dsl.() -> kotlin.Unit): com.transferclipboard.backend.protobuf.ProtobufData.Text =
  com.transferclipboard.backend.protobuf.TextKt.Dsl._create(com.transferclipboard.backend.protobuf.ProtobufData.Text.newBuilder()).apply { block() }._build()
/**
 * Protobuf type `protobuf.Text`
 */
public object TextKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: com.transferclipboard.backend.protobuf.ProtobufData.Text.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: com.transferclipboard.backend.protobuf.ProtobufData.Text.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): com.transferclipboard.backend.protobuf.ProtobufData.Text = _builder.build()

    /**
     * `uint32 id = 1;`
     */
    public var id: kotlin.Int
      @JvmName("getId")
      get() = _builder.getId()
      @JvmName("setId")
      set(value) {
        _builder.setId(value)
      }
    /**
     * `uint32 id = 1;`
     */
    public fun clearId() {
      _builder.clearId()
    }

    /**
     * `string text = 2;`
     */
    public var text: kotlin.String
      @JvmName("getText")
      get() = _builder.getText()
      @JvmName("setText")
      set(value) {
        _builder.setText(value)
      }
    /**
     * `string text = 2;`
     */
    public fun clearText() {
      _builder.clearText()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun com.transferclipboard.backend.protobuf.ProtobufData.Text.copy(block: com.transferclipboard.backend.protobuf.TextKt.Dsl.() -> kotlin.Unit): com.transferclipboard.backend.protobuf.ProtobufData.Text =
  com.transferclipboard.backend.protobuf.TextKt.Dsl._create(this.toBuilder()).apply { block() }._build()
