# Project: SignBridge

## Overview
SignBridge is a modern, real-time, two-way interpreter app that bridges communication between deaf and hearing individuals.  
It translates:
1. **Sign Language → Spoken Audio/Text**  
2. **Spoken Audio/Text → Animated Sign Language Avatar**  
3. **Observer Mode:** Using the camera, a person can point at someone signing in the real world and get live translation.

## Tech Stack
- **Frontend (Mobile App):** Flutter (Dart)
- **Backend:** Node.js + Express.js
- **Realtime Communication:** WebSockets (for continuous audio/video/text streams)
- **Storage/Cache (Optional):** Redis (for low-latency message passing, session data)

## Visual & UX Goals
- **Vibe:** Modern, clean, accessible, intuitive, trustworthy.  
- **Color Palette:** Blue (#007AFF), Green (#34C759), Neutral backgrounds (#F9F9FB, #FFFFFF).  
- **Typography:** Inter font (legible, sans-serif).  
- **UI Elements:** Rounded corners, generous whitespace, minimal icons.  
- **Screens:**  
  - Login/Authentication (Google Sign-In, Guest option)  
  - Onboarding (3 slides: Seamless Conversations, Sign to Speak, Speak to Sign)  
  - Main Conversation Screen (camera for sign input OR avatar for sign output)  
  - Observer Mode (camera pointed at external signer → live translation)  
  - Settings (Profile, Voice, Language, Privacy, Help)

## MVP Scope (Hackathon-Friendly)
For the first 48h prototype:
- Limit vocabulary to **10–15 common signs/phrases** (e.g., Hello, Thank you, Yes, No, How are you?).  
- Use a **pre-trained ML model** or mocked function to recognize basic gestures.  
- Implement speech-to-text (Google Speech API) + text-to-speech (Flutter TTS).  
- Build a **basic animated avatar** with simple pre-recorded animations for a few signs.  
- Core demo: One person signs → app speaks it aloud. Another person speaks → app avatar signs it.  
- Observer mode demo: User points camera at signer → text + audio output.

## Development Guidelines
- **Flutter Side:**  
  - Use `http` package to call backend APIs.  
  - Use `provider` or `riverpod` for simple state management.  
  - Use `camera` and `flutter_tts` for media input/output.  
  - UI should prioritize clarity, large action buttons, minimal clutter.

- **Backend Side (Node.js + Express):**  
  - Endpoints:  
    - `/sign-to-speech` → Accepts camera input (image/video frame) → Returns text.  
    - `/speech-to-sign` → Accepts text → Returns sign avatar animation mapping.  
    - `/observer-mode` → Accepts video input → Returns text + audio.  
  - Keep code modular: `routes/`, `controllers/`, `services/`.  
  - Use WebSockets for real-time streaming if time permits.  

## Hints for Copilot
- Generate Flutter widgets for onboarding, conversation interface, and settings.  
- Suggest backend API routes with JSON responses for translations.  
- Use small, reusable UI components (buttons, cards, icons).  
- Provide boilerplate code for Flutter + Node.js connectivity (http requests, API endpoints).  
- Always prefer simplicity, readability, and hackathon feasibility.  
