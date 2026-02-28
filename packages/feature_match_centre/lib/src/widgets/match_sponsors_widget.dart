import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:theming/theming.dart';

/// Displays a grid of match sponsors with tappable links.
///
/// Hides itself when [matchSponsors] is empty. Pure presentation.
class MatchSponsorsWidget extends StatelessWidget {
  const MatchSponsorsWidget({
    super.key,
    this.matchSponsors,
  });

  final List<SponsorshipDealsStruct>? matchSponsors;

  @override
  Widget build(BuildContext context) {
    final sponsors = matchSponsors;
    if (sponsors == null || sponsors.isEmpty) return const SizedBox.shrink();

    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final primary = Theme.of(context).colorScheme.primary;

    final sorted =
        sponsors.sortedList(keyOf: (e) => e.sortOrder, desc: false).toList();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: colors.primaryBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 3, thickness: 3, color: primary),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Text(
                'SPONSORS',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 35),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(sorted.length, (i) {
                    final sponsor = sorted[i];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => launchURL(sponsor.sponsorWebsite),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 90,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (sponsor.sponsorImage == '' ||
                                      sponsor.sponsorImage == 'null')
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5, 0, 5, 0),
                                      child: Text(
                                        sponsor.sponsorName,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  if (sponsor.sponsorImage != '' &&
                                      sponsor.sponsorImage != 'null')
                                    Align(
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.zero,
                                        child: Image.network(
                                          sponsor.sponsorImage,
                                          width: 120,
                                          height: 90,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 5, 8),
                                child: Text(
                                  sponsor.shortDisplay.isNotEmpty
                                      ? sponsor.shortDisplay
                                      : 'Match Sponsor',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
