import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/doctor_sidebar.dart';
import 'patient_list_screen.dart';
import 'appointments_calendar_screen.dart';
import 'analytics_screen.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const PatientListScreen(),
    const AppointmentsCalendarScreen(),
    const AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: Row(
          children: [
            // Sidebar
            DoctorSidebar(
              selectedIndex: _selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),

            // Main Content
            Expanded(
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: const [AppShadows.gentle],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back, color: AppColors.beige600),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Back to Home',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.beige600,
                              ),
                        ),
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.beige300,
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                        ),
                        Text(
                          'Provider Dashboard 🩺',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.beige800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        // Notifications
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications, color: AppColors.beige600),
                        ),
                        // Profile
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.beige500, AppColors.beige600],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              appProvider.userName.split(' ').map((e) => e[0]).join(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Content Area
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: _screens[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}