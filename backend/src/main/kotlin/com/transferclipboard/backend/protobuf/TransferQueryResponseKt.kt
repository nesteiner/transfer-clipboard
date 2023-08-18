// Generated by the protocol buffer compiler. DO NOT EDIT!
// source: .proto

// Generated files should ignore deprecation warnings
@file:Suppress("DEPRECATION")
package com.transferclipboard.backend.protobuf;

@kotlin.jvm.JvmName("-initializetransferQueryResponse")
public inline fun transferQueryResponse(block: com.transferclipboard.backend.protobuf.TransferQueryResponseKt.Dsl.() -> kotlin.Unit): com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse =
  com.transferclipboard.backend.protobuf.TransferQueryResponseKt.Dsl._create(com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.newBuilder()).apply { block() }._build()
/**
 * Protobuf type `protobuf.TransferQueryResponse`
 */
public object TransferQueryResponseKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse = _builder.build()

    /**
     * `.protobuf.TransferQueryResponse.DataType type = 1;`
     */
    public var type: com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.DataType
      @JvmName("getType")
      get() = _builder.getType()
      @JvmName("setType")
      set(value) {
        _builder.setType(value)
      }
    public var typeValue: kotlin.Int
      @JvmName("getTypeValue")
      get() = _builder.getTypeValue()
      @JvmName("setTypeValue")
      set(value) {
        _builder.setTypeValue(value)
      }
    /**
     * `.protobuf.TransferQueryResponse.DataType type = 1;`
     */
    public fun clearType() {
      _builder.clearType()
    }

    /**
     * `.protobuf.Text text = 2;`
     */
    public var text: com.transferclipboard.backend.protobuf.ProtobufData.Text
      @JvmName("getText")
      get() = _builder.getText()
      @JvmName("setText")
      set(value) {
        _builder.setText(value)
      }
    /**
     * `.protobuf.Text text = 2;`
     */
    public fun clearText() {
      _builder.clearText()
    }
    /**
     * `.protobuf.Text text = 2;`
     * @return Whether the text field is set.
     */
    public fun hasText(): kotlin.Boolean {
      return _builder.hasText()
    }

    /**
     * `.protobuf.Image image = 3;`
     */
    public var image: com.transferclipboard.backend.protobuf.ProtobufData.Image
      @JvmName("getImage")
      get() = _builder.getImage()
      @JvmName("setImage")
      set(value) {
        _builder.setImage(value)
      }
    /**
     * `.protobuf.Image image = 3;`
     */
    public fun clearImage() {
      _builder.clearImage()
    }
    /**
     * `.protobuf.Image image = 3;`
     * @return Whether the image field is set.
     */
    public fun hasImage(): kotlin.Boolean {
      return _builder.hasImage()
    }

    /**
     * `.protobuf.File file = 4;`
     */
    public var file: com.transferclipboard.backend.protobuf.ProtobufData.File
      @JvmName("getFile")
      get() = _builder.getFile()
      @JvmName("setFile")
      set(value) {
        _builder.setFile(value)
      }
    /**
     * `.protobuf.File file = 4;`
     */
    public fun clearFile() {
      _builder.clearFile()
    }
    /**
     * `.protobuf.File file = 4;`
     * @return Whether the file field is set.
     */
    public fun hasFile(): kotlin.Boolean {
      return _builder.hasFile()
    }
    public val dataCase: com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.DataCase
      @JvmName("getDataCase")
      get() = _builder.getDataCase()

    public fun clearData() {
      _builder.clearData()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse.copy(block: com.transferclipboard.backend.protobuf.TransferQueryResponseKt.Dsl.() -> kotlin.Unit): com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponse =
  com.transferclipboard.backend.protobuf.TransferQueryResponseKt.Dsl._create(this.toBuilder()).apply { block() }._build()

public val com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponseOrBuilder.textOrNull: com.transferclipboard.backend.protobuf.ProtobufData.Text?
  get() = if (hasText()) getText() else null

public val com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponseOrBuilder.imageOrNull: com.transferclipboard.backend.protobuf.ProtobufData.Image?
  get() = if (hasImage()) getImage() else null

public val com.transferclipboard.backend.protobuf.ProtobufData.TransferQueryResponseOrBuilder.fileOrNull: com.transferclipboard.backend.protobuf.ProtobufData.File?
  get() = if (hasFile()) getFile() else null

