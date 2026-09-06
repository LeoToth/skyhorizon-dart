# skyhorizon-dart
Sistema de emissão de passagens em Dart aplicando POO, Mixins e Null Safety.

# Situação-Problema
A SkyHorizon Airlines precisava de um sistema centralizado de emissão de passagens para corrigir a gravação de dados inválidos e garantir que alterações em bilhetes de Primeira Classe fossem devidamente auditadas. O desafio foi modelar essa solução garantindo tipagem segura (Null Safety), validação ativa nos atributos e reutilização de código de log/auditoria sem poluir a hierarquia de classes.


## Exemplo de Execução

```text
--- Passagem Padrão ---
Passagem emitida com sucesso!

--- Consulta e Leitura do Código ---
Código retornado: STD001
Passagem consultada com sucesso

--- Passagem Padrão ---
Passagem emitida com sucesso!

--- Cancelamento e Validação ---
Passagem cancelada com sucesso!
Código localizador de passagem inválido!

--- Passagem Primeira Classe ---
Passagem emitida com sucesso!

--- Atualização e Auditoria ---
Passagem de Primeira Classe atualizada com sucesso!
Alteração realizada pelo atendente: Roberto Alves
[Auditoria]: Verificação de segurança realizada para a Primeira Classe.
