import 'dart:async';
import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:clickcompras/data/repositories/authentication/authentication_repository.dart';
import 'package:clickcompras/data/repositories/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).set(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).set(json);
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw 'Erro no Firebase: ${e.message}';
    } on FormatException catch (_) {
      throw 'Erro de formatação de dados.';
    } on PlatformException catch (e) {
      throw 'Erro de plataforma: ${e.message}';
    } catch (e) {
      throw 'Algo deu errado. Tente novamente mais tarde. Detalhes: $e';
    }
  }
}
