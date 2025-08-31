'use client'
import { useState } from 'react'
import PatientLayout from './components/PatientLayout'
import Dashboard from './components/Dashboard'
import MoodTracking from './components/MoodTracking'
import Appointments from './components/Appointments'
import TherapyGames from './components/TherapyGames'
import Onboarding from './components/Onboarding'

export default function PatientPortal() {
  const [activeTab, setActiveTab] = useState('dashboard')
  const [isNewUser, setIsNewUser] = useState(false) // Set to true for new user flow

  if (isNewUser) {
    return <Onboarding onComplete={() => setIsNewUser(false)} />
  }

  const renderContent = () => {
    switch (activeTab) {
      case 'dashboard':
        return <Dashboard />
      case 'mood':
        return <MoodTracking />
      case 'appointments':
        return <Appointments />
      case 'therapy':
        return <TherapyGames />
      default:
        return <Dashboard />
    }
  }

  return (
    <PatientLayout activeTab={activeTab} setActiveTab={setActiveTab}>
      {renderContent()}
    </PatientLayout>
  )
}