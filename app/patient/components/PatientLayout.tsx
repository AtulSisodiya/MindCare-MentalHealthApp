import { ReactNode } from 'react'
import Link from 'next/link'
import { 
  HomeIcon,
  HeartIcon,
  CalendarIcon,
  PuzzlePieceIcon,
  ArrowLeftIcon,
  BellIcon,
  ChatBubbleLeftIcon,
  ExclamationTriangleIcon
} from '@heroicons/react/24/outline'

interface PatientLayoutProps {
  children: ReactNode
  activeTab: string
  setActiveTab: (tab: string) => void
}

export default function PatientLayout({ children, activeTab, setActiveTab }: PatientLayoutProps) {
  const navigation = [
    { id: 'dashboard', name: 'Dashboard', icon: HomeIcon },
    { id: 'mood', name: 'Mood Check-in', icon: HeartIcon },
    { id: 'appointments', name: 'Appointments', icon: CalendarIcon },
    { id: 'therapy', name: 'Wellness Games', icon: PuzzlePieceIcon },
  ]

  return (
    <div className="min-h-screen bg-gradient-to-br from-beige-50 via-cream-50 to-rose-50">
      {/* Header */}
      <header className="bg-white/90 backdrop-blur-sm shadow-gentle border-b border-beige-200/60">
        <div className="px-8 py-6">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-6">
              <Link href="/" className="flex items-center text-beige-600 hover:text-beige-800 transition-colors">
                <ArrowLeftIcon className="w-5 h-5 mr-2" />
                <span className="font-semibold">Back to Home</span>
              </Link>
              <div className="h-6 w-px bg-beige-300"></div>
              <h1 className="text-3xl font-display font-bold text-beige-800">My Wellness Journey 🌸</h1>
            </div>
            <div className="flex items-center space-x-4">
              <button className="p-3 text-beige-600 hover:text-beige-800 hover:bg-beige-100/50 rounded-2xl transition-all duration-300 relative">
                <BellIcon className="w-6 h-6" />
                <span className="absolute -top-1 -right-1 w-3 h-3 bg-rose-400 rounded-full border-2 border-white"></span>
              </button>
              <button className="p-3 text-beige-600 hover:text-beige-800 hover:bg-beige-100/50 rounded-2xl transition-all duration-300">
                <ChatBubbleLeftIcon className="w-6 h-6" />
              </button>
              <div className="w-12 h-12 bg-gradient-to-br from-rose-400 to-rose-500 rounded-2xl flex items-center justify-center shadow-rose">
                <span className="text-white text-sm font-bold">SJ</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      <div className="flex">
        {/* Sidebar */}
        <nav className="w-80 bg-white/80 backdrop-blur-sm shadow-gentle min-h-screen border-r border-beige-200/60">
          <div className="p-8">
            <div className="mb-10">
              <div className="text-sm font-semibold text-beige-600 mb-2">Welcome back,</div>
              <div className="text-2xl font-display font-bold text-beige-800">Sarah Johnson</div>
              <div className="text-sm text-rose-600 mt-2 font-medium">Day 12 of your journey ✨</div>
            </div>
            
            <ul className="space-y-4">
              {navigation.map((item) => {
                const Icon = item.icon
                return (
                  <li key={item.id}>
                    <button
                      onClick={() => setActiveTab(item.id)}
                      className={`w-full nav-item ${
                        activeTab === item.id ? 'nav-item-active' : 'nav-item-inactive'
                      }`}
                    >
                      <Icon className="w-6 h-6 mr-4" />
                      {item.name}
                    </button>
                  </li>
                )
              })}
            </ul>

            {/* Mood Quick Check */}
            <div className="mt-10 p-6 bg-gradient-to-br from-rose-100/60 to-beige-100/60 rounded-3xl border border-rose-200/50">
              <h3 className="font-display font-bold text-beige-800 mb-4">Quick Mood Check 💭</h3>
              <div className="flex justify-between mb-6">
                {['😢', '😐', '🙂', '😊', '🤩'].map((emoji, index) => (
                  <button
                    key={index}
                    className="text-3xl hover:scale-125 transition-transform duration-300 p-2 hover:bg-white/50 rounded-2xl"
                  >
                    {emoji}
                  </button>
                ))}
              </div>
              <button className="w-full btn-soft">
                Log Today's Mood
              </button>
            </div>

            {/* Crisis Support */}
            <div className="mt-8 p-6 bg-gradient-to-br from-rose-200/40 to-beige-200/40 rounded-3xl border border-rose-300/50">
              <div className="flex items-center mb-4">
                <ExclamationTriangleIcon className="w-6 h-6 text-rose-600 mr-3" />
                <h3 className="font-display font-bold text-beige-800">Need Help Now?</h3>
              </div>
              <button className="w-full bg-gradient-to-r from-rose-500 to-rose-600 text-white py-4 px-6 rounded-2xl hover:shadow-rose transition-all duration-300 font-bold text-lg">
                🆘 Crisis Support
              </button>
              <p className="text-xs text-beige-700 mt-3 text-center font-medium">24/7 immediate assistance available</p>
            </div>
          </div>
        </nav>

        {/* Main Content */}
        <main className="flex-1 p-10">
          {children}
        </main>
      </div>
    </div>
  )
}