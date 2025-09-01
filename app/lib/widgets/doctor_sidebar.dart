import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';

class DoctorSidebar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const DoctorSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<DoctorSidebar> createState() => _DoctorSidebarState();
}

class _DoctorSidebarState extends State<DoctorSidebar> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final doctorData = appProvider.getDoctorDashboardData();

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
                  'Good morning,',
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
                    'Caring for ${doctorData['totalPatients']} patients ✨',
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
                  icon: Icons.people,
                  title: 'Patients',
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  index: 1,
                  icon: Icons.calendar_today,
                  title: 'Appointments',
                ),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  index: 2,
                  icon: Icons.analytics,
                  title: 'Analytics',
                ),
              ],
            ),
          ),

          // Today's Overview
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
                      Icons.analytics,
                      color: AppColors.rose500,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Today\'s Overview 📊',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildOverviewItem(
                  'Appointments',
                  '${doctorData['todayAppointments']}',
                  AppColors.rose500,
                ),
                const SizedBox(height: 12),
                _buildOverviewItem(
                  'Active Patients',
                  '${doctorData['totalPatients']}',
                  AppColors.beige500,
                ),
                const SizedBox(height: 12),
                _buildOverviewItem(
                  'Urgent Reviews',
                  '${doctorData['urgentReviews']}',
                  AppColors.rose600,
                ),
              ],
            ),
          ),

          // Quick Actions
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.beige50, AppColors.cream50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.beige200.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                _buildQuickAction(
                  '📝 Add Session Notes',
                  AppColors.rose500,
                ),
                const SizedBox(height: 12),
                _buildQuickAction(
                  '📞 Schedule Call',
                  AppColors.beige500,
                ),
                const SizedBox(height: 12),
                _buildQuickAction(
                  '📊 View Reports',
                  AppColors.softMint,
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
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
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

  Widget _buildOverviewItem(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.beige700,
                fontWeight: FontWeight.w500,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildQuickAction(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        minimumSize: const Size(double.infinity, 0),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}