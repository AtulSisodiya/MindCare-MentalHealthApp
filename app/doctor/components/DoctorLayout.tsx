import { ReactNode } from 'react'
import Link from 'next/link'
import { 
  UserGroupIcon, 
  CalendarIcon, 
  ChartBarIcon,
  ArrowLeftIcon,
  BellIcon
} from '@heroicons/react/24/outline'

interface DoctorLayoutProps {
  children: ReactNode
  activeTab: string
  setActiveTab: (tab: string) => void
}

export default function DoctorLayout({ children, activeTab, setActiveTab }: DoctorLayoutProps) {
  const navigation = [
    { id: 'patients', name: 'Patients', icon: UserGroupIcon },
    { id: 'appointments', name: 'Appointments', icon: CalendarIcon },
    { id: 'analytics', name: 'Analytics', icon: ChartBarIcon },
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
              <h1 className="text-3xl font-display font-bold text-beige-800">Provider Dashboard 🩺</h1>
            </div>
            <div className="flex items-center space-x-4">
              <button className="p-3 text-beige-600 hover:text-beige-800 hover:bg-beige-100/50 rounded-2xl transition-all duration-300 relative">
                <BellIcon className="w-6 h-6" />
                <span className="absolute -top-1 -right-1 w-3 h-3 bg-rose-400 rounded-full border-2 border-white"></span>
              </button>
              <div className="w-12 h-12 bg-gradient-to-br from-beige-500 to-beige-600 rounded-2xl flex items-center justify-center shadow-warm">
                <span className="text-white text-sm font-bold">DR</span>
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
              <div className="text-sm font-semibold text-beige-600 mb-2">Good morning,</div>
              <div className="text-2xl font-display font-bold text-beige-800">Dr. Sarah Wilson</div>
              <div className="text-sm text-rose-600 mt-2 font-medium">Caring for 127 patients ✨</div>
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

            {/* Quick Stats */}
            <div className="mt-12 p-6 bg-gradient-to-br from-rose-100/60 to-beige-100/60 rounded-3xl border border-rose-200/50">
              <h3 className="font-display font-bold text-beige-800 mb-6">Today's Overview 📊</h3>
              <div className="space-y-4">
                <div className="flex justify-between items-center">
                  <span className="text-beige-700 font-medium">Appointments</span>
                  <span className="font-bold text-beige-800 text-lg">8</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-beige-700 font-medium">Active Patients</span>
                  <span className="font-bold text-beige-800 text-lg">127</span>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-beige-700 font-medium">Urgent Reviews</span>
                  <span className="font-bold text-rose-600 text-lg">3</span>
                </div>
              </div>
            </div>

            {/* Quick Actions */}
            <div className="mt-8 p-6 bg-gradient-to-br from-beige-100/60 to-cream-100/60 rounded-3xl border border-beige-200/50">
              <h3 className="font-display font-bold text-beige-800 mb-4">Quick Actions</h3>
              <div className="space-y-3">
                <button className="w-full btn-soft text-left">
                  📝 Add Session Notes
                </button>
                <button className="w-full btn-soft text-left">
                  📞 Schedule Call
                </button>
                <button className="w-full btn-soft text-left">
                  📊 View Reports
                </button>
              </div>
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