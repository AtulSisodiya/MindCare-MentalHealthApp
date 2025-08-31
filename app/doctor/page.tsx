'use client'
import { useState } from 'react'
import DoctorLayout from './components/DoctorLayout'
import PatientList from './components/PatientList'
import PatientDetails from './components/PatientDetails'
import AppointmentCalendar from './components/AppointmentCalendar'
import Analytics from './components/Analytics'

export default function DoctorDashboard() {
  const [activeTab, setActiveTab] = useState('patients')
  const [selectedPatient, setSelectedPatient] = useState(null)

  const renderContent = () => {
    switch (activeTab) {
      case 'patients':
        return selectedPatient ? (
          <PatientDetails 
            patient={selectedPatient} 
            onBack={() => setSelectedPatient(null)} 
          />
        ) : (
          <PatientList onSelectPatient={setSelectedPatient} />
        )
      case 'appointments':
        return <AppointmentCalendar />
      case 'analytics':
        return <Analytics />
      default:
        return <PatientList onSelectPatient={setSelectedPatient} />
    }
  }

  return (
    <DoctorLayout activeTab={activeTab} setActiveTab={setActiveTab}>
      {renderContent()}
    </DoctorLayout>
  )
}