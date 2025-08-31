import './globals.css'

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
      <body className="antialiased">{children}</body>
    </html>
  )
}