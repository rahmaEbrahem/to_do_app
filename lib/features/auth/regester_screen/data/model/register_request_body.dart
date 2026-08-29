class RegisterRequestBody {
  String name;
  String email;
  String password;
  String passwordconfirm;
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordconfirm,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordconfirm,
    };
  }
}
