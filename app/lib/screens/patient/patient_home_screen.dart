import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/patient_sidebar.dart';
import 'dashboard_screen.dart';
import 'mood_screen.dart';
import 'appointments_screen.dart';
import 'therapy_screen.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const MoodScreen(),
    const AppointmentsScreen(),
    const TherapyScreen(),
  ];

  final List<String> _titles = [
    'Dashboard',
    'Mood Check-in',
    'Appointments',
    'Wellness Games',
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
            PatientSidebar(
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
                          'My Wellness Journey 🌸',
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
                        // Messages
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message, color: AppColors.beige600),
                        ),
                        // Profile
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.rose400, AppColors.rose500],
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