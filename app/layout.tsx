import './globals.css'
import { AuthProvider } from '../lib/auth-context'

export const metadata = {
  title: 'MindCare - Mental Health Platform',
  description: 'Connecting patients and doctors for better mental health care',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className="antialiased">
        <AuthProvider>
          {children}
        </AuthProvider>
      </body>
    </html>
  )
}