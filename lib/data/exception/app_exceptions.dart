class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, "You Don't Have Access This");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
      : super(message, "Request Time Out");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication ");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "invalid Request");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "invalid Input ");
}
