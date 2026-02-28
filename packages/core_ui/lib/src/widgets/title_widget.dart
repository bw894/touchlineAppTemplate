import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:core_ui/src/config/component_variants.dart';

/// Hard-coded label strings for each [TitleSection].
///
/// Each entry is [part1, part2] — part1 uses Rubik bold-italic,
/// part2 uses Inter bold-italic in the primary colour.
const _sectionLabels = <TitleSection, (String, String)>{
  TitleSection.latestNews: ('LATEST ', 'NEWS'),
  TitleSection.latestVideos: ('LATEST ', 'VIDEOS'),
  TitleSection.leagueTable: ('LEAGUE ', 'TABLE'),
  TitleSection.nextFixture: ('NEXT ', 'UP'),
  TitleSection.squadHub: ('SQUAD ', 'HUB'),
  TitleSection.social: ('social ', 'media'),
  TitleSection.generic: ('', ''),
};

/// Consolidated section-heading widget replacing 24 individual title variants.
///
/// Usage:
/// ```dart
/// TitleWidget(section: TitleSection.latestNews)                   // "LATEST NEWS ›"
/// TitleWidget(section: TitleSection.generic, title: 'MY TITLE')  // custom text
/// TitleWidget(section: TitleSection.latestNews, onTap: () { … }) // tappable
/// ```
class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.section,
    this.title,
    this.onTap,
    this.style = TitleStyle.standard,
  });

  final TitleSection section;

  /// Only used when [section] is [TitleSection.generic].
  final String? title;

  /// Optional tap handler. When provided a chevron is always shown.
  final VoidCallback? onTap;
  final TitleStyle style;

  @override
  Widget build(BuildContext context) {
    final double fontSize = style == TitleStyle.standard ? 32.0 : 24.0;
    final primary = Theme.of(context).colorScheme.primary;
    final textColour = Theme.of(context).colorScheme.onSurface;

    final (String p1, String p2) = section == TitleSection.generic
        ? _parseGeneric(title ?? '')
        : _sectionLabels[section]!;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (p1.isNotEmpty)
              Text(
                p1,
                style: GoogleFonts.rubik(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: textColour,
                  letterSpacing: 0.0,
                ),
              ),
            if (p2.isNotEmpty)
              Text(
                p2,
                style: GoogleFonts.inter(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: primary,
                  letterSpacing: 0.0,
                ),
              ),
            if (p1.isEmpty && p2.isEmpty && title != null)
              Text(
                title!,
                style: GoogleFonts.bebasNeue(
                  fontSize: fontSize,
                  color: textColour,
                  letterSpacing: 1.0,
                ),
              ),
            if (onTap != null)
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                child: FaIcon(FontAwesomeIcons.angleRight,
                    color: primary, size: 15.0),
              ),
          ],
        ),
      ),
    );
  }

  /// Splits a custom [title] string at the last space so part2 (last word)
  /// gets the primary colour. Falls back to putting everything in part2.
  static (String, String) _parseGeneric(String value) {
    final idx = value.lastIndexOf(' ');
    if (idx == -1) return ('', value);
    return ('${value.substring(0, idx)} ', value.substring(idx + 1));
  }
}
