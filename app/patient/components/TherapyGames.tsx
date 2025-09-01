'use client'
import { useState, useEffect } from 'react'
import { PlayIcon, TrophyIcon, ClockIcon, StarIcon, SparklesIcon } from '@heroicons/react/24/outline'
import { aiService } from '../../../lib/ai-service'

const games = [
  {
    id: 1,
    title: 'Memory Palace',
    description: 'Improve your memory and concentration with this engaging cognitive exercise',
    category: 'Memory',
    difficulty: 'Easy',
    duration: '5-10 min',
    points: 50,
    icon: '🧠',
    color: 'bg-blue-100 border-blue-200'
  },
  {
    id: 2,
    title: 'Mindful Breathing',
    description: 'Guided breathing exercises to reduce anxiety and promote relaxation',
    category: 'Mindfulness',
    difficulty: 'Beginner',
    duration: '3-15 min',
    points: 30,
    icon: '🫁',
    color: 'bg-green-100 border-green-200'
  },
  {
    id: 3,
    title: 'Emotion Detective',
    description: 'Learn to identify and understand different emotions through interactive scenarios',
    category: 'Emotional Intelligence',
    difficulty: 'Medium',
    duration: '10-15 min',
    points: 75,
    icon: '🕵️',
    color: 'bg-purple-100 border-purple-200'
  },
  {
    id: 4,
    title: 'Stress Buster',
    description: 'Quick techniques to manage stress and anxiety in challenging situations',
    category: 'Coping Skills',
    difficulty: 'Easy',
    duration: '5 min',
    points: 40,
    icon: '🎯',
    color: 'bg-orange-100 border-orange-200'
  },
  {
    id: 5,
    title: 'Focus Flow',
    description: 'Attention training exercises to improve concentration and mental clarity',
    category: 'Attention',
    difficulty: 'Hard',
    duration: '15-20 min',
    points: 100,
    icon: '🎪',
    color: 'bg-red-100 border-red-200'
  },
  {
    id: 6,
    title: 'Gratitude Garden',
    description: 'Cultivate positivity by practicing gratitude in a beautiful virtual garden',
    category: 'Positive Psychology',
    difficulty: 'Beginner',
    duration: '5-10 min',
    points: 35,
    icon: '🌱',
    color: 'bg-emerald-100 border-emerald-200'
  }
]

const achievements = [
  { title: 'First Steps', description: 'Completed your first therapy game', icon: '🎯', earned: true },
  { title: 'Mindful Master', description: 'Completed 10 mindfulness exercises', icon: '🧘', earned: true },
  { title: 'Memory Champion', description: 'Achieved high score in memory games', icon: '🏆', earned: false },
  { title: 'Streak Keeper', description: 'Played games for 7 days straight', icon: '🔥', earned: true },
]

export default function TherapyGames() {
  const [selectedCategory, setSelectedCategory] = useState('All')
  const [showAchievements, setShowAchievements] = useState(false)
  const [aiRecommendations, setAiRecommendations] = useState<string[]>([])
  const [isLoadingRecommendations, setIsLoadingRecommendations] = useState(true)

  const categories = ['All', 'Memory', 'Mindfulness', 'Emotional Intelligence', 'Coping Skills', 'Attention', 'Positive Psychology']

  const filteredGames = selectedCategory === 'All'
    ? games
    : games.filter(game => game.category === selectedCategory)

  useEffect(() => {
    const generateRecommendations = async () => {
      try {
        // Mock patient profile - in a real app, this would come from user data
        const patientProfile = {
          mood: 7, // Current mood level
          concerns: ['Anxiety', 'Stress'],
          preferences: ['Mindfulness', 'Breathing exercises'],
          progress: 'Intermediate' // Beginner, Intermediate, Advanced
        }

        const recommendations = await aiService.generateTherapyRecommendations(patientProfile)
        setAiRecommendations(recommendations)
      } catch (error) {
        console.error('Failed to generate AI recommendations:', error)
        // Fallback recommendations
        setAiRecommendations([
          'Try the Mindful Breathing exercise for 10 minutes daily',
          'Practice the Gratitude Garden activity to build positive thinking',
          'Consider the Stress Buster game for quick anxiety relief'
        ])
      } finally {
        setIsLoadingRecommendations(false)
      }
    }

    generateRecommendations()
  }, [])

  const getDifficultyColor = (difficulty: string) => {
    switch (difficulty) {
      case 'Beginner':
      case 'Easy':
        return 'text-green-600 bg-green-100'
      case 'Medium':
        return 'text-yellow-600 bg-yellow-100'
      case 'Hard':
        return 'text-red-600 bg-red-100'
      default:
        return 'text-gray-600 bg-gray-100'
    }
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold text-beige-800">Therapy Games & Exercises 🎮</h2>
          <p className="text-beige-600">Fun, interactive ways to build mental wellness skills</p>
        </div>
        <button
          onClick={() => setShowAchievements(!showAchievements)}
          className="btn-secondary flex items-center"
        >
          <TrophyIcon className="w-4 h-4 mr-2" />
          Achievements
        </button>
      </div>

      {/* Stats */}
      <div className="grid md:grid-cols-4 gap-4">
        <div className="card text-center">
          <div className="text-2xl font-bold text-beige-800">1,250</div>
          <div className="text-beige-600">Total Points</div>
        </div>
        <div className="card text-center">
          <div className="text-2xl font-bold text-beige-800">23</div>
          <div className="text-beige-600">Games Completed</div>
        </div>
        <div className="card text-center">
          <div className="text-2xl font-bold text-beige-800">7</div>
          <div className="text-beige-600">Day Streak</div>
        </div>
        <div className="card text-center">
          <div className="text-2xl font-bold text-beige-800">Level 5</div>
          <div className="text-beige-600">Current Level</div>
        </div>
      </div>

      {/* Achievements Modal */}
      {showAchievements && (
        <div className="card">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-beige-800">🏆 Your Achievements</h3>
            <button
              onClick={() => setShowAchievements(false)}
              className="text-beige-600 hover:text-beige-800"
            >
              ✕
            </button>
          </div>
          <div className="grid md:grid-cols-2 gap-4">
            {achievements.map((achievement, index) => (
              <div
                key={index}
                className={`p-4 rounded-lg border-2 ${
                  achievement.earned
                    ? 'border-yellow-300 bg-yellow-50'
                    : 'border-gray-200 bg-gray-50 opacity-60'
                }`}
              >
                <div className="flex items-center space-x-3">
                  <div className="text-2xl">{achievement.icon}</div>
                  <div>
                    <h4 className="font-semibold text-beige-800">{achievement.title}</h4>
                    <p className="text-sm text-beige-600">{achievement.description}</p>
                  </div>
                  {achievement.earned && (
                    <StarIcon className="w-5 h-5 text-yellow-500 ml-auto" />
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Category Filter */}
      <div className="flex flex-wrap gap-2">
        {categories.map((category) => (
          <button
            key={category}
            onClick={() => setSelectedCategory(category)}
            className={`px-4 py-2 rounded-lg transition-colors ${
              selectedCategory === category
                ? 'bg-beige-600 text-white'
                : 'bg-beige-100 text-beige-700 hover:bg-beige-200'
            }`}
          >
            {category}
          </button>
        ))}
      </div>

      {/* Games Grid */}
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {filteredGames.map((game) => (
          <div key={game.id} className={`card border-2 ${game.color} hover:shadow-lg transition-shadow`}>
            <div className="text-center mb-4">
              <div className="text-4xl mb-2">{game.icon}</div>
              <h3 className="text-lg font-semibold text-beige-800">{game.title}</h3>
              <p className="text-sm text-beige-600 mt-2">{game.description}</p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center justify-between text-sm">
                <span className="text-beige-600">Category:</span>
                <span className="text-beige-800 font-medium">{game.category}</span>
              </div>
              
              <div className="flex items-center justify-between text-sm">
                <span className="text-beige-600">Difficulty:</span>
                <span className={`px-2 py-1 rounded text-xs font-medium ${getDifficultyColor(game.difficulty)}`}>
                  {game.difficulty}
                </span>
              </div>

              <div className="flex items-center justify-between text-sm">
                <div className="flex items-center text-beige-600">
                  <ClockIcon className="w-4 h-4 mr-1" />
                  {game.duration}
                </div>
                <div className="flex items-center text-beige-600">
                  <TrophyIcon className="w-4 h-4 mr-1" />
                  {game.points} pts
                </div>
              </div>
            </div>

            <button className="w-full mt-4 btn-primary flex items-center justify-center">
              <PlayIcon className="w-4 h-4 mr-2" />
              Start Game
            </button>
          </div>
        ))}
      </div>

      {/* AI-Powered Recommendations */}
      <div className="card">
        <h3 className="text-xl font-display font-bold text-beige-800 mb-6 flex items-center">
          <SparklesIcon className="w-6 h-6 text-rose-500 mr-3" />
          AI Personalized Recommendations
        </h3>

        {isLoadingRecommendations ? (
          <div className="flex items-center justify-center py-8">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-beige-600"></div>
            <span className="ml-3 text-beige-700">Generating personalized recommendations...</span>
          </div>
        ) : (
          <div className="space-y-4">
            {aiRecommendations.map((recommendation, index) => (
              <div key={index} className="flex items-start space-x-4 p-4 bg-gradient-to-r from-rose-50/50 to-beige-50/50 rounded-2xl border border-rose-200/50">
                <div className="flex-shrink-0 w-8 h-8 bg-rose-500 text-white rounded-full flex items-center justify-center text-sm font-bold">
                  {index + 1}
                </div>
                <div className="flex-1">
                  <p className="text-beige-800 font-medium">{recommendation}</p>
                </div>
                <button className="btn-soft text-sm">
                  Try Now
                </button>
              </div>
            ))}
          </div>
        )}

        <div className="mt-6 p-4 bg-gradient-to-r from-beige-100/50 to-cream-100/50 rounded-xl border border-beige-200/50">
          <p className="text-beige-700 text-sm">
            💡 <strong>AI Insight:</strong> These recommendations are personalized based on your recent mood patterns,
            activity levels, and therapy progress. They adapt as you continue your wellness journey.
          </p>
        </div>
      </div>

      {/* Daily Challenge */}
      <div className="card bg-gradient-to-r from-beige-100 to-beige-200 border-2 border-beige-300">
        <div className="flex items-center justify-between">
          <div>
            <h3 className="text-lg font-semibold text-beige-800 mb-2">🌟 Today's Challenge</h3>
            <p className="text-beige-700">Complete the "Mindful Breathing" exercise to earn bonus points!</p>
            <div className="flex items-center mt-2 text-sm text-beige-600">
              <TrophyIcon className="w-4 h-4 mr-1" />
              Bonus: +50 points
            </div>
          </div>
          <button className="btn-primary">
            Accept Challenge
          </button>
        </div>
      </div>

      {/* Progress Tracking */}
      <div className="card">
        <h3 className="text-lg font-semibold text-beige-800 mb-4">📊 Your Progress This Week</h3>
        <div className="space-y-4">
          <div>
            <div className="flex justify-between text-sm mb-1">
              <span className="text-beige-600">Memory Skills</span>
              <span className="text-beige-800">75%</span>
            </div>
            <div className="w-full bg-beige-200 rounded-full h-2">
              <div className="bg-blue-500 h-2 rounded-full" style={{ width: '75%' }}></div>
            </div>
          </div>
          <div>
            <div className="flex justify-between text-sm mb-1">
              <span className="text-beige-600">Mindfulness</span>
              <span className="text-beige-800">90%</span>
            </div>
            <div className="w-full bg-beige-200 rounded-full h-2">
              <div className="bg-green-500 h-2 rounded-full" style={{ width: '90%' }}></div>
            </div>
          </div>
          <div>
            <div className="flex justify-between text-sm mb-1">
              <span className="text-beige-600">Emotional Intelligence</span>
              <span className="text-beige-800">60%</span>
            </div>
            <div className="w-full bg-beige-200 rounded-full h-2">
              <div className="bg-purple-500 h-2 rounded-full" style={{ width: '60%' }}></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}