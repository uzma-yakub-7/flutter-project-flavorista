# Flavorista — Phase 1 Flutter Starter

This folder contains a new Phase 1 starter implementation based on the uploaded Flavorista project plan and the Phase 1 submission instructions.

## Included in this scaffold
- Flutter app entry point and theme setup
- Welcome, login and registration screens
- Home, restaurant list, restaurant detail, menu item, cart, profile and settings UI
- Bottom navigation and screen-to-screen navigation
- Basic form validation for login and registration
- Reusable buttons, section headings and empty-state widget
- Provider-based cart, favorites and theme state
- Local theme preference using `SharedPreferencesAsync`

## Important scope notes
- Login and registration are demo-only; no real authentication or account storage is connected.
- Restaurant and menu data are sample in-memory data.
- Cart and favorites are in-memory for this starter.
- Checkout, real payments, order history, notifications, review submission and restaurant administration are not implemented here; they remain later-phase work.
- This is a starter implementation, not a copy of an existing project repository. Review and merge it into your actual repository as appropriate.

## Run it
1. Install Flutter and confirm `flutter doctor` reports a working setup.
2. From this folder, run:

   ```bash
   flutter pub get
   flutter run
   ```

3. To check code formatting:

   ```bash
   dart format lib
   ```

4. To run static analysis:

   ```bash
   flutter analyze
   ```

## Suggested GitHub submission steps
1. Create a **private** GitHub repository.
2. Add this project folder to the repository and push the code.
3. Invite `developer.ziakhan@gmail.com` as a repository collaborator.
4. Record a short demo showing the welcome screen, login/register validation, bottom navigation, restaurant details, adding items to cart, cart quantity controls and theme switching.
5. Submit the repository link, the 2–3 sentence summary and the demo video link as instructed by your course.

## Source alignment
The screen and feature scope follows the uploaded *Flavorista Project Plan* (especially Sections 5–17 and Phase 1 in Section 17). The submission checklist follows *1st Phase Code Submission Instructions*.
