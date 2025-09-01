'use client'
import { useState } from 'react'
import { FaceSmileIcon, HeartIcon, BoltIcon, CloudIcon, SparklesIcon } from '@heroicons/react/24/outline'
import { aiService, MoodData } from '../../../lib/ai-service'

const moodEmojis = [
  { value: 1, emoji: '😢', label: 'Very Sad' },
  { value: 2, emoji: '😔', label: 'Sad' },
  { value: 3, emoji: '😐', label: 'Neutral' },
  { value: 4, emoji: '🙂', label: 'Good' },
  { value: 5, emoji: '😊', label: 'Happy' },
  { value: 6, emoji: '😄', label: 'Very Happy' },
  { value: 7, emoji: '🤩', label: 'Excellent' }
]

const symptoms = [
  'Anxiety', 'Sadness', 'Stress', 'Fatigue', 'Irritability', 
  'Restlessness', 'Hopelessness', 'Overwhelmed', 'Lonely', 'Angry'
]

const activities = [
  'Exercise', 'Meditation', 'Social Time', 'Work', 'Sleep', 
  'Therapy', 'Reading', 'Music', 'Nature', 'Hobbies'
]

export default function MoodTracking() {
  const [selectedMood, setSelectedMood] = useState(0)
  const [selectedSymptoms, setSelectedSymptoms] = useState<string[]>([])
  const [selectedActivities, setSelectedActivities] = useState<string[]>([])
  const [journalEntry, setJournalEntry] = useState('')
  const [energyLevel, setEnergyLevel] = useState(5)
  const [sleepQuality, setSleepQuality] = useState(5)
  const [aiInsight, setAiInsight] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [showInsight, setShowInsight] = useState(false)

  const toggleSymptom = (symptom: string) => {
    setSelectedSymptoms(prev => 
      prev.includes(symptom) 
        ? prev.filter(s => s !== symptom)
        : [...prev, symptom]
    )
  }

  const toggleActivity = (activity: string) => {
    setSelectedActivities(prev => 
      prev.includes(activity) 
        ? prev.filter(a => a !== activity)
        : [...prev, activity]
    )
  }

  const handleSubmit = async () => {
    setIsLoading(true)
    try {
      const moodData: MoodData = {
        mood: selectedMood,
        symptoms: selectedSymptoms,
        activities: selectedActivities,
        energyLevel,
        sleepQuality,
        journalEntry
      }

      // Check for crisis indicators in journal entry
      let crisisDetected = false
      let crisisResponse = ''

      if (journalEntry) {
        const crisisCheck = await aiService.detectCrisis(journalEntry)
        if (crisisCheck.isCrisis) {
          crisisDetected = true
          crisisResponse = crisisCheck.response
        }
      }

      if (crisisDetected) {
        setAiInsight(crisisResponse)
      } else {
        const insight = await aiService.analyzeMood(moodData)
        setAiInsight(insight)
      }

      setShowInsight(true)

      // Here you would typically save to a database
      console.log('Mood entry saved:', moodData)
    } catch (error) {
      console.error('Failed to save mood entry:', error)
      // Fallback message if AI fails
      setAiInsight('Thank you for sharing how you\'re feeling. Your check-in has been saved. 🌸')
      setShowInsight(true)
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="space-y-8">
      <div>
        <h2 className="text-3xl font-display font-bold text-warm-900 mb-2">How are you feeling today? 💭</h2>
        <p className="text-warm-700 text-lg">Take a moment to check in with yourself and reflect on your day</p>
      </div>

      <div className="grid lg:grid-cols-2 gap-8">
        {/* Mood Selection */}
        <div className="card">
          <h3 className="text-xl font-display font-semibold text-warm-900 mb-6 flex items-center">
            <FaceSmileIcon className="w-6 h-6 text-sage-600 mr-3" />
            Overall Mood
          </h3>
          <div className="grid grid-cols-4 gap-4">
            {moodEmojis.map((mood) => (
              <button
                key={mood.value}
                onClick={() => setSelectedMood(mood.value)}
                className={`p-5 rounded-2xl border-2 transition-all duration-300 text-center hover:scale-105 ${
                  selectedMood === mood.value
                    ? 'border-sage-500 bg-gradient-to-br from-sage-100/50 to-cream-100/50 scale-105 shadow-soft'
                    : 'border-cream-200 hover:border-sage-300 hover:bg-cream-50/50'
                }`}
              >
                <div className="text-4xl mb-2">{mood.emoji}</div>
                <div className="text-xs font-medium text-warm-700">{mood.label}</div>
              </button>
            ))}
          </div>
        </div>

        {/* Energy & Sleep */}
        <div className="card">
          <h3 className="text-xl font-display font-semibold text-warm-900 mb-6 flex items-center">
            <BoltIcon className="w-6 h-6 text-sage-600 mr-3" />
            Energy & Sleep
          </h3>
          <div className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-warm-800 mb-3">
                Energy Level: <span className="text-sage-600 font-semibold">{energyLevel}/10</span>
              </label>
              <input
                type="range"
                min="1"
                max="10"
                value={energyLevel}
                onChange={(e) => setEnergyLevel(Number(e.target.value))}
                className="w-full h-3 bg-cream-200 rounded-full appearance-none cursor-pointer slider"
                style={{
                  background: `linear-gradient(to right, #7d947d 0%, #7d947d ${energyLevel * 10}%, #f0e8dc ${energyLevel * 10}%, #f0e8dc 100%)`
                }}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-warm-800 mb-3">
                Sleep Quality: <span className="text-sage-600 font-semibold">{sleepQuality}/10</span>
              </label>
              <input
                type="range"
                min="1"
                max="10"
                value={sleepQuality}
                onChange={(e) => setSleepQuality(Number(e.target.value))}
                className="w-full h-3 bg-cream-200 rounded-full appearance-none cursor-pointer slider"
                style={{
                  background: `linear-gradient(to right, #7d947d 0%, #7d947d ${sleepQuality * 10}%, #f0e8dc ${sleepQuality * 10}%, #f0e8dc 100%)`
                }}
              />
            </div>
          </div>
        </div>

        {/* Symptoms */}
        <div className="card">
          <h3 className="text-xl font-display font-semibold text-warm-900 mb-6 flex items-center">
            <CloudIcon className="w-6 h-6 text-sage-600 mr-3" />
            Any symptoms today?
          </h3>
          <div className="grid grid-cols-2 gap-3">
            {symptoms.map((symptom) => (
              <button
                key={symptom}
                onClick={() => toggleSymptom(symptom)}
                className={`p-4 rounded-xl border-2 transition-all duration-200 text-sm font-medium ${
                  selectedSymptoms.includes(symptom)
                    ? 'border-soft-red bg-gradient-to-br from-soft-red/20 to-warm-200/30 text-warm-900 shadow-gentle'
                    : 'border-cream-200 hover:border-sage-300 text-warm-700 hover:bg-cream-50/50'
                }`}
              >
                {symptom}
              </button>
            ))}
          </div>
        </div>

        {/* Activities */}
        <div className="card">
          <h3 className="text-xl font-display font-semibold text-warm-900 mb-6 flex items-center">
            <HeartIcon className="w-6 h-6 text-sage-600 mr-3" />
            What did you do today?
          </h3>
          <div className="grid grid-cols-2 gap-3">
            {activities.map((activity) => (
              <button
                key={activity}
                onClick={() => toggleActivity(activity)}
                className={`p-4 rounded-xl border-2 transition-all duration-200 text-sm font-medium ${
                  selectedActivities.includes(activity)
                    ? 'border-soft-green bg-gradient-to-br from-soft-green/20 to-sage-100/30 text-warm-900 shadow-gentle'
                    : 'border-cream-200 hover:border-sage-300 text-warm-700 hover:bg-cream-50/50'
                }`}
              >
                {activity}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Journal Entry */}
      <div className="card">
        <h3 className="text-xl font-display font-semibold text-warm-900 mb-6">📝 Journal Entry (Optional)</h3>
        <textarea
          value={journalEntry}
          onChange={(e) => setJournalEntry(e.target.value)}
          placeholder="How was your day? What's on your mind? Share anything you'd like..."
          className="input-field h-40 resize-none"
        />
        <div className="mt-4 p-4 bg-gradient-to-r from-sage-100/50 to-cream-100/50 rounded-xl border border-sage-200/50">
          <p className="text-warm-800 text-sm">
            💡 <strong>Tip:</strong> Writing about your feelings can help you process emotions and track patterns over time.
          </p>
        </div>
      </div>

      {/* AI Insights */}
      {showInsight && (
        <div className="card">
          <h3 className="text-xl font-display font-semibold text-warm-900 mb-6 flex items-center">
            <SparklesIcon className="w-6 h-6 text-sage-600 mr-3" />
            AI Insights
          </h3>
          <div className="bg-gradient-to-br from-sage-100/50 to-cream-100/50 p-6 rounded-2xl border border-sage-200/50">
            {isLoading ? (
              <div className="flex items-center space-x-3">
                <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-sage-600"></div>
                <p className="text-warm-700">Generating personalized insights...</p>
              </div>
            ) : (
              <p className="text-warm-800 leading-relaxed">{aiInsight}</p>
            )}
          </div>
        </div>
      )}

      {/* Submit Button */}
      <div className="flex justify-center">
        <button
          onClick={handleSubmit}
          disabled={selectedMood === 0 || isLoading}
          className={`px-12 py-4 rounded-2xl font-medium transition-all duration-300 ${
            selectedMood === 0 || isLoading
              ? 'bg-cream-200 text-warm-500 cursor-not-allowed'
              : 'btn-primary hover:scale-105 shadow-soft hover:shadow-gentle'
          }`}
        >
          {isLoading ? (
            <div className="flex items-center space-x-2">
              <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
              <span>Analyzing...</span>
            </div>
          ) : (
            'Save Today\'s Check-in'
          )}
        </button>
      </div>
    </div>
  )
}