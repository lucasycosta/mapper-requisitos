Feature: Crud avaliacao

  Background: login avaliacao mapper
    Given login avaliacao mapper
    And clicar em Cadastramento
    And clicar em avaliacao
    When abrira a tela de cadastro de avaliacao

  @web @avaliacao @sucesso
  Scenario Outline: Cadastrar avaliacao com sucesso
    And inserir o nome da avaliacao "<nome>"
    And clicar no botao Gravar avaliacao
    Then a mensagem para avaliacao "<mensagem>"

    Examples: 
      | nome      | mensagem                |
      | AvalTest1 | Cadastrado com sucesso! |
      | AvalTest2 | Cadastrado com sucesso! |
      | AvalTest3 | Cadastrado com sucesso! |
      | AvalTest4 | Cadastrado com sucesso! |

  @web @avaliacao @vazio
  Scenario Outline: Cadastrar avaliacao campos em branco
    And inserir nome da avaliacao "<nome>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | nome | mensagem                   |
      |      | O campo Nome é obrigatório |

  @web @avaliacao @consultar
  Scenario Outline: Consultar avaliacao mapper
    And rolar pagina de avaliacao
    And buscar a avaliacao pela "<sigla>"
    Then retorna o "<sigla>" e "<nome>" da avaliacao

    Examples: 
      | nome      |
      | AvalTest1 |
      | AvalTest2 |
      | AvalTest3 |
      | AvalTest4 |

  @web @avaliacao @alterar
  Scenario Outline: Alterar avaliacao mapper
    And rolar pagina de avaliacao para baixo
    And buscar avaliacao pelo "<nome>"
    When retorna o "<nome>" da avaliacao buscada
    And clicar no icone de edicao da respectiva avaliacao
    And os dados do avaliacao serao retornados
    And altere "<nome2>"
    And clique em Alterar avaliacao
    Then a mensagem de alteracao do avaliacao "<mensagem>"

    Examples: 
      | nome      | nome2      | mensagem              |
      | AvalTest1 | AvalTeste1 | Alterado com sucesso! |
      | AvalTest2 | AvalTeste2 | Alterado com sucesso! |
      | AvalTest3 | AvalTeste3 | Alterado com sucesso! |
      | AvalTest4 | AvalTeste4 | Alterado com sucesso! |

  @web @avaliacao @excluir
  Scenario Outline: Excluir avaliacao
    And role a pagina de avaliacao
    And buscar o avaliacao "<nome>"
    And clicar no icone de exclusão de avaliacao
    Then a mensagem "<mensagem>"

    Examples: 
      | nome       | mensagem              |
      | AvalTeste1 | Deletado com sucesso! |
      | AvalTeste2 | Deletado com sucesso! |
      | AvalTeste3 | Deletado com sucesso! |
      | AvalTeste4 | Deletado com sucesso! |
