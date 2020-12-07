class AuthException implements Exception {
  final String key;
  static const Map<String, String> erros = {
    'EMAIL_EXISTS': 'E-mail já existe!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Tente mais tarde!',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado!',
    'INVALID_PASSWORD': 'Senha inválida!',
    'USER_DISABLED': 'Usuário desativado!',
  };

  const AuthException(this.key);
  @override
  String toString() {
    if (erros.containsKey(key)) {
      return erros[key];
    } else {
      return 'Ocorreu um erro na atutenticação';
    }
  }
}
