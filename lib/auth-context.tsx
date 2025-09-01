'use client'
import { createContext, useContext, useState, useEffect, ReactNode } from 'react'
import { useRouter } from 'next/navigation'

interface AuthContextType {
  isAuthenticated: boolean
  userRole: string | null
  selectedDoctor: string | null
  login: (username: string, password: string, role: string, doctor?: string) => Promise<boolean>
  logout: () => void
  loading: boolean
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [isAuthenticated, setIsAuthenticated] = useState(false)
  const [userRole, setUserRole] = useState<string | null>(null)
  const [selectedDoctor, setSelectedDoctor] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const router = useRouter()

  useEffect(() => {
    // Check if user is already authenticated on app load
    const checkAuth = () => {
      const authStatus = localStorage.getItem('isAuthenticated')
      const role = localStorage.getItem('userRole')
      const doctor = localStorage.getItem('selectedDoctor')

      if (authStatus === 'true') {
        setIsAuthenticated(true)
        setUserRole(role || 'patient')
        setSelectedDoctor(doctor)
      }
      setLoading(false)
    }

    checkAuth()
  }, [])

  const login = async (username: string, password: string, role: string, doctor?: string): Promise<boolean> => {
    // Authentication with role-based credentials
    const isValidPatient = role === 'patient' && username === 'patient' && password === 'password'
    const isValidDoctor = role === 'doctor' && username === 'doctor' && password === 'password'

    if (isValidPatient || isValidDoctor) {
      setIsAuthenticated(true)
      setUserRole(role)
      setSelectedDoctor(doctor || null)

      // Store in localStorage for persistence
      localStorage.setItem('isAuthenticated', 'true')
      localStorage.setItem('userRole', role)
      if (doctor) {
        localStorage.setItem('selectedDoctor', doctor)
      }

      return true
    }
    return false
  }

  const logout = () => {
    setIsAuthenticated(false)
    setUserRole(null)
    setSelectedDoctor(null)

    // Clear localStorage
    localStorage.removeItem('isAuthenticated')
    localStorage.removeItem('userRole')
    localStorage.removeItem('selectedDoctor')

    // Redirect to login
    router.push('/login')
  }

  const value = {
    isAuthenticated,
    userRole,
    selectedDoctor,
    login,
    logout,
    loading
  }

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}