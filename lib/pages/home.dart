import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/api/auth.dart';
import 'package:flutterapp/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Auth.isLoggedin())
      ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.loginPage);
    else {
      User user = Auth.getInstance();
      return Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(user.name),
                    SizedBox(height: 25),
                    Text(user.email),
                    SizedBox(height: 25),
                    RaisedButton(
                      onPressed: () {
                        Auth.logout();
                        ExtendedNavigator.ofRouter<Router>()
                            .pushNamed(Routes.loginPage);
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
