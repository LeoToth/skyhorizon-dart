class Passageiro {
  String? nome;
  String? cpf;
  String? rg;
  String? email;
  String? celular;
}

class PlataformaVenda {
  int? codigoCanal;
  String? nomeCanal;
}

class Atendente {
  String? nome;
  String? matricula;
  String? cargo;
  String? email;
  String? celular;
  double? salario;
}

class Passagem {
  String? _codigoLocalizador = "";

  Passageiro? passageiro;
  PlataformaVenda? plataforma;
  Atendente? atendente;
  String? observacoes;

  Passagem() {}

  Passagem.somenteCodigo(String codigoLocalizador) {
    this._codigoLocalizador = codigoLocalizador;
  }

  Passagem.completa(
    String? codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente,
    String? observacoes,
  ) {
    this._codigoLocalizador = codigoLocalizador;
    this.passageiro = passageiro;
    this.plataforma = plataforma;
    this.atendente = atendente;
    this.observacoes = observacoes;
  }

  Passagem.codigoEPassageiro({String? codigoLocalizador, this.passageiro}) {
    this._codigoLocalizador = codigoLocalizador;
  }

  Passagem.all(
    String? codigoLocalizador, {
    required this.passageiro,
    required this.plataforma,
    required this.atendente,
  }) {
    this._codigoLocalizador = codigoLocalizador;
  }

  String? getCodigoLocalizador() {
    return this._codigoLocalizador;
  }

  void setCodigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    this._codigoLocalizador = codigoLocalizador;
  }

  String? get codigoLocalizador => _codigoLocalizador;

  set codigoLocalizador(String? codigoLocalizador) {
    if (codigoLocalizador == null || codigoLocalizador.isEmpty) {
      print("Código localizador de passagem inválido!");
      return;
    }
    this._codigoLocalizador = codigoLocalizador;
  }

  //métodos
  void EmitirPassagem() {
    print("Passagem emitida com sucesso!");
  }

  bool CancelarPassagem() {
    print("Passagem cancelada com sucesso!");
    return true;
  }

  void AtualizarPassagem() {
    print("Passagem atualizada com sucesso!");
  }

  Passagem ConsultarPassagem(String codigo) {
    print("Passagem consultada com sucesso");
    return Passagem();
  }
}

mixin Logger {
  void log(String mensagem) {
    print(mensagem);
  }
}

mixin Auditoria {
  void auditar(String mensagem) {
    print("[Auditoria]: $mensagem");
  }
}

class PassagemPrimeiraClasse extends Passagem with Logger, Auditoria {
  String? loungeAcesso;

  PassagemPrimeiraClasse(
    String? codigoLocalizador,
    Passageiro? passageiro,
    PlataformaVenda? plataforma,
    Atendente? atendente, {
    required this.loungeAcesso,
  }) : super.all(
         codigoLocalizador,
         passageiro: passageiro,
         plataforma: plataforma,
         atendente: atendente,
       );

  @override
  void AtualizarPassagem() {
    print("Passagem de Primeira Classe atualizada com sucesso!");
    log("Alteração realizada pelo atendente: ${super.atendente?.nome}");
    auditar("Verificação de segurança realizada para a Primeira Classe.");
  }
}

void main() {
  print("\n--- Passagem Padrão ---");
  Passagem p1 = new Passagem();
  p1.setCodigoLocalizador("STD001");
  p1.EmitirPassagem();

  print("\n--- Consulta e Leitura do Código ---");
  print("Código retornado: ${p1.getCodigoLocalizador()}");
  p1.ConsultarPassagem("STD001");

  print("\n--- Passagem Padrão ---");
  Passagem p2 = new Passagem.all(
    "STD002",
    passageiro: Passageiro()..nome = "Carlos Eduardo",
    plataforma: PlataformaVenda()..nomeCanal = "Site Oficial",
    atendente: Atendente()..nome = "Fernanda Lima",
  );
  p2.EmitirPassagem();

  print("\n--- Cancelamento e Validação ---");
  p2.CancelarPassagem();
  p2.codigoLocalizador = "";

  print("\n--- Passagem Primeira Classe ---");
  PassagemPrimeiraClasse pVIP = new PassagemPrimeiraClasse(
    "VIP789",
    Passageiro()..nome = "Mariana Souza",
    PlataformaVenda()..nomeCanal = "App Mobile",
    Atendente()..nome = "Roberto Alves",
    loungeAcesso: "Sala VIP - Terminal 3",
  );

  pVIP.EmitirPassagem();

  print("\n--- Atualização e Auditoria ---");
  pVIP.AtualizarPassagem();
}
