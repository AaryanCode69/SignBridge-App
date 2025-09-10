abstract class OnboardingRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted();
  Future<void> clearOnboardingStatus(); // For testing
}
