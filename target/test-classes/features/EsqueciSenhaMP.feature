Feature: Esqueci a senha

  Background: tela de login
    Given estar na tela de login
    And clicar em esqueci senha
    And abrir a pagina com a "<mensagemEmail>"
    When inserir e-mail "<email>" cadastrado
    And clicar no botão Enviar

  @web @esqsenha @enviado
  Scenario Outline: Envio de email com sucesso
    Then a mensagem "<mensagem>" de email enviado

    Examples: 
      | mensagemEmail                              | email                | mensagem                                             |
      | Entre com seu e-mail e aguarde a mensagem! | trocarsenha@mail.com | Email enviado com sucesso, verificar caixa de e-mail |

  @web @esqsenha @invalido
  Scenario Outline: Envio de email com sucesso
    Then a mensagem "<mensagem>" de email invalido

    Examples: 
      | mensagemEmail                              | email           | mensagem        |
      | Entre com seu e-mail e aguarde a mensagem! | teste.com       | Email inválido! |
      | Entre com seu e-mail e aguarde a mensagem! | tst@gmail.com   | Email inválido! |
      | Entre com seu e-mail e aguarde a mensagem! |                 | Email inválido! |
