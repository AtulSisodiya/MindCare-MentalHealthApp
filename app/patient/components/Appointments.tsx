'use client'
import { useState } from 'react'
import { CalendarIcon, VideoCameraIcon, ClockIcon, UserIcon, PlusIcon } from '@heroicons/react/24/outline'

const upcomingAppointments = [
  {
    id: 1,
    doctor: 'Dr. Emily Rodriguez',
    specialty: 'Clinical Psychologist',
    date: '2024-01-17',
    time: '2:00 PM',
    duration: '50 min',
    type: 'video',
    status: 'confirmed',
    notes: 'Follow-up on anxiety management techniques'
  },
  {
    id: 2,
    doctor: 'Dr. Michael Chen',
    specialty: 'Psychiatrist',
    date: '2024-01-19',
    time: '10:30 AM',
    duration: '30 min',
    type: 'in-person',
    status: 'confirmed',
    notes: 'Medication review and adjustment'
  }
]

const availableSlots = [
  { date: '2024-01-18', time: '9:00 AM', doctor: 'Dr. Sarah Wilson' },
  { date: '2024-01-18', time: '11:00 AM', doctor: 'Dr. Emily Rodriguez' },
  { date: '2024-01-19', time: '3:00 PM', doctor: 'Dr. Michael Chen' },
  { date: '2024-01-20', time: '1:00 PM', doctor: 'Dr. Sarah Wilson' },
]

export default function Appointments() {
  const [showBooking, setShowBooking] = useState(false)
  const [selectedSlot, setSelectedSlot] = useState(null)

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
        <div>
          <h2 className="text-2xl font-bold text-beige-800">My Appointments 📅</h2>
          <p className="text-beige-600">Manage your therapy sessions and consultations</p>
        </div>
        <button
          onClick={() => setShowBooking(!showBooking)}
          className="btn-primary flex items-center"
        >
          <PlusIcon className="w-4 h-4 mr-2" />
          Book Appointment
        </button>
      </div>

      {/* Upcoming Appointments */}
      <div className="card">
        <h3 className="text-lg font-semibold text-beige-800 mb-4">📋 Upcoming Sessions</h3>
        <div className="space-y-4">
          {upcomingAppointments.map((appointment) => (
            <div key={appointment.id} className="border border-beige-200 rounded-lg p-4">
              <div className="flex items-start justify-between">
                <div className="flex items-start space-x-4">
                  <div className="w-12 h-12 bg-beige-600 rounded-full flex items-center justify-center">
                    <UserIcon className="w-6 h-6 text-white" />
                  </div>
                  <div>
                    <h4 className="font-semibold text-beige-800">{appointment.doctor}</h4>
                    <p className="text-sm text-beige-600">{appointment.specialty}</p>
                    <div className="flex items-center space-x-4 mt-2 text-sm text-beige-600">
                      <div className="flex items-center">
                        <CalendarIcon className="w-4 h-4 mr-1" />
                        {new Date(appointment.date).toLocaleDateString('en-US', { 
                          weekday: 'long', 
                          month: 'short', 
                          day: 'numeric' 
                        })}
                      </div>
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
                    {appointment.notes && (
                      <p className="text-sm text-beige-700 mt-2 italic">"{appointment.notes}"</p>
                    )}
                  </div>
                </div>
                
                <div className="flex flex-col items-end space-y-2">
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
        </div>
      </div>

      {/* Booking Interface */}
      {showBooking && (
        <div className="card">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-beige-800">📅 Book New Appointment</h3>
            <button
              onClick={() => setShowBooking(false)}
              className="text-beige-600 hover:text-beige-800"
            >
              ✕
            </button>
          </div>
          
          <div className="grid md:grid-cols-2 gap-6">
            <div>
              <h4 className="font-medium text-beige-800 mb-3">Available Time Slots</h4>
              <div className="space-y-2">
                {availableSlots.map((slot, index) => (
                  <button
                    key={index}
                    onClick={() => setSelectedSlot(slot)}
                    className={`w-full text-left p-3 rounded-lg border transition-colors ${
                      selectedSlot === slot
                        ? 'border-beige-600 bg-beige-100'
                        : 'border-beige-200 hover:border-beige-300'
                    }`}
                  >
                    <div className="flex justify-between items-center">
                      <div>
                        <div className="font-medium text-beige-800">
                          {new Date(slot.date).toLocaleDateString('en-US', { 
                            weekday: 'short', 
                            month: 'short', 
                            day: 'numeric' 
                          })}
                        </div>
                        <div className="text-sm text-beige-600">{slot.time}</div>
                      </div>
                      <div className="text-sm text-beige-600">{slot.doctor}</div>
                    </div>
                  </button>
                ))}
              </div>
            </div>

            <div>
              <h4 className="font-medium text-beige-800 mb-3">Appointment Details</h4>
              {selectedSlot ? (
                <div className="space-y-4">
                  <div className="bg-beige-50 p-4 rounded-lg">
                    <h5 className="font-medium text-beige-800 mb-2">Selected Slot</h5>
                    <p className="text-beige-700">{selectedSlot.doctor}</p>
                    <p className="text-beige-600 text-sm">
                      {new Date(selectedSlot.date).toLocaleDateString('en-US', { 
                        weekday: 'long', 
                        month: 'long', 
                        day: 'numeric' 
                      })} at {selectedSlot.time}
                    </p>
                  </div>
                  
                  <div>
                    <label className="block text-sm font-medium text-beige-700 mb-2">
                      Session Type
                    </label>
                    <select className="w-full px-3 py-2 border border-beige-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-beige-500">
                      <option>Video Call</option>
                      <option>In-Person</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-beige-700 mb-2">
                      Reason for Visit (Optional)
                    </label>
                    <textarea
                      className="w-full px-3 py-2 border border-beige-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-beige-500"
                      rows={3}
                      placeholder="What would you like to discuss in this session?"
                    />
                  </div>

                  <button className="w-full btn-primary">
                    Confirm Appointment
                  </button>
                </div>
              ) : (
                <div className="text-center py-8 text-beige-600">
                  Select a time slot to continue
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Quick Actions */}
      <div className="grid md:grid-cols-3 gap-4">
        <div className="card text-center">
          <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-3">
            <VideoCameraIcon className="w-6 h-6 text-blue-600" />
          </div>
          <h3 className="font-semibold text-beige-800 mb-2">Emergency Session</h3>
          <p className="text-sm text-beige-600 mb-3">Need to talk to someone right now?</p>
          <button className="btn-primary w-full">Request Now</button>
        </div>

        <div className="card text-center">
          <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-3">
            <CalendarIcon className="w-6 h-6 text-green-600" />
          </div>
          <h3 className="font-semibold text-beige-800 mb-2">Reschedule</h3>
          <p className="text-sm text-beige-600 mb-3">Need to change an existing appointment?</p>
          <button className="btn-secondary w-full">Manage</button>
        </div>

        <div className="card text-center">
          <div className="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center mx-auto mb-3">
            <UserIcon className="w-6 h-6 text-purple-600" />
          </div>
          <h3 className="font-semibold text-beige-800 mb-2">Find Specialist</h3>
          <p className="text-sm text-beige-600 mb-3">Looking for a specific type of therapist?</p>
          <button className="btn-secondary w-full">Browse</button>
        </div>
      </div>

      {/* Session History */}
      <div className="card">
        <h3 className="text-lg font-semibold text-beige-800 mb-4">📚 Recent Sessions</h3>
        <div className="space-y-3">
          <div className="flex items-center justify-between p-3 bg-beige-50 rounded-lg">
            <div>
              <div className="font-medium text-beige-800">Dr. Emily Rodriguez</div>
              <div className="text-sm text-beige-600">Jan 10, 2024 • Anxiety Management</div>
            </div>
            <button className="text-beige-600 hover:text-beige-800 text-sm">View Notes</button>
          </div>
          <div className="flex items-center justify-between p-3 bg-beige-50 rounded-lg">
            <div>
              <div className="font-medium text-beige-800">Dr. Michael Chen</div>
              <div className="text-sm text-beige-600">Jan 5, 2024 • Medication Review</div>
            </div>
            <button className="text-beige-600 hover:text-beige-800 text-sm">View Notes</button>
          </div>
        </div>
      </div>
    </div>
  )
}