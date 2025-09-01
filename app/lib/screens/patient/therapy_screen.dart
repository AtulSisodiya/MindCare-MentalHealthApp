import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Wellness Games & Activities 🎮',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Interactive activities to support your mental wellness journey',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 48),

        // Quick Activities
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Activities (5-10 minutes)',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildActivityCard(
                      context,
                      'Breathing Exercise',
                      '4-7-8 breathing technique',
                      '🫁',
                      AppColors.softMint,
                      '5 min',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildActivityCard(
                      context,
                      'Mindfulness',
                      'Guided meditation',
                      '🧘',
                      AppColors.softLavender,
                      '7 min',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildActivityCard(
                      context,
                      'Gratitude',
                      'Daily gratitude practice',
                      '🙏',
                      AppColors.softPeach,
                      '3 min',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Featured Games
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Wellness Games',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              _buildGameCard(
                context,
                'Mood Color Match',
                'Match colors to your current emotions',
                '🎨',
                AppColors.rose400,
                'Interactive • 10 min',
                'New!',
              ),
              const SizedBox(height: 20),
              _buildGameCard(
                context,
                'Thought Garden',
                'Plant and nurture positive thoughts',
                '🌱',
                AppColors.softMint,
                'Creative • 15 min',
                'Popular',
              ),
              const SizedBox(height: 20),
              _buildGameCard(
                context,
                'Stress Relief Bubbles',
                'Pop bubbles to release tension',
                '🫧',
                AppColors.softSky,
                'Relaxing • 8 min',
                '',
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Progress & Achievements
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Progress & Achievements 🏆',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildAchievementBadge(
                    context,
                    'First Steps',
                    'Completed 5 activities',
                    '🎯',
                    true,
                  ),
                  const SizedBox(width: 20),
                  _buildAchievementBadge(
                    context,
                    'Mindful Master',
                    '7 day meditation streak',
                    '🧘',
                    true,
                  ),
                  const SizedBox(width: 20),
                  _buildAchievementBadge(
                    context,
                    'Gratitude Guru',
                    '30 days of gratitude',
                    '🙏',
                    false,
                  ),
                  const SizedBox(width: 20),
                  _buildAchievementBadge(
                    context,
                    'Stress Buster',
                    'Completed 10 stress relief sessions',
                    '💪',
                    false,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.rose50, AppColors.beige50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.rose200.withOpacity(0.5),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.trending_up,
                      color: AppColors.rose500,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Great Progress!',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppColors.beige800,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'You\'ve completed 23 wellness activities this month. Keep up the amazing work! 🌟',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.beige700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Categories
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Categories',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildCategoryCard(
                      context,
                      'Anxiety Relief',
                      'Techniques to manage anxiety',
                      Icons.spa,
                      AppColors.softMint,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildCategoryCard(
                      context,
                      'Sleep Stories',
                      'Guided sleep meditations',
                      Icons.nightlight,
                      AppColors.softLavender,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildCategoryCard(
                      context,
                      'Stress Management',
                      'Tools for stress reduction',
                      Icons.self_improvement,
                      AppColors.softPeach,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildCategoryCard(
                      context,
                      'Positive Affirmations',
                      'Daily affirmation exercises',
                      Icons.favorite,
                      AppColors.rose400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityCard(
    BuildContext context,
    String title,
    String description,
    String emoji,
    Color color,
    String duration,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.beige700,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                duration,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.beige600,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context,
    String title,
    String description,
    String emoji,
    Color color,
    String details,
    String badge,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (badge.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.rose500,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.beige700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  details,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Play Now'),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementBadge(
    BuildContext context,
    String title,
    String description,
    String emoji,
    bool unlocked,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: unlocked
              ? AppColors.rose50.withOpacity(0.5)
              : AppColors.beige50.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: unlocked
                ? AppColors.rose200.withOpacity(0.5)
                : AppColors.beige200.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: TextStyle(
                fontSize: 32,
                color: unlocked ? AppColors.rose600 : AppColors.beige400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: unlocked ? AppColors.beige800 : AppColors.beige600,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: unlocked ? AppColors.beige700 : AppColors.beige500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 32,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.beige800,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.beige700,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}