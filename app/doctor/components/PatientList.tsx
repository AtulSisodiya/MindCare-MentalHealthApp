'use client'
import { useState } from 'react'
import { MagnifyingGlassIcon, ExclamationTriangleIcon } from '@heroicons/react/24/outline'

const mockPatients = [
  {
    id: 1,
    name: 'Sarah Johnson',
    age: 28,
    riskLevel: 'medium',
    lastSession: '2024-01-15',
    condition: 'Anxiety, Depression',
    moodTrend: 'improving',
    wearableData: { heartRate: 72, sleep: 6.5, steps: 8500 }
  },
  {
    id: 2,
    name: 'Michael Chen',
    age: 34,
    riskLevel: 'low',
    lastSession: '2024-01-12',
    condition: 'Stress Management',
    moodTrend: 'stable',
    wearableData: { heartRate: 68, sleep: 7.2, steps: 12000 }
  },
  {
    id: 3,
    name: 'Emma Davis',
    age: 22,
    riskLevel: 'high',
    lastSession: '2024-01-10',
    condition: 'PTSD, Anxiety',
    moodTrend: 'declining',
    wearableData: { heartRate: 85, sleep: 4.8, steps: 3200 }
  }
]

interface PatientListProps {
  onSelectPatient: (patient: any) => void
}

export default function PatientList({ onSelectPatient }: PatientListProps) {
  const [searchTerm, setSearchTerm] = useState('')
  const [filterRisk, setFilterRisk] = useState('all')

  const filteredPatients = mockPatients.filter(patient => {
    const matchesSearch = patient.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         patient.condition.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesRisk = filterRisk === 'all' || patient.riskLevel === filterRisk
    return matchesSearch && matchesRisk
  })

  const getRiskColor = (risk: string) => {
    switch (risk) {
      case 'high': return 'bg-red-100 text-red-800 border-red-200'
      case 'medium': return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'low': return 'bg-green-100 text-green-800 border-green-200'
      default: return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  const getMoodIcon = (trend: string) => {
    switch (trend) {
      case 'improving': return '📈'
      case 'declining': return '📉'
      case 'stable': return '➡️'
      default: return '❓'
    }
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-2xl font-bold text-beige-800">Patient Management</h2>
        <div className="flex items-center space-x-4">
          <div className="relative">
            <MagnifyingGlassIcon className="w-5 h-5 absolute left-3 top-1/2 transform -translate-y-1/2 text-beige-400" />
            <input
              type="text"
              placeholder="Search patients..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10 pr-4 py-2 border border-beige-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-beige-500"
            />
          </div>
          <select
            value={filterRisk}
            onChange={(e) => setFilterRisk(e.target.value)}
            className="px-4 py-2 border border-beige-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-beige-500"
          >
            <option value="all">All Risk Levels</option>
            <option value="high">High Risk</option>
            <option value="medium">Medium Risk</option>
            <option value="low">Low Risk</option>
          </select>
        </div>
      </div>

      <div className="grid gap-4">
        {filteredPatients.map((patient) => (
          <div
            key={patient.id}
            onClick={() => onSelectPatient(patient)}
            className="card hover:shadow-md cursor-pointer transition-shadow"
          >
            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-4">
                <div className="w-12 h-12 bg-beige-600 rounded-full flex items-center justify-center">
                  <span className="text-white font-medium">
                    {patient.name.split(' ').map(n => n[0]).join('')}
                  </span>
                </div>
                <div>
                  <h3 className="font-semibold text-beige-800">{patient.name}</h3>
                  <p className="text-sm text-beige-600">Age: {patient.age} • {patient.condition}</p>
                  <p className="text-xs text-beige-500">Last session: {patient.lastSession}</p>
                </div>
              </div>

              <div className="flex items-center space-x-4">
                <div className="text-center">
                  <div className="text-2xl">{getMoodIcon(patient.moodTrend)}</div>
                  <p className="text-xs text-beige-600 capitalize">{patient.moodTrend}</p>
                </div>

                <div className="text-right text-sm">
                  <p className="text-beige-600">💓 {patient.wearableData.heartRate} bpm</p>
                  <p className="text-beige-600">😴 {patient.wearableData.sleep}h</p>
                  <p className="text-beige-600">👟 {patient.wearableData.steps.toLocaleString()}</p>
                </div>

                <div className={`px-3 py-1 rounded-full text-xs font-medium border ${getRiskColor(patient.riskLevel)}`}>
                  {patient.riskLevel.toUpperCase()} RISK
                  {patient.riskLevel === 'high' && <ExclamationTriangleIcon className="w-3 h-3 inline ml-1" />}
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {filteredPatients.length === 0 && (
        <div className="text-center py-12">
          <p className="text-beige-600">No patients found matching your criteria.</p>
        </div>
      )}
    </div>
  )
}