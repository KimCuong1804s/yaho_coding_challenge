class ErrorGettingListUsers implements Exception {
  ErrorGettingListUsers(String error);
}

class ErrorEmptyResponse implements Exception {
  ErrorEmptyResponse(String error);
}

class ErrorNoNetworking implements Exception {
  ErrorNoNetworking(String error);
}

class NoMoreData implements Exception {}
