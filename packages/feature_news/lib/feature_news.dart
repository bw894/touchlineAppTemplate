/// Touchline news feature package.
///
/// Provides WordPress news feed, CMS content, X (Twitter) feed, video gallery,
/// and HTML content rendering — with enum-driven variant selection.
///
/// Migration note: Populated in Phase 5.5 of MIGRATION_PLAN.md
library feature_news;

export 'src/providers.dart';
export 'src/widgets/wordpress_news_feed.dart';
export 'src/widgets/x_feed_widget.dart';
export 'src/widgets/latest_videos_widget.dart';
export 'src/widgets/youtube_video_widget.dart';
export 'src/widgets/cms_post_page.dart';
export 'src/widgets/combined_cms_widget.dart';
export 'src/widgets/events_slider_widget.dart';

// My Club — CMS static page tree
export 'src/screens/static_page_folder_screen.dart';
export 'src/screens/static_page_screen.dart';
