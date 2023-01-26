///
//  Generated code. Do not modify.
//  source: hello/world.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use failPreconditionDescriptor instead')
const FailPrecondition$json = const {
  '1': 'FailPrecondition',
  '2': const [
    const {'1': 'FAIL_PRECONDITION_UNSPECIFIED', '2': 0},
    const {'1': 'FAIL_PRECONDITION_NAME', '2': 1},
  ],
};

/// Descriptor for `FailPrecondition`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List failPreconditionDescriptor = $convert.base64Decode(
    'ChBGYWlsUHJlY29uZGl0aW9uEiEKHUZBSUxfUFJFQ09ORElUSU9OX1VOU1BFQ0lGSUVEEAASGgoWRkFJTF9QUkVDT05ESVRJT05fTkFNRRAB');
@$core.Deprecated('Use myNameResponseDescriptor instead')
const MyNameResponse$json = const {
  '1': 'MyNameResponse',
  '2': const [
    const {'1': 'auth_name', '3': 1, '4': 1, '5': 9, '10': 'authName'},
  ],
};

/// Descriptor for `MyNameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List myNameResponseDescriptor = $convert.base64Decode(
    'Cg5NeU5hbWVSZXNwb25zZRIbCglhdXRoX25hbWUYASABKAlSCGF1dGhOYW1l');
