import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/shared/data/local/shared_prefs_storage_service.dart';

final storageServiceProvider = Provider((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
