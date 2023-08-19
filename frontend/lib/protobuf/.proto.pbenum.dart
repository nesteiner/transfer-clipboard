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

class TransferData_DataType extends $pb.ProtobufEnum {
  static const TransferData_DataType ERROR = TransferData_DataType._(0, _omitEnumNames ? '' : 'ERROR');
  static const TransferData_DataType MESSAGE = TransferData_DataType._(1, _omitEnumNames ? '' : 'MESSAGE');
  static const TransferData_DataType TEXT = TransferData_DataType._(2, _omitEnumNames ? '' : 'TEXT');
  static const TransferData_DataType IMAGE = TransferData_DataType._(3, _omitEnumNames ? '' : 'IMAGE');
  static const TransferData_DataType FILE = TransferData_DataType._(4, _omitEnumNames ? '' : 'FILE');

  static const $core.List<TransferData_DataType> values = <TransferData_DataType> [
    ERROR,
    MESSAGE,
    TEXT,
    IMAGE,
    FILE,
  ];

  static final $core.Map<$core.int, TransferData_DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransferData_DataType? valueOf($core.int value) => _byValue[value];

  const TransferData_DataType._($core.int v, $core.String n) : super(v, n);
}

class TransferQueryAllResponse_DataType extends $pb.ProtobufEnum {
  static const TransferQueryAllResponse_DataType TEXT_LIST = TransferQueryAllResponse_DataType._(0, _omitEnumNames ? '' : 'TEXT_LIST');
  static const TransferQueryAllResponse_DataType IMAGE_LIST = TransferQueryAllResponse_DataType._(1, _omitEnumNames ? '' : 'IMAGE_LIST');
  static const TransferQueryAllResponse_DataType FILE_LIST = TransferQueryAllResponse_DataType._(2, _omitEnumNames ? '' : 'FILE_LIST');

  static const $core.List<TransferQueryAllResponse_DataType> values = <TransferQueryAllResponse_DataType> [
    TEXT_LIST,
    IMAGE_LIST,
    FILE_LIST,
  ];

  static final $core.Map<$core.int, TransferQueryAllResponse_DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransferQueryAllResponse_DataType? valueOf($core.int value) => _byValue[value];

  const TransferQueryAllResponse_DataType._($core.int v, $core.String n) : super(v, n);
}

class TransferQueryResponse_DataType extends $pb.ProtobufEnum {
  static const TransferQueryResponse_DataType TEXT = TransferQueryResponse_DataType._(0, _omitEnumNames ? '' : 'TEXT');
  static const TransferQueryResponse_DataType IMAGE = TransferQueryResponse_DataType._(1, _omitEnumNames ? '' : 'IMAGE');
  static const TransferQueryResponse_DataType FILE = TransferQueryResponse_DataType._(2, _omitEnumNames ? '' : 'FILE');
  static const TransferQueryResponse_DataType ERROR = TransferQueryResponse_DataType._(3, _omitEnumNames ? '' : 'ERROR');

  static const $core.List<TransferQueryResponse_DataType> values = <TransferQueryResponse_DataType> [
    TEXT,
    IMAGE,
    FILE,
    ERROR,
  ];

  static final $core.Map<$core.int, TransferQueryResponse_DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransferQueryResponse_DataType? valueOf($core.int value) => _byValue[value];

  const TransferQueryResponse_DataType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
