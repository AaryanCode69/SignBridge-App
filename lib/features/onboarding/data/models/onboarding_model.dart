class OnboardingSlide {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingSlide({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class OnboardingData {
  static const List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: 'Seamless Conversations',
      description:
          'Your personal interpreter connecting sign and spoken language.',
      imagePath: 'assets/images/onboarding_1.png', // Sound wave illustration
    ),
    OnboardingSlide(
      title: 'Sign to Speak',
      description: 'Your signs are instantly translated into spoken words.',
      imagePath: 'assets/images/onboarding_2.png', // Person with speech bubbles
    ),
    OnboardingSlide(
      title: 'Speak to Sign',
      description: 'Spoken words instantly appear as sign language.',
      imagePath: 'assets/images/onboarding_3.png', // Person with phone
    ),
  ];
}
