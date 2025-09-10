import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';

class SignToTextPage extends ConsumerWidget {
  const SignToTextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigate back or show menu
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.backgroundStart,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Camera Icon with circular background
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.videocam,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 48),

                // Title
                const Text(
                  'Hand Sign to Text\n(Camera)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Description
                const Text(
                  'This feature is currently under\nconstruction. We\'re working hard to bring\nit to you soon!',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Notify Me Button
                CustomButton(
                  text: 'Notify Me When It\'s Ready',
                  onPressed: () {
                    // TODO: Implement notification signup
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'You\'ll be notified when this feature is ready!',
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  isLoading: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
