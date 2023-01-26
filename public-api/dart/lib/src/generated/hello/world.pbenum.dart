///
//  Generated code. Do not modify.
//  source: hello/world.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class FailPrecondition extends $pb.ProtobufEnum {
  static const FailPrecondition FAIL_PRECONDITION_UNSPECIFIED =
      FailPrecondition._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FAIL_PRECONDITION_UNSPECIFIED');
  static const FailPrecondition FAIL_PRECONDITION_NAME = FailPrecondition._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'FAIL_PRECONDITION_NAME');

  static const $core.List<FailPrecondition> values = <FailPrecondition>[
    FAIL_PRECONDITION_UNSPECIFIED,
    FAIL_PRECONDITION_NAME,
  ];

  static final $core.Map<$core.int, FailPrecondition> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static FailPrecondition? valueOf($core.int value) => _byValue[value];

  const FailPrecondition._($core.int v, $core.String n) : super(v, n);
}
