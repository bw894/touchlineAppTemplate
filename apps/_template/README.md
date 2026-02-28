# Touchline Club App — Template

This is the canonical starting point for every new club app.

Copy this directory to `apps/[clubname]/` and work through the checklist below.
See `docs/migration/MIGRATION_PLAN.md` Section 8 for the full context.

---

## Per-club onboarding checklist

### Step 1 — Copy the template

```bash
cp -r apps/_template/ apps/[clubname]/
```

Update the package name in `apps/[clubname]/pubspec.yaml`:
```yaml
name: [clubname]   # e.g. harriers
```

### Step 2 — Implement AppConfig (`lib/app_config.dart`)

Rename `TemplateClubConfig` → `[ClubName]Config`.

Fill in every field that currently throws `UnimplementedError`.  Get the values from:
- Touchline dashboard → project ID, REST API key, team object ID, settings object ID
- Dynalink dashboard → public key, project ID
- The club's existing social links and ticketing URL

### Step 3 — Customise HomeScreen (`lib/home/home_screen.dart`)

Each home-page section is a clearly labelled block in the `Column`.

- **Enable/disable**: remove or comment-out a block
- **Reorder**: move a block up or down in the `Column`
- **Social links**: replace the placeholder URLs in `SocialIconsBar`
- **Background image**: replace `assets/images/bg3-min.png` with your asset

### Step 4 — Customise NavbarWidget (`lib/navigation/navbar_widget.dart`)

- Tab icons and labels — edit the `_TabButton` calls
- Add/remove tabs — add or remove children from the tab `Row`
- The dynamic centre button (match live badge) requires no changes —
  it reads `AppConfig.focusTeamObjectId` automatically

### Step 5 — Update `main.dart`

- Replace all `TemplateClubConfig` references with `[ClubName]Config`
- Update `title: 'Club App'` with the club's display name

### Step 6 — Firebase setup

1. Create a Firebase project for the club (or use an existing one)
2. Add an Android app (package name matches `android/app/build.gradle`)
   and an iOS app (bundle ID matches `ios/Runner.xcodeproj`)
3. Download `google-services.json` → `android/app/`
4. Download `GoogleService-Info.plist` → `ios/Runner/`
5. Run `flutterfire configure` in `apps/[clubname]/`
6. In `main.dart`, uncomment `import 'firebase_options.dart'` and
   add `options: DefaultFirebaseOptions.currentPlatform` to `Firebase.initializeApp()`

### Step 7 — Native Android config

File: `android/app/build.gradle.kts`
```kotlin
namespace = "com.[org].[clubname]"
applicationId = "com.[org].[clubname]"
```

File: `android/app/src/main/AndroidManifest.xml`
- Update `android:label` to the club's display name
- Update the custom deep-link scheme intent-filter:
  ```xml
  <data android:scheme="[clubscheme]" android:host="[clubdomain]" />
  ```
- Update the Dynalink HTTPS intent-filter host:
  ```xml
  <data android:scheme="https" android:host="[clubname].dynalinks.app" />
  ```

File: `android/app/src/main/kotlin/.../MainActivity.kt`
- Update the `package` declaration to match the namespace above

### Step 8 — Native iOS config

File: `ios/Runner/Info.plist`
- `CFBundleDisplayName` → club name
- `CFBundleURLTypes` → update the custom scheme and Google Sign-In reverse client ID
- `CFBundleAssociatedDomains` → `applinks:[clubname].dynalinks.app`

File: `ios/Runner.xcodeproj/project.pbxproj`
- Replace all occurrences of the old bundle ID with the new one:
  `com.[org].[clubname]`

### Step 9 — Assets

Place the following in `assets/`:

| File | Description |
|------|-------------|
| `images/app_launcher_icon.png` | 1024×1024 app icon (square, no rounded corners) |
| `images/adaptive_foreground_icon.png` | Android adaptive icon foreground |
| `images/bg3-min.png` | Home-page background image |
| `images/Harriers_Logo_PNG_White.png` | Club logo (white, transparent background) |
| `jsons/live-white.json` | Lottie animation for live match centre button |
| `fonts/[FontName]-Regular.ttf` | Club body font |
| `fonts/[FontName]-SemiBold.ttf` | Club semi-bold font |

Update `pubspec.yaml` fonts section to match your font files.
Update `ClubThemeConfig.fontFamily` in `app_config.dart` to match the family name.

### Step 10 — App icons

```bash
cd apps/[clubname]
flutter pub run flutter_launcher_icons
```

### Step 11 — Dynalink

Set up a Dynalink project for this club at https://dynalinks.app.
The `dynalinkPublicKey` and `dynalinkProjectId` values come from there.

### Step 12 — Build check

```bash
cd apps/[clubname]
flutter pub get
flutter build apk --debug
```

Zero errors = ready for QA.

### Step 13 — Smoke tests

Run through the critical flows listed in `docs/migration/MIGRATION_PLAN.md` Section 8.

### Step 14 — Commit

```bash
git add apps/[clubname]/
git commit -m "feat(apps): add [clubname] app"
```

---

## File overview

```
lib/
  app_config.dart          → Fill in all club values here (STEP 2)
  main.dart                → Bootstrap — Firebase, Dynalink, portrait lock
  home/
    home_screen.dart       → Home page sections — enable, disable, reorder (STEP 3)
  navigation/
    navbar_widget.dart     → 5-tab nav — customise tabs (STEP 4)
    router.dart            → All routes — do NOT change path strings (deep links)
  screens/
    tickets_screen.dart    → WebView loading AppConfig.ticketingUrl

assets/
  images/                  → App icons, background, club logo
  fonts/                   → Club typeface files
  jsons/                   → Lottie animations (live-white.json)

android/
  app/
    google-services.json   → Firebase Android config (STEP 6)
    build.gradle.kts       → Package name + Firebase plugins (STEP 7)
    src/main/
      AndroidManifest.xml  → Deep-link intent filters (STEP 7)
      kotlin/...MainActivity.kt → Package declaration (STEP 7)

ios/
  Runner/
    GoogleService-Info.plist → Firebase iOS config (STEP 6)
    Info.plist               → Bundle ID, URL schemes, associated domains (STEP 8)
  Runner.xcodeproj/
    project.pbxproj          → Bundle ID (STEP 8)
```
