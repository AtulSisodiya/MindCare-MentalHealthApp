'use client'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts'

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
        <div className="grid md:grid-cols-2 gap-4">
          <div className="bg-blue-50 p-4 rounded-lg border-l-4 border-blue-400">
            <h4 className="font-semibold text-blue-800 mb-2">Treatment Effectiveness</h4>
            <p className="text-blue-700 text-sm">
              CBT-based interventions show 23% higher success rates compared to traditional therapy alone. 
              Consider integrating more cognitive behavioral techniques.
            </p>
          </div>
          <div className="bg-green-50 p-4 rounded-lg border-l-4 border-green-400">
            <h4 className="font-semibold text-green-800 mb-2">Wearable Data Correlation</h4>
            <p className="text-green-700 text-sm">
              Patients with consistent sleep patterns (7+ hours) show 34% faster recovery rates. 
              Recommend sleep hygiene protocols for new patients.
            </p>
          </div>
          <div className="bg-yellow-50 p-4 rounded-lg border-l-4 border-yellow-400">
            <h4 className="font-semibold text-yellow-800 mb-2">Risk Prediction</h4>
            <p className="text-yellow-700 text-sm">
              3 patients showing early warning signs of potential relapse based on mood patterns. 
              Consider scheduling check-ins within 48 hours.
            </p>
          </div>
          <div className="bg-purple-50 p-4 rounded-lg border-l-4 border-purple-400">
            <h4 className="font-semibold text-purple-800 mb-2">Engagement Patterns</h4>
            <p className="text-purple-700 text-sm">
              Gamified therapy exercises increase patient engagement by 45%. 
              Consider expanding interactive elements in treatment plans.
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}