'use client'
import { ArrowLeftIcon, ChatBubbleLeftIcon, VideoCameraIcon } from '@heroicons/react/24/outline'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts'

const mockMoodData = [
  { date: '2024-01-01', mood: 6, sleep: 7.2, heartRate: 72 },
  { date: '2024-01-02', mood: 5, sleep: 6.8, heartRate: 75 },
  { date: '2024-01-03', mood: 7, sleep: 8.1, heartRate: 68 },
  { date: '2024-01-04', mood: 6, sleep: 7.5, heartRate: 70 },
  { date: '2024-01-05', mood: 8, sleep: 8.0, heartRate: 65 },
]

interface PatientDetailsProps {
  patient: any
  onBack: () => void
}

export default function PatientDetails({ patient, onBack }: PatientDetailsProps) {
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div className="flex items-center space-x-4">
          <button
            onClick={onBack}
            className="p-2 text-beige-600 hover:text-beige-800 rounded-lg hover:bg-beige-100"
          >
            <ArrowLeftIcon className="w-5 h-5" />
          </button>
          <div>
            <h2 className="text-2xl font-bold text-beige-800">{patient.name}</h2>
            <p className="text-beige-600">Patient ID: #{patient.id} • Age: {patient.age}</p>
          </div>
        </div>
        <div className="flex space-x-2">
          <button className="btn-secondary flex items-center">
            <ChatBubbleLeftIcon className="w-4 h-4 mr-2" />
            Message
          </button>
          <button className="btn-primary flex items-center">
            <VideoCameraIcon className="w-4 h-4 mr-2" />
            Video Call
          </button>
        </div>
      </div>

      <div className="grid lg:grid-cols-3 gap-6">
        {/* Patient Overview */}
        <div className="lg:col-span-2 space-y-6">
          {/* AI Summary */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">🤖 AI Summary</h3>
            <div className="bg-beige-50 p-4 rounded-lg">
              <p className="text-beige-700">
                Patient shows signs of improvement over the past week. Sleep quality has increased by 15%, 
                and mood ratings are trending upward. However, heart rate variability suggests ongoing stress. 
                Recommend continuing current therapy approach with additional stress management techniques.
              </p>
            </div>
          </div>

          {/* Mood & Wellness Trends */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">📊 Wellness Trends</h3>
            <div className="h-64">
              <ResponsiveContainer width="100%" height="100%">
                <LineChart data={mockMoodData}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="date" />
                  <YAxis />
                  <Tooltip />
                  <Line type="monotone" dataKey="mood" stroke="#d4a574" strokeWidth={2} name="Mood (1-10)" />
                  <Line type="monotone" dataKey="sleep" stroke="#825637" strokeWidth={2} name="Sleep (hours)" />
                </LineChart>
              </ResponsiveContainer>
            </div>
          </div>

          {/* Recent Notes */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">📝 Recent Session Notes</h3>
            <div className="space-y-3">
              <div className="border-l-4 border-beige-400 pl-4">
                <p className="text-sm text-beige-600">Jan 15, 2024</p>
                <p className="text-beige-800">Patient reported improved sleep patterns. Discussed coping strategies for work-related stress. Homework: practice mindfulness exercises daily.</p>
              </div>
              <div className="border-l-4 border-beige-400 pl-4">
                <p className="text-sm text-beige-600">Jan 8, 2024</p>
                <p className="text-beige-800">Breakthrough session - patient identified key triggers. Mood improvement noted. Continue current medication regimen.</p>
              </div>
            </div>
          </div>
        </div>

        {/* Sidebar */}
        <div className="space-y-6">
          {/* Quick Stats */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">📈 Current Status</h3>
            <div className="space-y-3">
              <div className="flex justify-between">
                <span className="text-beige-600">Risk Level:</span>
                <span className={`px-2 py-1 rounded text-xs font-medium ${
                  patient.riskLevel === 'high' ? 'bg-red-100 text-red-800' :
                  patient.riskLevel === 'medium' ? 'bg-yellow-100 text-yellow-800' :
                  'bg-green-100 text-green-800'
                }`}>
                  {patient.riskLevel.toUpperCase()}
                </span>
              </div>
              <div className="flex justify-between">
                <span className="text-beige-600">Mood Trend:</span>
                <span className="text-beige-800 capitalize">{patient.moodTrend}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-beige-600">Last Session:</span>
                <span className="text-beige-800">{patient.lastSession}</span>
              </div>
            </div>
          </div>

          {/* Wearable Data */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">⌚ Wearable Data</h3>
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-beige-600">💓 Heart Rate</span>
                <span className="text-beige-800 font-medium">{patient.wearableData.heartRate} bpm</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-beige-600">😴 Sleep</span>
                <span className="text-beige-800 font-medium">{patient.wearableData.sleep}h</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-beige-600">👟 Steps</span>
                <span className="text-beige-800 font-medium">{patient.wearableData.steps.toLocaleString()}</span>
              </div>
            </div>
          </div>

          {/* Recommended Tests */}
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">🧪 Recommended Tests</h3>
            <div className="space-y-2">
              <button className="w-full text-left p-3 bg-beige-50 rounded-lg hover:bg-beige-100 transition-colors">
                <div className="font-medium text-beige-800">PHQ-9 Assessment</div>
                <div className="text-sm text-beige-600">Depression screening</div>
              </button>
              <button className="w-full text-left p-3 bg-beige-50 rounded-lg hover:bg-beige-100 transition-colors">
                <div className="font-medium text-beige-800">GAD-7 Assessment</div>
                <div className="text-sm text-beige-600">Anxiety evaluation</div>
              </button>
              <button className="w-full text-left p-3 bg-beige-50 rounded-lg hover:bg-beige-100 transition-colors">
                <div className="font-medium text-beige-800">Cognitive Games</div>
                <div className="text-sm text-beige-600">Memory & attention tests</div>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}