Feature: Login

  Background: Login mapper
    Given estar na tela de login

  @web @login @valido
  Scenario Outline: Login mapper valido
    When inserir o e-mail "<email>"
    And inserir a senha "<senha>"
    And clicar no botão Entrar
    Then abrira a "<pagina>" inicial

    Examples: 
      | email             | senha  | pagina                   |
      | raonikg@gmail.com | 123456 | http://3.82.209.69:3000/ |

  @web @login @vazio
  Scenario Outline: Login mapper campos vazios
    When inserir o e-mail "<email>" vazio
    And inserir a senha "<senha>" vazia
    Then apresenta a "<mensagem>" para os campos vazios

    Examples: 
      | email             | senha  | mensagem                    |
      |                   | 123456 | O campo Email é obrigatório |
      | raonikg@gmail.com |        | O campo Senha é obrigatório |

  @web @login @invalido
  Scenario Outline: Login mapper invalido
    When inserir o e-mail "<email>" invalido
    And inserir a senha "<senha>" invalida
    And clicar no botão para Entrar
    Then apresenta a "<mensagem>" para invalidacao

    Examples: 
      | email             | senha  | mensagem                      |
      | raonikg@gmail.com | 895151 | Email e/ou senha inválido(s)  |
      | teste@gmail.com   | 782166 | Email e/ou senha inválido(s)  |

  @web @login @emailinvalido
  Scenario Outline: Login mapper email invalido
    When inserir o e-mail "<email>" nao valido
    Then apresenta a "<mensagem>" para email invalido

    Examples: 
      | email         | senha  | mensagem                               |
      | teste.com     | 123456 | O campo Email deve ser um email válido |
      | teste@        | 123456 | O campo Email deve ser um email válido |
      | testemail.com | 123456 | O campo Email deve ser um email válido |
      | teste@mail    | 123456 | O campo Email deve ser um email válido |
      | testemail     | 123456 | O campo Email deve ser um email válido |
      | teste@.com    | 123456 | O campo Email deve ser um email válido |
