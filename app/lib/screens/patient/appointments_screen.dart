import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Your Appointments 📅',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Manage your therapy sessions and consultations',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 48),

        // Upcoming Appointments
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
                'Upcoming Appointments',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              _buildAppointmentCard(
                context,
                'Therapy Session',
                'Dr. Sarah Rodriguez',
                'Tomorrow, 2:00 PM',
                'Virtual Consultation',
                isNext: true,
              ),
              const SizedBox(height: 16),
              _buildAppointmentCard(
                context,
                'Weekly Check-in',
                'Dr. Sarah Rodriguez',
                'Friday, 10:00 AM',
                'In-person Session',
                isNext: false,
              ),
              const SizedBox(height: 16),
              _buildAppointmentCard(
                context,
                'Follow-up Session',
                'Dr. Michael Chen',
                'Next Monday, 3:30 PM',
                'Virtual Consultation',
                isNext: false,
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Past Appointments
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
                'Recent Sessions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              _buildPastAppointmentCard(
                context,
                'Therapy Session',
                'Dr. Sarah Rodriguez',
                'Last Tuesday, 2:00 PM',
                'Completed - Notes available',
              ),
              const SizedBox(height: 16),
              _buildPastAppointmentCard(
                context,
                'Weekly Check-in',
                'Dr. Sarah Rodriguez',
                'Last Friday, 10:00 AM',
                'Completed - Notes available',
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Quick Actions
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
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Schedule New',
                      Icons.add,
                      AppColors.rose500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Reschedule',
                      Icons.edit_calendar,
                      AppColors.beige500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      'Cancel',
                      Icons.cancel,
                      AppColors.rose600,
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

  Widget _buildAppointmentCard(
    BuildContext context,
    String title,
    String doctor,
    String time,
    String type,
    {required bool isNext}
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isNext
            ? AppColors.rose50.withOpacity(0.5)
            : AppColors.beige50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isNext
              ? AppColors.rose200.withOpacity(0.5)
              : AppColors.beige200.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isNext ? AppColors.rose500 : AppColors.beige400,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.beige700,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.beige600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige500,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              if (isNext)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.rose500,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('Join Now'),
                )
              else
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
                    'View Details',
                    style: TextStyle(color: AppColors.beige700),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPastAppointmentCard(
    BuildContext context,
    String title,
    String doctor,
    String time,
    String status,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.beige50.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.beige200.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.rose500,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  doctor,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.beige700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.rose600,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.beige400,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}