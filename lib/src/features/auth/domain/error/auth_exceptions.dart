final class InvalidCredentialsException implements Exception {
  const InvalidCredentialsException();

  @override
  String toString() => 'Invalid username or password';
}
