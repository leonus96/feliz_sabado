import 'package:flutter/widgets.dart';

enum LoadState { staging, loading, done }

class Loader<T> extends ChangeNotifier {
  final Future<T?> Function() _runner;

  LoadState _initialLoadState = LoadState.staging;
  bool _isLoading = false;
  T? _value;

  Loader(runner, {T? initialValue}) : _runner = runner {
    _value = initialValue;
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    if (_initialLoadState == LoadState.staging) {
      _initialLoadState = LoadState.loading;
      load();
    }
  }

  Future<void> load() async {
    _isLoading = true;
    _value = await _runner();
    _isLoading = false;
    _initialLoadState = LoadState.done;
    notifyListeners();
  }

  bool get hasLoaded => _initialLoadState == LoadState.done;

  bool get isLoading => _isLoading;

  T? get value => _value;
}
