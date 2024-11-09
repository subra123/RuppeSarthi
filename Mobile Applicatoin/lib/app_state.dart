import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _allExpenses = prefs
              .getStringList('ff_allExpenses')
              ?.map((x) {
                try {
                  return ExpenseStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _allExpenses;
    });
    _safeInit(() {
      _ChatMsg = prefs
              .getStringList('ff_ChatMsg')
              ?.map((x) {
                try {
                  return BotChatsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ChatMsg;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _month = 0;
  int get month => _month;
  set month(int value) {
    _month = value;
  }

  int _year = 0;
  int get year => _year;
  set year(int value) {
    _year = value;
  }

  List<int> _queryTimestamps = [];
  List<int> get queryTimestamps => _queryTimestamps;
  set queryTimestamps(List<int> value) {
    _queryTimestamps = value;
  }

  void addToQueryTimestamps(int value) {
    queryTimestamps.add(value);
  }

  void removeFromQueryTimestamps(int value) {
    queryTimestamps.remove(value);
  }

  void removeAtIndexFromQueryTimestamps(int index) {
    queryTimestamps.removeAt(index);
  }

  void updateQueryTimestampsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    queryTimestamps[index] = updateFn(_queryTimestamps[index]);
  }

  void insertAtIndexInQueryTimestamps(int index, int value) {
    queryTimestamps.insert(index, value);
  }

  List<ExpenseStruct> _allExpenses = [];
  List<ExpenseStruct> get allExpenses => _allExpenses;
  set allExpenses(List<ExpenseStruct> value) {
    _allExpenses = value;
    prefs.setStringList(
        'ff_allExpenses', value.map((x) => x.serialize()).toList());
  }

  void addToAllExpenses(ExpenseStruct value) {
    allExpenses.add(value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void removeFromAllExpenses(ExpenseStruct value) {
    allExpenses.remove(value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAllExpenses(int index) {
    allExpenses.removeAt(index);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void updateAllExpensesAtIndex(
    int index,
    ExpenseStruct Function(ExpenseStruct) updateFn,
  ) {
    allExpenses[index] = updateFn(_allExpenses[index]);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAllExpenses(int index, ExpenseStruct value) {
    allExpenses.insert(index, value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  List<BotChatsStruct> _ChatMsg = [];
  List<BotChatsStruct> get ChatMsg => _ChatMsg;
  set ChatMsg(List<BotChatsStruct> value) {
    _ChatMsg = value;
    prefs.setStringList('ff_ChatMsg', value.map((x) => x.serialize()).toList());
  }

  void addToChatMsg(BotChatsStruct value) {
    ChatMsg.add(value);
    prefs.setStringList(
        'ff_ChatMsg', _ChatMsg.map((x) => x.serialize()).toList());
  }

  void removeFromChatMsg(BotChatsStruct value) {
    ChatMsg.remove(value);
    prefs.setStringList(
        'ff_ChatMsg', _ChatMsg.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChatMsg(int index) {
    ChatMsg.removeAt(index);
    prefs.setStringList(
        'ff_ChatMsg', _ChatMsg.map((x) => x.serialize()).toList());
  }

  void updateChatMsgAtIndex(
    int index,
    BotChatsStruct Function(BotChatsStruct) updateFn,
  ) {
    ChatMsg[index] = updateFn(_ChatMsg[index]);
    prefs.setStringList(
        'ff_ChatMsg', _ChatMsg.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChatMsg(int index, BotChatsStruct value) {
    ChatMsg.insert(index, value);
    prefs.setStringList(
        'ff_ChatMsg', _ChatMsg.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
