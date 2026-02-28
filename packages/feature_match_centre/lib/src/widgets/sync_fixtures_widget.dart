import 'dart:io' show Platform;

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

// ---------------------------------------------------------------------------
// Public widgets
// ---------------------------------------------------------------------------

/// Prompts the user to sync fixtures to their phone calendar.
///
/// Fetches [CalendarStatusCall] to decide which calendar options to show.
/// Each option opens [fixturesLink] in the appropriate scheme
/// (webcal:// for Apple/Outlook, Google Calendar URL for Google, raw for ICS).
class SyncFixturesWidget extends ConsumerWidget {
  const SyncFixturesWidget({super.key, required this.fixturesLink});

  final String fixturesLink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final primary = Theme.of(context).colorScheme.primary;
    final secondary = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2F1D2429),
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: cfg.cardBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Add to calendar',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: secondary,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                child: Text(
                  "Sync your team's fixtures & events to your favourite calendar app!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(height: 1.3),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FutureBuilder<ApiCallResponse>(
                  future: CalendarStatusCall.call(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: AppLoader(color: primary, size: 50));
                    }
                    final resp = snapshot.data!;
                    final isIOS = Platform.isIOS;
                    return Wrap(
                      spacing: 15,
                      runSpacing: 25,
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (isIOS &&
                            (CalendarStatusCall.apple(resp.jsonBody) ?? false))
                          _CalendarOption(
                            label: 'Apple',
                            assetPath:
                                'assets/images/941b3852f089696217cabe420c7a459f.png',
                            onTap: () => launchURL(
                                fixturesLink.replaceFirst(
                                    'https://', 'webcal://')),
                            colors: colors,
                          ),
                        if (isIOS &&
                            (CalendarStatusCall.outlook(resp.jsonBody) ??
                                false))
                          _CalendarOption(
                            label: 'Outlook',
                            assetPath:
                                'assets/images/Microsoft_Office_Outlook_(2018present).svg.png',
                            onTap: () => launchURL(
                                fixturesLink.replaceFirst(
                                    'https://', 'webcal://')),
                            colors: colors,
                          ),
                        if (CalendarStatusCall.ics(resp.jsonBody) ?? true)
                          _CalendarOption(
                            label: 'ICS',
                            assetPath: 'assets/images/2306102.png',
                            onTap: () => launchURL(fixturesLink),
                            colors: colors,
                          ),
                        if (CalendarStatusCall.google(resp.jsonBody) ?? true)
                          _CalendarOption(
                            label: 'Google',
                            assetPath:
                                'assets/images/Google_Calendar_icon_(2020).svg.png',
                            onTap: () => launchURL(
                                'https://www.google.com/calendar/render?cid=${fixturesLink.replaceFirst('https://', 'webcal://')}'),
                            colors: colors,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Simple animated card that appears while fixtures download / import.
class DownloadingFixturesWidget extends ConsumerWidget {
  const DownloadingFixturesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Container(
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          color: colors.secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: cfg.cardBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Downloading Fixtures',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Tap the download to import into your calendar application.',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'This will not update automatically',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .moveX(begin: 40, end: 0, duration: 600.ms),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download_rounded,
                    color: primary,
                    size: 58,
                  ).animate().fadeIn(duration: 600.ms).scale(
                        begin: const Offset(0, 0),
                        end: const Offset(1, 1),
                        duration: 600.ms,
                      ),
                ],
              ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 600.ms)
          .moveY(begin: 50, end: 0, duration: 600.ms),
    );
  }
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

class _CalendarOption extends StatelessWidget {
  const _CalendarOption({
    required this.label,
    required this.assetPath,
    required this.onTap,
    required this.colors,
  });

  final String label;
  final String assetPath;
  final VoidCallback onTap;
  final TouchlineColors colors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: colors.secondaryBackground),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.primaryBackground,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.asset(
                    assetPath,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
          ].divide(const SizedBox(height: 6)),
        ),
      ),
    );
  }
}
