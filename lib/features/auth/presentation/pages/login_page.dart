import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/signbridge_logo.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/google_icon.dart';
import '../providers/auth_providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoading = ref.watch(isAuthLoadingProvider);

    // Listen to auth state changes for error handling
    ref.listen<AsyncValue<Object?>>(authProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${next.error}'),
            backgroundColor: AppColors.textSecondary,
          ),
        );
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const Spacer(flex: 2),

                // Logo Section
                const SignBridgeLogo(size: 120),

                const SizedBox(height: 32),

                // Title Section
                Column(
                  children: [
                    Text(
                      'Welcome to',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SignBridge',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Connecting conversations, one sign at a\ntime.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),

                const Spacer(flex: 3),

                // Buttons Section
                Column(
                  children: [
                    // Google Sign In Button
                    CustomButton(
                      text: 'Sign in with Google',
                      icon: const GoogleIcon(size: 20),
                      isLoading: isLoading,
                      onPressed: () {
                        ref.read(authProvider.notifier).signInWithGoogle();
                      },
                    ),

                    const SizedBox(height: 24),

                    // Guest Sign In Button
                    CustomButton(
                      text: 'Continue as guest',
                      type: ButtonType.secondary,
                      onPressed: isLoading
                          ? null
                          : () {
                              ref.read(authProvider.notifier).signInAsGuest();
                            },
                    ),
                  ],
                ),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
