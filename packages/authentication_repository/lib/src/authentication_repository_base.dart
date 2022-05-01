// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

//SOLID PRINCIPLE: OPEN-CLOSED PRINCIPLE , other auth provider can be  extended without requiring the modificaiton in exisitng code.
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _controllerGoogleInfo = StreamController<String>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  Stream<String> get googleUserInfo async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controllerGoogleInfo.stream;
  }

  Future<void> logInWithCredentials({
    required String useremail,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: useremail,
        password: password,
      );
      // var user = userCredential.user;

      _controller.add(AuthenticationStatus.authenticated);
    } on FirebaseAuthException catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided.');
      }
    }
  }

  Future<void> signUpWithCredentials({
    required String useremail,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: useremail,
        password: password,
      );
      // var user = userCredential.user;
      _controller.add(AuthenticationStatus.authenticated);
    } on FirebaseAuthException catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided.');
      }
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final AuthCredential credential;

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
      } else {
        credential =
            AuthCredential(providerId: "google.com", signInMethod: "password");
      }
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        // user = userCredential.user;
        _controller.add(AuthenticationStatus.authenticated);
        _controllerGoogleInfo.add(userCredential.user?.email ?? "");
      } on FirebaseAuthException catch (e) {
        _controller.add(AuthenticationStatus.unauthenticated);
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      } catch (e) {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    } catch (_) {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void logOut() {
    auth.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
    _controllerGoogleInfo.close();
  }
}
