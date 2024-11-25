class LoginRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);

  Map<String, dynamic> toBody() {
    return {
      'username': username,
      'password': password,
    };
  }
}
