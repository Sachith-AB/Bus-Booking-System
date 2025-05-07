import 'package:bus_booking/src/services/exceptions/signup_failure.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../app/models/user_model.dart';
import 'exceptions/crud_failure.dart';

class AuthenticationServices extends GetxController {

  static AuthenticationServices get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore service = FirebaseFirestore.instance;

  Future<dynamic> registerUser(String email, String password) async {
    try{
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user;
    }catch(_){
      final ex = SignUpFailure();

      PopupWarning.Warning(
        title: "Signup Failure",
        message: ex.message,
        type: 1
      );
      throw ex;
    }
  }

  Future<void> insertUser(
      {required String collection, required UserModel user}) async {
    try {

      await service.collection(collection).doc(user.id).set(user.toJson());

    } on FirebaseException catch (e) {
      final ex = CrudFailure.code(e.code);
      PopupWarning.Warning(
        title: "User Signup Failure",
        message: ex.message,
        type: 1,
      );
      throw ex;
    } catch (_) {
      final ex = CrudFailure();
      PopupWarning.Warning(
        title: "User Signup Failure",
        message: ex.message,
        type: 1,
      );
      throw ex;
    }
  }

  Future<UserCredential> loginUser(String email , String password) async {
    try{
      final user = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value){
        return value;
      });
      return user;
    } on FirebaseAuthException catch (e) {
      final ex = SignUpFailure.code(e.code);
      PopupWarning.Warning(
        title: 'User SignIn Failure',
        message: ex.message,
        type: 1
      ); throw ex.message;
    }
  }
}