'use client'
import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { HeartIcon, EyeIcon, EyeSlashIcon } from '@heroicons/react/24/outline'
import { useAuth } from '../../lib/auth-context'

export default function LoginPage() {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [role, setRole] = useState('')
  const [selectedDoctor, setSelectedDoctor] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [error, setError] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const { login, isAuthenticated, loading } = useAuth()
  const router = useRouter()

  useEffect(() => {
    if (!loading && isAuthenticated) {
      router.push('/')
    }
  }, [isAuthenticated, loading, router])

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setError('')

    // Validate required fields
    if (!role) {
      setError('Please select your role')
      setIsLoading(false)
      return
    }

    if (role === 'patient' && !selectedDoctor) {
      setError('Please select a doctor')
      setIsLoading(false)
      return
    }

    const success = await login(username, password, role, role === 'patient' ? selectedDoctor : undefined)

    if (!success) {
      setError('Invalid username or password')
    }

    setIsLoading(false)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-beige-50 via-cream-50 to-rose-50 flex items-center justify-center p-6">
      <div className="max-w-md w-full">
        {/* Header */}
        <div className="text-center mb-8">
          <div className="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-rose-400 to-rose-500 rounded-full mb-6 shadow-rose">
            <HeartIcon className="w-10 h-10 text-white" />
          </div>
          <h1 className="text-4xl font-display font-bold text-beige-800 mb-2">Welcome to MindCare</h1>
          <p className="text-beige-600">Your mental wellness journey starts here 🌸</p>
        </div>

        {/* Login Form */}
        <div className="card">
          <form onSubmit={handleLogin} className="space-y-6">
            <div>
              <label htmlFor="username" className="block text-sm font-medium text-beige-700 mb-2">
                Username
              </label>
              <input
                id="username"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                className="input-field"
                placeholder="Enter your username"
                required
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-sm font-medium text-beige-700 mb-2">
                Password
              </label>
              <div className="relative">
                <input
                  id="password"
                  type={showPassword ? 'text' : 'password'}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="input-field pr-12"
                  placeholder="Enter your password"
                  required
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-3 top-1/2 transform -translate-y-1/2 text-beige-500 hover:text-beige-700"
                >
                  {showPassword ? (
                    <EyeSlashIcon className="w-5 h-5" />
                  ) : (
                    <EyeIcon className="w-5 h-5" />
                  )}
                </button>
              </div>
            </div>

            {/* Role Selection */}
            <div>
              <label className="block text-sm font-medium text-beige-700 mb-2">
                I am a:
              </label>
              <div className="space-y-2">
                <label className="flex items-center">
                  <input
                    type="radio"
                    name="role"
                    value="patient"
                    checked={role === 'patient'}
                    onChange={(e) => setRole(e.target.value)}
                    className="mr-2 text-rose-500 focus:ring-rose-500"
                  />
                  <span className="text-beige-700">Patient</span>
                </label>
                <label className="flex items-center">
                  <input
                    type="radio"
                    name="role"
                    value="doctor"
                    checked={role === 'doctor'}
                    onChange={(e) => setRole(e.target.value)}
                    className="mr-2 text-rose-500 focus:ring-rose-500"
                  />
                  <span className="text-beige-700">Doctor</span>
                </label>
              </div>
            </div>

            {/* Doctor Selection - Only show for patients */}
            {role === 'patient' && (
              <div>
                <label htmlFor="doctor" className="block text-sm font-medium text-beige-700 mb-2">
                  Select your doctor:
                </label>
                <select
                  id="doctor"
                  value={selectedDoctor}
                  onChange={(e) => setSelectedDoctor(e.target.value)}
                  className="input-field"
                  required
                >
                  <option value="">Choose a doctor...</option>
                  <option value="Dr. Sarah Johnson">Dr. Sarah Johnson - Clinical Psychologist</option>
                  <option value="Dr. Michael Chen">Dr. Michael Chen - Psychiatrist</option>
                  <option value="Dr. Emily Rodriguez">Dr. Emily Rodriguez - Therapist</option>
                  <option value="Dr. David Kim">Dr. David Kim - Counseling Psychologist</option>
                </select>
              </div>
            )}

            {error && (
              <div className="bg-red-50 border border-red-200 rounded-lg p-3">
                <p className="text-red-700 text-sm font-medium">{error}</p>
              </div>
            )}

            <button
              type="submit"
              disabled={isLoading}
              className="w-full btn-primary flex items-center justify-center disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {isLoading ? (
                <>
                  <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-2"></div>
                  Signing in...
                </>
              ) : (
                'Sign In'
              )}
            </button>
          </form>

          {/* Demo Credentials */}
          <div className="mt-6 p-4 bg-beige-50 rounded-lg border border-beige-200">
            <h3 className="text-sm font-semibold text-beige-800 mb-2">Demo Credentials</h3>
            <div className="text-sm text-beige-700 space-y-3">
              <div>
                <p className="font-medium text-beige-800">For Patients:</p>
                <p><strong>Username:</strong> patient</p>
                <p><strong>Password:</strong> password</p>
              </div>
              <div>
                <p className="font-medium text-beige-800">For Doctors:</p>
                <p><strong>Username:</strong> doctor</p>
                <p><strong>Password:</strong> password</p>
              </div>
            </div>
          </div>

          {/* Footer */}
          <div className="mt-6 text-center">
            <p className="text-sm text-beige-600">
              Don't have an account?{' '}
              <Link href="/register" className="text-rose-600 hover:text-rose-700 font-medium">
                Sign up here
              </Link>
            </p>
          </div>
        </div>

        {/* Trust indicators */}
        <div className="text-center mt-8">
          <div className="flex items-center justify-center space-x-6 text-beige-600">
            <div className="flex items-center space-x-2">
              <div className="w-2 h-2 bg-gradient-to-r from-rose-400 to-rose-500 rounded-full"></div>
              <span className="text-xs font-medium">Secure & Private</span>
            </div>
            <div className="flex items-center space-x-2">
              <div className="w-2 h-2 bg-gradient-to-r from-rose-400 to-rose-500 rounded-full"></div>
              <span className="text-xs font-medium">HIPAA Compliant</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}