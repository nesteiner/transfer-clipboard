//
//  Generated code. Do not modify.
//  source: .proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transferDataDescriptor instead')
const TransferData$json = {
  '1': 'TransferData',
  '2': [
    {'1': 'fromuid', '3': 1, '4': 1, '5': 9, '10': 'fromuid'},
    {'1': 'touid', '3': 2, '4': 1, '5': 9, '10': 'touid'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.protobuf.TransferData.DataType', '10': 'type'},
    {'1': 'text', '3': 4, '4': 1, '5': 11, '6': '.protobuf.Text', '9': 0, '10': 'text'},
    {'1': 'image', '3': 5, '4': 1, '5': 11, '6': '.protobuf.Image', '9': 0, '10': 'image'},
    {'1': 'file', '3': 6, '4': 1, '5': 11, '6': '.protobuf.File', '9': 0, '10': 'file'},
    {'1': 'message', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'message'},
    {'1': 'error', '3': 8, '4': 1, '5': 9, '9': 0, '10': 'error'},
  ],
  '4': [TransferData_DataType$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use transferDataDescriptor instead')
const TransferData_DataType$json = {
  '1': 'DataType',
  '2': [
    {'1': 'ERROR', '2': 0},
    {'1': 'MESSAGE', '2': 1},
    {'1': 'TEXT', '2': 2},
    {'1': 'IMAGE', '2': 3},
    {'1': 'FILE', '2': 4},
  ],
};

/// Descriptor for `TransferData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDataDescriptor = $convert.base64Decode(
    'CgxUcmFuc2ZlckRhdGESGAoHZnJvbXVpZBgBIAEoCVIHZnJvbXVpZBIUCgV0b3VpZBgCIAEoCV'
    'IFdG91aWQSMwoEdHlwZRgDIAEoDjIfLnByb3RvYnVmLlRyYW5zZmVyRGF0YS5EYXRhVHlwZVIE'
    'dHlwZRIkCgR0ZXh0GAQgASgLMg4ucHJvdG9idWYuVGV4dEgAUgR0ZXh0EicKBWltYWdlGAUgAS'
    'gLMg8ucHJvdG9idWYuSW1hZ2VIAFIFaW1hZ2USJAoEZmlsZRgGIAEoCzIOLnByb3RvYnVmLkZp'
    'bGVIAFIEZmlsZRIaCgdtZXNzYWdlGAcgASgJSABSB21lc3NhZ2USFgoFZXJyb3IYCCABKAlIAF'
    'IFZXJyb3IiQQoIRGF0YVR5cGUSCQoFRVJST1IQABILCgdNRVNTQUdFEAESCAoEVEVYVBACEgkK'
    'BUlNQUdFEAMSCAoERklMRRAEQgYKBGRhdGE=');

@$core.Deprecated('Use onlineUsersDescriptor instead')
const OnlineUsers$json = {
  '1': 'OnlineUsers',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 9, '10': 'users'},
  ],
};

/// Descriptor for `OnlineUsers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onlineUsersDescriptor = $convert.base64Decode(
    'CgtPbmxpbmVVc2VycxIUCgV1c2VycxgBIAMoCVIFdXNlcnM=');

@$core.Deprecated('Use transferQueryAllResponseDescriptor instead')
const TransferQueryAllResponse$json = {
  '1': 'TransferQueryAllResponse',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protobuf.TransferQueryAllResponse.DataType', '10': 'type'},
    {'1': 'texts', '3': 2, '4': 1, '5': 11, '6': '.protobuf.TextList', '9': 0, '10': 'texts'},
    {'1': 'images', '3': 3, '4': 1, '5': 11, '6': '.protobuf.ImageList', '9': 0, '10': 'images'},
    {'1': 'files', '3': 4, '4': 1, '5': 11, '6': '.protobuf.FileList', '9': 0, '10': 'files'},
  ],
  '4': [TransferQueryAllResponse_DataType$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use transferQueryAllResponseDescriptor instead')
const TransferQueryAllResponse_DataType$json = {
  '1': 'DataType',
  '2': [
    {'1': 'TEXT_LIST', '2': 0},
    {'1': 'IMAGE_LIST', '2': 1},
    {'1': 'FILE_LIST', '2': 2},
  ],
};

/// Descriptor for `TransferQueryAllResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferQueryAllResponseDescriptor = $convert.base64Decode(
    'ChhUcmFuc2ZlclF1ZXJ5QWxsUmVzcG9uc2USPwoEdHlwZRgBIAEoDjIrLnByb3RvYnVmLlRyYW'
    '5zZmVyUXVlcnlBbGxSZXNwb25zZS5EYXRhVHlwZVIEdHlwZRIqCgV0ZXh0cxgCIAEoCzISLnBy'
    'b3RvYnVmLlRleHRMaXN0SABSBXRleHRzEi0KBmltYWdlcxgDIAEoCzITLnByb3RvYnVmLkltYW'
    'dlTGlzdEgAUgZpbWFnZXMSKgoFZmlsZXMYBCABKAsyEi5wcm90b2J1Zi5GaWxlTGlzdEgAUgVm'
    'aWxlcyI4CghEYXRhVHlwZRINCglURVhUX0xJU1QQABIOCgpJTUFHRV9MSVNUEAESDQoJRklMRV'
    '9MSVNUEAJCBgoEZGF0YQ==');

@$core.Deprecated('Use transferQueryResponseDescriptor instead')
const TransferQueryResponse$json = {
  '1': 'TransferQueryResponse',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protobuf.TransferQueryResponse.DataType', '10': 'type'},
    {'1': 'text', '3': 2, '4': 1, '5': 11, '6': '.protobuf.Text', '9': 0, '10': 'text'},
    {'1': 'image', '3': 3, '4': 1, '5': 11, '6': '.protobuf.Image', '9': 0, '10': 'image'},
    {'1': 'file', '3': 4, '4': 1, '5': 11, '6': '.protobuf.File', '9': 0, '10': 'file'},
  ],
  '4': [TransferQueryResponse_DataType$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use transferQueryResponseDescriptor instead')
const TransferQueryResponse_DataType$json = {
  '1': 'DataType',
  '2': [
    {'1': 'TEXT', '2': 0},
    {'1': 'IMAGE', '2': 1},
    {'1': 'FILE', '2': 2},
  ],
};

/// Descriptor for `TransferQueryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferQueryResponseDescriptor = $convert.base64Decode(
    'ChVUcmFuc2ZlclF1ZXJ5UmVzcG9uc2USPAoEdHlwZRgBIAEoDjIoLnByb3RvYnVmLlRyYW5zZm'
    'VyUXVlcnlSZXNwb25zZS5EYXRhVHlwZVIEdHlwZRIkCgR0ZXh0GAIgASgLMg4ucHJvdG9idWYu'
    'VGV4dEgAUgR0ZXh0EicKBWltYWdlGAMgASgLMg8ucHJvdG9idWYuSW1hZ2VIAFIFaW1hZ2USJA'
    'oEZmlsZRgEIAEoCzIOLnByb3RvYnVmLkZpbGVIAFIEZmlsZSIpCghEYXRhVHlwZRIICgRURVhU'
    'EAASCQoFSU1BR0UQARIICgRGSUxFEAJCBgoEZGF0YQ==');

@$core.Deprecated('Use textDescriptor instead')
const Text$json = {
  '1': 'Text',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `Text`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textDescriptor = $convert.base64Decode(
    'CgRUZXh0Eg4KAmlkGAEgASgNUgJpZBISCgR0ZXh0GAIgASgJUgR0ZXh0');

@$core.Deprecated('Use imageDescriptor instead')
const Image$json = {
  '1': 'Image',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
    {'1': 'size', '3': 4, '4': 1, '5': 9, '10': 'size'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode(
    'CgVJbWFnZRIOCgJpZBgBIAEoDVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgRwYXRoGAMgAS'
    'gJUgRwYXRoEhIKBHNpemUYBCABKAlSBHNpemU=');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'path', '3': 3, '4': 1, '5': 9, '10': 'path'},
    {'1': 'size', '3': 4, '4': 1, '5': 9, '10': 'size'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAmlkGAEgASgNUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBHBhdGgYAyABKA'
    'lSBHBhdGgSEgoEc2l6ZRgEIAEoCVIEc2l6ZQ==');

@$core.Deprecated('Use textListDescriptor instead')
const TextList$json = {
  '1': 'TextList',
  '2': [
    {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.protobuf.Text', '10': 'list'},
  ],
};

/// Descriptor for `TextList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textListDescriptor = $convert.base64Decode(
    'CghUZXh0TGlzdBIiCgRsaXN0GAEgAygLMg4ucHJvdG9idWYuVGV4dFIEbGlzdA==');

@$core.Deprecated('Use imageListDescriptor instead')
const ImageList$json = {
  '1': 'ImageList',
  '2': [
    {'1': 'list', '3': 2, '4': 3, '5': 11, '6': '.protobuf.Image', '10': 'list'},
  ],
};

/// Descriptor for `ImageList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageListDescriptor = $convert.base64Decode(
    'CglJbWFnZUxpc3QSIwoEbGlzdBgCIAMoCzIPLnByb3RvYnVmLkltYWdlUgRsaXN0');

@$core.Deprecated('Use fileListDescriptor instead')
const FileList$json = {
  '1': 'FileList',
  '2': [
    {'1': 'list', '3': 3, '4': 3, '5': 11, '6': '.protobuf.File', '10': 'list'},
  ],
};

/// Descriptor for `FileList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileListDescriptor = $convert.base64Decode(
    'CghGaWxlTGlzdBIiCgRsaXN0GAMgAygLMg4ucHJvdG9idWYuRmlsZVIEbGlzdA==');

