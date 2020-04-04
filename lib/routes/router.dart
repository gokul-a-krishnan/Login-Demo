import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/login.dart';
import 'package:flutterapp/pages/signup.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;
  LoginPage loginPage;
  SignupPage signupPage;
}
// flutter packages pub run build_runner watch
