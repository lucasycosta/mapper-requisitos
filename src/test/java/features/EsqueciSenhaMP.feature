Feature: Esqueci a senha

  Background: tela de login
    Given estar na tela de login ES
    And clicar em esqueci senha

  @web @esqsenha @enviado
  Scenario Outline: Envio de email com sucesso
    And abrir a pagina com a "<mensagemEmail>"
    When inserir e-mail "<email>" cadastrado
    And clicar no botão Enviar
    Then a mensagem "<mensagem>" de email enviado

    Examples: 
      | mensagemEmail                              | email                | mensagem               |
      | Entre com seu e-mail e aguarde a mensagem! | trocarsenha@mail.com | Verifique o seu email! |

  @web @esqsenha @invalido
  Scenario Outline: Email invalido
    And abrir pagina com a "<mensagemEmail>"
    When inserir o e-mail "<email>" de recuperacao
    And clicar no botão Enviar email
    Then a mensagem "<mensagem>" de email invalido

    Examples: 
      | mensagemEmail                              | email         | mensagem        |
      | Entre com seu e-mail e aguarde a mensagem! | teste.com     | Email inválido! |
      | Entre com seu e-mail e aguarde a mensagem! | tst@gmail.com | Email inválido! |
      | Entre com seu e-mail e aguarde a mensagem! |               | Email inválido! |
