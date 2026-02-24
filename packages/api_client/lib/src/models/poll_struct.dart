// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class PollStruct extends BaseStruct {
  PollStruct({
    int? startDatetime,
    bool? showResultsWhileVoting,
    String? title,
    String? type,
    String? objectId,
    int? endDatetime,

    /// potential options for the poll
    List<PollOptionsStruct>? options,
    BLESSfixtureStruct? relatedMatch,
    int? formPages,
    String? style,
    List<FormFieldsStruct>? formFields,
    List<QuizQuestionsStruct>? quizQuestions,
    List<FormEntriesStruct>? formEntries,
    List<QuizEntriesStruct>? quizEntries,
  })  : _startDatetime = startDatetime,
        _showResultsWhileVoting = showResultsWhileVoting,
        _title = title,
        _type = type,
        _objectId = objectId,
        _endDatetime = endDatetime,
        _options = options,
        _relatedMatch = relatedMatch,
        _formPages = formPages,
        _style = style,
        _formFields = formFields,
        _quizQuestions = quizQuestions,
        _formEntries = formEntries,
        _quizEntries = quizEntries;

  // "startDatetime" field.
  int? _startDatetime;
  int get startDatetime => _startDatetime ?? 0;
  set startDatetime(int? val) => _startDatetime = val;

  void incrementStartDatetime(int amount) =>
      startDatetime = startDatetime + amount;

  bool hasStartDatetime() => _startDatetime != null;

  // "showResultsWhileVoting" field.
  bool? _showResultsWhileVoting;
  bool get showResultsWhileVoting => _showResultsWhileVoting ?? false;
  set showResultsWhileVoting(bool? val) => _showResultsWhileVoting = val;

  bool hasShowResultsWhileVoting() => _showResultsWhileVoting != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "endDatetime" field.
  int? _endDatetime;
  int get endDatetime => _endDatetime ?? 0;
  set endDatetime(int? val) => _endDatetime = val;

  void incrementEndDatetime(int amount) => endDatetime = endDatetime + amount;

  bool hasEndDatetime() => _endDatetime != null;

  // "options" field.
  List<PollOptionsStruct>? _options;
  List<PollOptionsStruct> get options => _options ?? const [];
  set options(List<PollOptionsStruct>? val) => _options = val;

  void updateOptions(Function(List<PollOptionsStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "relatedMatch" field.
  BLESSfixtureStruct? _relatedMatch;
  BLESSfixtureStruct get relatedMatch => _relatedMatch ?? BLESSfixtureStruct();
  set relatedMatch(BLESSfixtureStruct? val) => _relatedMatch = val;

  void updateRelatedMatch(Function(BLESSfixtureStruct) updateFn) {
    updateFn(_relatedMatch ??= BLESSfixtureStruct());
  }

  bool hasRelatedMatch() => _relatedMatch != null;

  // "formPages" field.
  int? _formPages;
  int get formPages => _formPages ?? 1;
  set formPages(int? val) => _formPages = val;

  void incrementFormPages(int amount) => formPages = formPages + amount;

  bool hasFormPages() => _formPages != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  set style(String? val) => _style = val;

  bool hasStyle() => _style != null;

  // "formFields" field.
  List<FormFieldsStruct>? _formFields;
  List<FormFieldsStruct> get formFields => _formFields ?? const [];
  set formFields(List<FormFieldsStruct>? val) => _formFields = val;

  void updateFormFields(Function(List<FormFieldsStruct>) updateFn) {
    updateFn(_formFields ??= []);
  }

  bool hasFormFields() => _formFields != null;

  // "quizQuestions" field.
  List<QuizQuestionsStruct>? _quizQuestions;
  List<QuizQuestionsStruct> get quizQuestions => _quizQuestions ?? const [];
  set quizQuestions(List<QuizQuestionsStruct>? val) => _quizQuestions = val;

  void updateQuizQuestions(Function(List<QuizQuestionsStruct>) updateFn) {
    updateFn(_quizQuestions ??= []);
  }

  bool hasQuizQuestions() => _quizQuestions != null;

  // "formEntries" field.
  List<FormEntriesStruct>? _formEntries;
  List<FormEntriesStruct> get formEntries => _formEntries ?? const [];
  set formEntries(List<FormEntriesStruct>? val) => _formEntries = val;

  void updateFormEntries(Function(List<FormEntriesStruct>) updateFn) {
    updateFn(_formEntries ??= []);
  }

  bool hasFormEntries() => _formEntries != null;

  // "quizEntries" field.
  List<QuizEntriesStruct>? _quizEntries;
  List<QuizEntriesStruct> get quizEntries => _quizEntries ?? const [];
  set quizEntries(List<QuizEntriesStruct>? val) => _quizEntries = val;

  void updateQuizEntries(Function(List<QuizEntriesStruct>) updateFn) {
    updateFn(_quizEntries ??= []);
  }

  bool hasQuizEntries() => _quizEntries != null;

  static PollStruct fromMap(Map<String, dynamic> data) => PollStruct(
        startDatetime: castToType<int>(data['startDatetime']),
        showResultsWhileVoting: data['showResultsWhileVoting'] as bool?,
        title: data['title'] as String?,
        type: data['type'] as String?,
        objectId: data['objectId'] as String?,
        endDatetime: castToType<int>(data['endDatetime']),
        options: getStructList(
          data['options'],
          PollOptionsStruct.fromMap,
        ),
        relatedMatch: data['relatedMatch'] is BLESSfixtureStruct
            ? data['relatedMatch']
            : BLESSfixtureStruct.maybeFromMap(data['relatedMatch']),
        formPages: castToType<int>(data['formPages']),
        style: data['style'] as String?,
        formFields: getStructList(
          data['formFields'],
          FormFieldsStruct.fromMap,
        ),
        quizQuestions: getStructList(
          data['quizQuestions'],
          QuizQuestionsStruct.fromMap,
        ),
        formEntries: getStructList(
          data['formEntries'],
          FormEntriesStruct.fromMap,
        ),
        quizEntries: getStructList(
          data['quizEntries'],
          QuizEntriesStruct.fromMap,
        ),
      );

  static PollStruct? maybeFromMap(dynamic data) =>
      data is Map ? PollStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'startDatetime': _startDatetime,
        'showResultsWhileVoting': _showResultsWhileVoting,
        'title': _title,
        'type': _type,
        'objectId': _objectId,
        'endDatetime': _endDatetime,
        'options': _options?.map((e) => e.toMap()).toList(),
        'relatedMatch': _relatedMatch?.toMap(),
        'formPages': _formPages,
        'style': _style,
        'formFields': _formFields?.map((e) => e.toMap()).toList(),
        'quizQuestions': _quizQuestions?.map((e) => e.toMap()).toList(),
        'formEntries': _formEntries?.map((e) => e.toMap()).toList(),
        'quizEntries': _quizEntries?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startDatetime': serializeParam(
          _startDatetime,
          ParamType.int,
        ),
        'showResultsWhileVoting': serializeParam(
          _showResultsWhileVoting,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'endDatetime': serializeParam(
          _endDatetime,
          ParamType.int,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
        'relatedMatch': serializeParam(
          _relatedMatch,
          ParamType.DataStruct,
        ),
        'formPages': serializeParam(
          _formPages,
          ParamType.int,
        ),
        'style': serializeParam(
          _style,
          ParamType.String,
        ),
        'formFields': serializeParam(
          _formFields,
          ParamType.DataStruct,
          isList: true,
        ),
        'quizQuestions': serializeParam(
          _quizQuestions,
          ParamType.DataStruct,
          isList: true,
        ),
        'formEntries': serializeParam(
          _formEntries,
          ParamType.DataStruct,
          isList: true,
        ),
        'quizEntries': serializeParam(
          _quizEntries,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PollStruct fromSerializableMap(Map<String, dynamic> data) =>
      PollStruct(
        startDatetime: deserializeParam(
          data['startDatetime'],
          ParamType.int,
          false,
        ),
        showResultsWhileVoting: deserializeParam(
          data['showResultsWhileVoting'],
          ParamType.bool,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        endDatetime: deserializeParam(
          data['endDatetime'],
          ParamType.int,
          false,
        ),
        options: deserializeStructParam<PollOptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: PollOptionsStruct.fromSerializableMap,
        ),
        relatedMatch: deserializeStructParam(
          data['relatedMatch'],
          ParamType.DataStruct,
          false,
          structBuilder: BLESSfixtureStruct.fromSerializableMap,
        ),
        formPages: deserializeParam(
          data['formPages'],
          ParamType.int,
          false,
        ),
        style: deserializeParam(
          data['style'],
          ParamType.String,
          false,
        ),
        formFields: deserializeStructParam<FormFieldsStruct>(
          data['formFields'],
          ParamType.DataStruct,
          true,
          structBuilder: FormFieldsStruct.fromSerializableMap,
        ),
        quizQuestions: deserializeStructParam<QuizQuestionsStruct>(
          data['quizQuestions'],
          ParamType.DataStruct,
          true,
          structBuilder: QuizQuestionsStruct.fromSerializableMap,
        ),
        formEntries: deserializeStructParam<FormEntriesStruct>(
          data['formEntries'],
          ParamType.DataStruct,
          true,
          structBuilder: FormEntriesStruct.fromSerializableMap,
        ),
        quizEntries: deserializeStructParam<QuizEntriesStruct>(
          data['quizEntries'],
          ParamType.DataStruct,
          true,
          structBuilder: QuizEntriesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PollStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PollStruct &&
        startDatetime == other.startDatetime &&
        showResultsWhileVoting == other.showResultsWhileVoting &&
        title == other.title &&
        type == other.type &&
        objectId == other.objectId &&
        endDatetime == other.endDatetime &&
        listEquality.equals(options, other.options) &&
        relatedMatch == other.relatedMatch &&
        formPages == other.formPages &&
        style == other.style &&
        listEquality.equals(formFields, other.formFields) &&
        listEquality.equals(quizQuestions, other.quizQuestions) &&
        listEquality.equals(formEntries, other.formEntries) &&
        listEquality.equals(quizEntries, other.quizEntries);
  }

  @override
  int get hashCode => const ListEquality().hash([
        startDatetime,
        showResultsWhileVoting,
        title,
        type,
        objectId,
        endDatetime,
        options,
        relatedMatch,
        formPages,
        style,
        formFields,
        quizQuestions,
        formEntries,
        quizEntries
      ]);
}

PollStruct createPollStruct({
  int? startDatetime,
  bool? showResultsWhileVoting,
  String? title,
  String? type,
  String? objectId,
  int? endDatetime,
  BLESSfixtureStruct? relatedMatch,
  int? formPages,
  String? style,
}) =>
    PollStruct(
      startDatetime: startDatetime,
      showResultsWhileVoting: showResultsWhileVoting,
      title: title,
      type: type,
      objectId: objectId,
      endDatetime: endDatetime,
      relatedMatch: relatedMatch ?? BLESSfixtureStruct(),
      formPages: formPages,
      style: style,
    );
