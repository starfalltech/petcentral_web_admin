class ServerException implements Exception {
  String msg;

  ServerException(this.msg);
}

class CacheException implements Exception {}
