// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizQuestionsStruct extends BaseStruct {
  QuizQuestionsStruct({
    String? image,
    List<QuizQuestionOptionsStruct>? questionOptions,
    int? sortOrder,
    int? time,
    String? title,
    String? ownerId,
    String? objectId,
  })  : _image = image,
        _questionOptions = questionOptions,
        _sortOrder = sortOrder,
        _time = time,
        _title = title,
        _ownerId = ownerId,
        _objectId = objectId;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "questionOptions" field.
  List<QuizQuestionOptionsStruct>? _questionOptions;
  List<QuizQuestionOptionsStruct> get questionOptions =>
      _questionOptions ?? const [];
  set questionOptions(List<QuizQuestionOptionsStruct>? val) =>
      _questionOptions = val;

  void updateQuestionOptions(
      Function(List<QuizQuestionOptionsStruct>) updateFn) {
    updateFn(_questionOptions ??= []);
  }

  bool hasQuestionOptions() => _questionOptions != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  set time(int? val) => _time = val;

  void incrementTime(int amount) => time = time + amount;

  bool hasTime() => _time != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static QuizQuestionsStruct fromMap(Map<String, dynamic> data) =>
      QuizQuestionsStruct(
        image: data['image'] as String?,
        questionOptions: getStructList(
          data['questionOptions'],
          QuizQuestionOptionsStruct.fromMap,
        ),
        sortOrder: castToType<int>(data['sortOrder']),
        time: castToType<int>(data['time']),
        title: data['title'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
      );

  static QuizQuestionsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizQuestionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'questionOptions': _questionOptions?.map((e) => e.toMap()).toList(),
        'sortOrder': _sortOrder,
        'time': _time,
        'title': _title,
        'ownerId': _ownerId,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'questionOptions': serializeParam(
          _questionOptions,
          ParamType.DataStruct,
          isList: true,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizQuestionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizQuestionsStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        questionOptions: deserializeStructParam<QuizQuestionOptionsStruct>(
          data['questionOptions'],
          ParamType.DataStruct,
          true,
          structBuilder: QuizQuestionOptionsStruct.fromSerializableMap,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuizQuestionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuizQuestionsStruct &&
        image == other.image &&
        listEquality.equals(questionOptions, other.questionOptions) &&
        sortOrder == other.sortOrder &&
        time == other.time &&
        title == other.title &&
        ownerId == other.ownerId &&
        objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [image, questionOptions, sortOrder, time, title, ownerId, objectId]);
}

QuizQuestionsStruct createQuizQuestionsStruct({
  String? image,
  int? sortOrder,
  int? time,
  String? title,
  String? ownerId,
  String? objectId,
}) =>
    QuizQuestionsStruct(
      image: image,
      sortOrder: sortOrder,
      time: time,
      title: title,
      ownerId: ownerId,
      objectId: objectId,
    );
