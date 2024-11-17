class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'Ocorreu um erro desconhecido no Firebase. Por favor, tente novamente.';
      case 'invalid-custom-token':
        return 'O formato do token personalizado está incorreto. Verifique seu token personalizado.';
      case 'custom-token-mismatch':
        return 'O token personalizado corresponde a um público diferente.';
      case 'user-disabled':
        return 'A conta de usuário foi desativada.';
      case 'user-not-found':
        return 'Nenhum usuário encontrado para o e-mail ou UID fornecido.';
      case 'invalid-email':
        return 'O endereço de e-mail fornecido é inválido. Por favor, insira um e-mail válido.';
      case 'email-already-in-use':
        return 'O endereço de e-mail já está registrado. Por favor, use um e-mail diferente.';
      case 'wrong-password':
        return 'Senha incorreta. Por favor, verifique sua senha e tente novamente.';
      case 'weak-password':
        return 'A senha é muito fraca. Por favor, escolha uma senha mais forte.';
      case 'operation-not-allowed':
        return 'Essa operação não é permitida. Entre em contato com o suporte.';
      case 'requires-recent-login':
        return 'Esta operação requer uma autenticação recente. Por favor, faça login novamente.';
      case 'too-many-requests':
        return 'Muitas solicitações. Por favor, tente novamente mais tarde.';
      case 'network-request-failed':
        return 'Erro de rede. Verifique sua conexão com a internet e tente novamente.';
      case 'invalid-verification-code':
        return 'O código de verificação fornecido é inválido.';
      case 'invalid-verification-id':
        return 'O ID de verificação fornecido é inválido.';
      case 'session-expired':
        return 'Sua sessão expirou. Por favor, faça login novamente.';
      case 'quota-exceeded':
        return 'Cota excedida. Por favor, tente novamente mais tarde ou entre em contato com o suporte.';
      case 'app-not-authorized':
        return 'Este aplicativo não está autorizado a usar a autenticação do Firebase. Verifique sua configuração.';
      case 'credential-already-in-use':
        return 'Essas credenciais já estão associadas a outra conta de usuário.';
      case 'invalid-api-key':
        return 'A chave de API é inválida. Verifique sua chave de API do Firebase.';
      case 'expired-action-code':
        return 'O código de ação expirou. Por favor, solicite um novo.';
      case 'invalid-action-code':
        return 'O código de ação é inválido. Verifique e tente novamente.';
      case 'missing-android-pkg-name':
        return 'Um nome de pacote Android deve ser fornecido para esta operação.';
      case 'missing-continue-uri':
        return 'Uma URI de continuação deve ser fornecida para esta operação.';
      case 'missing-ios-bundle-id':
        return 'Um ID de pacote iOS deve ser fornecido para esta operação.';
      case 'unauthorized-domain':
        return 'Este domínio não está autorizado para operações de OAuth.';
      case 'invalid-continue-uri':
        return 'A URI de continuação fornecida é inválida.';
      case 'invalid-dynamic-link-domain':
        return 'O domínio de link dinâmico é inválido. Verifique sua configuração de links dinâmicos do Firebase.';
      case 'user-token-expired':
        return 'As credenciais do usuário não são mais válidas. Por favor, faça login novamente.';
      case 'web-context-cancelled':
        return 'A operação web foi cancelada pelo usuário.';
      case 'web-storage-unsupported':
        return 'Este navegador não é suportado ou cookies de terceiros e dados podem estar desativados.';
      case 'invalid-credential':
        return 'Os dados de credenciais fornecidos estão malformados ou expiraram.';
      case 'internal-error':
        return 'Ocorreu um erro interno. Por favor, tente novamente mais tarde.';
      default:
        return 'Ocorreu um erro desconhecido no Firebase. Por favor, tente novamente.';
    }
  }
}
