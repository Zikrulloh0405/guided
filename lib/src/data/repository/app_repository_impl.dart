// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:l/l.dart';
// import '../entity/user_model.dart';
// import 'app_repository.dart';
//
// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
//
//
// class AppRepositoryImpl implements AppRepository {
//   factory AppRepositoryImpl() => _impl;
//
//   const AppRepositoryImpl._internal();
//
//   static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();
//
//
//   @override
//   Future<UserModel?> registerUser({
//     required String email,
//     required String password,
//     required String fullName,
//     required DateTime dateOfBirth,
//     required UserRole role,
//   }) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = userCredential.user;
//
//       if (user != null) {
//         UserModel newUser = UserModel(
//           uid: user.uid,
//           fullName: fullName,
//           email: email,
//           role: role,
//           dateOfBirth: dateOfBirth,
//         );
//         await saveUserToFireStore(newUser);
//         return newUser;
//       } else {
//         return null;
//       }
//     } on FirebaseAuthException catch (e) {
//       l.e('Error registering user: ${e.message}');
//       return null;
//     } catch (e) {
//       l.e('Unexpected error registering user: $e');
//       return null;
//     }
//   }
//
//   @override
//   Future<UserModel?> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       User? user = userCredential.user;
//
//       if (user != null) {
//         return await getUserFromFireStore(user.uid);
//       } else {
//         return null;
//       }
//     } on FirebaseAuthException catch (e) {
//       l.e('Error logging in user: ${e.message}');
//       return null;
//     } catch (e) {
//       l.e('Unexpected error logging in user: $e');
//       return null;
//     }
//   }
//
//   @override
//   Future<void> logoutUser() async {
//     try {
//       await _firebaseAuth.signOut();
//     } on FirebaseAuthException catch (e) {
//       l.e('Error logging out user: ${e.message}');
//     } catch (e) {
//       l.e('Unexpected error logging out user: $e');
//     }
//   }
//
//   @override
//   Future<UserModel?> getCurrentUser() async {
//     try {
//       User? user = _firebaseAuth.currentUser;
//       if (user != null) {
//         return await getUserFromFireStore(user.uid);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       l.e('Error getting current user: $e');
//       return null;
//     }
//   }
//
//   @override
//   Future<void> saveUserToFireStore(UserModel user) async {
//     try {
//       await _fireStore.collection('users').doc(user.uid).set(user.toMap());
//     } on FirebaseException catch (e) {
//       l.e('Error saving user to Firestore: ${e.message}');
//     } catch (e) {
//       l.e('Unexpected error saving user to Firestore: $e');
//     }
//   }
//
//   @override
//   Future<UserModel?> getUserFromFireStore(String uid) async {
//     try {
//       DocumentSnapshot doc = await _fireStore.collection('users').doc(uid).get();
//       if (doc.exists) {
//         return UserModel.fromMap(doc.data() as Map<String, dynamic>);
//       } else {
//         return null;
//       }
//     } on FirebaseException catch (e) {
//       l.e('Error getting user from Firestore: ${e.message}');
//       return null;
//     } catch (e) {
//       l.e('Unexpected error getting user from Firestore: $e');
//       return null;
//     }
//   }
// }
