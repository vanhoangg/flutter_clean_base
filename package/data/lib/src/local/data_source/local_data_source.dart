abstract class LocalDataSource {
  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    // expirationTime is 60 secs
    final int currentTimeInMillis =
        DateTime.now().millisecondsSinceEpoch; // time now is 1:00:00 pm

    final bool isCacheValid = currentTimeInMillis - expirationTime <
        cacheTime; // cache time was in 12:59:30
    // false if current time > 1:00:30
    // true if current time <1:00:30
    return isCacheValid;
  }
}
