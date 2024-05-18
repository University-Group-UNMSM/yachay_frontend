class User {
  final String email;
  final String pass;

  User(this.email, this.pass);

  bool verificarCredenciales(
      String emailToCheck, String passToCheck) {
    return email == emailToCheck && pass == passToCheck;
  }
}
