class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}

class LoginResponse {
  final String token;
  final String name;

  LoginResponse({required this.token, required this.name});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['data']['token'],
      name: json['data']['user']['name'],
    );
  }
}
