import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/restaurant.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._preferences);

  final SharedPreferencesAsync _preferences;
  bool _isDark = false;
  bool get isDark => _isDark;

  Future<void> load() async {
    _isDark = await _preferences.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    await _preferences.setBool('isDarkTheme', _isDark);
    notifyListeners();
  }
}

class CartEntry {
  CartEntry(this.item, {this.quantity = 1});
  final MenuItem item;
  int quantity;
  double get total => item.price * quantity;
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartEntry> _items = {};
  List<CartEntry> get items => _items.values.toList();
  int get itemCount => _items.values.fold(0, (sum, entry) => sum + entry.quantity);
  double get subtotal => _items.values.fold(0, (sum, entry) => sum + entry.total);

  void add(MenuItem item) {
    if (_items.containsKey(item.id)) {
      _items[item.id]!.quantity++;
    } else {
      _items[item.id] = CartEntry(item);
    }
    notifyListeners();
  }

  void decrease(String id) {
    final entry = _items[id];
    if (entry == null) return;
    if (entry.quantity > 1) {
      entry.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _ids = {};
  bool isFavorite(String id) => _ids.contains(id);

  void toggle(String id) {
    if (!_ids.add(id)) _ids.remove(id);
    notifyListeners();
  }
}
