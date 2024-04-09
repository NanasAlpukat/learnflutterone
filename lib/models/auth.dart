class Auth {
  String? email;
  String? password;

  Auth({this.email, this.password});

  factory Auth.formLogin(Map<String, dynamic> data) {
    return Auth(
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }
}
