import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AppointmentsCalendarScreen extends StatefulWidget {
  const AppointmentsCalendarScreen({super.key});

  @override
  State<AppointmentsCalendarScreen> createState() => _AppointmentsCalendarScreenState();
}

class _AppointmentsCalendarScreenState extends State<AppointmentsCalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Appointment Calendar 📅',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Manage your patient appointments and schedule',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 32),

        // Calendar and Appointments
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Widget
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [AppShadows.gentle],
                ),
                child: Column(
                  children: [
                    Text(
                      'Calendar',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    // Simple calendar representation
                    _buildCalendarWidget(),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('New Appointment'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.rose500,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 32),

            // Appointments List
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [AppShadows.gentle],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s Appointments',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    _buildAppointmentItem(
                      context,
                      'Sarah Johnson',
                      '2:00 PM - 3:00 PM',
                      'Therapy Session',
                      'Virtual Consultation',
                      true,
                    ),
                    const SizedBox(height: 16),
                    _buildAppointmentItem(
                      context,
                      'Michael Chen',
                      '10:00 AM - 10:30 AM',
                      'Follow-up',
                      'In-person',
                      false,
                    ),
                    const SizedBox(height: 16),
                    _buildAppointmentItem(
                      context,
                      'Emma Rodriguez',
                      '11:30 AM - 12:00 PM',
                      'Crisis Intervention',
                      'Virtual Consultation',
                      true,
                    ),
                    const SizedBox(height: 16),
                    _buildAppointmentItem(
                      context,
                      'David Kim',
                      '3:30 PM - 4:00 PM',
                      'Weekly Check-in',
                      'Virtual Consultation',
                      false,
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Tomorrow\'s Appointments',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    _buildAppointmentItem(
                      context,
                      'Lisa Thompson',
                      '9:00 AM - 9:30 AM',
                      'Initial Consultation',
                      'In-person',
                      false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Quick Stats
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This Week\'s Summary',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Total Appointments',
                      '24',
                      AppColors.rose500,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildStatCard(
                      'Completed',
                      '18',
                      AppColors.softMint,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildStatCard(
                      'Upcoming',
                      '6',
                      AppColors.beige500,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildStatCard(
                      'Cancellations',
                      '2',
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

  Widget _buildCalendarWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.beige50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Month/Year header
          Text(
            'January 2024',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          // Days of week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
              return Text(
                day,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.beige600,
                      fontWeight: FontWeight.w600,
                    ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          // Calendar days (simplified)
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(31, (index) {
              final day = index + 1;
              final isToday = day == 16;
              final hasAppointments = [5, 12, 16, 20, 25].contains(day);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = DateTime(2024, 1, day);
                  });
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isToday
                        ? AppColors.rose500
                        : hasAppointments
                            ? AppColors.rose100
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: TextStyle(
                        color: isToday
                            ? Colors.white
                            : hasAppointments
                                ? AppColors.rose600
                                : AppColors.beige700,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(
    BuildContext context,
    String patientName,
    String time,
    String type,
    String format,
    bool isUrgent,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isUrgent
            ? AppColors.rose50.withOpacity(0.5)
            : AppColors.beige50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUrgent
              ? AppColors.rose200.withOpacity(0.5)
              : AppColors.beige200.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.rose400, AppColors.rose500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                patientName.split(' ').map((e) => e[0]).join(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
                      patientName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (isUrgent) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.rose500,
                          borderRadius: BorderRadius.circular(8),
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
                  time,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.beige700,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$type • $format',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.rose500,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Start'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Reschedule',
                  style: TextStyle(color: AppColors.beige600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.beige700,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}