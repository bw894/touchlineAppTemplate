// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class NewsItemStruct extends BaseStruct {
  NewsItemStruct({
    String? link,
    RenderedContentStruct? title,
    RenderedContentStruct? excerpt,
    int? featuredMedia,
    String? date,
  })  : _link = link,
        _title = title,
        _excerpt = excerpt,
        _featuredMedia = featuredMedia,
        _date = date;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "title" field.
  RenderedContentStruct? _title;
  RenderedContentStruct get title => _title ?? RenderedContentStruct();
  set title(RenderedContentStruct? val) => _title = val;

  void updateTitle(Function(RenderedContentStruct) updateFn) {
    updateFn(_title ??= RenderedContentStruct());
  }

  bool hasTitle() => _title != null;

  // "excerpt" field.
  RenderedContentStruct? _excerpt;
  RenderedContentStruct get excerpt => _excerpt ?? RenderedContentStruct();
  set excerpt(RenderedContentStruct? val) => _excerpt = val;

  void updateExcerpt(Function(RenderedContentStruct) updateFn) {
    updateFn(_excerpt ??= RenderedContentStruct());
  }

  bool hasExcerpt() => _excerpt != null;

  // "featured_media" field.
  int? _featuredMedia;
  int get featuredMedia => _featuredMedia ?? 0;
  set featuredMedia(int? val) => _featuredMedia = val;

  void incrementFeaturedMedia(int amount) =>
      featuredMedia = featuredMedia + amount;

  bool hasFeaturedMedia() => _featuredMedia != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  static NewsItemStruct fromMap(Map<String, dynamic> data) => NewsItemStruct(
        link: data['link'] as String?,
        title: data['title'] is RenderedContentStruct
            ? data['title']
            : RenderedContentStruct.maybeFromMap(data['title']),
        excerpt: data['excerpt'] is RenderedContentStruct
            ? data['excerpt']
            : RenderedContentStruct.maybeFromMap(data['excerpt']),
        featuredMedia: castToType<int>(data['featured_media']),
        date: data['date'] as String?,
      );

  static NewsItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'link': _link,
        'title': _title?.toMap(),
        'excerpt': _excerpt?.toMap(),
        'featured_media': _featuredMedia,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.DataStruct,
        ),
        'excerpt': serializeParam(
          _excerpt,
          ParamType.DataStruct,
        ),
        'featured_media': serializeParam(
          _featuredMedia,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsItemStruct(
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        title: deserializeStructParam(
          data['title'],
          ParamType.DataStruct,
          false,
          structBuilder: RenderedContentStruct.fromSerializableMap,
        ),
        excerpt: deserializeStructParam(
          data['excerpt'],
          ParamType.DataStruct,
          false,
          structBuilder: RenderedContentStruct.fromSerializableMap,
        ),
        featuredMedia: deserializeParam(
          data['featured_media'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsItemStruct &&
        link == other.link &&
        title == other.title &&
        excerpt == other.excerpt &&
        featuredMedia == other.featuredMedia &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([link, title, excerpt, featuredMedia, date]);
}

NewsItemStruct createNewsItemStruct({
  String? link,
  RenderedContentStruct? title,
  RenderedContentStruct? excerpt,
  int? featuredMedia,
  String? date,
}) =>
    NewsItemStruct(
      link: link,
      title: title ?? RenderedContentStruct(),
      excerpt: excerpt ?? RenderedContentStruct(),
      featuredMedia: featuredMedia,
      date: date,
    );
