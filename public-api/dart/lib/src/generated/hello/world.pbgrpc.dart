///
//  Generated code. Do not modify.
//  source: hello/world.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../core/empty.pb.dart' as $0;
import 'world.pb.dart' as $1;
export 'world.pb.dart';

class HelloWorldServiceClient extends $grpc.Client {
  static final _$myName = $grpc.ClientMethod<$0.Empty, $1.MyNameResponse>(
      '/hello.HelloWorldService/MyName',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.MyNameResponse.fromBuffer(value));

  HelloWorldServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.MyNameResponse> myName($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$myName, request, options: options);
  }
}

abstract class HelloWorldServiceBase extends $grpc.Service {
  $core.String get $name => 'hello.HelloWorldService';

  HelloWorldServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.MyNameResponse>(
        'MyName',
        myName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.MyNameResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.MyNameResponse> myName_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return myName(call, await request);
  }

  $async.Future<$1.MyNameResponse> myName(
      $grpc.ServiceCall call, $0.Empty request);
}
