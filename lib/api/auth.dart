import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Auth {
  //todo change baseurl
  static String _baseUrl = 'https://localhost/api';
  static User _user;
  static Dio _dio;

  Auth._();

  static User getInstance() {
    return _user;
  }

  static void logout() {
    _user = null;
  }

  static Dio _getDio() {
    if (_dio != null) return _dio;
    _dio = Dio();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _dio;
  }

  static bool isLoggedin() {
    return (_user != null) ? true : false;
  }

  static Future<bool> isValid() async {
    if (!isLoggedin()) throw Exception('Already Logged out');
    try {
      Response response = await _getDio().post(_baseUrl + '/verify',
          options: Options(headers: {'auth-token': _user.token}));
      return response.data['valid'];
    } on DioError catch (err) {
      if (err.response != null)
        return err.response.data['valid'];
      else
        throw Exception('Network failed');
    }
  }

  static Future<User> registerWithEmail(
      String name, String email, String password) async {
    if (isLoggedin()) throw Exception('Already logged in');
    try {
      Response response = await _getDio().post(_baseUrl + '/user/register',
          options: Options(contentType: 'application/json'),
          data: {"name": name, "email": email, "password": password});
      _user = User.fromJson(response.data['user']);
      return _user;
    } on DioError catch (err) {
      throw (err.response != null)
          ? Exception(err.response.data['error'])
          : Exception('Network failed');
    }
  }

  static Future<User> loginWithEmail(String email, String password) async {
    print(email + password);
    if (isLoggedin()) throw Exception('Already logged in');
    try {
      Response response = await _getDio().post(_baseUrl + '/user/login',
          options: Options(contentType: 'application/json'),
          data: {"email": email, "password": password});
      _user = User.fromJson(response.data['user']);
      return _user;
    } on DioError catch (err) {
      throw (err.response != null)
          ? Exception(err.response.data['error'])
          : Exception('Network failed');
    }
  }
}

class User {
  String name;
  String email;
  String token;

  User({this.name, this.email, this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
