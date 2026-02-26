import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Record typedefs for family provider keys
// ---------------------------------------------------------------------------

typedef _WordpressArgs = ({String websiteBaseUrl});
typedef _XFeedArgs = ({String feedUrl});
typedef _YoutubeArgs = ({String playlistId, String apiKey});
typedef _CmsPostArgs = ({
  String projectId,
  String restApiKey,
  String postObjectId,
  String userToken
});
typedef _CmsListArgs = ({
  String projectId,
  String restApiKey,
  int count,
  String userToken
});
typedef _EventsArgs = ({String projectId, String restApiKey});

// ---------------------------------------------------------------------------
// WordPress news
// ---------------------------------------------------------------------------

final wordpressNewsProvider = FutureProvider.autoDispose
    .family<List<NewsItemStruct>, _WordpressArgs>((ref, args) async {
  final r = await WordpressWebsitesGroup.newsCall.call(
    websiteBaseUrl: args.websiteBaseUrl,
  );
  if (!r.succeeded) return [];
  final raw = r.jsonBody;
  if (raw is! List) return [];
  return raw
      .map((e) => NewsItemStruct.maybeFromMap(e))
      .whereType<NewsItemStruct>()
      .take(5)
      .toList();
});

// ---------------------------------------------------------------------------
// X (Twitter) feed
// ---------------------------------------------------------------------------

final xFeedProvider = FutureProvider.autoDispose
    .family<List<ItemTwitterStruct>, _XFeedArgs>((ref, args) async {
  final r = await LiveTextCall.call(feedURL: args.feedUrl);
  if (!r.succeeded) return [];
  return (TwitterFeedStruct.maybeFromMap(r.jsonBody)?.items ?? [])
      .take(3)
      .toList();
});

// ---------------------------------------------------------------------------
// YouTube videos
// ---------------------------------------------------------------------------

final youtubeVideosProvider = FutureProvider.autoDispose
    .family<List<ItemsStruct>, _YoutubeArgs>((ref, args) async {
  final r = await YouTubeVideosCall.call(
    playlistId: args.playlistId,
    tkeye: args.apiKey,
  );
  if (!r.succeeded) return [];
  return (VideoResponseStruct.maybeFromMap(r.jsonBody)?.items ?? [])
      .take(5)
      .toList();
});

// ---------------------------------------------------------------------------
// CMS post (single)
// ---------------------------------------------------------------------------

final cmsPostProvider = FutureProvider.autoDispose
    .family<CMSPostStruct?, _CmsPostArgs>((ref, args) async {
  final r = await CmsGroup.getCMSPostByIDCall.call(
    cmsPostObjectId: args.postObjectId,
    bLappId: args.projectId,
    bLRestApiKey: args.restApiKey,
    headerName: args.userToken.isNotEmpty ? 'user-token' : 'Content-Type',
    headerValue: args.userToken.isNotEmpty ? args.userToken : 'application/json',
  );
  if (!r.succeeded) return null;
  return CMSPostStruct.maybeFromMap(r.jsonBody);
});

// ---------------------------------------------------------------------------
// CMS latest posts (list)
// ---------------------------------------------------------------------------

final cmsLatestPostsProvider = FutureProvider.autoDispose
    .family<List<CMSPostStruct>, _CmsListArgs>((ref, args) async {
  final r = await CmsGroup.getLatestPostsCall.call(
    bLappId: args.projectId,
    bLRestApiKey: args.restApiKey,
    number: args.count,
    currentTime: DateTime.now().millisecondsSinceEpoch,
    headerName: args.userToken.isNotEmpty ? 'user-token' : 'Content-Type',
    headerValue: args.userToken.isNotEmpty ? args.userToken : 'application/json',
  );
  if (!r.succeeded) return [];
  final raw = r.jsonBody;
  if (raw is! List) return [];
  return raw
      .map((e) => CMSPostStruct.maybeFromMap(e))
      .whereType<CMSPostStruct>()
      .toList();
});

// ---------------------------------------------------------------------------
// Upcoming commercial events
// ---------------------------------------------------------------------------

final upcomingEventsProvider = FutureProvider.autoDispose
    .family<List<CommercialEventStruct>, _EventsArgs>((ref, args) async {
  final r = await BackendlessDatabaseGroup.getUpcomingCommercialEventsCall.call(
    currentTime: DateTime.now().millisecondsSinceEpoch,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  if (!r.succeeded) return [];
  final raw = r.jsonBody;
  if (raw is! List) return [];
  return (raw
      .map((e) => CommercialEventStruct.maybeFromMap(e))
      .whereType<CommercialEventStruct>()
      .toList())
    ..sort((a, b) => a.startDatetime.compareTo(b.startDatetime));
});
