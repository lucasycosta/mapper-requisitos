Feature: Crud escola

  Background: login escola mapper
    Given login escola mapper
    And clicar em Administração no menu
    And clicar em Escola
    When abrira a tela de cadastro de escola

  @web @escola @sucesso
  Scenario Outline: Cadastrar escola com sucesso
    And inserir o nome do escola "<nome>"
    And inserir a cidade da escola "<cidade>"
    And selecione o estado da escola "<estado>"
    And clicar no botao Gravar escola
    Then a mensagem para escola "<mensagem>"

    Examples: 
      | nome    | cidade    | estado           | mensagem                |
      | escola1 | Brasília  | Distrito Federal | Cadastrado com sucesso! |
      | escola2 | São Paulo | São Paulo        | Cadastrado com sucesso! |
      | escola3 | Salvado   | Bahia            | Cadastrado com sucesso! |
      | escola4 | Brasília  | Distrito Federal | Cadastrado com sucesso! |

  @web @escola @vazio
  Scenario Outline: Cadastrar escola campos em branco
    And inserir nome do escola "<nome>"
    And inserir cidade da escola "<cidade>"
    And selecione estado da escola "<estado>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | nome    | cidade   | estado           | mensagem                     |
      |         | Brasília | Distrito Federal | O campo Nome é obrigatório   |
      | escola2 |          | Rio de Janeiro   | O campo Cidade é obrigatório |
      | escola3 | Brasília |                  | O campo Estado é obrigatório |

  @web @escola @consultar
  Scenario Outline: Consultar escola mapper
    And rolar pagina de escola
    And buscar o escola pelo "<nome>"
    Then retorna o "<nome>", "<cidade>" e "<estado>" da escola

    Examples: 
      | nome    | cidade    | estado |
      | escola1 | Brasília  | DF     |
      | escola2 | São Paulo | SP     |
      | escola3 | Salvado   | BA     |
      | escola4 | Brasília  | DF     |

  @web @escola @alterar
  Scenario Outline: Alterar escola mapper
    And rolar pagina de escola para baixo
    And buscar o escola com "<nome>"
    When retorna o "<nome>", "<cidade>" e "<estado>" da escola  buscada
    And clicar no icone de edicao da respectiva escola
    And os dados da escola serao retornados
    And altere "<nome2>", "<cidade2>", "<estado2>"
    And clique em Alterar escola
    Then a mensagem de alteracao da escola "<mensagem>"

    Examples: 
      | nome    | cidade    | estado | nome2   | cidade2        | estado2             |mensagem              |
      | escola1 | Brasília  | DF     | Escola1 | Salvador       | Bahia               |Alterado com sucesso! |
      | escola2 | São Paulo | SP     | Escola2 | Rio de Janeiro | Rio de Janeiro      |Alterado com sucesso! |
      | escola3 | Salvado   | BA     | Escola3 | Natal          | Rio Grande do Norte |Alterado com sucesso! |
      | escola4 | Brasília  | DF     | Escola4 | Campinas       | São Paulo           |Alterado com sucesso! |

  @web @escola @excluir
  Scenario Outline: Excluir escola
    And role a pagina de escola
    And buscar o escola "<nome>"
    And clicar no icone de exclusão de escola

    #Then a mensagem "<mensagem>"
    Examples: 
      | email   | mensagem              |
      | Escola1 | Deletado com sucesso! |
      | Escola2 | Deletado com sucesso! |
      | Escola3 | Deletado com sucesso! |
      | Escola4 | Deletado com sucesso! |
