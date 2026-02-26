import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ---------------------------------------------------------------------------
// Storage keys — MUST NOT change (existing persisted user data)
// ---------------------------------------------------------------------------

const _kCartKey = 'ff_cart';
const _kCheckoutKey = 'ff_checkout';

// ---------------------------------------------------------------------------
// Cart — CartNotifier
// ---------------------------------------------------------------------------

/// Manages the list of items currently in the shopping bag.
///
/// Persists to FlutterSecureStorage with key [_kCartKey] (preserving the
/// original key so existing user data survives the migration).
class CartNotifier extends StateNotifier<List<CartLinesStruct>> {
  CartNotifier() : super([]) {
    _load();
  }

  static const _storage = FlutterSecureStorage();

  Future<void> _load() async {
    try {
      final raw = await _storage.read(key: _kCartKey);
      if (raw != null && raw.isNotEmpty) {
        final list = jsonDecode(raw) as List;
        state = list
            .map((e) => CartLinesStruct.fromSerializableMap(
                Map<String, dynamic>.from(e as Map)))
            .toList();
      }
    } catch (_) {}
  }

  Future<void> _save() async {
    try {
      final json =
          jsonEncode(state.map((e) => e.toSerializableMap()).toList());
      await _storage.write(key: _kCartKey, value: json);
    } catch (_) {}
  }

  void addItem(CartLinesStruct item) {
    state = [...state, item];
    _save();
  }

  void removeAt(int index) {
    final next = [...state];
    next.removeAt(index);
    state = next;
    _save();
  }

  /// Updates the [qty] for the item at [index] and recalculates totals.
  void updateQtyAt(int index, int qty) {
    final next = List<CartLinesStruct>.from(state);
    final item = next[index];
    final unitPrice = item.qty > 0 ? item.itemTotal / item.qty : item.itemTotal;
    item.qty = qty;
    item.lineTotal = unitPrice * qty;
    state = List.unmodifiable(next);
    _save();
  }

  void clear() {
    state = [];
    _save();
  }

  /// Subtotal = sum of (itemTotal × qty) for all cart lines.
  double get subtotal {
    double total = 0;
    for (final item in state) {
      total += item.itemTotal * item.qty;
    }
    return total;
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, List<CartLinesStruct>>(
  (_) => CartNotifier(),
);

// ---------------------------------------------------------------------------
// Checkout — CheckoutNotifier
// ---------------------------------------------------------------------------

/// Manages the checkout data (billing, shipping, order total, etc.).
///
/// Persists to FlutterSecureStorage with key [_kCheckoutKey].
class CheckoutNotifier extends StateNotifier<CheckoutStruct> {
  CheckoutNotifier() : super(CheckoutStruct()) {
    _load();
  }

  static const _storage = FlutterSecureStorage();

  Future<void> _load() async {
    try {
      final raw = await _storage.read(key: _kCheckoutKey);
      if (raw != null && raw.isNotEmpty) {
        final map = jsonDecode(raw) as Map;
        state = CheckoutStruct.fromSerializableMap(
            Map<String, dynamic>.from(map));
      }
    } catch (_) {}
  }

  Future<void> _save() async {
    try {
      final json = jsonEncode(state.toSerializableMap());
      await _storage.write(key: _kCheckoutKey, value: json);
    } catch (_) {}
  }

  void update(CheckoutStruct Function(CheckoutStruct) updater) {
    state = updater(state);
    _save();
  }

  void reset() {
    state = CheckoutStruct();
    _save();
  }
}

final checkoutNotifierProvider =
    StateNotifierProvider<CheckoutNotifier, CheckoutStruct>(
  (_) => CheckoutNotifier(),
);

// ---------------------------------------------------------------------------
// Shop product (single item)
// ---------------------------------------------------------------------------

typedef _ShopItemArgs = ({
  String objectId,
  String projectId,
  String restApiKey
});

final shopItemProvider = FutureProvider.autoDispose
    .family<ShopItemStruct?, _ShopItemArgs>((ref, args) async {
  final r = await ShopGroup.getSingleShopItemCall.call(
    shopItemObjectId: args.objectId,
    bLappId: args.projectId,
    bLRestApiKey: args.restApiKey,
  );
  if (!r.succeeded) return null;
  return ShopItemStruct.maybeFromMap(r.jsonBody);
});

// ---------------------------------------------------------------------------
// Shop reviews
// ---------------------------------------------------------------------------

typedef _ReviewCountArgs = ({
  String objectId,
  String projectId,
  String restApiKey
});

final shopReviewCountProvider = FutureProvider.autoDispose
    .family<int, _ReviewCountArgs>((ref, args) async {
  final r = await ShopGroup.getNumberOfReviewsForASingleProductCall.call(
    shopItemObjectId: args.objectId,
    bLappId: args.projectId,
    bLRestApiKey: args.restApiKey,
  );
  if (!r.succeeded) return 0;
  final body = r.jsonBody;
  return body is int ? body : 0;
});

typedef _ReviewsArgs = ({
  String objectId,
  int offset,
  String projectId,
  String restApiKey
});

final shopReviewsProvider = FutureProvider.autoDispose
    .family<List<ShopReviewsStruct>, _ReviewsArgs>((ref, args) async {
  final r = await ShopGroup.getReviewsForAShopItemCall.call(
    shopItemObjectId: args.objectId,
    offset: args.offset,
    bLappId: args.projectId,
    bLRestApiKey: args.restApiKey,
  );
  if (!r.succeeded) return [];
  final raw = r.jsonBody;
  if (raw is! List) return [];
  return raw
      .map((e) => ShopReviewsStruct.maybeFromMap(e))
      .whereType<ShopReviewsStruct>()
      .toList();
});
