import Link from 'next/link'
import { UserIcon, HeartIcon, SparklesIcon, DevicePhoneMobileIcon, HandRaisedIcon } from '@heroicons/react/24/outline'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-beige-50 via-cream-50 to-rose-50">
      <div className="container mx-auto px-6 py-20">
        <div className="text-center mb-20">
          <div className="inline-flex items-center justify-center w-24 h-24 bg-gradient-to-br from-rose-400 to-rose-500 rounded-full mb-8 shadow-rose">
            <HeartIcon className="w-12 h-12 text-white" />
          </div>
          <h1 className="text-7xl font-display font-bold text-beige-800 mb-6 tracking-tight">
            MindCare
          </h1>
          <p className="text-2xl text-beige-700 mb-8 max-w-3xl mx-auto leading-relaxed">
            Connecting minds, healing hearts — Your mental wellness journey starts here with compassionate care and gentle guidance 🌸
          </p>
        </div>

        <div className="grid md:grid-cols-2 gap-10 max-w-6xl mx-auto mb-24">
          {/* Doctor Portal */}
          <div className="card group">
            <div className="text-center">
              <div className="icon-wrapper bg-gradient-to-br from-beige-400 to-beige-500 group-hover:shadow-soft">
                <UserIcon className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-3xl font-display font-semibold text-beige-800 mb-4">
                Healthcare Provider Portal
              </h2>
              <p className="text-beige-700 mb-8 leading-relaxed text-lg">
                Comprehensive dashboard to manage patients, track progress, and provide personalized care with AI-powered insights and compassionate tools
              </p>
              <Link href="/doctor" className="btn-primary inline-flex items-center">
                <UserIcon className="w-5 h-5 mr-3" />
                Access Provider Dashboard
              </Link>
            </div>
          </div>

          {/* Patient Portal */}
          <div className="card group">
            <div className="text-center">
              <div className="icon-wrapper bg-gradient-to-br from-rose-400 to-rose-500 group-hover:shadow-soft">
                <HeartIcon className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-3xl font-display font-semibold text-beige-800 mb-4">
                Personal Wellness Portal
              </h2>
              <p className="text-beige-700 mb-8 leading-relaxed text-lg">
                Track your wellness journey, connect with specialists, and access personalized care through interactive and nurturing tools
              </p>
              <Link href="/patient" className="btn-primary inline-flex items-center">
                <HeartIcon className="w-5 h-5 mr-3" />
                Begin Your Journey
              </Link>
            </div>
          </div>
        </div>

        <div className="text-center mb-16">
          <h3 className="text-4xl font-display font-semibold text-beige-800 mb-16">
            Why Choose MindCare? ✨
          </h3>
          <div className="grid md:grid-cols-3 gap-10 max-w-5xl mx-auto">
            <div className="text-center group">
              <div className="w-20 h-20 bg-gradient-to-br from-soft-lavender to-rose-300 rounded-full flex items-center justify-center mx-auto mb-8 shadow-gentle group-hover:shadow-soft transition-all duration-300">
                <SparklesIcon className="w-10 h-10 text-white" />
              </div>
              <h4 className="font-display font-semibold text-beige-800 mb-4 text-xl">AI-Powered Insights</h4>
              <p className="text-beige-700 leading-relaxed text-lg">Smart analysis of mood patterns, wellness data, and personalized recommendations for better mental health outcomes</p>
            </div>
            <div className="text-center group">
              <div className="w-20 h-20 bg-gradient-to-br from-soft-mint to-beige-400 rounded-full flex items-center justify-center mx-auto mb-8 shadow-gentle group-hover:shadow-soft transition-all duration-300">
                <DevicePhoneMobileIcon className="w-10 h-10 text-white" />
              </div>
              <h4 className="font-display font-semibold text-beige-800 mb-4 text-xl">Seamless Integration</h4>
              <p className="text-beige-700 leading-relaxed text-lg">Connect your wearables and health devices for comprehensive fitness and wellness data tracking in one place</p>
            </div>
            <div className="text-center group">
              <div className="w-20 h-20 bg-gradient-to-br from-soft-peach to-rose-400 rounded-full flex items-center justify-center mx-auto mb-8 shadow-gentle group-hover:shadow-soft transition-all duration-300">
                <HandRaisedIcon className="w-10 h-10 text-white" />
              </div>
              <h4 className="font-display font-semibold text-beige-800 mb-4 text-xl">Connected Care</h4>
              <p className="text-beige-700 leading-relaxed text-lg">Direct communication between patients and providers with secure messaging and compassionate video consultations</p>
            </div>
          </div>
        </div>

        {/* Trust indicators */}
        <div className="text-center mt-20 pt-16 border-t border-beige-200/50">
          <div className="flex items-center justify-center space-x-12 text-beige-600">
            <div className="flex items-center space-x-3">
              <div className="w-3 h-3 bg-gradient-to-r from-rose-400 to-rose-500 rounded-full"></div>
              <span className="text-sm font-semibold">HIPAA Compliant</span>
            </div>
            <div className="flex items-center space-x-3">
              <div className="w-3 h-3 bg-gradient-to-r from-rose-400 to-rose-500 rounded-full"></div>
              <span className="text-sm font-semibold">End-to-End Encrypted</span>
            </div>
            <div className="flex items-center space-x-3">
              <div className="w-3 h-3 bg-gradient-to-r from-rose-400 to-rose-500 rounded-full"></div>
              <span className="text-sm font-semibold">24/7 Support</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}