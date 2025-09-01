'use client'
import { useState } from 'react'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts'
import { CalendarIcon, HeartIcon, ClockIcon, TrophyIcon, SparklesIcon, CheckCircleIcon, PaperAirplaneIcon, XMarkIcon } from '@heroicons/react/24/outline'
import { aiService, ChatMessage } from '../../../lib/ai-service'

const mockMoodData = [
  { date: '1/10', mood: 6, energy: 5 },
  { date: '1/11', mood: 7, energy: 6 },
  { date: '1/12', mood: 5, energy: 4 },
  { date: '1/13', mood: 8, energy: 7 },
  { date: '1/14', mood: 7, energy: 6 },
  { date: '1/15', mood: 9, energy: 8 },
  { date: '1/16', mood: 8, energy: 7 }
]

export default function Dashboard() {
  const [isChatOpen, setIsChatOpen] = useState(false)
  const [chatMessages, setChatMessages] = useState<ChatMessage[]>([
    {
      role: 'assistant',
      content: 'Hi Sarah! I noticed your sleep improved last night. How are you feeling today? Would you like to try a quick mindfulness exercise? 🌸',
      timestamp: new Date()
    }
  ])
  const [currentMessage, setCurrentMessage] = useState('')
  const [isTyping, setIsTyping] = useState(false)

  const handleSendMessage = async () => {
    if (!currentMessage.trim()) return

    const userMessage: ChatMessage = {
      role: 'user',
      content: currentMessage,
      timestamp: new Date()
    }

    setChatMessages(prev => [...prev, userMessage])
    const messageToSend = currentMessage
    setCurrentMessage('')
    setIsTyping(true)

    try {
      // First, check for crisis indicators
      const crisisCheck = await aiService.detectCrisis(messageToSend)

      let aiResponse: string
      if (crisisCheck.isCrisis) {
        // Crisis detected - provide urgent support response
        aiResponse = crisisCheck.response

        // Add crisis alert styling to the message
        const crisisMessage: ChatMessage = {
          role: 'assistant',
          content: aiResponse,
          timestamp: new Date()
        }
        setChatMessages(prev => [...prev, crisisMessage])

        // You could also trigger additional actions here like:
        // - Send notification to healthcare provider
        // - Log crisis event
        // - Provide emergency contact information
      } else {
        // Normal conversation flow
        aiResponse = await aiService.generateChatResponse(chatMessages, messageToSend)
        const aiMessage: ChatMessage = {
          role: 'assistant',
          content: aiResponse,
          timestamp: new Date()
        }
        setChatMessages(prev => [...prev, aiMessage])
      }
    } catch (error) {
      console.error('Chat error:', error)
      const errorMessage: ChatMessage = {
        role: 'assistant',
        content: 'I\'m here to listen. How are you feeling right now? 💙',
        timestamp: new Date()
      }
      setChatMessages(prev => [...prev, errorMessage])
    } finally {
      setIsTyping(false)
    }
  }

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      handleSendMessage()
    }
  }

  return (
    <div className="space-y-10">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-4xl font-display font-bold text-beige-800 mb-3">Good morning, Sarah! ☀️</h2>
          <p className="text-beige-700 text-xl">Here's how you're progressing on your wellness journey</p>
        </div>
        <div className="text-right bg-white/80 backdrop-blur-sm rounded-3xl p-6 border border-beige-200/60 shadow-gentle">
          <div className="text-sm font-semibold text-beige-600">Today's Date</div>
          <div className="text-xl font-display font-bold text-beige-800">January 16, 2024</div>
        </div>
      </div>

      {/* Quick Stats */}
      <div className="grid md:grid-cols-4 gap-8">
        <div className="stat-card group">
          <div className="icon-wrapper bg-gradient-to-br from-soft-mint to-beige-400 group-hover:shadow-soft">
            <HeartIcon className="w-10 h-10 text-white" />
          </div>
          <div className="text-4xl font-display font-bold text-beige-800 mb-2">8/10</div>
          <div className="text-beige-700 font-semibold text-lg">Today's Mood</div>
          <div className="text-sm text-rose-600 mt-2 font-medium">↗ Improving</div>
        </div>
        <div className="stat-card group">
          <div className="icon-wrapper bg-gradient-to-br from-soft-sky to-rose-400 group-hover:shadow-soft">
            <ClockIcon className="w-10 h-10 text-white" />
          </div>
          <div className="text-4xl font-display font-bold text-beige-800 mb-2">7.2h</div>
          <div className="text-beige-700 font-semibold text-lg">Sleep Last Night</div>
          <div className="text-sm text-rose-600 mt-2 font-medium">Quality sleep</div>
        </div>
        <div className="stat-card group">
          <div className="icon-wrapper bg-gradient-to-br from-soft-lavender to-beige-500 group-hover:shadow-soft">
            <TrophyIcon className="w-10 h-10 text-white" />
          </div>
          <div className="text-4xl font-display font-bold text-beige-800 mb-2">12</div>
          <div className="text-beige-700 font-semibold text-lg">Day Streak</div>
          <div className="text-sm text-rose-600 mt-2 font-medium">🔥 On fire!</div>
        </div>
        <div className="stat-card group">
          <div className="icon-wrapper bg-gradient-to-br from-soft-peach to-rose-500 group-hover:shadow-soft">
            <CalendarIcon className="w-10 h-10 text-white" />
          </div>
          <div className="text-4xl font-display font-bold text-beige-800 mb-2">Tomorrow</div>
          <div className="text-beige-700 font-semibold text-lg">Next Session</div>
          <div className="text-sm text-rose-600 mt-2 font-medium">Dr. Rodriguez</div>
        </div>
      </div>

      <div className="grid lg:grid-cols-3 gap-10">
        {/* Mood Trends */}
        <div className="lg:col-span-2 card">
          <div className="flex items-center mb-8">
            <SparklesIcon className="w-8 h-8 text-rose-500 mr-4" />
            <h3 className="text-2xl font-display font-bold text-beige-800">Your Mood Journey 🌸</h3>
          </div>
          <div className="h-80 mb-8">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={mockMoodData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#f4e6d1" />
                <XAxis dataKey="date" stroke="#a06d42" />
                <YAxis domain={[0, 10]} stroke="#a06d42" />
                <Tooltip 
                  contentStyle={{ 
                    backgroundColor: 'rgba(255, 255, 255, 0.95)', 
                    border: '1px solid #f4e6d1',
                    borderRadius: '16px',
                    boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
                  }} 
                />
                <Line type="monotone" dataKey="mood" stroke="#e85d75" strokeWidth={4} name="Mood" dot={{ fill: '#e85d75', strokeWidth: 2, r: 8 }} />
                <Line type="monotone" dataKey="energy" stroke="#d4a574" strokeWidth={4} name="Energy" dot={{ fill: '#d4a574', strokeWidth: 2, r: 8 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
          <div className="p-6 bg-gradient-to-r from-rose-100/60 to-beige-100/60 rounded-2xl border border-rose-200/50">
            <div className="flex items-center">
              <CheckCircleIcon className="w-6 h-6 text-rose-500 mr-3" />
              <p className="text-beige-800 font-semibold text-lg">
                🎉 Excellent progress! Your mood has improved by 25% this week. Keep up the wonderful work!
              </p>
            </div>
          </div>
        </div>

        {/* Sidebar Content */}
        <div className="space-y-8">
          {/* Today's Tasks */}
          <div className="card">
            <h3 className="text-xl font-display font-bold text-beige-800 mb-6 flex items-center">
              <CheckCircleIcon className="w-6 h-6 text-rose-500 mr-3" />
              Today's Wellness Tasks
            </h3>
            <div className="space-y-4">
              <div className="flex items-center justify-between p-5 bg-gradient-to-r from-soft-mint/30 to-beige-100/50 rounded-2xl border border-soft-mint/40">
                <div className="flex items-center">
                  <div className="w-6 h-6 bg-soft-mint rounded-full mr-4 flex items-center justify-center">
                    <CheckCircleIcon className="w-4 h-4 text-white" />
                  </div>
                  <span className="text-beige-800 font-semibold">Morning meditation</span>
                </div>
                <span className="text-soft-mint text-sm font-bold">✓ Complete</span>
              </div>
              <div className="flex items-center justify-between p-5 bg-beige-100/50 rounded-2xl border border-beige-200/50 hover:bg-beige-100 transition-colors">
                <div className="flex items-center">
                  <div className="w-6 h-6 border-2 border-rose-400 rounded-full mr-4"></div>
                  <span className="text-beige-800 font-semibold">Log mood & symptoms</span>
                </div>
                <button className="text-rose-500 text-sm font-bold hover:text-rose-700 transition-colors">Do now</button>
              </div>
              <div className="flex items-center justify-between p-5 bg-beige-100/50 rounded-2xl border border-beige-200/50 hover:bg-beige-100 transition-colors">
                <div className="flex items-center">
                  <div className="w-6 h-6 border-2 border-rose-400 rounded-full mr-4"></div>
                  <span className="text-beige-800 font-semibold">Breathing exercise</span>
                </div>
                <button className="text-rose-500 text-sm font-bold hover:text-rose-700 transition-colors">Start</button>
              </div>
            </div>
          </div>

          {/* AI Companion */}
          <div className="card">
            <h3 className="text-xl font-display font-bold text-beige-800 mb-6 flex items-center">
              <SparklesIcon className="w-6 h-6 text-rose-500 mr-3" />
              Your AI Companion
            </h3>

            {!isChatOpen ? (
              <div className="bg-gradient-to-br from-rose-100/50 to-beige-100/50 p-6 rounded-2xl border border-rose-200/50">
                <p className="text-beige-800 mb-6 leading-relaxed font-medium text-lg">
                  {chatMessages[chatMessages.length - 1]?.content || 'Hi! I\'m here to support your wellness journey. 🌸'}
                </p>
                <div className="flex space-x-4">
                  <button
                    onClick={() => setIsChatOpen(true)}
                    className="btn-primary flex-1"
                  >
                    Chat with AI
                  </button>
                  <button className="btn-soft">Later</button>
                </div>
              </div>
            ) : (
              <div className="bg-gradient-to-br from-rose-100/50 to-beige-100/50 rounded-2xl border border-rose-200/50">
                {/* Chat Header */}
                <div className="flex items-center justify-between p-4 border-b border-rose-200/30">
                  <h4 className="font-semibold text-beige-800">AI Chat</h4>
                  <button
                    onClick={() => setIsChatOpen(false)}
                    className="text-beige-600 hover:text-beige-800"
                  >
                    <XMarkIcon className="w-5 h-5" />
                  </button>
                </div>

                {/* Chat Messages */}
                <div className="max-h-64 overflow-y-auto p-4 space-y-3">
                  {chatMessages.map((message, index) => (
                    <div
                      key={index}
                      className={`flex ${message.role === 'user' ? 'justify-end' : 'justify-start'}`}
                    >
                      <div
                        className={`max-w-xs px-4 py-2 rounded-2xl ${
                          message.role === 'user'
                            ? 'bg-rose-500 text-white'
                            : 'bg-white text-beige-800 border border-beige-200'
                        }`}
                      >
                        <p className="text-sm">{message.content}</p>
                      </div>
                    </div>
                  ))}
                  {isTyping && (
                    <div className="flex justify-start">
                      <div className="bg-white text-beige-800 border border-beige-200 px-4 py-2 rounded-2xl">
                        <div className="flex space-x-1">
                          <div className="w-2 h-2 bg-beige-400 rounded-full animate-bounce"></div>
                          <div className="w-2 h-2 bg-beige-400 rounded-full animate-bounce" style={{ animationDelay: '0.1s' }}></div>
                          <div className="w-2 h-2 bg-beige-400 rounded-full animate-bounce" style={{ animationDelay: '0.2s' }}></div>
                        </div>
                      </div>
                    </div>
                  )}
                </div>

                {/* Chat Input */}
                <div className="p-4 border-t border-rose-200/30">
                  <div className="flex space-x-2">
                    <input
                      type="text"
                      value={currentMessage}
                      onChange={(e) => setCurrentMessage(e.target.value)}
                      onKeyPress={handleKeyPress}
                      placeholder="Type your message..."
                      className="flex-1 px-3 py-2 border border-beige-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-rose-300"
                      disabled={isTyping}
                    />
                    <button
                      onClick={handleSendMessage}
                      disabled={!currentMessage.trim() || isTyping}
                      className="px-4 py-2 bg-rose-500 text-white rounded-lg hover:bg-rose-600 disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                      <PaperAirplaneIcon className="w-4 h-4" />
                    </button>
                  </div>
                </div>
              </div>
            )}
          </div>

          {/* Upcoming */}
          <div className="card">
            <h3 className="text-xl font-display font-bold text-beige-800 mb-6 flex items-center">
              <CalendarIcon className="w-6 h-6 text-rose-500 mr-3" />
              Coming Up
            </h3>
            <div className="space-y-4">
              <div className="flex items-center space-x-4 p-4 bg-beige-100/50 rounded-2xl">
                <div className="w-4 h-4 bg-rose-500 rounded-full"></div>
                <div>
                  <div className="font-bold text-beige-800">Therapy Session</div>
                  <div className="text-sm text-beige-700 font-medium">Tomorrow, 2:00 PM</div>
                </div>
              </div>
              <div className="flex items-center space-x-4 p-4 bg-beige-100/50 rounded-2xl">
                <div className="w-4 h-4 bg-rose-500 rounded-full"></div>
                <div>
                  <div className="font-bold text-beige-800">Weekly Check-in</div>
                  <div className="text-sm text-beige-700 font-medium">Friday, 10:00 AM</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}