# The challenge
## Goal
Build a simple movie browser app using **Swift 5+** and **SwiftUI**.  
Load a list of movies, navigate to a details screen, show recommended movies, and support “likes”.
Functionality and code quality matter more than pixel perfection.

## Requirements
- [X] **Language & UI:** Swift 5+, SwiftUI.
- [X] **Concurrency:** Use Swift Concurrency (`async/await`).
- [ ] **Package Management:** Swift Package Manager.
- [ ] **Architecture:** MVVM or a similarly clean pattern.
- [X] **Networking:** Handle loading, error, and empty states gracefully.
- [X] **Environment:** In your README, specify the **Xcode version**, **iOS version**, and **device/simulator model** you used for testing.
- [X] **Repo:** Fork this repo and keep your fork public until review.

## Environment
- Xcode version: 26.0
- iOS version: 26.0
- Device/Simulator model: iPhone Pro 17

## API
- **List:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json`  

- **Details:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/{id}.json`  

- **Recommended:**  
  `https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/recommended/{id}.json`  

## What to Build
- **Movie List:** fetch and display the list.
- **Details Screen:** show details for a movie and its recommendations.
- **Navigation:** tapping a recommended movie opens its details.
- **Likes:** allow marking a movie as liked/favorited and reflect this state across list and details (persist locally; your choice of method).

## Bonus
- Unit tests.
- Lightweight caching (e.g., images or responses).
- Dark Mode support.
- Brief README notes on trade-offs and “what you’d do next”.
