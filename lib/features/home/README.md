# Home Feature - SignBridge

## Overview
The Home feature provides the main navigation interface for the SignBridge app with a bottom navigation bar containing three main functional tabs.

## Architecture
```
lib/features/home/
├── home_screen.dart                    # Main home screen with bottom navigation
├── pages/
│   ├── speech_to_sign_page.dart       # Speech → Animated Hand Sign tab
│   ├── sign_to_text_page.dart         # Hand Sign → Text (Camera) tab
│   └── chat_page.dart                 # Real-Time Chat with Friends tab
├── home.dart                          # Export file
└── README.md                          # This file
```

## Features Implemented

### 🏠 HomeScreen
- **Bottom Navigation Bar**: 3 tabs with consistent design
- **IndexedStack**: Maintains state across tab switches
- **Icons**: Speech (mic), Camera (camera_alt), Chat (chat)
- **Theme Integration**: Uses app colors and consistent styling

### 📢 Speech to Sign Page
- **App Bar**: SignBridge title with settings icon
- **Main Content**: Large translation icon with description
- **Primary Action**: "Start" button for speech-to-sign conversion
- **Settings Menu**: Logout functionality with confirmation dialog
- **UI Design**: Matches provided design with centered content

### 📷 Sign to Text Page
- **App Bar**: Back button for navigation
- **Main Content**: Camera icon representing hand sign capture
- **Status**: "Under construction" message
- **Action Button**: "Notify Me When It's Ready" for user engagement
- **UI Design**: Clean, minimal interface matching design specs

### 💬 Chat Page
- **App Bar**: "Real-Time Chat" title with back button
- **Illustration**: Custom people avatars with speech bubbles
- **Status**: Coming soon message with engagement
- **Action Button**: Notification signup for feature launch
- **Bottom Icons**: Visual indicator showing current active tab
- **UI Design**: Includes illustration matching provided design

## Navigation Flow
```
AuthWrapper → HomeScreen (after login + onboarding)
   ├── Tab 1: Speech to Sign Page (default)
   ├── Tab 2: Sign to Text Page  
   └── Tab 3: Chat Page
```

## Key Components

### Bottom Navigation
- **Type**: BottomNavigationBarType.fixed
- **Theme**: Dark theme with primary color for active state
- **State Management**: Uses setState for tab switching
- **Persistence**: IndexedStack maintains page state

### Page Structure
All pages follow consistent structure:
- **AppBar**: Title, navigation, and actions
- **Body**: Gradient background with centered content
- **Icon**: Large circular icon with brand colors
- **Title**: Feature name and description
- **Action Button**: Primary call-to-action
- **Responsive**: Proper padding and spacing

### UI Design Principles
- **Color Scheme**: Uses AppColors for consistency
- **Typography**: Clear hierarchy with proper font weights
- **Spacing**: Consistent padding and margins (16, 24, 40, 48px)
- **Feedback**: SnackBar messages for user interactions
- **Accessibility**: Proper icon choices and text contrast

## Integration Points
- **AuthWrapper**: Navigation after successful onboarding
- **App Theme**: Consistent with existing dark theme
- **Custom Widgets**: Uses existing CustomButton component
- **Auth System**: Logout functionality integrated with auth providers

## Placeholder Features
All three tabs are currently placeholder implementations:

1. **Speech to Sign**: Shows "coming soon" message via SnackBar
2. **Sign to Text**: Notification signup placeholder
3. **Chat**: Notification signup placeholder

These placeholders can be easily replaced with actual functionality:
- Replace button onPressed handlers
- Add feature-specific state management
- Integrate with backend services
- Add real camera/microphone permissions

## Future Enhancements
- **Real-time speech processing** for Speech to Sign
- **Camera integration** for Hand Sign recognition
- **WebSocket chat** for real-time communication
- **User profiles** and friend management
- **Notification system** for feature updates
- **Settings page** with user preferences

## Testing
- **Tab Navigation**: Switch between all three tabs
- **State Persistence**: Page state maintained during tab switches
- **UI Responsiveness**: Proper layout on different screen sizes
- **User Interactions**: Buttons, dialogs, and feedback work correctly
- **Integration**: Smooth navigation from onboarding to home

The home feature provides a solid foundation for the main app interface with beautiful, consistent design and easy extensibility for future features! 🏠
