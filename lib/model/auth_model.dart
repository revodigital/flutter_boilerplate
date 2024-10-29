//import 'package:flutter_revo_boilerplate/api/generated/openapi.enums.swagger.dart';
//import 'package:flutter_revo_boilerplate/api/generated/openapi.models.swagger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPostModel {
  String? email;
  String? password;
  String? name;
  String? surname;

  AuthPostModel({
    this.email,
    this.password,
    this.name,
    this.surname,
  });
}

enum AuthGetModelType {
  Installatore,
  Utente,
  God
}

class AuthGetModel {
  String? email;
  String? type;
  String? profilePicture;
  String? id;
  String? name;
  String? surname;

  static final AuthGetModel _authGetModel = AuthGetModel._internal();

  factory AuthGetModel({String? email, String? id, /*UserType? type,*/ String? profilePicture, String? name, String? surname}) {
    _authGetModel.email ??= email;
    _authGetModel.id ??= id;
    //_authGetModel.type ??= type == UserType.user ? AuthGetModelType.Utente.name : type == UserType.superuser ? AuthGetModelType.God.name : AuthGetModelType.Installatore.name;
    _authGetModel.profilePicture ??= profilePicture;
    _authGetModel.name ??= name;
    _authGetModel.surname ??= surname;

    return _authGetModel;
  }

  Future<void> logout () async {
    _authGetModel.email = null;
    _authGetModel.id = null;
    _authGetModel.type = null;
    _authGetModel.profilePicture = null;
    _authGetModel.name = null;
    _authGetModel.surname = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('logged_as');
  }

  String toJsonString () =>
      "{\"email\": \"$email\",\"id\": \"$id\", \"type\": \"$type\", \"profilePicture\": \"$profilePicture\", \"name\": \"$name\", \"surname\": \"$surname\"}";

  AuthGetModel.fromJson (Map<String, dynamic> json) {
    _authGetModel.email ??= json['email'];
    _authGetModel.id ??= json['id'];
    _authGetModel.type ??= json['type'];
    _authGetModel.profilePicture ??= json['profilePicture'];
    _authGetModel.name ??= json['name'];
    _authGetModel.surname ??= json['surname'];
  }

  AuthGetModel._internal();
}