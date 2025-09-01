import { GoogleGenerativeAI } from '@google/generative-ai'

const genAI = new GoogleGenerativeAI(process.env.GOOGLE_AI_API_KEY!)
const model = genAI.getGenerativeModel({
  model: process.env.AI_MODEL || 'gemini-pro'
})

export interface MoodData {
  mood: number
  symptoms: string[]
  activities: string[]
  energyLevel: number
  sleepQuality: number
  journalEntry?: string
}

export interface PatientData {
  name: string
  age: number
  condition: string
  moodTrend: string
  riskLevel: string
  wearableData: {
    heartRate: number
    sleep: number
    steps: number
  }
  lastSession: string
}

export interface ChatMessage {
  role: 'user' | 'assistant'
  content: string
  timestamp: Date
}

class AIService {
  private async generateResponse(prompt: string): Promise<string> {
    try {
      const result = await model.generateContent(prompt)
      const response = await result.response
      const text = response.text()

      // Validate response
      if (!text || text.trim().length === 0) {
        throw new Error('Empty response from AI')
      }

      return text
    } catch (error) {
      console.error('AI Service Error:', error)

      // Check for specific error types
      if (error instanceof Error) {
        if (error.message.includes('API_KEY')) {
          throw new Error('AI service configuration error. Please check your API key.')
        }
        if (error.message.includes('quota') || error.message.includes('limit')) {
          throw new Error('AI service quota exceeded. Please try again later.')
        }
        if (error.message.includes('network') || error.message.includes('fetch')) {
          throw new Error('Network error. Please check your connection and try again.')
        }
      }

      throw new Error('AI service temporarily unavailable. Please try again.')
    }
  }

  async analyzeMood(moodData: MoodData): Promise<string> {
    const prompt = `
You are a compassionate mental health AI assistant. Analyze this patient's mood check-in data and provide supportive, personalized insights.

Patient Data:
- Mood Level: ${moodData.mood}/7 (${this.getMoodLabel(moodData.mood)})
- Energy Level: ${moodData.energyLevel}/10
- Sleep Quality: ${moodData.sleepQuality}/10
- Symptoms: ${moodData.symptoms.join(', ') || 'None reported'}
- Activities: ${moodData.activities.join(', ') || 'None reported'}
- Journal Entry: ${moodData.journalEntry || 'No entry provided'}

Provide a brief, empathetic analysis (2-3 sentences) that:
1. Acknowledges their current state
2. Offers gentle encouragement or suggestions
3. Maintains a supportive, non-clinical tone

Keep the response under 150 words and end with an encouraging note.
`

    try {
      return await this.generateResponse(prompt)
    } catch (error) {
      console.error('Mood analysis failed:', error)
      // Fallback response
      return `Thank you for sharing how you're feeling today. Your mood check-in has been recorded, and I'm here to support you on your wellness journey. Remember that every step forward counts. 🌸`
    }
  }

  async generatePatientSummary(patientData: PatientData): Promise<string> {
    const prompt = `
You are an AI assistant helping mental health professionals. Generate a concise patient summary based on the provided data.

Patient Information:
- Name: ${patientData.name}
- Age: ${patientData.age}
- Condition: ${patientData.condition}
- Risk Level: ${patientData.riskLevel}
- Mood Trend: ${patientData.moodTrend}
- Last Session: ${patientData.lastSession}
- Wearable Data:
  - Heart Rate: ${patientData.wearableData.heartRate} bpm
  - Sleep: ${patientData.wearableData.sleep} hours
  - Steps: ${patientData.wearableData.steps}

Generate a professional summary (3-4 sentences) that includes:
1. Current status overview
2. Key observations from wearable data
3. Recommended next steps or concerns

Keep it clinical but accessible, under 200 words.
`

    try {
      return await this.generateResponse(prompt)
    } catch (error) {
      console.error('Patient summary generation failed:', error)
      // Fallback summary
      return `${patientData.name} is a ${patientData.age}-year-old patient with ${patientData.condition}. Current risk level: ${patientData.riskLevel}. Last session: ${patientData.lastSession}. Wearable data shows heart rate of ${patientData.wearableData.heartRate} bpm, ${patientData.wearableData.sleep} hours sleep, and ${patientData.wearableData.steps} steps. Monitor progress and consider follow-up based on clinical assessment.`
    }
  }

  async generateChatResponse(messages: ChatMessage[], userMessage: string): Promise<string> {
    const conversationHistory = messages.slice(-5).map(msg =>
      `${msg.role === 'user' ? 'Patient' : 'AI'}: ${msg.content}`
    ).join('\n')

    const prompt = `
You are a compassionate AI mental health companion. Respond supportively to the patient's message.

Recent Conversation:
${conversationHistory}

Patient's New Message: "${userMessage}"

Guidelines:
- Be empathetic and supportive
- Ask open-ended questions to encourage sharing
- Suggest healthy coping strategies when appropriate
- Avoid giving clinical diagnoses
- Keep responses conversational and warm
- If they seem distressed, gently suggest professional help

Respond as a caring friend who happens to be knowledgeable about mental health. Keep under 100 words.
`

    try {
      return await this.generateResponse(prompt)
    } catch (error) {
      console.error('Chat response failed:', error)
      // Fallback response
      return "I'm here to listen and support you. How are you feeling right now? Remember that it's okay to ask for help when you need it. 💙"
    }
  }

  async generateAnalyticsInsights(metrics: any): Promise<string[]> {
    const prompt = `
You are an AI analytics assistant for mental health professionals. Generate 4 insightful observations based on these metrics:

Practice Metrics:
- Total Patients: ${metrics.totalPatients}
- Improvement Rate: ${metrics.improvementRate}%
- Average Session Rating: ${metrics.avgRating}/5
- Attendance Rate: ${metrics.attendanceRate}%

Patient Outcomes (last 4 months):
${metrics.patientOutcomes?.map((outcome: any) =>
  `${outcome.month}: Improved: ${outcome.improved}, Stable: ${outcome.stable}, Declined: ${outcome.declined}`
).join('\n')}

Risk Distribution:
- Low Risk: ${metrics.riskDistribution?.low || 0}%
- Medium Risk: ${metrics.riskDistribution?.medium || 0}%
- High Risk: ${metrics.riskDistribution?.high || 0}%

Generate 4 specific, actionable insights that would help improve patient care. Each insight should be 1-2 sentences.

Format as a JSON array of strings.
`

    try {
      const response = await this.generateResponse(prompt)
      try {
        return JSON.parse(response)
      } catch {
        // Fallback if JSON parsing fails
        return response.split('\n').filter(line => line.trim().length > 0)
      }
    } catch (error) {
      console.error('Analytics insights generation failed:', error)
      // Fallback insights
      return [
        'Patient engagement shows positive correlation with treatment outcomes',
        'Regular mood tracking appears to improve self-awareness',
        'Sleep quality metrics suggest need for sleep hygiene education',
        'Consider additional support for patients with declining mood trends'
      ]
    }
  }

  async detectCrisis(message: string): Promise<{ isCrisis: boolean; severity: 'low' | 'medium' | 'high'; response: string }> {
    const prompt = `
You are a crisis detection AI for mental health. Analyze this message for signs of crisis or self-harm.

Message: "${message}"

Assess for:
- Suicidal ideation or self-harm
- Severe depression or hopelessness
- Immediate danger
- Need for urgent intervention

Respond with JSON in this format:
{
  "isCrisis": boolean,
  "severity": "low" | "medium" | "high",
  "response": "appropriate response message"
}

If crisis detected, provide a supportive response directing them to emergency resources.
If no crisis, provide normal supportive response.
`

    const response = await this.generateResponse(prompt)
    try {
      return JSON.parse(response)
    } catch {
      return {
        isCrisis: false,
        severity: 'low' as const,
        response: 'I\'m here to listen. How are you feeling right now?'
      }
    }
  }

  async generateTherapyRecommendations(patientProfile: any): Promise<string[]> {
    const prompt = `
Based on this patient profile, suggest 3 personalized therapy activities or exercises:

Patient Profile:
- Current Mood: ${patientProfile.mood}/10
- Primary Concerns: ${patientProfile.concerns?.join(', ') || 'General wellness'}
- Preferred Activities: ${patientProfile.preferences?.join(', ') || 'Not specified'}
- Progress Level: ${patientProfile.progress || 'Beginner'}

Suggest 3 specific, actionable recommendations that are:
1. Appropriate for their current state
2. Easy to implement
3. Evidence-based or generally beneficial

Format as a JSON array of strings, each 1-2 sentences long.
`

    try {
      const response = await this.generateResponse(prompt)
      try {
        return JSON.parse(response)
      } catch {
        return [
          'Try deep breathing exercises for 5 minutes daily',
          'Practice gratitude journaling each evening',
          'Take short mindful walks in nature'
        ]
      }
    } catch (error) {
      console.error('Therapy recommendations generation failed:', error)
      // Fallback recommendations
      return [
        'Practice deep breathing exercises for stress relief',
        'Try keeping a daily gratitude journal',
        'Consider short mindful walks in nature',
        'Use the mood tracking feature regularly'
      ]
    }
  }

  private getMoodLabel(mood: number): string {
    const labels = ['Very Sad', 'Sad', 'Neutral', 'Good', 'Happy', 'Very Happy', 'Excellent']
    return labels[mood - 1] || 'Unknown'
  }
}

export const aiService = new AIService()