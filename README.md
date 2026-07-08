# Oriflame Quick Share — Flutter UI Assignment

A Flutter UI demo for the **Oriflame Quick Share** feature, built from the provided Figma design.  
This is a **UI-only** project with hardcoded mock data — no backend or API integration.

## Features

- **Intro screen** — plays `comp_1_1.mp4` with header, tabs, and loading state, then navigates to the feed
- **Smart Post feed** — vertical reels-style scroll with spring physics across 3 mock posts
- **Product info box** — shows on post load, auto-hides after 3 seconds
- **Caption overlay** — profile badge, music recommendation, styled caption (referral code/link emphasis)
- **Quick share row** — horizontally scrollable platform icons (Instagram, Facebook, Messenger, TikTok, WhatsApp, etc.)
- **Share loading overlay** — blur + progress steps, then opens the selected platform externally
- **Edit caption screen** — tap caption to edit; Save enables only when text changes
- **Bottom navigation** — overlaid on the feed image

## Tech Stack

| Package | Purpose |
|---------|---------|
| `go_router` | Navigation |
| `flutter_screenutil` | Responsive layout (design size 390×844) |
| `video_player` | Intro video |
| `url_launcher` | Open share targets in external apps/browser |

## Project Structure

```
lib/
├── main.dart
├── app/                    # Bootstrap + MaterialApp
├── core/
│   ├── constants/          # Assets, enums
│   ├── routes/             # GoRouter
│   ├── theme/              # Colors, typography
│   └── utils/              # ScreenUtils
├── shared/widgets/         # Header, tabs, bottom nav, buttons
└── features/
    ├── intro/              # Video intro + loading
    └── smart_post/         # Feed, caption edit, share flow
```

## How to Run

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.10+)
- Android Studio / Xcode (for emulator) or a physical device with USB debugging enabled
- Run `flutter doctor` and fix any reported issues before starting

### Steps

```bash
# 1. Clone the repo (after you push to GitHub)
git clone https://github.com/tirumala2306/oriflame.git
cd oriflame

# 2. Install dependencies
flutter pub get

# 3. List available devices
flutter devices

# 4. Run the app (pick one)
flutter run                          # default device
flutter run -d chrome                  # web (optional)
flutter run -d <device-id>             # specific emulator/device
```

### After changing native plugins (e.g. `url_launcher`)

Do a **full restart** (stop app → `flutter run` again). Hot reload alone may cause platform channel errors.

### Live demo tip

For presentation, use an Android emulator or a real device in portrait mode. The UI is designed for a mobile phone screen (390×844).

## Assumptions & Custom Improvements

### Assumptions

- **No backend** — all posts, captions, product details, and share targets are hardcoded in `lib/features/smart_post/data/mock_posts.dart`
- **Share flow is simulated** — tapping a platform shows a loading overlay, then opens a generic URL for that platform (not a real share intent with image/caption payload)
- **Fonts** — Figma references *Oriflame Sans 2.0* and *Satoshi*; custom font files were not bundled, so the app falls back to system fonts with matching sizes/weights
- **Product box tap** — product navigation is not implemented (out of UI scope)
- **"See more" on caption** — expand/collapse is not implemented; full caption is shown in the overlay
- **Bottom nav tabs** — icons are visual only; no navigation to other app sections

### Custom Improvements

- **Reels-style vertical feed** with custom spring page physics
- **In-place share loading overlay** (blur + gradient + step messages) instead of a separate full-screen route
- **Caption styling** — referral code and link rendered with distinct typography via `caption_text_builder.dart`
- **Product info timing** — box appears immediately on post change, then fades after 3 seconds
- **Responsive scaling** via `flutter_screenutil` for consistent layout across screen sizes
- **Android manifest queries** added for `https` and `mailto` so `url_launcher` works on Android 11+

## Screens / Routes

| Route | Screen |
|-------|--------|
| `/` | Intro video |
| `/smart-post` | Smart Post feed |
| `/smart-post/edit-caption` | Edit caption |




## Screenshots

<table>
<tr>
<td align="center"><b>Intro Screen</b></td>
<td align="center"><b>Smart Feed</b></td>
</tr>

<tr>
<td>
<img src="https://github.com/user-attachments/assets/26d5b331-7b19-4d28-933f-fd7fb58652bf" width="250"/>
</td>

<td>
<img src="https://github.com/user-attachments/assets/f254a37c-c57a-4e96-b1cb-35f71fa577b5" width="250"/>
</td>
</tr>

<tr>
<td align="center"><b>Product Card</b></td>
<td align="center"><b>Edit Caption</b></td>
</tr>

<tr>
<td>
<img src="https://github.com/user-attachments/assets/905c1dac-048b-4c85-a517-701a5cfa5366" width="250"/>
</td>

<td>
<img src="https://github.com/user-attachments/assets/f71dfe29-bdc3-4719-9d81-5e8f8a507465" width="250"/>
</td>
</tr>

<tr>
<td align="center"><b>Share Loading</b></td>
<td align="center"><b>Share Options</b></td>
</tr>

<tr>
<td>
<img src="https://github.com/user-attachments/assets/4729034c-3d81-4af8-9fdc-5f841f9ae063" width="250"/>
</td>

<td>
<img src="https://github.com/user-attachments/assets/98d36758-010b-458f-92dd-b188ca7fa31a" width="250"/>
</td>
</tr>

</table>

---

Built for the Oriflame Sweden Flutter assignment — UI demo with hardcoded values, ready for live presentation on emulator or device.

Design size:

```
390 × 844
```

---

# Author

**Tirumala G**

**Flutter Developer**
