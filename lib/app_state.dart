import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _newOrder = (await secureStorage.getStringList('ff_newOrder'))
              ?.map((x) {
                try {
                  return OrderItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _newOrder;
    });
    await _safeInitAsync(() async {
      _playingCommentary =
          await secureStorage.getBool('ff_playingCommentary') ??
              _playingCommentary;
    });
    await _safeInitAsync(() async {
      _currentUserObjectId =
          await secureStorage.getString('ff_currentUserObjectId') ??
              _currentUserObjectId;
    });
    await _safeInitAsync(() async {
      _userToken = await secureStorage.getString('ff_userToken') ?? _userToken;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_currentUser') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_currentUser') ?? '{}';
          _currentUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((x) {
                try {
                  return CartLinesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
    await _safeInitAsync(() async {
      _savedShippingDetails =
          (await secureStorage.getStringList('ff_savedShippingDetails'))
                  ?.map((x) {
                    try {
                      return ShippingDetailsStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _savedShippingDetails;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_checkout') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_checkout') ?? '{}';
          _checkout =
              CheckoutStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _bottomPaddingHeight =
          await secureStorage.getDouble('ff_bottomPaddingHeight') ??
              _bottomPaddingHeight;
    });
    await _safeInitAsync(() async {
      _campaignObjectIds =
          await secureStorage.getStringList('ff_campaignObjectIds') ??
              _campaignObjectIds;
    });
    await _safeInitAsync(() async {
      _currentPlayerIndex =
          await secureStorage.getInt('ff_currentPlayerIndex') ??
              _currentPlayerIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<OrderItemsStruct> _newOrder = [];
  List<OrderItemsStruct> get newOrder => _newOrder;
  set newOrder(List<OrderItemsStruct> value) {
    _newOrder = value;
    secureStorage.setStringList(
        'ff_newOrder', value.map((x) => x.serialize()).toList());
  }

  void deleteNewOrder() {
    secureStorage.delete(key: 'ff_newOrder');
  }

  void addToNewOrder(OrderItemsStruct value) {
    newOrder.add(value);
    secureStorage.setStringList(
        'ff_newOrder', _newOrder.map((x) => x.serialize()).toList());
  }

  void removeFromNewOrder(OrderItemsStruct value) {
    newOrder.remove(value);
    secureStorage.setStringList(
        'ff_newOrder', _newOrder.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNewOrder(int index) {
    newOrder.removeAt(index);
    secureStorage.setStringList(
        'ff_newOrder', _newOrder.map((x) => x.serialize()).toList());
  }

  void updateNewOrderAtIndex(
    int index,
    OrderItemsStruct Function(OrderItemsStruct) updateFn,
  ) {
    newOrder[index] = updateFn(_newOrder[index]);
    secureStorage.setStringList(
        'ff_newOrder', _newOrder.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNewOrder(int index, OrderItemsStruct value) {
    newOrder.insert(index, value);
    secureStorage.setStringList(
        'ff_newOrder', _newOrder.map((x) => x.serialize()).toList());
  }

  bool _playingCommentary = false;
  bool get playingCommentary => _playingCommentary;
  set playingCommentary(bool value) {
    _playingCommentary = value;
    secureStorage.setBool('ff_playingCommentary', value);
  }

  void deletePlayingCommentary() {
    secureStorage.delete(key: 'ff_playingCommentary');
  }

  String _currentMatchObjectId = '';
  String get currentMatchObjectId => _currentMatchObjectId;
  set currentMatchObjectId(String value) {
    _currentMatchObjectId = value;
  }

  int _pageViewIndex = 0;
  int get pageViewIndex => _pageViewIndex;
  set pageViewIndex(int value) {
    _pageViewIndex = value;
  }

  /// Identifies the current user of the app with the backend server
  String _currentUserObjectId = '';
  String get currentUserObjectId => _currentUserObjectId;
  set currentUserObjectId(String value) {
    _currentUserObjectId = value;
    secureStorage.setString('ff_currentUserObjectId', value);
  }

  void deleteCurrentUserObjectId() {
    secureStorage.delete(key: 'ff_currentUserObjectId');
  }

  /// Should reset to 0 if error
  int _activeTabBarIndex = 0;
  int get activeTabBarIndex => _activeTabBarIndex;
  set activeTabBarIndex(int value) {
    _activeTabBarIndex = value;
  }

  /// Mandatory field - identifies a user with the server
  String _userToken = '';
  String get userToken => _userToken;
  set userToken(String value) {
    _userToken = value;
    secureStorage.setString('ff_userToken', value);
  }

  void deleteUserToken() {
    secureStorage.delete(key: 'ff_userToken');
  }

  UserStruct _currentUser = UserStruct();
  UserStruct get currentUser => _currentUser;
  set currentUser(UserStruct value) {
    _currentUser = value;
    secureStorage.setString('ff_currentUser', value.serialize());
  }

  void deleteCurrentUser() {
    secureStorage.delete(key: 'ff_currentUser');
  }

  void updateCurrentUserStruct(Function(UserStruct) updateFn) {
    updateFn(_currentUser);
    secureStorage.setString('ff_currentUser', _currentUser.serialize());
  }

  List<CartLinesStruct> _cart = [];
  List<CartLinesStruct> get cart => _cart;
  set cart(List<CartLinesStruct> value) {
    _cart = value;
    secureStorage.setStringList(
        'ff_cart', value.map((x) => x.serialize()).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(CartLinesStruct value) {
    cart.add(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartLinesStruct value) {
    cart.remove(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    CartLinesStruct Function(CartLinesStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, CartLinesStruct value) {
    cart.insert(index, value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  List<ShippingDetailsStruct> _savedShippingDetails = [];
  List<ShippingDetailsStruct> get savedShippingDetails => _savedShippingDetails;
  set savedShippingDetails(List<ShippingDetailsStruct> value) {
    _savedShippingDetails = value;
    secureStorage.setStringList(
        'ff_savedShippingDetails', value.map((x) => x.serialize()).toList());
  }

  void deleteSavedShippingDetails() {
    secureStorage.delete(key: 'ff_savedShippingDetails');
  }

  void addToSavedShippingDetails(ShippingDetailsStruct value) {
    savedShippingDetails.add(value);
    secureStorage.setStringList('ff_savedShippingDetails',
        _savedShippingDetails.map((x) => x.serialize()).toList());
  }

  void removeFromSavedShippingDetails(ShippingDetailsStruct value) {
    savedShippingDetails.remove(value);
    secureStorage.setStringList('ff_savedShippingDetails',
        _savedShippingDetails.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSavedShippingDetails(int index) {
    savedShippingDetails.removeAt(index);
    secureStorage.setStringList('ff_savedShippingDetails',
        _savedShippingDetails.map((x) => x.serialize()).toList());
  }

  void updateSavedShippingDetailsAtIndex(
    int index,
    ShippingDetailsStruct Function(ShippingDetailsStruct) updateFn,
  ) {
    savedShippingDetails[index] = updateFn(_savedShippingDetails[index]);
    secureStorage.setStringList('ff_savedShippingDetails',
        _savedShippingDetails.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSavedShippingDetails(
      int index, ShippingDetailsStruct value) {
    savedShippingDetails.insert(index, value);
    secureStorage.setStringList('ff_savedShippingDetails',
        _savedShippingDetails.map((x) => x.serialize()).toList());
  }

  /// Contains everything apart from the cart items - these are stored
  /// separately
  CheckoutStruct _checkout = CheckoutStruct();
  CheckoutStruct get checkout => _checkout;
  set checkout(CheckoutStruct value) {
    _checkout = value;
    secureStorage.setString('ff_checkout', value.serialize());
  }

  void deleteCheckout() {
    secureStorage.delete(key: 'ff_checkout');
  }

  void updateCheckoutStruct(Function(CheckoutStruct) updateFn) {
    updateFn(_checkout);
    secureStorage.setString('ff_checkout', _checkout.serialize());
  }

  double _bottomPaddingHeight = 0.0;
  double get bottomPaddingHeight => _bottomPaddingHeight;
  set bottomPaddingHeight(double value) {
    _bottomPaddingHeight = value;
    secureStorage.setDouble('ff_bottomPaddingHeight', value);
  }

  void deleteBottomPaddingHeight() {
    secureStorage.delete(key: 'ff_bottomPaddingHeight');
  }

  List<LineupBuilderPlayersStruct> _selectedPlayersLineupBuilder = [];
  List<LineupBuilderPlayersStruct> get selectedPlayersLineupBuilder =>
      _selectedPlayersLineupBuilder;
  set selectedPlayersLineupBuilder(List<LineupBuilderPlayersStruct> value) {
    _selectedPlayersLineupBuilder = value;
  }

  void addToSelectedPlayersLineupBuilder(LineupBuilderPlayersStruct value) {
    selectedPlayersLineupBuilder.add(value);
  }

  void removeFromSelectedPlayersLineupBuilder(
      LineupBuilderPlayersStruct value) {
    selectedPlayersLineupBuilder.remove(value);
  }

  void removeAtIndexFromSelectedPlayersLineupBuilder(int index) {
    selectedPlayersLineupBuilder.removeAt(index);
  }

  void updateSelectedPlayersLineupBuilderAtIndex(
    int index,
    LineupBuilderPlayersStruct Function(LineupBuilderPlayersStruct) updateFn,
  ) {
    selectedPlayersLineupBuilder[index] =
        updateFn(_selectedPlayersLineupBuilder[index]);
  }

  void insertAtIndexInSelectedPlayersLineupBuilder(
      int index, LineupBuilderPlayersStruct value) {
    selectedPlayersLineupBuilder.insert(index, value);
  }

  List<PlayerStruct> _playersForLineupsBuilder = [];
  List<PlayerStruct> get playersForLineupsBuilder => _playersForLineupsBuilder;
  set playersForLineupsBuilder(List<PlayerStruct> value) {
    _playersForLineupsBuilder = value;
  }

  void addToPlayersForLineupsBuilder(PlayerStruct value) {
    playersForLineupsBuilder.add(value);
  }

  void removeFromPlayersForLineupsBuilder(PlayerStruct value) {
    playersForLineupsBuilder.remove(value);
  }

  void removeAtIndexFromPlayersForLineupsBuilder(int index) {
    playersForLineupsBuilder.removeAt(index);
  }

  void updatePlayersForLineupsBuilderAtIndex(
    int index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    playersForLineupsBuilder[index] =
        updateFn(_playersForLineupsBuilder[index]);
  }

  void insertAtIndexInPlayersForLineupsBuilder(int index, PlayerStruct value) {
    playersForLineupsBuilder.insert(index, value);
  }

  bool _seenAds = false;
  bool get seenAds => _seenAds;
  set seenAds(bool value) {
    _seenAds = value;
  }

  /// Contains a list of the active campaigns that the user has already seen
  List<String> _campaignObjectIds = [];
  List<String> get campaignObjectIds => _campaignObjectIds;
  set campaignObjectIds(List<String> value) {
    _campaignObjectIds = value;
    secureStorage.setStringList('ff_campaignObjectIds', value);
  }

  void deleteCampaignObjectIds() {
    secureStorage.delete(key: 'ff_campaignObjectIds');
  }

  void addToCampaignObjectIds(String value) {
    campaignObjectIds.add(value);
    secureStorage.setStringList('ff_campaignObjectIds', _campaignObjectIds);
  }

  void removeFromCampaignObjectIds(String value) {
    campaignObjectIds.remove(value);
    secureStorage.setStringList('ff_campaignObjectIds', _campaignObjectIds);
  }

  void removeAtIndexFromCampaignObjectIds(int index) {
    campaignObjectIds.removeAt(index);
    secureStorage.setStringList('ff_campaignObjectIds', _campaignObjectIds);
  }

  void updateCampaignObjectIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    campaignObjectIds[index] = updateFn(_campaignObjectIds[index]);
    secureStorage.setStringList('ff_campaignObjectIds', _campaignObjectIds);
  }

  void insertAtIndexInCampaignObjectIds(int index, String value) {
    campaignObjectIds.insert(index, value);
    secureStorage.setStringList('ff_campaignObjectIds', _campaignObjectIds);
  }

  int _currentPlayerIndex = 0;
  int get currentPlayerIndex => _currentPlayerIndex;
  set currentPlayerIndex(int value) {
    _currentPlayerIndex = value;
    secureStorage.setInt('ff_currentPlayerIndex', value);
  }

  void deleteCurrentPlayerIndex() {
    secureStorage.delete(key: 'ff_currentPlayerIndex');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
