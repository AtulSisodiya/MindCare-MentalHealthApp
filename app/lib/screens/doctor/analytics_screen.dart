import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_theme.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          'Analytics & Insights 📊',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.beige800,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Track patient progress and practice performance',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.beige700,
              ),
        ),

        const SizedBox(height: 32),

        // Key Metrics
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                context,
                'Patient Satisfaction',
                '94%',
                '+2.1%',
                Icons.sentiment_satisfied,
                AppColors.softMint,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildMetricCard(
                context,
                'Avg. Session Duration',
                '52 min',
                '+5 min',
                Icons.timer,
                AppColors.beige500,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildMetricCard(
                context,
                'Patient Retention',
                '87%',
                '+3.2%',
                Icons.people,
                AppColors.rose500,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildMetricCard(
                context,
                'Sessions This Month',
                '156',
                '+12%',
                Icons.calendar_today,
                AppColors.softLavender,
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Charts Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mood Trends Chart
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [AppShadows.gentle],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Average Patient Mood Trends',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.beige800,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 300,
                      child: LineChart(
                        _buildMoodTrendsData(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.rose50.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.rose200.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.trending_up,
                            color: AppColors.rose500,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Overall mood improvement of 18% across all patients this quarter. Great progress! 🌟',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.beige800,
                                    fontWeight: FontWeight.w500,
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

            // Sidebar with additional charts
            Expanded(
              child: Column(
                children: [
                  // Session Types Distribution
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
                          'Session Types',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.beige800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: PieChart(
                            _buildSessionTypesData(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildLegendItem('Therapy', AppColors.rose500),
                        const SizedBox(height: 8),
                        _buildLegendItem('Consultation', AppColors.beige500),
                        const SizedBox(height: 8),
                        _buildLegendItem('Crisis Intervention', AppColors.softMint),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Top Concerns
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
                          'Top Patient Concerns',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.beige800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 20),
                        _buildConcernItem('Anxiety', 35, AppColors.rose500),
                        const SizedBox(height: 12),
                        _buildConcernItem('Depression', 28, AppColors.beige500),
                        const SizedBox(height: 12),
                        _buildConcernItem('Stress Management', 22, AppColors.softMint),
                        const SizedBox(height: 12),
                        _buildConcernItem('Sleep Issues', 15, AppColors.softLavender),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Patient Progress Overview
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patient Progress Overview',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildProgressCategory(
                      context,
                      'Improving',
                      42,
                      AppColors.softMint,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildProgressCategory(
                      context,
                      'Stable',
                      38,
                      AppColors.beige500,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildProgressCategory(
                      context,
                      'Needs Attention',
                      20,
                      AppColors.rose500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Recent Insights
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [AppShadows.gentle],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Insights & Recommendations',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.beige800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              _buildInsightCard(
                context,
                'Sleep Quality Impact',
                'Patients with improved sleep show 25% better mood outcomes. Consider incorporating sleep hygiene discussions.',
                Icons.nightlight,
                AppColors.softLavender,
              ),
              const SizedBox(height: 16),
              _buildInsightCard(
                context,
                'Activity Engagement',
                'Patients who complete 3+ wellness activities per week show 30% faster progress.',
                Icons.sports_soccer,
                AppColors.softMint,
              ),
              const SizedBox(height: 16),
              _buildInsightCard(
                context,
                'Follow-up Timing',
                'Sessions scheduled within 5-7 days of previous appointment show better continuity.',
                Icons.schedule,
                AppColors.beige500,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    String change,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppShadows.gentle],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softMint.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  change,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.softMint,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
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
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.beige700,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.beige700,
              ),
        ),
      ],
    );
  }

  Widget _buildConcernItem(String concern, int percentage, Color color) {
    return Row(
      children: [
        Expanded(
          child: Text(
            concern,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 100,
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$percentage%',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget _buildProgressCategory(BuildContext context, String category, int count, Color color) {
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
            count.toString(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.beige800,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          Text(
            'patients',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.beige600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
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
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.beige700,
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildMoodTrendsData() {
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
              const months = ['Oct', 'Nov', 'Dec', 'Jan'];
              if (value.toInt() >= 0 && value.toInt() < months.length) {
                return Text(
                  months[value.toInt()],
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
            interval: 1,
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
      maxX: 3,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 6.2),
            FlSpot(1, 6.8),
            FlSpot(2, 7.1),
            FlSpot(3, 7.4),
          ],
          isCurved: true,
          color: AppColors.rose500,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
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
      ],
    );
  }

  PieChartData _buildSessionTypesData() {
    return PieChartData(
      sections: [
        PieChartSectionData(
          value: 45,
          title: '45%',
          color: AppColors.rose500,
          radius: 60,
          titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        PieChartSectionData(
          value: 35,
          title: '35%',
          color: AppColors.beige500,
          radius: 60,
          titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        PieChartSectionData(
          value: 20,
          title: '20%',
          color: AppColors.softMint,
          radius: 60,
          titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
      sectionsSpace: 2,
      centerSpaceRadius: 40,
    );
  }
}