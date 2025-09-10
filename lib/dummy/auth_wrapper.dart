import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/presentation/providers/auth_providers.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/home/home_screen.dart';
import '../core/theme/app_colors.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // First check if SharedPreferences is loaded
    final sharedPrefsAsync = ref.watch(sharedPreferencesProvider);

    return sharedPrefsAsync.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.backgroundStart,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
              SizedBox(height: 16),
              Text(
                'Initializing...',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      error: (error, stack) => Scaffold(
        backgroundColor: AppColors.backgroundStart,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Initialization Error',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.refresh(sharedPreferencesProvider),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      data: (prefs) {
        // Now that SharedPreferences is loaded, watch auth state
        final authState = ref.watch(authProvider);

        return authState.when(
          loading: () => const Scaffold(
            backgroundColor: AppColors.backgroundStart,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          error: (error, stack) => Scaffold(
            backgroundColor: AppColors.backgroundStart,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Authentication Error',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => ref.refresh(authProvider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          data: (user) {
            if (user == null) {
              // User is not authenticated, show login page
              return const LoginPage();
            }

            // User is authenticated, now check onboarding status
            final onboardingStatus = ref.watch(onboardingStatusProvider);

            return onboardingStatus.when(
              loading: () => const Scaffold(
                backgroundColor: AppColors.backgroundStart,
                body: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              error: (error, stack) {
                // If there's an error checking onboarding status,
                // assume onboarding is needed
                return OnboardingScreen(
                  onComplete: () {
                    // After onboarding completion, refresh the status
                    ref.invalidate(onboardingStatusProvider);
                  },
                );
              },
              data: (isOnboardingCompleted) {
                if (!isOnboardingCompleted) {
                  // Show onboarding
                  return OnboardingScreen(
                    onComplete: () {
                      // After onboarding completion, refresh the status
                      ref.invalidate(onboardingStatusProvider);
                    },
                  );
                }

                // User is authenticated and onboarding is completed
                return const HomeScreen();
              },
            );
          },
        );
      },
    );
  }
}
