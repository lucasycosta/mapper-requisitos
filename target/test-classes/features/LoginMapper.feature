Feature: Login

  Background: Login mapper
    Given estar na tela de login
    When inserir o e-mail "<email>"
    And inserir a senha "<senha>"

  @web @login @valido
  Scenario Outline: Login mapper valido
    And clicar no botão “Entrar”
    Then abrira a "<pagina>" inicial

    Examples: 
      | email             | senha  | pagina                   |
      | raonikg@gmail.com | 123456 | http://3.82.209.69:3000/ |

  @web @login @vazio
  Scenario Outline: : Login mapper campos vazios
    Then apresenta a "<mensagem>" para os campos vazios

    Examples: 
      | email             | senha  | mensagem                    |
      |                   | 123456 | O campo Email é obrigatório |
      | raonikg@gmail.com |        | O campo Senha é obrigatório |

  @web @login @invalido
  Scenario Outline: : Login mapper invalido
    Then apresenta a "<mensagem>" para invalidacao

    Examples: 
      | email             | senha  | mensagem                    |
      | raonikg@gmail.com | 895151 | E-mail e/ou senha invalidos |
      | teste@gmail.com   | 782166 | E-mail e/ou senha invalidos |

  @web @login @emailinvalido
  Scenario Outline: : Login mapper email invalido
    Then apresenta a "<mensagem>" para email invalido

    Examples: 
      | email         | senha  | mensagem                               |
      | teste.com     | 123456 | O campo Email deve ser um email válido |
      | teste@        | 123456 | O campo Email deve ser um email válido |
      | testemail.com | 123456 | O campo Email deve ser um email válido |
      | teste@mail    | 123456 | O campo Email deve ser um email válido |
      | testemail     | 123456 | O campo Email deve ser um email válido |
      | teste@.com    | 123456 | O campo Email deve ser um email válido |
