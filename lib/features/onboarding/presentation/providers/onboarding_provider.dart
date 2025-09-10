import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/onboarding_repository.dart';

// Repository provider
final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl();
});

// Onboarding status provider
final onboardingStatusProvider = FutureProvider<bool>((ref) async {
  final repository = ref.read(onboardingRepositoryProvider);
  return await repository.isOnboardingCompleted();
});

// Provider to complete onboarding
final onboardingControllerProvider = Provider(
  (ref) => OnboardingController(ref),
);

class OnboardingController {
  final Ref _ref;

  OnboardingController(this._ref);

  Future<void> completeOnboarding() async {
    final repository = _ref.read(onboardingRepositoryProvider);
    await repository.setOnboardingCompleted();
    // Refresh the status provider
    _ref.invalidate(onboardingStatusProvider);
  }

  Future<void> clearOnboardingStatus() async {
    final repository = _ref.read(onboardingRepositoryProvider);
    await repository.clearOnboardingStatus();
    // Refresh the status provider
    _ref.invalidate(onboardingStatusProvider);
  }
}
