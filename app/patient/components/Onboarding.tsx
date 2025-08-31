'use client'
import { useState } from 'react'
import { CheckIcon } from '@heroicons/react/24/outline'

interface OnboardingProps {
  onComplete: () => void
}

export default function Onboarding({ onComplete }: OnboardingProps) {
  const [currentStep, setCurrentStep] = useState(0)
  const [formData, setFormData] = useState({
    name: '',
    age: '',
    symptoms: [],
    goals: [],
    wearableConsent: false,
    dataConsent: false
  })

  const steps = [
    'Personal Information',
    'Current Symptoms',
    'Your Goals',
    'Wearable Integration',
    'Privacy & Consent'
  ]

  const symptoms = [
    'Anxiety', 'Depression', 'Stress', 'Sleep Issues', 'Panic Attacks',
    'Social Anxiety', 'PTSD', 'Mood Swings', 'Concentration Issues', 'Other'
  ]

  const goals = [
    'Reduce Anxiety', 'Improve Sleep', 'Manage Stress', 'Build Confidence',
    'Better Relationships', 'Emotional Regulation', 'Mindfulness', 'Self-Care'
  ]

  const handleNext = () => {
    if (currentStep < steps.length - 1) {
      setCurrentStep(currentStep + 1)
    } else {
      onComplete()
    }
  }

  const handlePrevious = () => {
    if (currentStep > 0) {
      setCurrentStep(currentStep - 1)
    }
  }

  const toggleSymptom = (symptom: string) => {
    setFormData(prev => ({
      ...prev,
      symptoms: prev.symptoms.includes(symptom)
        ? prev.symptoms.filter(s => s !== symptom)
        : [...prev.symptoms, symptom]
    }))
  }

  const toggleGoal = (goal: string) => {
    setFormData(prev => ({
      ...prev,
      goals: prev.goals.includes(goal)
        ? prev.goals.filter(g => g !== goal)
        : [...prev.goals, goal]
    }))
  }

  const renderStep = () => {
    switch (currentStep) {
      case 0:
        return (
          <div className="space-y-8">
            <div className="text-center">
              <div className="w-20 h-20 bg-gradient-to-br from-sage-500 to-sage-600 rounded-3xl flex items-center justify-center mx-auto mb-6 shadow-soft">
                <span className="text-3xl">👋</span>
              </div>
              <h2 className="text-3xl font-display font-bold text-warm-900 mb-3">Welcome to MindCare!</h2>
              <p className="text-warm-700 text-lg">Let's get to know you better to personalize your wellness journey.</p>
            </div>
            <div className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-warm-800 mb-3">What's your name?</label>
                <input
                  type="text"
                  value={formData.name}
                  onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
                  className="input-field"
                  placeholder="Enter your first name"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-warm-800 mb-3">How old are you?</label>
                <input
                  type="number"
                  value={formData.age}
                  onChange={(e) => setFormData(prev => ({ ...prev, age: e.target.value }))}
                  className="input-field"
                  placeholder="Enter your age"
                />
              </div>
            </div>
          </div>
        )

      case 1:
        return (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold text-beige-800 mb-2">What brings you here? 🤔</h2>
              <p className="text-beige-600">Select any symptoms or challenges you're currently experiencing. This helps us understand how to support you better.</p>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {symptoms.map((symptom) => (
                <button
                  key={symptom}
                  onClick={() => toggleSymptom(symptom)}
                  className={`p-3 rounded-lg border-2 transition-colors text-left ${
                    formData.symptoms.includes(symptom)
                      ? 'border-beige-600 bg-beige-100 text-beige-800'
                      : 'border-beige-200 hover:border-beige-300 text-beige-600'
                  }`}
                >
                  <div className="flex items-center justify-between">
                    <span>{symptom}</span>
                    {formData.symptoms.includes(symptom) && (
                      <CheckIcon className="w-5 h-5 text-beige-600" />
                    )}
                  </div>
                </button>
              ))}
            </div>
          </div>
        )

      case 2:
        return (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold text-beige-800 mb-2">What are your goals? 🎯</h2>
              <p className="text-beige-600">What would you like to work on? Select all that apply to create your personalized journey.</p>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {goals.map((goal) => (
                <button
                  key={goal}
                  onClick={() => toggleGoal(goal)}
                  className={`p-3 rounded-lg border-2 transition-colors text-left ${
                    formData.goals.includes(goal)
                      ? 'border-beige-600 bg-beige-100 text-beige-800'
                      : 'border-beige-200 hover:border-beige-300 text-beige-600'
                  }`}
                >
                  <div className="flex items-center justify-between">
                    <span>{goal}</span>
                    {formData.goals.includes(goal) && (
                      <CheckIcon className="w-5 h-5 text-beige-600" />
                    )}
                  </div>
                </button>
              ))}
            </div>
          </div>
        )

      case 3:
        return (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold text-beige-800 mb-2">Connect Your Wearables ⌚</h2>
              <p className="text-beige-600">We can track your sleep, heart rate, and activity to provide better insights. This is completely optional!</p>
            </div>
            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div className="card text-center">
                  <div className="text-4xl mb-2">⌚</div>
                  <h3 className="font-semibold text-beige-800">Apple Watch</h3>
                  <button className="btn-secondary mt-2 w-full">Connect</button>
                </div>
                <div className="card text-center">
                  <div className="text-4xl mb-2">📱</div>
                  <h3 className="font-semibold text-beige-800">Fitbit</h3>
                  <button className="btn-secondary mt-2 w-full">Connect</button>
                </div>
              </div>
              <div className="flex items-center">
                <input
                  type="checkbox"
                  id="wearableConsent"
                  checked={formData.wearableConsent}
                  onChange={(e) => setFormData(prev => ({ ...prev, wearableConsent: e.target.checked }))}
                  className="mr-3"
                />
                <label htmlFor="wearableConsent" className="text-beige-700">
                  I consent to sharing my wearable data to improve my care
                </label>
              </div>
            </div>
          </div>
        )

      case 4:
        return (
          <div className="space-y-6">
            <div>
              <h2 className="text-2xl font-bold text-beige-800 mb-2">Privacy & Consent 🔒</h2>
              <p className="text-beige-600">Your privacy is our priority. Please review and consent to how we'll use your data.</p>
            </div>
            <div className="space-y-4">
              <div className="bg-beige-50 p-4 rounded-lg">
                <h3 className="font-semibold text-beige-800 mb-2">How we protect your data:</h3>
                <ul className="text-sm text-beige-700 space-y-1">
                  <li>• All data is encrypted and stored securely</li>
                  <li>• Only your assigned healthcare providers can access your information</li>
                  <li>• You can delete your data at any time</li>
                  <li>• We never share your data with third parties without consent</li>
                </ul>
              </div>
              <div className="space-y-3">
                <div className="flex items-start">
                  <input
                    type="checkbox"
                    id="dataConsent"
                    checked={formData.dataConsent}
                    onChange={(e) => setFormData(prev => ({ ...prev, dataConsent: e.target.checked }))}
                    className="mr-3 mt-1"
                  />
                  <label htmlFor="dataConsent" className="text-beige-700 text-sm">
                    I consent to the collection and use of my health data for personalized care and treatment recommendations. I understand I can withdraw this consent at any time.
                  </label>
                </div>
              </div>
            </div>
          </div>
        )

      default:
        return null
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-cream-50 via-warm-50 to-sage-50 flex items-center justify-center p-6">
      <div className="max-w-3xl w-full">
        {/* Progress Bar */}
        <div className="mb-10">
          <div className="flex items-center justify-between mb-3">
            <span className="text-sm font-medium text-warm-700">Step {currentStep + 1} of {steps.length}</span>
            <span className="text-sm font-medium text-warm-700">{Math.round(((currentStep + 1) / steps.length) * 100)}% Complete</span>
          </div>
          <div className="w-full bg-cream-200 rounded-full h-3 shadow-inner">
            <div 
              className="bg-gradient-to-r from-sage-500 to-sage-600 h-3 rounded-full transition-all duration-500 shadow-gentle"
              style={{ width: `${((currentStep + 1) / steps.length) * 100}%` }}
            ></div>
          </div>
          <div className="mt-2 text-center">
            <span className="text-sm text-warm-600 font-medium">{steps[currentStep]}</span>
          </div>
        </div>

        {/* Content */}
        <div className="card">
          {renderStep()}
        </div>

        {/* Navigation */}
        <div className="flex justify-between mt-8">
          <button
            onClick={handlePrevious}
            disabled={currentStep === 0}
            className={`px-8 py-3 rounded-xl font-medium transition-all duration-200 ${
              currentStep === 0
                ? 'bg-cream-200 text-warm-500 cursor-not-allowed'
                : 'btn-secondary hover:scale-105'
            }`}
          >
            Previous
          </button>
          <button
            onClick={handleNext}
            className="btn-primary px-8 py-3 hover:scale-105"
          >
            {currentStep === steps.length - 1 ? 'Complete Setup ✨' : 'Continue'}
          </button>
        </div>
      </div>
    </div>
  )
}