import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String fullName;
  final String email;
  final String password;

  User({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class UserStorageService {
  static const _userKey = 'user_key';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
    final userJs = prefs.getString(_userKey);
    print(userJs);
  }

  Future<User?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<bool> checkUserExists(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    print(userJson);
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));
      return user.email == email && user.password == password;
    }
    return false;
  }
}
