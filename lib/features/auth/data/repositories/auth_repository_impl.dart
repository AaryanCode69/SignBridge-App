import 'dart:convert';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../../../../core/constants/oauth_config.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn;
  final SharedPreferences _prefs;

  // Stream controller for auth state changes
  final StreamController<UserEntity?> _authStateController =
      StreamController<UserEntity?>.broadcast();

  AuthRepositoryImpl(this._prefs)
    : _googleSignIn = GoogleSignIn(scopes: GoogleOAuthConfig.scopes);

  @override
  Future<UserEntity?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final user = UserModel.fromGoogleUser(googleUser, googleAuth.accessToken);
      await _saveUserToPrefs(user);
      _authStateController.add(user);

      return user;
    } catch (e) {
      throw Exception('Google Sign-In failed: $e');
    }
  }

  @override
  Future<UserEntity> signInAsGuest() async {
    final user = UserModel.guest();
    await _saveUserToPrefs(user);
    _authStateController.add(user);
    return user;
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _prefs.remove('user');
      _authStateController.add(null);
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      // Try to get user from SharedPreferences first
      final userJson = _prefs.getString('user');
      if (userJson != null) {
        final user = UserModel.fromJson(json.decode(userJson));
        _authStateController.add(user);
        return user;
      }

      // Try to silently sign in
      final googleUser = await _googleSignIn.signInSilently();
      if (googleUser != null) {
        final auth = await googleUser.authentication;
        final user = UserModel.fromGoogleUser(googleUser, auth.accessToken);
        await _saveUserToPrefs(user);
        _authStateController.add(user);
        return user;
      }

      _authStateController.add(null);
      return null;
    } catch (e) {
      _authStateController.add(null);
      return null;
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges => _authStateController.stream;

  Future<void> _saveUserToPrefs(UserModel user) async {
    try {
      await _prefs.setString('user', json.encode(user.toJson()));
    } catch (e) {
      // Handle error silently - not critical for app function
      print('Failed to save user to preferences: $e');
    }
  }

  void dispose() {
    _authStateController.close();
  }
}
