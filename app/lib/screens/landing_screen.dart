import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/portal_card.dart';
import 'patient/patient_home_screen.dart';
import 'doctor/doctor_home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Logo and Heart Icon
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.rose400, AppColors.rose500],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [AppShadows.rose],
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 48,
                  ),
                ),

                const SizedBox(height: 32),

                // Main Title
                Text(
                  'MindCare',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: AppColors.beige800,
                        height: 1.1,
                      ),
                ),

                const SizedBox(height: 24),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Connecting minds, healing hearts — Your mental wellness journey starts here with compassionate care and gentle guidance 🌸',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.beige700,
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 64),

                // Portal Cards
                Row(
                  children: [
                    Expanded(
                      child: PortalCard(
                        title: 'Healthcare Provider Portal',
                        description: 'Comprehensive dashboard to manage patients, track progress, and provide personalized care with AI-powered insights and compassionate tools',
                        icon: Icons.people,
                        gradient: const LinearGradient(
                          colors: [AppColors.beige400, AppColors.beige500],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () {
                          context.read<AppProvider>().login('doctor', 'Dr. Sarah Wilson');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DoctorHomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: PortalCard(
                        title: 'Personal Wellness Portal',
                        description: 'Track your wellness journey, connect with specialists, and access personalized care through interactive and nurturing tools',
                        icon: Icons.favorite,
                        gradient: const LinearGradient(
                          colors: [AppColors.rose400, AppColors.rose500],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () {
                          context.read<AppProvider>().login('patient', 'Sarah Johnson');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientHomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // Features Section
                Text(
                  'Why Choose MindCare? ✨',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Feature Cards
                const Row(
                  children: [
                    Expanded(
                      child: FeatureCard(
                        icon: Icons.auto_awesome,
                        title: 'AI-Powered Insights',
                        description: 'Smart analysis of mood patterns, wellness data, and personalized recommendations for better mental health outcomes',
                        gradient: AppGradients.softLavender,
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: FeatureCard(
                        icon: Icons.phone_android,
                        title: 'Seamless Integration',
                        description: 'Connect your wearables and health devices for comprehensive fitness and wellness data tracking in one place',
                        gradient: AppGradients.softMint,
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: FeatureCard(
                        icon: Icons.handshake,
                        title: 'Connected Care',
                        description: 'Direct communication between patients and providers with secure messaging and compassionate video consultations',
                        gradient: AppGradients.softPeach,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // Trust Indicators
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.beige200.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTrustIndicator('HIPAA Compliant'),
                      const SizedBox(width: 48),
                      _buildTrustIndicator('End-to-End Encrypted'),
                      const SizedBox(width: 48),
                      _buildTrustIndicator('24/7 Support'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrustIndicator(String text) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.rose400, AppColors.rose500],
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.beige600,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class PortalCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;

  const PortalCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [AppShadows.gentle],
          border: Border.all(
            color: AppColors.beige200.withOpacity(0.6),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [AppShadows.soft],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.beige800,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.beige700,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(icon, color: AppColors.rose500, size: 20),
                const SizedBox(width: 8),
                Text(
                  icon == Icons.people ? 'Access Provider Dashboard' : 'Begin Your Journey',
                  style: const TextStyle(
                    color: AppColors.rose600,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.rose500,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Gradient gradient;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [AppShadows.gentle],
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.beige700,
                  height: 1.4,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}