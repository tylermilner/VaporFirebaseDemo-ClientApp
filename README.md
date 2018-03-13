# VaporFirebaseDemo-ClientApp
The iOS client app for my VaporFirebaseDemo project showing how to use server-side Swift Vapor with Firebase's Cloud Firestore NoSQL database. This repository is the demo client app for the [Medium article](https://medium.com/rocket-fuel/getting-started-with-firebase-for-server-side-swift-93c11098702a) that I wrote on this subject.

# What Does It Do?
This demo app is intended to be used in conjunction with my [Vapor-Firebase server-side Swift demo](https://github.com/tylermilner/VaporFirebaseDemo). The server publishes a random number to a Firebase Cloud Firestore database every 60 seconds. This client app simply observes the changes, showing the random number updates in realtime.

# Getting Started
If you'd like to run this client app yourself, here's what you need to do:

## Setup the Server
Follow the instructions on the [server app sister repo](https://github.com/tylermilner/VaporFirebaseDemo) to get your server up-and-running.

## Setup Firebase
Add an iOS app to your Firebase project. Follow Google's instructions to download your app's `GoogleService-Info.plist` and replace the one that's included with this project by default.

## Setup Development Team (Optional)
If you'd like to run this app on a device, you'll also need to select an Apple Developer team in the Xcode project. This is available in the "General" tab for the `VaporFirebaseDemo-ClientApp` target's build settings.

## Install Dependencies
This app makes uses of [Cocoapods](https://cocoapods.org/) to manage its dependencies. Install Cocoapods using Ruby `gem`:
```bash
gem install cocoapods
```

After installing Cocoapods, use it to fetch and install the Firebase iOS SDK using the command:
```bash
pod install
```

# Running the App
After setting up your server, Firebase app, and installing the dependencies, you should be good to run the demo app. Open the `VaporFirebaseDemo-ClientApp.xcworkspace` file (that's **`xcworkspace`**, not `xcodeproj`) and then hit `CMD + R` to build and run your app. With any luck, you should see a random number and then a countdown to when the next random number will be generated.
