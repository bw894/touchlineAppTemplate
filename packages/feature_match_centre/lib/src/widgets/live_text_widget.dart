import 'dart:ui';

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

import 'package:feature_match_centre/src/providers.dart';

/// Live match text feed.
///
/// Fetches items once via [liveTextProvider]. Items with neither a heading
/// nor a description are filtered out. Tapping an item opens a blurred
/// detail overlay.
class LiveTextWidget extends ConsumerWidget {
  const LiveTextWidget({
    super.key,
    required this.matchObjectId,
    required this.projectId,
    required this.restApiKey,
  });

  final String matchObjectId;
  final String projectId;
  final String restApiKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primary = Theme.of(context).colorScheme.primary;
    final args = (
      projectId: projectId,
      restApiKey: restApiKey,
      matchObjectId: matchObjectId,
    );
    final itemsAsync = ref.watch(liveTextProvider(args));

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
      child: itemsAsync.when(
        loading: () => Center(child: AppLoader(color: primary, size: 50)),
        error: (_, __) => const SizedBox.shrink(),
        data: (items) {
          if (items.isEmpty) {
            return _EmptyState(
              title: 'LIVE TEXT NOT AVAILABLE',
              body: 'Check back soon',
              icon: Icon(Icons.list, color: primary, size: 50),
            );
          }

          return Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: Alignment.center,
                      child: _LiveTextDetailDialog(item: item),
                    ),
                  ),
                  child: _LiveTextCard(item: item),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private widgets
// ---------------------------------------------------------------------------

class _LiveTextCard extends StatelessWidget {
  const _LiveTextCard({required this.item});

  final LiveTextStruct item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      width: 100,
      decoration:
          BoxDecoration(color: colors.secondaryBackground),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(height: 3, thickness: 3, color: primary),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (item.minuteIndicator != '' &&
                  item.minuteIndicator != 'null')
                _MinuteBadge(label: "${item.minuteIndicator}'", primary: primary, colors: colors)
              else
                _MinuteBadge(
                  label:
                      '${dateTimeFormat("jm", DateTime.fromMillisecondsSinceEpoch(item.created))} (UK)',
                  primary: primary,
                  colors: colors,
                ),
            ],
          ),
          if (item.heading != '' &&
              item.type != 'GENERAL' &&
              item.heading != 'null')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 3, 14, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (item.imagePathUrl != '' &&
                      item.imagePathUrl != 'null')
                    ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.network(
                        item.imagePathUrl,
                        width: 38,
                        height: 34,
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (item.heading != '' && item.heading != 'null')
                    Expanded(
                      child: Text(
                        item.heading,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                ].divide(const SizedBox(width: 12)),
              ),
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 14, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ].divide(const SizedBox(width: 12)),
            ),
          ),
          if (item.mainImageUrl != '' && item.mainImageUrl != 'null')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 5, 14, 0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => AppImageViewer(
                      image: Image.network(
                        item.mainImageUrl,
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      useHeroAnimation: true,
                      tag: item.mainImageUrl,
                    ),
                  ),
                ),
                child: Hero(
                  tag: item.mainImageUrl,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Image.network(
                      item.mainImageUrl,
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ].addToEnd(const SizedBox(height: 14)),
      ),
    );
  }
}

class _MinuteBadge extends StatelessWidget {
  const _MinuteBadge({
    required this.label,
    required this.primary,
    required this.colors,
  });

  final String label;
  final Color primary;
  final TouchlineColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primary),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(7, 3, 7, 6),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: colors.secondaryBackground,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}

/// Blurred backdrop detail overlay shown when a live text item is tapped.
class _LiveTextDetailDialog extends StatelessWidget {
  const _LiveTextDetailDialog({required this.item});

  final LiveTextStruct item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final primary = Theme.of(context).colorScheme.primary;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pop(context),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration:
                BoxDecoration(color: colors.secondaryBackground),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(height: 3, thickness: 3, color: primary),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (item.minuteIndicator != '' &&
                        item.minuteIndicator != 'null')
                      _DetailMinuteBadge(
                        label: "${item.minuteIndicator}'",
                        primary: primary,
                        colors: colors,
                      )
                    else
                      _DetailMinuteBadge(
                        label:
                            '${dateTimeFormat("jm", DateTime.fromMillisecondsSinceEpoch(item.created))} (UK)',
                        primary: primary,
                        colors: colors,
                      ),
                  ],
                ),
                if (item.heading != '' &&
                    item.type != 'GENERAL' &&
                    item.heading != 'null')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 3, 14, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (item.imagePathUrl != '' &&
                            item.imagePathUrl != 'null')
                          ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Image.network(
                              item.imagePathUrl,
                              width: 45,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (item.heading != '' &&
                            item.heading != 'null')
                          Expanded(
                            child: Text(
                              item.heading,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                      ].divide(const SizedBox(width: 12)),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 14, 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          item.description,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 12)),
                  ),
                ),
                if (item.mainImageUrl != '' &&
                    item.mainImageUrl != 'null')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 5, 14, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => AppImageViewer(
                            image: Image.network(
                              item.mainImageUrl,
                              fit: BoxFit.contain,
                            ),
                            allowRotation: false,
                            useHeroAnimation: true,
                            tag: item.mainImageUrl,
                          ),
                        ),
                      ),
                      child: Hero(
                        tag: item.mainImageUrl,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Image.network(
                            item.mainImageUrl,
                            width: MediaQuery.sizeOf(context).width,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
              ].addToEnd(const SizedBox(height: 14)),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailMinuteBadge extends StatelessWidget {
  const _DetailMinuteBadge({
    required this.label,
    required this.primary,
    required this.colors,
  });

  final String label;
  final Color primary;
  final TouchlineColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primary),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(7, 3, 7, 6),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: colors.secondaryBackground,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 32)),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ].divide(const SizedBox(height: 6)),
      ),
    );
  }
}
