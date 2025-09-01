import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  // Navigation state
  int _currentIndex = 0;
  String _currentRoute = '/';

  // User state
  bool _isLoggedIn = false;
  String _userType = ''; // 'patient' or 'doctor'
  String _userName = '';
  int _userStreak = 0;

  // Mood tracking
  int _currentMood = 5; // 1-10 scale
  List<Map<String, dynamic>> _moodHistory = [
    {'date': '1/10', 'mood': 6, 'energy': 5},
    {'date': '1/11', 'mood': 7, 'energy': 6},
    {'date': '1/12', 'mood': 5, 'energy': 4},
    {'date': '1/13', 'mood': 8, 'energy': 7},
    {'date': '1/14', 'mood': 7, 'energy': 6},
    {'date': '1/15', 'mood': 9, 'energy': 8},
    {'date': '1/16', 'mood': 8, 'energy': 7},
  ];

  // Chat messages
  List<Map<String, dynamic>> _chatMessages = [
    {
      'role': 'assistant',
      'content': 'Hi! I\'m here to support your wellness journey. 🌸',
      'timestamp': DateTime.now(),
    }
  ];

  // Getters
  int get currentIndex => _currentIndex;
  String get currentRoute => _currentRoute;
  bool get isLoggedIn => _isLoggedIn;
  String get userType => _userType;
  String get userName => _userName;
  int get userStreak => _userStreak;
  int get currentMood => _currentMood;
  List<Map<String, dynamic>> get moodHistory => _moodHistory;
  List<Map<String, dynamic>> get chatMessages => _chatMessages;

  // Navigation methods
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setCurrentRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }

  // User methods
  void login(String type, String name) {
    _isLoggedIn = true;
    _userType = type;
    _userName = name;
    _userStreak = 12; // Mock data
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userType = '';
    _userName = '';
    _userStreak = 0;
    _currentIndex = 0;
    notifyListeners();
  }

  // Mood methods
  void updateMood(int mood) {
    _currentMood = mood;
    // Add to history
    final today = DateTime.now();
    final dateStr = '${today.month}/${today.day}';
    _moodHistory.add({
      'date': dateStr,
      'mood': mood,
      'energy': mood + 1, // Mock energy level
    });
    notifyListeners();
  }

  // Chat methods
  void addChatMessage(String role, String content) {
    _chatMessages.add({
      'role': role,
      'content': content,
      'timestamp': DateTime.now(),
    });
    notifyListeners();
  }

  void clearChat() {
    _chatMessages = [
      {
        'role': 'assistant',
        'content': 'Hi! I\'m here to support your wellness journey. 🌸',
        'timestamp': DateTime.now(),
      }
    ];
    notifyListeners();
  }

  // Mock data for dashboard
  Map<String, dynamic> getDashboardData() {
    return {
      'todayMood': _currentMood,
      'sleepHours': 7.2,
      'dayStreak': _userStreak,
      'nextAppointment': 'Tomorrow, 2:00 PM',
      'doctorName': 'Dr. Rodriguez',
      'completedTasks': ['Morning meditation'],
      'pendingTasks': ['Log mood & symptoms', 'Breathing exercise'],
      'upcomingEvents': [
        {'title': 'Therapy Session', 'time': 'Tomorrow, 2:00 PM'},
        {'title': 'Weekly Check-in', 'time': 'Friday, 10:00 AM'},
      ],
    };
  }

  // Mock data for doctor dashboard
  Map<String, dynamic> getDoctorDashboardData() {
    return {
      'totalPatients': 127,
      'todayAppointments': 8,
      'urgentReviews': 3,
      'recentActivity': [
        'Patient Sarah completed mood check-in',
        'New appointment scheduled for tomorrow',
        'Medication review completed for John D.',
      ],
    };
  }
}