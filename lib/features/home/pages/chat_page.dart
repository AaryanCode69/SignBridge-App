import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

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
        title: const Text(
          'Real-Time Chat',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.backgroundStart,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration Container
                  Container(
                    width: 280,
                    height: 200,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5E6D3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // People illustration placeholder
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPersonAvatar(Colors.brown),
                              _buildPersonAvatar(Colors.orange),
                              _buildPersonAvatar(Colors.purple),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Speech bubbles
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSpeechBubble(AppColors.primary),
                              const SizedBox(width: 8),
                              _buildSpeechBubble(Colors.orange),
                              const SizedBox(width: 8),
                              _buildSpeechBubble(Colors.purple),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Title
                  const Text(
                    'Connect with Your Friends',
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
                    'This feature is coming soon! Get ready to\nconnect with your friends in real-time.',
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
                            'You\'ll be notified when chat is available!',
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    isLoading: false,
                  ),

                  const SizedBox(height: 80),

                  // Bottom Navigation Icons
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonAvatar(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 24),
    );
  }

  Widget _buildSpeechBubble(Color color) {
    return Container(
      width: 16,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _buildBottomNavIcon(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Icon(
          icon,
          color: isActive ? AppColors.primary : AppColors.textSecondary,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.primary : AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
