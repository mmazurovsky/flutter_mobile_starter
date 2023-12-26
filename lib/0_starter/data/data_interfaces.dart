import 'package:firebase_auth/firebase_auth.dart';

abstract class UserInterface {
  String get id;
  String get name;
  Future<String?> get idToken;
}
