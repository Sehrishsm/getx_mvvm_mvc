

class AppException implements Exception{

  final _message ;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {

  InternetException([String? message]): super(message, 'no internet');

}

class RequestTimeOut extends AppException {

  RequestTimeOut([String? message]): super(message, 'request time out');

}

class ServerException extends AppException {

  ServerException([String? message]): super(message, 'internal server error');

}

class InvalidUrlException extends AppException {

  InvalidUrlException([String? message]): super(message, 'invalid url');

}


class FetchDataException extends AppException {

  FetchDataException([String? message]): super(message, '');

}