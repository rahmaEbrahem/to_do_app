class ApiExeption implements Exception {
  final int statuscode;
  final String message;
  ApiExeption({required this.statuscode, required this.message});

  @override
  String toString() => "Api Exeption:$statuscode - $message";
}

class ErrorHandling {
  static String handle(Exception error) {
    if (error is ApiExeption) {
      switch (error.statuscode) {
        case 400:
          return "Bad requested: ${error.message}";
        case 401:
          return "unauthorized: please login";
        case 404:
          return "not found";
        case 500:
          return "server error";
        default:
          return "Api Error :${error.message}";
      }
    }
    return "UnExpected Error";
  }
}
