// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExtraFieldsStruct extends BaseStruct {
  ExtraFieldsStruct({
    /// Textfield, number, etc etc
    String? type,
    String? fieldTitle,
    String? responseValue,
  })  : _type = type,
        _fieldTitle = fieldTitle,
        _responseValue = responseValue;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "fieldTitle" field.
  String? _fieldTitle;
  String get fieldTitle => _fieldTitle ?? '';
  set fieldTitle(String? val) => _fieldTitle = val;

  bool hasFieldTitle() => _fieldTitle != null;

  // "responseValue" field.
  String? _responseValue;
  String get responseValue => _responseValue ?? '';
  set responseValue(String? val) => _responseValue = val;

  bool hasResponseValue() => _responseValue != null;

  static ExtraFieldsStruct fromMap(Map<String, dynamic> data) =>
      ExtraFieldsStruct(
        type: data['type'] as String?,
        fieldTitle: data['fieldTitle'] as String?,
        responseValue: data['responseValue'] as String?,
      );

  static ExtraFieldsStruct? maybeFromMap(dynamic data) => data is Map
      ? ExtraFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'fieldTitle': _fieldTitle,
        'responseValue': _responseValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'fieldTitle': serializeParam(
          _fieldTitle,
          ParamType.String,
        ),
        'responseValue': serializeParam(
          _responseValue,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExtraFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExtraFieldsStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        fieldTitle: deserializeParam(
          data['fieldTitle'],
          ParamType.String,
          false,
        ),
        responseValue: deserializeParam(
          data['responseValue'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExtraFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExtraFieldsStruct &&
        type == other.type &&
        fieldTitle == other.fieldTitle &&
        responseValue == other.responseValue;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, fieldTitle, responseValue]);
}

ExtraFieldsStruct createExtraFieldsStruct({
  String? type,
  String? fieldTitle,
  String? responseValue,
}) =>
    ExtraFieldsStruct(
      type: type,
      fieldTitle: fieldTitle,
      responseValue: responseValue,
    );
