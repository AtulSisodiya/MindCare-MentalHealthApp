import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../providers/app_provider.dart';
import '../../theme/app_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isChatOpen = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final dashboardData = appProvider.getDashboardData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning, ${appProvider.userName.split(' ')[0]}! ☀️',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.beige800,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Here\'s how you\'re progressing on your wellness journey',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.beige700,
                      ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [AppShadows.gentle],
              ),
              child: Column(
                children: [
                  Text(
                    'Today\'s Date',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.beige600,
                        ),
                  ),
                  Text(
                    'January 16, 2024',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.beige800,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Quick Stats
        Row(
          children: [
            _buildStatCard(
              context,
              icon: Icons.favorite,
              value: '${dashboardData['todayMood']}/10',
              label: 'Today\'s Mood',
              trend: '↗ Improving',
              gradient: const LinearGradient(
                colors: [AppColors.softMint, AppColors.beige400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(width: 24),
            _buildStatCard(
              context,
              icon: Icons.bedtime,
              value: '${dashboardData['sleepHours']}h',
              label: 'Sleep Last Night',
              trend: 'Quality sleep',
              gradient: const LinearGradient(
                colors: [AppColors.softSky, AppColors.rose400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(width: 24),
            _buildStatCard(
              context,
              icon: Icons.local_fire_department,
              value: '${dashboardData['dayStreak']}',
              label: 'Day Streak',
              trend: '🔥 On fire!',
              gradient: const LinearGradient(
                colors: [AppColors.softLavender, AppColors.beige500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(width: 24),
            _buildStatCard(
              context,
              icon: Icons.calendar_today,
              value: 'Tomorrow',
              label: 'Next Session',
              trend: dashboardData['doctorName'],
              gradient: const LinearGradient(
                colors: [AppColors.softPeach, AppColors.rose500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Main Content Grid
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mood Chart Section
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [AppShadows.gentle],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          color: AppColors.rose500,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Your Mood Journey 🌸',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.beige800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 300,
                      child: LineChart(
                        _buildMoodChartData(appProvider.moodHistory),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.rose100, AppColors.beige100],
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
                            Icons.check_circle,
                            color: AppColors.rose500,
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              '🎉 Excellent progress! Your mood has improved by 25% this week. Keep up the wonderful work!',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.beige800,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 32),

            // Sidebar Content
            Expanded(
              child: Column(
                children: [
                  // Today's Tasks
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [AppShadows.gentle],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.rose500,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Today\'s Wellness Tasks',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.beige800,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTaskItem(
                          'Morning meditation',
                          completed: true,
                        ),
                        const SizedBox(height: 12),
                        _buildTaskItem(
                          'Log mood & symptoms',
                          completed: false,
                        ),
                        const SizedBox(height: 12),
                        _buildTaskItem(
                          'Breathing exercise',
                          completed: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // AI Companion
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [AppShadows.gentle],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.auto_awesome,
                              color: AppColors.rose500,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Your AI Companion',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.beige800,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (!_isChatOpen) ...[
                          Text(
                            appProvider.chatMessages.isNotEmpty
                                ? appProvider.chatMessages.last['content']
                                : 'Hi! I\'m here to support your wellness journey. 🌸',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.beige800,
                                  height: 1.5,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isChatOpen = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.rose500,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  child: const Text('Chat with AI'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Later',
                                  style: TextStyle(color: AppColors.beige600),
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          // Chat Interface
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: AppColors.rose50.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                // Chat Header
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'AI Chat',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              color: AppColors.beige800,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isChatOpen = false;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: AppColors.beige600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Chat Messages
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: appProvider.chatMessages.length,
                                    itemBuilder: (context, index) {
                                      final message = appProvider.chatMessages[index];
                                      final isUser = message['role'] == 'user';
                                      return Align(
                                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 8),
                                          padding: const EdgeInsets.all(12),
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isUser ? AppColors.rose500 : Colors.white,
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: Text(
                                            message['content'],
                                            style: TextStyle(
                                              color: isUser ? Colors.white : AppColors.beige800,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Chat Input
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Type your message...',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide.none,
                                            ),
                                            filled: true,
                                            fillColor: AppColors.beige50,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      IconButton(
                                        onPressed: () {
                                          // TODO: Send message
                                        },
                                        icon: const Icon(
                                          Icons.send,
                                          color: AppColors.rose500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Coming Up
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [AppShadows.gentle],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: AppColors.rose500,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Coming Up',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.beige800,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ...dashboardData['upcomingEvents'].map<Widget>((event) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.beige50.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: AppColors.rose500,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event['title'],
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              color: AppColors.beige800,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        event['time'],
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              color: AppColors.beige700,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String value,
    required String label,
    required String trend,
    required Gradient gradient,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [AppShadows.gentle],
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.beige800,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.beige700,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              trend,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.rose600,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, {required bool completed}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: completed
            ? AppColors.softMint.withOpacity(0.3)
            : AppColors.beige50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: completed
              ? AppColors.softMint.withOpacity(0.4)
              : AppColors.beige200.withOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: completed ? AppColors.softMint : Colors.transparent,
                  border: Border.all(
                    color: AppColors.rose400,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: completed
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.w600,
                  decoration: completed ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          if (!completed)
            TextButton(
              onPressed: () {},
              child: Text(
                'Do now',
                style: TextStyle(
                  color: AppColors.rose500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  LineChartData _buildMoodChartData(List<Map<String, dynamic>> moodData) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.beige200,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              if (value.toInt() >= 0 && value.toInt() < moodData.length) {
                return Text(
                  moodData[value.toInt()]['date'],
                  style: const TextStyle(
                    color: AppColors.beige600,
                    fontSize: 12,
                  ),
                );
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: AppColors.beige600,
                  fontSize: 12,
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: moodData.length.toDouble() - 1,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: moodData.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value['mood'].toDouble());
          }).toList(),
          isCurved: true,
          color: AppColors.rose500,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 8,
                color: AppColors.rose500,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.rose100.withOpacity(0.3),
          ),
        ),
        LineChartBarData(
          spots: moodData.asMap().entries.map((entry) {
            return FlSpot(entry.key.toDouble(), entry.value['energy'].toDouble());
          }).toList(),
          isCurved: true,
          color: AppColors.beige500,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 8,
                color: AppColors.beige500,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}