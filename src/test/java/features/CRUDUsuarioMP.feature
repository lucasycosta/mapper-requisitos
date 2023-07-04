Feature: Crud usuario

  Background: login user mapper
    Given login usuario mapper
    And clicar em Administração na lateral
    And clicar em Usuario
    When abrira a tela de cadastro de Usuario

  @web @usuario @sucesso
  Scenario Outline: Cadastrar usuario com sucesso
    And inserir o nome do usuario "<nome>"
    And inserir o email do usuario "<email>"
    And selecione o perfil do usuario "<perfil>"
    And selecione a escola do usuario "<escola>"
    And clicar no botao Gravar usuario
    Then a mensagem para usuario "<mensagem>"

    Examples: 
      | nome     | email          | perfil           | escola          | mensagem                |
      | usuario1 | user1@mail.com | Administrador    |                 | Cadastrado com sucesso! |
      | usuario2 | user2@mail.com | Digitador        | Escola de teste | Cadastrado com sucesso! |
      | usuario3 | user3@mail.com | Gestor de escola | Escola de teste | Cadastrado com sucesso! |
      | usuario4 | user4@mail.com | Administrador    |                 | Cadastrado com sucesso! |

  @web @usuario @vazio
  Scenario Outline: Cadastrar usuario campos em branco
    And inserir nome do usuario "<nome>"
    And inserir email do usuario "<email>"
    And selecione perfil do usuario "<perfil>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | nome     | email          | perfil        | mensagem                     |
      |          | user1@mail.com | Administrador | O campo Nome é obrigatório   |
      | usuario2 |                | Digitador     | O campo Email é obrigatório  |
      | usuario3 | user3@mail.com |               | O campo Perfil é obrigatório |

  @web @usuario @invalido
  Scenario Outline: Cadastrar usuario email invalido
    And inserir email para usuario "<email>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | email         | mensagem                               |
      | user1         | O campo Email deve ser um email válido |
      | user1@        | O campo Email deve ser um email válido |
      | user1@mail    | O campo Email deve ser um email válido |
      | user1mail     | O campo Email deve ser um email válido |
      | user1@.com    | O campo Email deve ser um email válido |
      | user1.com     | O campo Email deve ser um email válido |
      | user1mail.com | O campo Email deve ser um email válido |

  @web @usuario @consultar
  Scenario Outline: Consultar usuario mapper
    And rolar pagina de usuario
    And buscar o usuario pelo "<nome>"
    Then retorna o "<nome>", "<email>", "<perfil>" e "<escola>" do usuario

    Examples: 
      | nome     | email          | perfil           | escola          |
      | usuario1 | user1@mail.com | Administrador    |                 |
      | usuario2 | user2@mail.com | Digitador        | Escola de teste |
      | usuario3 | user3@mail.com | Gestor de escola | Escola de teste |
      | usuario4 | user4@mail.com | Administrador    |                 |

  @web @usuario @alterar
  Scenario Outline: Alterar usuario mapper
    And rolar pagina de usuario para baixo
    And buscar o usuario com "<nome>"
    When retorna o "<nome>", "<email>", "<perfil>" e "<escola>" do usuario buscado
    And clicar no icone de edicao do respectivo usuario
    And os dados do usuario serao retornados
    And altere "<nome2>", "<email2>", "<perfil2>" e "<escola2>"
    And clique em Alterar usuario
    Then a mensagem de alteracao do usuario "<mensagem>"

    Examples: 
      | nome     | email          | perfil           | escola          | nome2    | email2          | perfil2          | escola2         | mensagem              |
      | usuario1 | user1@mail.com | Administrador    |                 | Usuario1 | userr1@mail.com | Digitador        | Escola de teste | Alterado com sucesso! |
      | usuario2 | user2@mail.com | Digitador        | Escola de teste | Usuario2 | userr1@mail.com | Administrador    |                 | Alterado com sucesso! |
      | usuario3 | user3@mail.com | Gestor de escola | Escola de teste | Usuario3 | userr1@mail.com | Administrador    |                 | Alterado com sucesso! |
      | usuario4 | user4@mail.com | Administrador    |                 | Usuario4 | userr1@mail.com | Gestor de escola | Escola de teste | Alterado com sucesso! |

  @web @usuario @excluir
  Scenario Outline: Excluir usuario
    And role a pagina de usuario
    And buscar o usuario "<nome>"
    And clicar no icone de exclusão de usuario

    #Then a mensagem "<mensagem>"
    Examples: 
      | email    | mensagem              |
      | Usuario1 | Deletado com sucesso! |
      | Usuario2 | Deletado com sucesso! |
      | Usuario3 | Deletado com sucesso! |
      | Usuario4 | Deletado com sucesso! |
