import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../error/exception.dart';
import 'secure_storage_manager.dart';
import 'storage_constant.dart';

class AppStorage {
  final FlutterSecureStorage sharedPreferences;
  AppStorage({required this.sharedPreferences});

  Future<void> deleteData() {
    final local = SecureStorageData<AppModel>(
      StorageConstant.APP_CACHED,
      sharedPreferences,
      fromJson: AppModel.fromMap,
      toJson: (data) => data.toJson(),
    );
    return local.clearData();
  }

  Future<AppModel?> loadData() async {
    final local = SecureStorageData<AppModel>(
      StorageConstant.APP_CACHED,
      sharedPreferences,
      fromJson: AppModel.fromMap,
      toJson: (data) => data.toJson(),
    );

    try {
      return (await local.loadData())!;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveData(AppModel value) async {
    final local = SecureStorageData<AppModel>(
      StorageConstant.APP_CACHED,
      sharedPreferences,
      fromJson: AppModel.fromMap,
      toJson: (data) => data.toJson(),
    );

    try {
      await local.saveData(value);
    } catch (e) {
      throw CacheException();
    }
  }
}

class AppModel {
  final bool alreadySeeOnboarding;

  AppModel({required this.alreadySeeOnboarding});

  factory AppModel.fromMap(Map<String, dynamic> map) {
    return AppModel(
      alreadySeeOnboarding: map['alreadySeeOnboarding'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'alreadySeeOnboarding': alreadySeeOnboarding,
    };
  }
}
