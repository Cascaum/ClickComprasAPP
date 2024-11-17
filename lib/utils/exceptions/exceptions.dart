/// Classe de exceção para lidar com vários erros.
class TExceptions implements Exception {
  /// A mensagem de erro associada.
  final String message;

  /// Construtor padrão com uma mensagem de erro genérica.
  const TExceptions([this.message = 'Ocorreu um erro inesperado. Por favor, tente novamente.']);

  /// Cria uma exceção de autenticação a partir de um código de exceção de autenticação do Firebase.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('O endereço de e-mail já está registrado. Por favor, use um e-mail diferente.');
      case 'invalid-email':
        return const TExceptions('O endereço de e-mail fornecido é inválido. Por favor, insira um e-mail válido.');
      case 'weak-password':
        return const TExceptions('A senha é muito fraca. Por favor, escolha uma senha mais forte.');
      case 'user-disabled':
        return const TExceptions('Esta conta de usuário foi desativada. Por favor, entre em contato com o suporte para obter assistência.');
      case 'user-not-found':
        return const TExceptions('Detalhes de login inválidos. Usuário não encontrado.');
      case 'wrong-password':
        return const TExceptions('Senha incorreta. Por favor, verifique sua senha e tente novamente.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Credenciais de login inválidas. Por favor, verifique suas informações.');
      case 'too-many-requests':
        return const TExceptions('Muitas solicitações. Por favor, tente novamente mais tarde.');
      case 'invalid-argument':
        return const TExceptions('Argumento inválido fornecido para o método de autenticação.');
      case 'invalid-password':
        return const TExceptions('Senha incorreta. Por favor, tente novamente.');
      case 'invalid-phone-number':
        return const TExceptions('O número de telefone fornecido é inválido.');
      case 'operation-not-allowed':
        return const TExceptions('O provedor de login está desativado para seu projeto Firebase.');
      case 'session-cookie-expired':
        return const TExceptions('O cookie de sessão do Firebase expirou. Por favor, faça login novamente.');
      case 'uid-already-exists':
        return const TExceptions('O ID de usuário fornecido já está em uso por outro usuário.');
      case 'sign_in_failed':
        return const TExceptions('Falha ao fazer login. Por favor, tente novamente.');
      case 'network-request-failed':
        return const TExceptions('Falha na solicitação de rede. Por favor, verifique sua conexão com a internet.');
      case 'internal-error':
        return const TExceptions('Erro interno. Por favor, tente novamente mais tarde.');
      case 'invalid-verification-code':
        return const TExceptions('Código de verificação inválido. Por favor, insira um código válido.');
      case 'invalid-verification-id':
        return const TExceptions('ID de verificação inválido. Por favor, solicite um novo código de verificação.');
      case 'quota-exceeded':
        return const TExceptions('Cota excedida. Por favor, tente novamente mais tarde.');
      default:
        return const TExceptions();
    }
  }
}
