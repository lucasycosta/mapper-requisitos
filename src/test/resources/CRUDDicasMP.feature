Feature: Crud dica

  Background: login dica   mapper
    Given login dica   mapper
    And clicar em Cadastramento
    And clicar em dica
    When abrira a tela de cadastro de dica

  @web @dica @sucesso
  Scenario Outline: Cadastrar dica com sucesso
    And inserir o codigo da dica "<codigo>"
    And inserir o nome da dica "<nome>"
    And inserir o arquivo "<arquivo>"
    And clicar no botao Gravar dica
    Then a mensagem para dica "<mensagem>"

    Examples: 
      | codigo | nome      | arquivo            | mensagem                |
      | DCTST  | dicaTest1 | D:\\componente.jpg | Cadastrado com sucesso! |
      | DCTST  | dicaTest2 | D:\\componente.jpg | Cadastrado com sucesso! |
      | DCTST  | dicaTest3 | D:\\componente.jpg | Cadastrado com sucesso! |
      | DCTST  | dicaTest4 | D:\\componente.jpg | Cadastrado com sucesso! |

  @web @dica @vazio
  Scenario Outline: Cadastrar dica campos em branco
    And inserir codigo da dica "<codigo>"
    And inserir nome da dica "<nome>"
    And inserir arquivo "<arquivo>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | ano    | nome      | semestre           | mensagem                       |
      |        | dicaTest1 | Janeiro            | O campo Ano é obrigatório      |
      |   2024 |           |                    | O campo Semestre é obrigatório |
      | codigo | nome      | arquivo            | mensagem                       |
      |        | dicaTest1 | D:\\componente.jpg | O campo Codigo é obrigatório   |
      | DCTST  |           | D:\\componente.jpg | O campo Nome é obrigatório     |
      | DCTST  | dicaTest3 |                    | O campo Arquivo é obrigatório  |

  @web @dica @consultar
  Scenario Outline: Consultar dica mapper
    And rolar pagina de dica
    And buscar a dica pelo "<nome>"
    Then retorna o "<codigo>" e "<nome>" da dica

    Examples: 
      | codigo | nome      |
      | DCTST  | dicaTest1 |
      | DCTST  | dicaTest2 |
      | DCTST  | dicaTest3 |
      | DCTST  | dicaTest4 |

  @web @dica @alterar
  Scenario Outline: Alterar dica mapper
    And rolar pagina de dica para baixo
    And buscar dica pelo "<nome>"
    When retorna o "<codigo>" e "<nome>" da dica buscada
    And clicar no icone de edicao da respectiva dica
    And os dados do dica serao retornados
    And altere "<codigo2>", "<nome2>"
    And clique em Alterar dica
    Then a mensagem de alteracao do dica "<mensagem>"

    Examples: 
      | codigo | nome      | codigo2 | nome2      | mensagem              |
      | DCTST  | dicaTest1 | DCTT    | dicaTeste1 | Alterado com sucesso! |
      | DCTST  | dicaTest2 | DCTT    | dicaTeste2 | Alterado com sucesso! |
      | DCTST  | dicaTest3 | DCTT    | dicaTeste3 | Alterado com sucesso! |
      | DCTST  | dicaTest4 | DCTT    | dicaTeste4 | Alterado com sucesso! |

  @web @dica @excluir
  Scenario Outline: Excluir dica
    And role a pagina de dica
    And buscar a dica "<nome>"
    And clicar no icone de exclusão de dica
    Then a mensagem "<mensagem>"

    Examples: 
      | ano        | mensagem              |
      | dicaTeste1 | Deletado com sucesso! |
      | dicaTeste2 | Deletado com sucesso! |
      | dicaTeste3 | Deletado com sucesso! |
      | dicaTeste4 | Deletado com sucesso! |
