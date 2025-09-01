'use client'
import { useState, useEffect } from 'react'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts'
import { aiService } from '../../../lib/ai-service'

const patientOutcomes = [
  { month: 'Oct', improved: 15, stable: 8, declined: 2 },
  { month: 'Nov', improved: 18, stable: 6, declined: 1 },
  { month: 'Dec', improved: 22, stable: 7, declined: 3 },
  { month: 'Jan', improved: 25, stable: 5, declined: 2 }
]

const riskDistribution = [
  { name: 'Low Risk', value: 45, color: '#10b981' },
  { name: 'Medium Risk', value: 35, color: '#f59e0b' },
  { name: 'High Risk', value: 20, color: '#ef4444' }
]

export default function Analytics() {
  const [aiInsights, setAiInsights] = useState<string[]>([])
  const [isLoadingInsights, setIsLoadingInsights] = useState(true)

  useEffect(() => {
    const generateInsights = async () => {
      try {
        const metrics = {
          totalPatients: 127,
          improvementRate: 89,
          avgRating: 4.8,
          attendanceRate: 92,
          patientOutcomes,
          riskDistribution: {
            low: 45,
            medium: 35,
            high: 20
          }
        }

        const insights = await aiService.generateAnalyticsInsights(metrics)
        setAiInsights(insights)
      } catch (error) {
        console.error('Failed to generate AI insights:', error)
        // Fallback insights
        setAiInsights([
          'Patient engagement has increased by 15% this quarter',
          'Sleep quality improvements correlate with better therapy outcomes',
          'Consider additional support for high-risk patients',
          'Digital interventions show promising results for anxiety management'
        ])
      } finally {
        setIsLoadingInsights(false)
      }
    }

    generateInsights()
  }, [])

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-bold text-beige-800">Analytics & Insights</h2>

      {/* Key Metrics */}
      <div className="grid md:grid-cols-4 gap-4">
        <div className="card text-center">
          <div className="text-3xl font-bold text-beige-800">127</div>
          <div className="text-beige-600">Total Patients</div>
          <div className="text-sm text-green-600 mt-1">↑ 12% from last month</div>
        </div>
        <div className="card text-center">
          <div className="text-3xl font-bold text-beige-800">89%</div>
          <div className="text-beige-600">Improvement Rate</div>
          <div className="text-sm text-green-600 mt-1">↑ 5% from last month</div>
        </div>
        <div className="card text-center">
          <div className="text-3xl font-bold text-beige-800">4.8</div>
          <div className="text-beige-600">Avg Session Rating</div>
          <div className="text-sm text-green-600 mt-1">↑ 0.2 from last month</div>
        </div>
        <div className="card text-center">
          <div className="text-3xl font-bold text-beige-800">92%</div>
          <div className="text-beige-600">Attendance Rate</div>
          <div className="text-sm text-green-600 mt-1">↑ 3% from last month</div>
        </div>
      </div>

      <div className="grid lg:grid-cols-2 gap-6">
        {/* Patient Outcomes */}
        <div className="card">
          <h3 className="text-lg font-semibold text-beige-800 mb-4">📈 Patient Outcomes Trend</h3>
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={patientOutcomes}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="month" />
                <YAxis />
                <Tooltip />
                <Bar dataKey="improved" fill="#10b981" name="Improved" />
                <Bar dataKey="stable" fill="#f59e0b" name="Stable" />
                <Bar dataKey="declined" fill="#ef4444" name="Declined" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Risk Distribution */}
        <div className="card">
          <h3 className="text-lg font-semibold text-beige-800 mb-4">🎯 Risk Level Distribution</h3>
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie
                  data={riskDistribution}
                  cx="50%"
                  cy="50%"
                  outerRadius={80}
                  dataKey="value"
                  label={({ name, value }) => `${name}: ${value}%`}
                >
                  {riskDistribution.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={entry.color} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </div>
      </div>

      {/* AI Insights */}
      <div className="card">
        <h3 className="text-lg font-semibold text-beige-800 mb-4">🤖 AI-Generated Insights</h3>
        {isLoadingInsights ? (
          <div className="flex items-center justify-center py-8">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-beige-600"></div>
            <span className="ml-3 text-beige-700">Generating insights...</span>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 gap-4">
            {aiInsights.map((insight, index) => {
              const colors = [
                { bg: 'bg-blue-50', border: 'border-blue-400', text: 'text-blue-800' },
                { bg: 'bg-green-50', border: 'border-green-400', text: 'text-green-800' },
                { bg: 'bg-yellow-50', border: 'border-yellow-400', text: 'text-yellow-800' },
                { bg: 'bg-purple-50', border: 'border-purple-400', text: 'text-purple-800' }
              ]
              const colorScheme = colors[index % colors.length]

              return (
                <div key={index} className={`${colorScheme.bg} p-4 rounded-lg border-l-4 ${colorScheme.border}`}>
                  <h4 className={`font-semibold ${colorScheme.text} mb-2`}>
                    Insight #{index + 1}
                  </h4>
                  <p className={`${colorScheme.text} text-sm`}>
                    {insight}
                  </p>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}