import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks campaign objectIds shown to the current user this session.
///
/// Populated by [CampaignWidget] on mount so the parent can filter out
/// campaigns the user has already seen.
final campaignProvider = StateProvider<List<String>>((ref) => []);
