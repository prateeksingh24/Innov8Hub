import 'package:demo_ui/models/students_model.dart';
import 'package:demo_ui/services/remote/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool signedUpSuccess = false;

  Future<bool> signup({
    required String name,
    required String email,
    required String number,
    required String password,
    required String passwordConfirmation,
  }) async {
    signedUpSuccess = await AuthServices.signup(
      name: name,
      email: email,
      number: number,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    return signedUpSuccess == true ? signedUpSuccess : false;
  }

  bool signedInSuccess = false;
  bool signingIn = false;

  Future<bool> signin({
    required String email,
    required String password,
  }) async {
    signingIn = true;
    notifyListeners();
    signedInSuccess = await AuthServices.signin(
      email: email,
      password: password,
    );
    signingIn = false;
    notifyListeners();
    return signedInSuccess == true ? signedInSuccess : false;
  }

  UserData? user;

  bool userHasData = false;

  Future<UserData?> getUserProfile() async {
    if (!userHasData) {
      await AuthServices.getUserData().then((value) {
        user = value;
        notifyListeners();
        userHasData = true;
        return user;
      }).catchError((er) {
        userHasData = true;
        if (kDebugMode) {
          print(er.toString());
        }
      });
    }
    return null;
  }
}
