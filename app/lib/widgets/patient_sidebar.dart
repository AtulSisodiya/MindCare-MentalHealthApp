import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';

class PatientSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const PatientSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        boxShadow: const [AppShadows.gentle],
      ),
      child: Column(
        children: [
          // User Info Section
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.beige600,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  appProvider.userName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.rose100.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Day ${appProvider.userStreak} of your journey ✨',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.rose600,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildNavItem(
                  context,
                  index: 0,
                  icon: Icons.home,
                  title: 'Dashboard',
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  index: 1,
                  icon: Icons.favorite,
                  title: 'Mood Check-in',
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  index: 2,
                  icon: Icons.calendar_today,
                  title: 'Appointments',
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  index: 3,
                  icon: Icons.extension,
                  title: 'Wellness Games',
                ),
              ],
            ),
          ),

          // Mood Quick Check
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.rose50, AppColors.beige50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.rose200.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.emoji_emotions,
                      color: AppColors.rose500,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Quick Mood Check 💭',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMoodEmoji('😢', 1),
                    _buildMoodEmoji('😐', 2),
                    _buildMoodEmoji('🙂', 3),
                    _buildMoodEmoji('😊', 4),
                    _buildMoodEmoji('🤩', 5),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to mood logging screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      foregroundColor: AppColors.beige700,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Log Today\'s Mood'),
                  ),
                ),
              ],
            ),
          ),

          // Crisis Support
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.rose100, AppColors.beige100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.rose300.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.warning,
                      color: AppColors.rose600,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Need Help Now?',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement crisis support
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.rose500,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: AppColors.rose200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '🆘 Crisis Support',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '24/7 immediate assistance available',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.beige700,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, {
    required int index,
    required IconData icon,
    required String title,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.rose100.withOpacity(0.8)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? const Border(
                  left: BorderSide(
                    color: AppColors.rose500,
                    width: 4,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.rose600 : AppColors.beige600,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected ? AppColors.rose800 : AppColors.beige600,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodEmoji(String emoji, int moodValue) {
    return GestureDetector(
      onTap: () {
        // TODO: Update mood in provider
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}