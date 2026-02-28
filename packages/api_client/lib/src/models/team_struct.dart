// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

/// Single team in BL
class TeamStruct extends BaseStruct {
  TeamStruct({
    String? category,
    String? name,
    String? securityPolicy,
    String? objectId,
    String? coaches,
    int? sortOrder,
    bool? youthSystem,
    List<PaymentPlansStruct>? paymentPlans,
  })  : _category = category,
        _name = name,
        _securityPolicy = securityPolicy,
        _objectId = objectId,
        _coaches = coaches,
        _sortOrder = sortOrder,
        _youthSystem = youthSystem,
        _paymentPlans = paymentPlans;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "securityPolicy" field.
  String? _securityPolicy;
  String get securityPolicy => _securityPolicy ?? '';
  set securityPolicy(String? val) => _securityPolicy = val;

  bool hasSecurityPolicy() => _securityPolicy != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "coaches" field.
  String? _coaches;
  String get coaches => _coaches ?? '';
  set coaches(String? val) => _coaches = val;

  bool hasCoaches() => _coaches != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 10;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "youthSystem" field.
  bool? _youthSystem;
  bool get youthSystem => _youthSystem ?? true;
  set youthSystem(bool? val) => _youthSystem = val;

  bool hasYouthSystem() => _youthSystem != null;

  // "paymentPlans" field.
  List<PaymentPlansStruct>? _paymentPlans;
  List<PaymentPlansStruct> get paymentPlans => _paymentPlans ?? const [];
  set paymentPlans(List<PaymentPlansStruct>? val) => _paymentPlans = val;

  void updatePaymentPlans(Function(List<PaymentPlansStruct>) updateFn) {
    updateFn(_paymentPlans ??= []);
  }

  bool hasPaymentPlans() => _paymentPlans != null;

  static TeamStruct fromMap(Map<String, dynamic> data) => TeamStruct(
        category: data['category'] as String?,
        name: data['name'] as String?,
        securityPolicy: data['securityPolicy'] as String?,
        objectId: data['objectId'] as String?,
        coaches: data['coaches'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
        youthSystem: data['youthSystem'] as bool?,
        paymentPlans: getStructList(
          data['paymentPlans'],
          PaymentPlansStruct.fromMap,
        ),
      );

  static TeamStruct? maybeFromMap(dynamic data) =>
      data is Map ? TeamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'name': _name,
        'securityPolicy': _securityPolicy,
        'objectId': _objectId,
        'coaches': _coaches,
        'sortOrder': _sortOrder,
        'youthSystem': _youthSystem,
        'paymentPlans': _paymentPlans?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'securityPolicy': serializeParam(
          _securityPolicy,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'coaches': serializeParam(
          _coaches,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'youthSystem': serializeParam(
          _youthSystem,
          ParamType.bool,
        ),
        'paymentPlans': serializeParam(
          _paymentPlans,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TeamStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        securityPolicy: deserializeParam(
          data['securityPolicy'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        coaches: deserializeParam(
          data['coaches'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        youthSystem: deserializeParam(
          data['youthSystem'],
          ParamType.bool,
          false,
        ),
        paymentPlans: deserializeStructParam<PaymentPlansStruct>(
          data['paymentPlans'],
          ParamType.DataStruct,
          true,
          structBuilder: PaymentPlansStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TeamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TeamStruct &&
        category == other.category &&
        name == other.name &&
        securityPolicy == other.securityPolicy &&
        objectId == other.objectId &&
        coaches == other.coaches &&
        sortOrder == other.sortOrder &&
        youthSystem == other.youthSystem &&
        listEquality.equals(paymentPlans, other.paymentPlans);
  }

  @override
  int get hashCode => const ListEquality().hash([
        category,
        name,
        securityPolicy,
        objectId,
        coaches,
        sortOrder,
        youthSystem,
        paymentPlans
      ]);
}

TeamStruct createTeamStruct({
  String? category,
  String? name,
  String? securityPolicy,
  String? objectId,
  String? coaches,
  int? sortOrder,
  bool? youthSystem,
}) =>
    TeamStruct(
      category: category,
      name: name,
      securityPolicy: securityPolicy,
      objectId: objectId,
      coaches: coaches,
      sortOrder: sortOrder,
      youthSystem: youthSystem,
    );
