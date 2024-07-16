import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:l/l.dart';

import '../../../data/entity/user_model.dart';

final authController = ChangeNotifierProvider<AuthController>((ref) {
  return AuthController();
});

class AuthController extends ChangeNotifier {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // final AppRepository _appRepository = AppRepositoryImpl();

  // Text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  UserModel? _currentUser;
  UserRole role = UserRole.tourist;
  bool isPasswordVisible = false;

  void setPasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  UserModel? get currentUser => _currentUser;

  int currentPage = 0;
  late PageController pageController;

  AuthController() {
    pageController = PageController();
    pageController.addListener(() {
      notifyListeners();
    });
  }

  void setPageIndex(int index) {
    currentPage = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    dateOfBirthController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Future<void> registerWithEmailAndPassword() async {
    try {
      DateTime dateOfBirth = DateFormat('dd/MM/yyyy').parseStrict(dateOfBirthController.text);
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        UserModel newUser = UserModel(
          uid: user.uid,
          fullName: fullNameController.text,
          email: emailController.text,
          role: role,
          dateOfBirth: dateOfBirth,
        );
        await saveUserToFirestore(newUser);
        _currentUser = newUser;
      }
    } on FirebaseAuthException catch (e) {
      l.e('Error registering user: ${e.message}');
    } catch (e) {
      l.e('Unexpected error registering user: $e');
    }
    notifyListeners();
  }

  Future<void> saveUserToFirestore(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      l.e('Error saving user to Firestore: $e');
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        _currentUser = await getUserFromFirestore(user.uid);
      }
    } on FirebaseAuthException catch (e) {
      l.e('Error logging in user: ${e.message}');
    } catch (e) {
      l.e('Unexpected error logging in user: $e');
    }
    notifyListeners();
  }

  Future<UserModel?> getUserFromFirestore(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      l.e('Error getting user from Firestore: $e');
    }
    return null;
  }

  void setRole(UserRole newRole) {
    role = newRole;
    notifyListeners();
  }
}
