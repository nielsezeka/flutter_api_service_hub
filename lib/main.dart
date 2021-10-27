import 'package:api_intergration/services/api_service/your_server_api_implementation/create_user/create_user_input.dart';
import 'package:api_intergration/services/api_service/your_server_api_implementation/create_user/create_user_output.dart';
import 'package:api_intergration/services/api_service/your_server_api_implementation/create_user/create_user_request.dart';
import 'package:api_intergration/services/api_service/your_server_api_implementation/list_user/list_user_input.dart';
import 'package:flutter/material.dart';

import 'services/api_service/api_service.dart';
import 'services/api_service/your_server_api_implementation/list_user/list_user_output.dart';
import 'services/api_service/your_server_api_implementation/list_user/list_user_request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    testValue();
    testCreateUser();
  }

  testValue() async {
    ListUserRequest requestToMake = ListUserRequest(
      input: ListUserInput(page: 1),
      output: ListUserResponse.getDefault(),
    );
    final result = await apiService.excuteRequest(requestToMake);
    print(result.output.total);
  }

  testCreateUser() async {
    CreateUserRequest requestToMake = CreateUserRequest(
      input: CreateUserInput(job: "nothing", name: "nothing"),
      output: CreateUserResponse.getDefault(),
    );
    final result = await apiService.excuteRequest(requestToMake);
    print(result.output.createdAt);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
