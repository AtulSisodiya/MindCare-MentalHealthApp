import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

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