import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/routes/router.gr.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: ExtendedNavigator<Router>(
        router: Router(),
      ),
    );
  }
}
