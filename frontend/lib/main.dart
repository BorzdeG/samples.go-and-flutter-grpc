import 'package:flutter/material.dart';
import 'package:frontend/api-client.dart';
import 'package:grpc/grpc.dart';
import 'dart:developer' as dev;
import 'package:public_api/src/generated/hello/world.pb.dart';
import 'package:public_api/src/generated/hello/world.pbenum.dart';
import 'package:public_api/src/generated/core/empty.pb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textToken = TextEditingController();
  MyNameResponse? _myNameResponse;

  Future<MyNameResponse> _readMyNameResponse() async {
    return apiClient.helloWorldService.myName(Empty());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textToken,
              onChanged: (value) {
                dev.log(value, name: 'text field');
                apiClient.setToken(value);
              },
              decoration: const InputDecoration(
                labelText: "Token",
                hintText: "Enter token",
              ),
            ),
            Text(
              myName(),
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        IconButton(
            onPressed: () {
              _getMyName();
            },
            icon: const Icon(Icons.person))
      ],
    );
  }

  String myName() {
    dev.log("_myNameResponse: $_myNameResponse");

    if (_myNameResponse != null) {
      return "Name: ${_myNameResponse!.authName}";
    } else {
      return "";
    }
  }

  void _getMyName() {
    // try {
    _readMyNameResponse()
        .then((value) => setState(() {
              _myNameResponse = value;
            }))
        .catchError((e) {
      e.details?.forEach((element) {
        if (element is PreconditionFailure) {
          setState(() {
            var failureViolation = element.violations.first;
            dev.log(failureViolation.type);

            if (failureViolation.type ==
                FailPrecondition.FAIL_PRECONDITION_NAME.name) {
              _myNameResponse =
                  MyNameResponse(authName: failureViolation.subject);
            } else {
              _myNameResponse = MyNameResponse(authName: "unknown");
            }
          });
        }
      });
    }, test: (e) => e is GrpcError);
  }
}
