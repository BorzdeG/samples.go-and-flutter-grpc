import 'package:grpc/grpc_or_grpcweb.dart';

import 'package:frontend/jwt-text-authenticator.dart';

import 'package:public_api/src/generated/hello/world.pbgrpc.dart';

var apiClient = ApiClient();

class ApiClient {
  final JwtTextAuthenticator _jwtTextAuthenticator = JwtTextAuthenticator();
  GrpcOrGrpcWebClientChannel? _channel;

  HelloWorldServiceClient? _helloWorldServiceClient;

  HelloWorldServiceClient get helloWorldService => _helloWorldServiceClient!;

  void setToken(String token) => _jwtTextAuthenticator.jwtToken = token;

  ApiClient() {
    _channel = GrpcOrGrpcWebClientChannel.toSingleEndpoint(
      host: '127.0.0.1',
      port: 9000,
      transportSecure: false,
    );

    _helloWorldServiceClient = HelloWorldServiceClient(
      _channel!,
      options: _jwtTextAuthenticator.toCallOptions,
    );
  }
}
