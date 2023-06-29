Feature: Crud modulo

  Background: login modulo mapper
    Given login modulo mapper
    And clicar em Cadastramento
    And clicar em modulo
    When abrira a tela de cadastro de modulo

  @web @modulo @sucesso
  Scenario Outline: Cadastrar modulo com sucesso
    And inserir o nome da modulo "<nome>"
    And clicar no botao Gravar modulo
    Then a mensagem para modulo "<mensagem>"

    Examples: 
      | nome        | mensagem                |
      | ModuloTest1 | Cadastrado com sucesso! |
      | ModuloTest2 | Cadastrado com sucesso! |
      | ModuloTest3 | Cadastrado com sucesso! |
      | ModuloTest4 | Cadastrado com sucesso! |

  @web @modulo @vazio
  Scenario Outline: Cadastrar modulo campos em branco
    And inserir nome da modulo "<nome>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | nome | mensagem                   |
      |      | O campo Nome é obrigatório |

  @web @modulo @consultar
  Scenario Outline: Consultar modulo mapper
    And rolar pagina de modulo
    And buscar a modulo pela "<sigla>"
    Then retorna o "<sigla>" e "<nome>" da modulo

    Examples: 
      | nome        |
      | ModuloTest1 |
      | ModuloTest2 |
      | ModuloTest3 |
      | ModuloTest4 |

  @web @modulo @alterar
  Scenario Outline: Alterar modulo mapper
    And rolar pagina de modulo para baixo
    And buscar modulo pelo "<nome>"
    When retorna o "<nome>" da modulo buscada
    And clicar no icone de edicao da respectiva modulo
    And os dados do modulo serao retornados
    And altere "<nome2>"
    And clique em Alterar modulo
    Then a mensagem de alteracao do modulo "<mensagem>"

    Examples: 
      | nome        | nome2        | mensagem              |
      | ModuloTest1 | ModuloTeste1 | Alterado com sucesso! |
      | ModuloTest2 | ModuloTeste2 | Alterado com sucesso! |
      | ModuloTest3 | ModuloTeste3 | Alterado com sucesso! |
      | ModuloTest4 | ModuloTeste4 | Alterado com sucesso! |

  @web @modulo @excluir
  Scenario Outline: Excluir modulo
    And role a pagina de modulo
    And buscar o modulo "<nome>"
    And clicar no icone de exclusão de modulo
    Then a mensagem "<mensagem>"

    Examples: 
      | nome         | mensagem              |
      | ModuloTeste1 | Deletado com sucesso! |
      | ModuloTeste2 | Deletado com sucesso! |
      | ModuloTeste3 | Deletado com sucesso! |
      | ModuloTeste4 | Deletado com sucesso! |
