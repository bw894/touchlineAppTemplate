// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentPlansStruct extends BaseStruct {
  PaymentPlansStruct({
    List<FeatureStruct>? sellingFeaturesList,
    String? description,
    int? months,
    double? total,
    double? monthlyInstallment,
    String? objectId,
    String? season,
  })  : _sellingFeaturesList = sellingFeaturesList,
        _description = description,
        _months = months,
        _total = total,
        _monthlyInstallment = monthlyInstallment,
        _objectId = objectId,
        _season = season;

  // "sellingFeaturesList" field.
  List<FeatureStruct>? _sellingFeaturesList;
  List<FeatureStruct> get sellingFeaturesList =>
      _sellingFeaturesList ?? const [];
  set sellingFeaturesList(List<FeatureStruct>? val) =>
      _sellingFeaturesList = val;

  void updateSellingFeaturesList(Function(List<FeatureStruct>) updateFn) {
    updateFn(_sellingFeaturesList ??= []);
  }

  bool hasSellingFeaturesList() => _sellingFeaturesList != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "months" field.
  int? _months;
  int get months => _months ?? 0;
  set months(int? val) => _months = val;

  void incrementMonths(int amount) => months = months + amount;

  bool hasMonths() => _months != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "monthly_installment" field.
  double? _monthlyInstallment;
  double get monthlyInstallment => _monthlyInstallment ?? 0.0;
  set monthlyInstallment(double? val) => _monthlyInstallment = val;

  void incrementMonthlyInstallment(double amount) =>
      monthlyInstallment = monthlyInstallment + amount;

  bool hasMonthlyInstallment() => _monthlyInstallment != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "season" field.
  String? _season;
  String get season => _season ?? '';
  set season(String? val) => _season = val;

  bool hasSeason() => _season != null;

  static PaymentPlansStruct fromMap(Map<String, dynamic> data) =>
      PaymentPlansStruct(
        sellingFeaturesList: getStructList(
          data['sellingFeaturesList'],
          FeatureStruct.fromMap,
        ),
        description: data['description'] as String?,
        months: castToType<int>(data['months']),
        total: castToType<double>(data['total']),
        monthlyInstallment: castToType<double>(data['monthly_installment']),
        objectId: data['objectId'] as String?,
        season: data['season'] as String?,
      );

  static PaymentPlansStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentPlansStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sellingFeaturesList':
            _sellingFeaturesList?.map((e) => e.toMap()).toList(),
        'description': _description,
        'months': _months,
        'total': _total,
        'monthly_installment': _monthlyInstallment,
        'objectId': _objectId,
        'season': _season,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sellingFeaturesList': serializeParam(
          _sellingFeaturesList,
          ParamType.DataStruct,
          isList: true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'months': serializeParam(
          _months,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'monthly_installment': serializeParam(
          _monthlyInstallment,
          ParamType.double,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'season': serializeParam(
          _season,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentPlansStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentPlansStruct(
        sellingFeaturesList: deserializeStructParam<FeatureStruct>(
          data['sellingFeaturesList'],
          ParamType.DataStruct,
          true,
          structBuilder: FeatureStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        months: deserializeParam(
          data['months'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        monthlyInstallment: deserializeParam(
          data['monthly_installment'],
          ParamType.double,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        season: deserializeParam(
          data['season'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentPlansStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PaymentPlansStruct &&
        listEquality.equals(sellingFeaturesList, other.sellingFeaturesList) &&
        description == other.description &&
        months == other.months &&
        total == other.total &&
        monthlyInstallment == other.monthlyInstallment &&
        objectId == other.objectId &&
        season == other.season;
  }

  @override
  int get hashCode => const ListEquality().hash([
        sellingFeaturesList,
        description,
        months,
        total,
        monthlyInstallment,
        objectId,
        season
      ]);
}

PaymentPlansStruct createPaymentPlansStruct({
  String? description,
  int? months,
  double? total,
  double? monthlyInstallment,
  String? objectId,
  String? season,
}) =>
    PaymentPlansStruct(
      description: description,
      months: months,
      total: total,
      monthlyInstallment: monthlyInstallment,
      objectId: objectId,
      season: season,
    );
