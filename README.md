# MindCare - Mental Health Platform

A comprehensive mental health application connecting doctors and patients with AI-powered insights, wearable integration, and gamified therapy exercises.

## 🌟 Features

### For Doctors/Clinicians
- **Patient Management Dashboard** - View patient profiles, risk levels, and AI-generated summaries
- **Real-time Monitoring** - Track patient mood, sleep, and wearable data trends
- **Smart Scheduling** - AI-assisted appointment management with video/in-person options
- **Clinical Documentation** - AI-powered session notes and treatment planning
- **Analytics & Insights** - Performance metrics and AI-generated treatment recommendations
- **Crisis Alerts** - Automated risk detection and intervention prompts

### For Patients
- **Personalized Dashboard** - Track wellness journey with mood trends and progress
- **Interactive Onboarding** - Guided setup with symptom assessment and goal setting
- **Daily Mood Tracking** - Emoji-based mood logging with symptoms and activities
- **Therapy Games** - Gamified cognitive exercises for memory, mindfulness, and emotional skills
- **Appointment Management** - Easy booking, rescheduling, and video call access
- **AI Companion** - Personalized insights and coping strategy recommendations
- **Crisis Support** - 24/7 emergency assistance button
- **Wearable Integration** - Sync fitness data for comprehensive health tracking

## 🎨 Design Theme
- **Primary Colors**: Beige and off-white background for a calming, therapeutic feel
- **Typography**: Clean, accessible fonts with proper contrast
- **UI/UX**: Intuitive navigation with empathetic, supportive design language

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ 
- npm or yarn

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd mindcare-app
```

2. Install dependencies
```bash
npm install
```

3. Start the development server
```bash
npm run dev
```

4. Open [http://localhost:3000](http://localhost:3000) in your browser

## 📁 Project Structure

```
mindcare-app/
├── app/
│   ├── doctor/                 # Doctor portal
│   │   ├── components/
│   │   │   ├── DoctorLayout.tsx
│   │   │   ├── PatientList.tsx
│   │   │   ├── PatientDetails.tsx
│   │   │   ├── AppointmentCalendar.tsx
│   │   │   └── Analytics.tsx
│   │   └── page.tsx
│   ├── patient/               # Patient portal
│   │   ├── components/
│   │   │   ├── PatientLayout.tsx
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Onboarding.tsx
│   │   │   ├── MoodTracking.tsx
│   │   │   ├── Appointments.tsx
│   │   │   └── TherapyGames.tsx
│   │   └── page.tsx
│   ├── globals.css            # Global styles
│   ├── layout.tsx             # Root layout
│   └── page.tsx               # Home page
├── tailwind.config.js         # Tailwind configuration
├── next.config.js             # Next.js configuration
└── package.json
```

## 🛠 Technology Stack

- **Frontend**: Next.js 14, React 18, TypeScript
- **Styling**: Tailwind CSS with custom beige/off-white theme
- **Charts**: Recharts for data visualization
- **Icons**: Heroicons
- **UI Components**: Headless UI for accessibility

## 🔮 AI Integration Points

The application is designed with AI integration in mind:

- **Patient Risk Assessment** - ML models to predict relapse risk
- **Mood Pattern Analysis** - Trend detection and early warning systems
- **Treatment Recommendations** - Personalized therapy suggestions
- **Wearable Data Insights** - Sleep, heart rate, and activity correlation
- **Crisis Detection** - Natural language processing for journal entries
- **Smart Scheduling** - Optimization for appointment booking

## 📱 Wearable Integration

Supports integration with:
- Apple Watch (HealthKit)
- Fitbit
- Generic fitness trackers via APIs

Data tracked:
- Heart rate and HRV
- Sleep quality and duration
- Daily activity and steps
- Stress levels

## 🎮 Gamification Features

- **Therapy Games**: Memory, mindfulness, emotional intelligence exercises
- **Achievement System**: Badges and streaks for engagement
- **Progress Tracking**: Skill development visualization
- **Daily Challenges**: Bonus point opportunities

## 🔒 Privacy & Security

- End-to-end encryption for all health data
- HIPAA-compliant data handling
- User consent management
- Data deletion capabilities
- Secure video calling infrastructure

## 🚀 Deployment

```bash
# Build for production
npm run build

# Start production server
npm start
```

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

For support and questions, please contact the development team or create an issue in the repository.
Test