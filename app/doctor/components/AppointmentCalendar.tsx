'use client'
import { useState } from 'react'
import { CalendarIcon, ClockIcon, VideoCameraIcon, UserIcon } from '@heroicons/react/24/outline'

const mockAppointments = [
  {
    id: 1,
    patient: 'Sarah Johnson',
    time: '09:00 AM',
    duration: '50 min',
    type: 'video',
    status: 'confirmed',
    date: '2024-01-16'
  },
  {
    id: 2,
    patient: 'Michael Chen',
    time: '10:30 AM',
    duration: '50 min',
    type: 'in-person',
    status: 'confirmed',
    date: '2024-01-16'
  },
  {
    id: 3,
    patient: 'Emma Davis',
    time: '02:00 PM',
    duration: '50 min',
    type: 'video',
    status: 'pending',
    date: '2024-01-16'
  }
]

export default function AppointmentCalendar() {
  const [selectedDate, setSelectedDate] = useState('2024-01-16')

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'confirmed': return 'bg-green-100 text-green-800'
      case 'pending': return 'bg-yellow-100 text-yellow-800'
      case 'cancelled': return 'bg-red-100 text-red-800'
      default: return 'bg-gray-100 text-gray-800'
    }
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <h2 className="text-2xl font-bold text-beige-800">Appointment Calendar</h2>
        <button className="btn-primary">
          Schedule New Appointment
        </button>
      </div>

      <div className="grid lg:grid-cols-4 gap-6">
        {/* Calendar Widget */}
        <div className="lg:col-span-1">
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">📅 Calendar</h3>
            <div className="space-y-2">
              {['2024-01-15', '2024-01-16', '2024-01-17', '2024-01-18', '2024-01-19'].map(date => (
                <button
                  key={date}
                  onClick={() => setSelectedDate(date)}
                  className={`w-full text-left p-3 rounded-lg transition-colors ${
                    selectedDate === date 
                      ? 'bg-beige-600 text-white' 
                      : 'bg-beige-50 hover:bg-beige-100 text-beige-800'
                  }`}
                >
                  <div className="font-medium">
                    {new Date(date).toLocaleDateString('en-US', { weekday: 'short' })}
                  </div>
                  <div className="text-sm opacity-75">
                    {new Date(date).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                  </div>
                </button>
              ))}
            </div>
          </div>
        </div>

        {/* Appointments List */}
        <div className="lg:col-span-3">
          <div className="card">
            <h3 className="text-lg font-semibold text-beige-800 mb-4">
              Appointments for {new Date(selectedDate).toLocaleDateString('en-US', { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric' 
              })}
            </h3>
            
            <div className="space-y-4">
              {mockAppointments
                .filter(apt => apt.date === selectedDate)
                .map((appointment) => (
                <div key={appointment.id} className="border border-beige-200 rounded-lg p-4">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center space-x-4">
                      <div className="w-10 h-10 bg-beige-600 rounded-full flex items-center justify-center">
                        <UserIcon className="w-5 h-5 text-white" />
                      </div>
                      <div>
                        <h4 className="font-semibold text-beige-800">{appointment.patient}</h4>
                        <div className="flex items-center space-x-4 text-sm text-beige-600">
                          <div className="flex items-center">
                            <ClockIcon className="w-4 h-4 mr-1" />
                            {appointment.time} ({appointment.duration})
                          </div>
                          <div className="flex items-center">
                            {appointment.type === 'video' ? (
                              <VideoCameraIcon className="w-4 h-4 mr-1" />
                            ) : (
                              <UserIcon className="w-4 h-4 mr-1" />
                            )}
                            {appointment.type === 'video' ? 'Video Call' : 'In-Person'}
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div className="flex items-center space-x-3">
                      <span className={`px-2 py-1 rounded text-xs font-medium ${getStatusColor(appointment.status)}`}>
                        {appointment.status.toUpperCase()}
                      </span>
                      <div className="flex space-x-2">
                        <button className="btn-secondary text-sm">Reschedule</button>
                        {appointment.type === 'video' && (
                          <button className="btn-primary text-sm">Join Call</button>
                        )}
                      </div>
                    </div>
                  </div>
                </div>
              ))}
              
              {mockAppointments.filter(apt => apt.date === selectedDate).length === 0 && (
                <div className="text-center py-8 text-beige-600">
                  No appointments scheduled for this date.
                </div>
              )}
            </div>
          </div>

          {/* Quick Stats */}
          <div className="grid md:grid-cols-3 gap-4 mt-6">
            <div className="card text-center">
              <div className="text-2xl font-bold text-beige-800">12</div>
              <div className="text-beige-600">This Week</div>
            </div>
            <div className="card text-center">
              <div className="text-2xl font-bold text-beige-800">3</div>
              <div className="text-beige-600">Today</div>
            </div>
            <div className="card text-center">
              <div className="text-2xl font-bold text-beige-800">2</div>
              <div className="text-beige-600">Pending</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}