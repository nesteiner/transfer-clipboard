//
//  Generated code. Do not modify.
//  source: .proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '.proto.pbenum.dart';

export '.proto.pbenum.dart';

enum TransferData_Data {
  text, 
  image, 
  file, 
  message, 
  error, 
  notSet
}

class TransferData extends $pb.GeneratedMessage {
  factory TransferData() => create();
  TransferData._() : super();
  factory TransferData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransferData_Data> _TransferData_DataByTag = {
    4 : TransferData_Data.text,
    5 : TransferData_Data.image,
    6 : TransferData_Data.file,
    7 : TransferData_Data.message,
    8 : TransferData_Data.error,
    0 : TransferData_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferData', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'fromuid')
    ..aOS(2, _omitFieldNames ? '' : 'touid')
    ..e<TransferData_DataType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TransferData_DataType.ERROR, valueOf: TransferData_DataType.valueOf, enumValues: TransferData_DataType.values)
    ..aOM<Text>(4, _omitFieldNames ? '' : 'text', subBuilder: Text.create)
    ..aOM<Image>(5, _omitFieldNames ? '' : 'image', subBuilder: Image.create)
    ..aOM<File>(6, _omitFieldNames ? '' : 'file', subBuilder: File.create)
    ..aOS(7, _omitFieldNames ? '' : 'message')
    ..aOS(8, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferData clone() => TransferData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferData copyWith(void Function(TransferData) updates) => super.copyWith((message) => updates(message as TransferData)) as TransferData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferData create() => TransferData._();
  TransferData createEmptyInstance() => create();
  static $pb.PbList<TransferData> createRepeated() => $pb.PbList<TransferData>();
  @$core.pragma('dart2js:noInline')
  static TransferData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferData>(create);
  static TransferData? _defaultInstance;

  TransferData_Data whichData() => _TransferData_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get fromuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get touid => $_getSZ(1);
  @$pb.TagNumber(2)
  set touid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTouid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTouid() => clearField(2);

  @$pb.TagNumber(3)
  TransferData_DataType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(TransferData_DataType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  Text get text => $_getN(3);
  @$pb.TagNumber(4)
  set text(Text v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);
  @$pb.TagNumber(4)
  Text ensureText() => $_ensure(3);

  @$pb.TagNumber(5)
  Image get image => $_getN(4);
  @$pb.TagNumber(5)
  set image(Image v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => clearField(5);
  @$pb.TagNumber(5)
  Image ensureImage() => $_ensure(4);

  @$pb.TagNumber(6)
  File get file => $_getN(5);
  @$pb.TagNumber(6)
  set file(File v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFile() => $_has(5);
  @$pb.TagNumber(6)
  void clearFile() => clearField(6);
  @$pb.TagNumber(6)
  File ensureFile() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get message => $_getSZ(6);
  @$pb.TagNumber(7)
  set message($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearMessage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get error => $_getSZ(7);
  @$pb.TagNumber(8)
  set error($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(8)
  void clearError() => clearField(8);
}

class OnlineUsers extends $pb.GeneratedMessage {
  factory OnlineUsers() => create();
  OnlineUsers._() : super();
  factory OnlineUsers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnlineUsers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OnlineUsers', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'users')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnlineUsers clone() => OnlineUsers()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnlineUsers copyWith(void Function(OnlineUsers) updates) => super.copyWith((message) => updates(message as OnlineUsers)) as OnlineUsers;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnlineUsers create() => OnlineUsers._();
  OnlineUsers createEmptyInstance() => create();
  static $pb.PbList<OnlineUsers> createRepeated() => $pb.PbList<OnlineUsers>();
  @$core.pragma('dart2js:noInline')
  static OnlineUsers getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnlineUsers>(create);
  static OnlineUsers? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get users => $_getList(0);
}

enum TransferQueryAllResponse_Data {
  texts, 
  images, 
  files, 
  notSet
}

class TransferQueryAllResponse extends $pb.GeneratedMessage {
  factory TransferQueryAllResponse() => create();
  TransferQueryAllResponse._() : super();
  factory TransferQueryAllResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferQueryAllResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransferQueryAllResponse_Data> _TransferQueryAllResponse_DataByTag = {
    2 : TransferQueryAllResponse_Data.texts,
    3 : TransferQueryAllResponse_Data.images,
    4 : TransferQueryAllResponse_Data.files,
    0 : TransferQueryAllResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferQueryAllResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<TransferQueryAllResponse_DataType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TransferQueryAllResponse_DataType.TEXT_LIST, valueOf: TransferQueryAllResponse_DataType.valueOf, enumValues: TransferQueryAllResponse_DataType.values)
    ..aOM<TextList>(2, _omitFieldNames ? '' : 'texts', subBuilder: TextList.create)
    ..aOM<ImageList>(3, _omitFieldNames ? '' : 'images', subBuilder: ImageList.create)
    ..aOM<FileList>(4, _omitFieldNames ? '' : 'files', subBuilder: FileList.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferQueryAllResponse clone() => TransferQueryAllResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferQueryAllResponse copyWith(void Function(TransferQueryAllResponse) updates) => super.copyWith((message) => updates(message as TransferQueryAllResponse)) as TransferQueryAllResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferQueryAllResponse create() => TransferQueryAllResponse._();
  TransferQueryAllResponse createEmptyInstance() => create();
  static $pb.PbList<TransferQueryAllResponse> createRepeated() => $pb.PbList<TransferQueryAllResponse>();
  @$core.pragma('dart2js:noInline')
  static TransferQueryAllResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferQueryAllResponse>(create);
  static TransferQueryAllResponse? _defaultInstance;

  TransferQueryAllResponse_Data whichData() => _TransferQueryAllResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TransferQueryAllResponse_DataType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TransferQueryAllResponse_DataType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  TextList get texts => $_getN(1);
  @$pb.TagNumber(2)
  set texts(TextList v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTexts() => $_has(1);
  @$pb.TagNumber(2)
  void clearTexts() => clearField(2);
  @$pb.TagNumber(2)
  TextList ensureTexts() => $_ensure(1);

  @$pb.TagNumber(3)
  ImageList get images => $_getN(2);
  @$pb.TagNumber(3)
  set images(ImageList v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImages() => $_has(2);
  @$pb.TagNumber(3)
  void clearImages() => clearField(3);
  @$pb.TagNumber(3)
  ImageList ensureImages() => $_ensure(2);

  @$pb.TagNumber(4)
  FileList get files => $_getN(3);
  @$pb.TagNumber(4)
  set files(FileList v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFiles() => $_has(3);
  @$pb.TagNumber(4)
  void clearFiles() => clearField(4);
  @$pb.TagNumber(4)
  FileList ensureFiles() => $_ensure(3);
}

enum TransferQueryResponse_Data {
  text, 
  image, 
  file, 
  notSet
}

class TransferQueryResponse extends $pb.GeneratedMessage {
  factory TransferQueryResponse() => create();
  TransferQueryResponse._() : super();
  factory TransferQueryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferQueryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TransferQueryResponse_Data> _TransferQueryResponse_DataByTag = {
    2 : TransferQueryResponse_Data.text,
    3 : TransferQueryResponse_Data.image,
    4 : TransferQueryResponse_Data.file,
    0 : TransferQueryResponse_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferQueryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<TransferQueryResponse_DataType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TransferQueryResponse_DataType.TEXT, valueOf: TransferQueryResponse_DataType.valueOf, enumValues: TransferQueryResponse_DataType.values)
    ..aOM<Text>(2, _omitFieldNames ? '' : 'text', subBuilder: Text.create)
    ..aOM<Image>(3, _omitFieldNames ? '' : 'image', subBuilder: Image.create)
    ..aOM<File>(4, _omitFieldNames ? '' : 'file', subBuilder: File.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferQueryResponse clone() => TransferQueryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferQueryResponse copyWith(void Function(TransferQueryResponse) updates) => super.copyWith((message) => updates(message as TransferQueryResponse)) as TransferQueryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferQueryResponse create() => TransferQueryResponse._();
  TransferQueryResponse createEmptyInstance() => create();
  static $pb.PbList<TransferQueryResponse> createRepeated() => $pb.PbList<TransferQueryResponse>();
  @$core.pragma('dart2js:noInline')
  static TransferQueryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferQueryResponse>(create);
  static TransferQueryResponse? _defaultInstance;

  TransferQueryResponse_Data whichData() => _TransferQueryResponse_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TransferQueryResponse_DataType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TransferQueryResponse_DataType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  Text get text => $_getN(1);
  @$pb.TagNumber(2)
  set text(Text v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
  @$pb.TagNumber(2)
  Text ensureText() => $_ensure(1);

  @$pb.TagNumber(3)
  Image get image => $_getN(2);
  @$pb.TagNumber(3)
  set image(Image v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
  @$pb.TagNumber(3)
  Image ensureImage() => $_ensure(2);

  @$pb.TagNumber(4)
  File get file => $_getN(3);
  @$pb.TagNumber(4)
  set file(File v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFile() => $_has(3);
  @$pb.TagNumber(4)
  void clearFile() => clearField(4);
  @$pb.TagNumber(4)
  File ensureFile() => $_ensure(3);
}

class Text extends $pb.GeneratedMessage {
  factory Text() => create();
  Text._() : super();
  factory Text.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Text.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Text', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Text clone() => Text()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Text copyWith(void Function(Text) updates) => super.copyWith((message) => updates(message as Text)) as Text;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Text create() => Text._();
  Text createEmptyInstance() => create();
  static $pb.PbList<Text> createRepeated() => $pb.PbList<Text>();
  @$core.pragma('dart2js:noInline')
  static Text getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Text>(create);
  static Text? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
}

class Image extends $pb.GeneratedMessage {
  factory Image() => create();
  Image._() : super();
  factory Image.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Image.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Image', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'path')
    ..aOS(4, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Image clone() => Image()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Image copyWith(void Function(Image) updates) => super.copyWith((message) => updates(message as Image)) as Image;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  Image createEmptyInstance() => create();
  static $pb.PbList<Image> createRepeated() => $pb.PbList<Image>();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get size => $_getSZ(3);
  @$pb.TagNumber(4)
  set size($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);
}

class File extends $pb.GeneratedMessage {
  factory File() => create();
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'File', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'path')
    ..aOS(4, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get size => $_getSZ(3);
  @$pb.TagNumber(4)
  set size($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);
}

class TextList extends $pb.GeneratedMessage {
  factory TextList() => create();
  TextList._() : super();
  factory TextList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..pc<Text>(1, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM, subBuilder: Text.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextList clone() => TextList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextList copyWith(void Function(TextList) updates) => super.copyWith((message) => updates(message as TextList)) as TextList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextList create() => TextList._();
  TextList createEmptyInstance() => create();
  static $pb.PbList<TextList> createRepeated() => $pb.PbList<TextList>();
  @$core.pragma('dart2js:noInline')
  static TextList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextList>(create);
  static TextList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Text> get list => $_getList(0);
}

class ImageList extends $pb.GeneratedMessage {
  factory ImageList() => create();
  ImageList._() : super();
  factory ImageList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..pc<Image>(2, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM, subBuilder: Image.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageList clone() => ImageList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageList copyWith(void Function(ImageList) updates) => super.copyWith((message) => updates(message as ImageList)) as ImageList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageList create() => ImageList._();
  ImageList createEmptyInstance() => create();
  static $pb.PbList<ImageList> createRepeated() => $pb.PbList<ImageList>();
  @$core.pragma('dart2js:noInline')
  static ImageList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageList>(create);
  static ImageList? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<Image> get list => $_getList(0);
}

class FileList extends $pb.GeneratedMessage {
  factory FileList() => create();
  FileList._() : super();
  factory FileList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileList', package: const $pb.PackageName(_omitMessageNames ? '' : 'protobuf'), createEmptyInstance: create)
    ..pc<File>(3, _omitFieldNames ? '' : 'list', $pb.PbFieldType.PM, subBuilder: File.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileList clone() => FileList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileList copyWith(void Function(FileList) updates) => super.copyWith((message) => updates(message as FileList)) as FileList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileList create() => FileList._();
  FileList createEmptyInstance() => create();
  static $pb.PbList<FileList> createRepeated() => $pb.PbList<FileList>();
  @$core.pragma('dart2js:noInline')
  static FileList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileList>(create);
  static FileList? _defaultInstance;

  @$pb.TagNumber(3)
  $core.List<File> get list => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
