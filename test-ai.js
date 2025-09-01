// Simple test script for AI integration
// Run with: node test-ai.js

require('dotenv').config({ path: '.env.local' })

async function testAIServices() {
  console.log('🧪 Testing MindCare AI Integration...\n')

  try {
    // Import the AI service
    const { aiService } = require('./lib/ai-service.ts')

    console.log('1. Testing Mood Analysis...')
    const moodData = {
      mood: 6,
      symptoms: ['Anxiety', 'Stress'],
      activities: ['Exercise', 'Meditation'],
      energyLevel: 7,
      sleepQuality: 8,
      journalEntry: 'Feeling a bit anxious about work but meditation helped'
    }

    const moodAnalysis = await aiService.analyzeMood(moodData)
    console.log('✅ Mood Analysis Result:', moodAnalysis.substring(0, 100) + '...\n')

    console.log('2. Testing Chat Response...')
    const chatResponse = await aiService.generateChatResponse([], 'I\'m feeling stressed today')
    console.log('✅ Chat Response:', chatResponse.substring(0, 100) + '...\n')

    console.log('3. Testing Patient Summary...')
    const patientData = {
      name: 'Sarah Johnson',
      age: 28,
      condition: 'Anxiety, Depression',
      moodTrend: 'improving',
      riskLevel: 'medium',
      wearableData: { heartRate: 72, sleep: 7.2, steps: 8500 },
      lastSession: '2024-01-15'
    }

    const patientSummary = await aiService.generatePatientSummary(patientData)
    console.log('✅ Patient Summary:', patientSummary.substring(0, 100) + '...\n')

    console.log('4. Testing Crisis Detection...')
    const crisisCheck = await aiService.detectCrisis('I feel like hurting myself')
    console.log('✅ Crisis Detection:', crisisCheck.isCrisis ? 'Crisis detected' : 'No crisis detected')
    console.log('Response:', crisisCheck.response.substring(0, 100) + '...\n')

    console.log('5. Testing Therapy Recommendations...')
    const recommendations = await aiService.generateTherapyRecommendations({
      mood: 7,
      concerns: ['Anxiety', 'Stress'],
      preferences: ['Mindfulness', 'Breathing exercises'],
      progress: 'Intermediate'
    })
    console.log('✅ Therapy Recommendations:', recommendations.slice(0, 2))

    console.log('\n🎉 All AI services are working correctly!')

  } catch (error) {
    console.error('❌ AI Service Test Failed:', error.message)
    console.log('\n🔧 Troubleshooting:')
    console.log('1. Check your GOOGLE_AI_API_KEY in .env.local')
    console.log('2. Ensure you have an active internet connection')
    console.log('3. Verify your Gemini API quota hasn\'t been exceeded')
  }
}

// Run the test
testAIServices()