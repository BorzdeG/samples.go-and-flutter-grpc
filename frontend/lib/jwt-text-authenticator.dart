import 'dart:async';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;

import 'package:grpc/grpc.dart';
import 'dart:developer' as dev;

class JwtTextAuthenticator extends HttpBasedAuthenticator {
  String? _jwtToken;

  set jwtToken(String value) => _jwtToken = value;

  @override
  Future<AccessCredentials> obtainCredentialsWithClient(
      http.Client client, String uri) {
    return Future.microtask(() {
      dev.log("value: ${_jwtToken ?? 'empty'}", name: 'token');

      var accessToken = AccessToken('Bearer', _jwtToken ?? "",
          DateTime(0).add(const Duration(seconds: 30)).toUtc());
      dev.log("accessToken: $accessToken", name: 'token');

      return AccessCredentials(accessToken, null, List.empty());
    });
  }
}
