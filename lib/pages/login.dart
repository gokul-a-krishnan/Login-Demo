import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/api/auth.dart';
import 'package:flutterapp/routes/router.gr.dart';
import 'package:flutterapp/widgets/neomorphic.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text("Email"),
                      SizedBox(
                        height: 10.0,
                      ),
                      NeomorphicTextField(
                        obscureText: false,
                        onChange: (data) {
                          email = data;
                        },
                        hintText: 'user@mail.com',
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text("Password"),
                      SizedBox(
                        height: 10.0,
                      ),
                      NeomorphicTextField(
                        obscureText: true,
                        onChange: (data) {
                          password = data;
                        },
                        hintText: '********',
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                          onTap: () {
                            ExtendedNavigator.ofRouter<Router>()
                                .pushNamed(Routes.signupPage);
                          },
                          child: Text("Not Registered ?")),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                try {
                                  await Auth.loginWithEmail(email, password);
                                  ExtendedNavigator.ofRouter<Router>()
                                      .pushNamed(Routes.homePage);
                                } catch (err) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Row(
                                      children: <Widget>[
                                        Icon(Icons.warning),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Text(err.message),
                                        )
                                      ],
                                    ),
                                  ));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                child: Center(
                                    child: Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                )),
                                decoration: BoxDecoration(
                                    color: Color(0XFFFF27B0),
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0XFFFF27B0),
                                          offset: Offset(6, 2),
                                          blurRadius: 1.0,
                                          spreadRadius: 2.0),
                                    ]),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
