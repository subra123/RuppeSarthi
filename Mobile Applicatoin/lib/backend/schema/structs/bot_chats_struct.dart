// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotChatsStruct extends BaseStruct {
  BotChatsStruct({
    DateTime? createdTime,
    String? createdBy,
    String? message,
  })  : _createdTime = createdTime,
        _createdBy = createdBy,
        _message = message;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static BotChatsStruct fromMap(Map<String, dynamic> data) => BotChatsStruct(
        createdTime: data['created_time'] as DateTime?,
        createdBy: data['created_by'] as String?,
        message: data['message'] as String?,
      );

  static BotChatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? BotChatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'created_by': _createdBy,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static BotChatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BotChatsStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BotChatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BotChatsStruct &&
        createdTime == other.createdTime &&
        createdBy == other.createdBy &&
        message == other.message;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([createdTime, createdBy, message]);
}

BotChatsStruct createBotChatsStruct({
  DateTime? createdTime,
  String? createdBy,
  String? message,
}) =>
    BotChatsStruct(
      createdTime: createdTime,
      createdBy: createdBy,
      message: message,
    );
