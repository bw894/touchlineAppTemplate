// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ItemTwitterStruct extends BaseStruct {
  ItemTwitterStruct({
    String? title,
    String? image,
    String? datePublished,
    String? url,
    String? contentText,
  })  : _title = title,
        _image = image,
        _datePublished = datePublished,
        _url = url,
        _contentText = contentText;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "date_published" field.
  String? _datePublished;
  String get datePublished => _datePublished ?? '';
  set datePublished(String? val) => _datePublished = val;

  bool hasDatePublished() => _datePublished != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "content_text" field.
  String? _contentText;
  String get contentText => _contentText ?? '';
  set contentText(String? val) => _contentText = val;

  bool hasContentText() => _contentText != null;

  static ItemTwitterStruct fromMap(Map<String, dynamic> data) =>
      ItemTwitterStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
        datePublished: data['date_published'] as String?,
        url: data['url'] as String?,
        contentText: data['content_text'] as String?,
      );

  static ItemTwitterStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemTwitterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
        'date_published': _datePublished,
        'url': _url,
        'content_text': _contentText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'date_published': serializeParam(
          _datePublished,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'content_text': serializeParam(
          _contentText,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemTwitterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemTwitterStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        datePublished: deserializeParam(
          data['date_published'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        contentText: deserializeParam(
          data['content_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemTwitterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemTwitterStruct &&
        title == other.title &&
        image == other.image &&
        datePublished == other.datePublished &&
        url == other.url &&
        contentText == other.contentText;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, image, datePublished, url, contentText]);
}

ItemTwitterStruct createItemTwitterStruct({
  String? title,
  String? image,
  String? datePublished,
  String? url,
  String? contentText,
}) =>
    ItemTwitterStruct(
      title: title,
      image: image,
      datePublished: datePublished,
      url: url,
      contentText: contentText,
    );
