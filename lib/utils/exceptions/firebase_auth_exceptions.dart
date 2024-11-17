/// Classe de exceção personalizada para lidar com vários erros relacionados à autenticação no Firebase.
class TFirebaseAuthException implements Exception {
  /// O código de erro associado à exceção.
  final String code;

  /// Construtor que recebe um código de erro.
  TFirebaseAuthException(this.code);

  /// Obtém a mensagem de erro correspondente com base no código de erro.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'O endereço de e-mail já está registrado. Por favor, use um e-mail diferente.';
      case 'invalid-email':
        return 'O endereço de e-mail fornecido é inválido. Por favor, insira um e-mail válido.';
      case 'weak-password':
        return 'A senha é muito fraca. Por favor, escolha uma senha mais forte.';
      case 'user-disabled':
        return 'Esta conta de usuário foi desativada. Por favor, entre em contato com o suporte para obter assistência.';
      case 'user-not-found':
        return 'Detalhes de login inválidos. Usuário não encontrado.';
      case 'wrong-password':
        return 'Senha incorreta. Por favor, verifique sua senha e tente novamente.';
      case 'invalid-verification-code':
        return 'Código de verificação inválido. Por favor, insira um código válido.';
      case 'invalid-verification-id':
        return 'ID de verificação inválido. Por favor, solicite um novo código de verificação.';
      case 'quota-exceeded':
        return 'Cota excedida. Por favor, tente novamente mais tarde.';
      case 'email-already-exists':
        return 'O endereço de e-mail já existe. Por favor, use um e-mail diferente.';
      case 'provider-already-linked':
        return 'A conta já está vinculada a outro provedor.';
      case 'requires-recent-login':
        return 'Esta operação é sensível e requer autenticação recente. Por favor, faça login novamente.';
      case 'credential-already-in-use':
        return 'Essa credencial já está associada a outra conta de usuário.';
      case 'user-mismatch':
        return 'As credenciais fornecidas não correspondem ao usuário anteriormente autenticado.';
      case 'account-exists-with-different-credential':
        return 'Já existe uma conta com o mesmo e-mail, mas com credenciais de login diferentes.';
      case 'operation-not-allowed':
        return 'Esta operação não é permitida. Entre em contato com o suporte para obter assistência.';
      case 'expired-action-code':
        return 'O código de ação expirou. Por favor, solicite um novo código de ação.';
      case 'invalid-action-code':
        return 'O código de ação é inválido. Por favor, verifique o código e tente novamente.';
      case 'missing-action-code':
        return 'O código de ação está ausente. Por favor, forneça um código de ação válido.';
      case 'user-token-expired':
        return 'O token do usuário expirou e a autenticação é necessária. Por favor, faça login novamente.';
      case 'user-not-found':
        return 'Nenhum usuário encontrado para o e-mail ou UID fornecido.';
      case 'invalid-credential':
        return 'A credencial fornecida está malformada ou expirou.';
      case 'wrong-password':
        return 'A senha é inválida. Por favor, verifique sua senha e tente novamente.';
      case 'user-token-revoked':
        return 'O token do usuário foi revogado. Por favor, faça login novamente.';
      case 'invalid-message-payload':
        return 'O conteúdo da mensagem de verificação do modelo de e-mail é inválido.';
      case 'invalid-sender':
        return 'O remetente do modelo de e-mail é inválido. Por favor, verifique o e-mail do remetente.';
      case 'invalid-recipient-email':
        return 'O endereço de e-mail do destinatário é inválido. Por favor, forneça um e-mail de destinatário válido.';
      case 'missing-iframe-start':
        return 'O modelo de e-mail está sem a tag inicial do iframe.';
      case 'missing-iframe-end':
        return 'O modelo de e-mail está sem a tag final do iframe.';
      case 'missing-iframe-src':
        return 'O modelo de e-mail está sem o atributo src do iframe.';
      case 'auth-domain-config-required':
        return 'A configuração authDomain é necessária para o link de verificação do código de ação.';
      case 'missing-app-credential':
        return 'As credenciais do aplicativo estão ausentes. Por favor, forneça credenciais de aplicativo válidas.';
      case 'invalid-app-credential':
        return 'As credenciais do aplicativo são inválidas. Por favor, forneça credenciais válidas.';
      case 'session-cookie-expired':
        return 'O cookie de sessão do Firebase expirou. Por favor, faça login novamente.';
      case 'uid-already-exists':
        return 'O ID de usuário fornecido já está em uso por outro usuário.';
      case 'invalid-cordova-configuration':
        return 'A configuração fornecida para o Cordova é inválida.';
      case 'app-deleted':
        return 'Esta instância do FirebaseApp foi deletada.';
      case 'user-disabled':
        return 'A conta de usuário foi desativada.';
      case 'user-token-mismatch':
        return 'O token fornecido do usuário não corresponde ao ID de usuário autenticado.';
      case 'web-storage-unsupported':
        return 'O armazenamento web não é suportado ou está desativado.';
      case 'invalid-credential':
        return 'A credencial fornecida é inválida. Por favor, verifique a credencial e tente novamente.';
      case 'app-not-authorized':
        return 'O aplicativo não está autorizado a usar a Autenticação Firebase com a chave de API fornecida.';
      case 'keychain-error':
        return 'Ocorreu um erro no keychain. Por favor, verifique o keychain e tente novamente.';
      case 'internal-error':
        return 'Ocorreu um erro interno de autenticação. Por favor, tente novamente mais tarde.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Credenciais de login inválidas.';
      default:
        return 'Ocorreu um erro de autenticação inesperado. Por favor, tente novamente.';
    }
  }
}