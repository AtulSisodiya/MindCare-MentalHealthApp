import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_theme.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  int _selectedMood = 5;

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'How are you feeling today? 💭',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Track your mood and emotions to better understand your wellness journey',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 48),

        // Mood Selection
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            children: [
              Text(
                'Select your current mood',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMoodOption(1, '😢', 'Very Sad'),
                  _buildMoodOption(2, '😞', 'Sad'),
                  _buildMoodOption(3, '😐', 'Neutral'),
                  _buildMoodOption(4, '🙂', 'Good'),
                  _buildMoodOption(5, '😊', 'Happy'),
                  _buildMoodOption(6, '😄', 'Very Happy'),
                  _buildMoodOption(7, '🤩', 'Excited'),
                  _buildMoodOption(8, '😍', 'Amazing'),
                  _buildMoodOption(9, '🥰', 'Wonderful'),
                  _buildMoodOption(10, '🤗', 'Fantastic'),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Selected: ${_getMoodLabel(_selectedMood)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.rose600,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Additional Notes
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
                'Additional Notes (Optional)',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Share what\'s on your mind...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.beige200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.beige200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.rose400, width: 2),
                  ),
                  filled: true,
                  fillColor: AppColors.beige50.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Energy Level
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
                'Energy Level',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Low'),
                  Expanded(
                    child: Slider(
                      value: 5,
                      min: 1,
                      max: 10,
                      divisions: 9,
                      activeColor: AppColors.rose500,
                      inactiveColor: AppColors.beige200,
                      onChanged: (value) {
                        // TODO: Update energy level
                      },
                    ),
                  ),
                  const Text('High'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Save Button
        Center(
          child: ElevatedButton(
            onPressed: () {
              appProvider.updateMood(_selectedMood);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Mood logged successfully! 🌸'),
                  backgroundColor: AppColors.rose500,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.rose500,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              'Save Mood Entry',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),

        const SizedBox(height: 48),

        // Recent Entries
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
                'Recent Mood Entries',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              ...appProvider.moodHistory.take(5).map((entry) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.beige50.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry['date'],
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.beige800,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Mood: ${entry['mood']}/10',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.beige700,
                                ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Energy: ${entry['energy']}/10',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.beige700,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMoodOption(int value, String emoji, String label) {
    final isSelected = _selectedMood == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = value;
        });
      },
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.rose100.withOpacity(0.8)
              : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.rose400 : AppColors.beige200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? const [AppShadows.rose] : null,
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.beige700,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _getMoodLabel(int mood) {
    switch (mood) {
      case 1:
        return 'Very Sad';
      case 2:
        return 'Sad';
      case 3:
        return 'Neutral';
      case 4:
        return 'Good';
      case 5:
        return 'Happy';
      case 6:
        return 'Very Happy';
      case 7:
        return 'Excited';
      case 8:
        return 'Amazing';
      case 9:
        return 'Wonderful';
      case 10:
        return 'Fantastic';
      default:
        return 'Unknown';
    }
  }
}