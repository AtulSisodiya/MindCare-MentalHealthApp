import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Patient Management 👥',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Monitor and support your patients\' wellness journeys',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 32),

        // Search and Filter
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search patients...',
                        prefixIcon: const Icon(Icons.search, color: AppColors.beige600),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.beige200),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.beige200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.rose400, width: 2),
                        ),
                        filled: true,
                        fillColor: AppColors.beige50.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                    label: const Text('Filter'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.beige500,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Patient List
        Expanded(
          child: ListView(
            children: [
              _buildPatientCard(
                context,
                'Sarah Johnson',
                'Last session: 2 days ago',
                'Mood: Improving',
                'Next: Tomorrow 2:00 PM',
                true, // Has urgent note
              ),
              const SizedBox(height: 16),
              _buildPatientCard(
                context,
                'Michael Chen',
                'Last session: 1 week ago',
                'Mood: Stable',
                'Next: Friday 10:00 AM',
                false,
              ),
              const SizedBox(height: 16),
              _buildPatientCard(
                context,
                'Emma Rodriguez',
                'Last session: 3 days ago',
                'Mood: Needs attention',
                'Next: Next Monday 3:30 PM',
                true, // Has urgent note
              ),
              const SizedBox(height: 16),
              _buildPatientCard(
                context,
                'David Kim',
                'Last session: Yesterday',
                'Mood: Good progress',
                'Next: Wednesday 11:00 AM',
                false,
              ),
              const SizedBox(height: 16),
              _buildPatientCard(
                context,
                'Lisa Thompson',
                'Last session: 5 days ago',
                'Mood: Stable',
                'Next: Next Tuesday 1:00 PM',
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPatientCard(
    BuildContext context,
    String name,
    String lastSession,
    String moodStatus,
    String nextAppointment,
    bool hasUrgentNote,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppShadows.gentle],
        border: hasUrgentNote
            ? Border.all(color: AppColors.rose300.withOpacity(0.5), width: 2)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.rose400, AppColors.rose500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    name.split(' ').map((e) => e[0]).join(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.beige800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        if (hasUrgentNote) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.rose500,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'URGENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastSession,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.beige600,
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.rose500,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('View Details'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.beige400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Quick Note',
                      style: TextStyle(color: AppColors.beige700),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatusItem(
                  context,
                  'Current Mood',
                  moodStatus,
                  Icons.mood,
                  _getMoodColor(moodStatus),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildStatusItem(
                  context,
                  'Next Session',
                  nextAppointment,
                  Icons.calendar_today,
                  AppColors.beige500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.beige600,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getMoodColor(String moodStatus) {
    if (moodStatus.contains('Improving') || moodStatus.contains('Good progress')) {
      return AppColors.softMint;
    } else if (moodStatus.contains('Stable')) {
      return AppColors.beige500;
    } else if (moodStatus.contains('Needs attention')) {
      return AppColors.rose500;
    }
    return AppColors.beige500;
  }
}