///
//  Generated code. Do not modify.
//  source: hello/world.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'world.pbenum.dart';

class MyNameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MyNameResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'hello'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authName')
    ..hasRequiredFields = false;

  MyNameResponse._() : super();
  factory MyNameResponse({
    $core.String? authName,
  }) {
    final _result = create();
    if (authName != null) {
      _result.authName = authName;
    }
    return _result;
  }
  factory MyNameResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MyNameResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyNameResponse clone() => MyNameResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyNameResponse copyWith(void Function(MyNameResponse) updates) =>
      super.copyWith((message) => updates(message as MyNameResponse))
          as MyNameResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyNameResponse create() => MyNameResponse._();
  MyNameResponse createEmptyInstance() => create();
  static $pb.PbList<MyNameResponse> createRepeated() =>
      $pb.PbList<MyNameResponse>();
  @$core.pragma('dart2js:noInline')
  static MyNameResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyNameResponse>(create);
  static MyNameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authName => $_getSZ(0);
  @$pb.TagNumber(1)
  set authName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAuthName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthName() => clearField(1);
}
