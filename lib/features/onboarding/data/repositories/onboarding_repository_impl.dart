import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  static const String _onboardingKey = 'onboarding_completed';
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  @override
  Future<bool> isOnboardingCompleted() async {
    try {
      final value = await _storage.read(key: _onboardingKey);
      return value == 'true';
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setOnboardingCompleted() async {
    try {
      await _storage.write(key: _onboardingKey, value: 'true');
    } catch (e) {
      // Handle error silently
    }
  }

  @override
  Future<void> clearOnboardingStatus() async {
    try {
      await _storage.delete(key: _onboardingKey);
    } catch (e) {
      // Handle error silently
    }
  }
}
