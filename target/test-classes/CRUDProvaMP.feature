Feature: Crud prova

  Background: login prova   mapper
    Given login prova   mapper
    And clicar em Cadastramento
    And clicar em prova
    When abrira a tela de cadastro de prova

  @web @prova @sucesso
  Scenario Outline: Cadastrar prova com sucesso
    And inserir o ano da prova "<ano>"
    And inserir o nome da prova "<nome>"
    And selecionar o sementre "<semestre>"
    And clicar no botao Gravar prova
    Then a mensagem para prova "<mensagem>"

    Examples: 
      | ano  | nome       | semestre  | mensagem                |
      | 2023 | provaTest1 | Janeiro   | Cadastrado com sucesso! |
      | 2024 |            | Fevereiro | Cadastrado com sucesso! |
      | 2022 | provaTest3 | Junho     | Cadastrado com sucesso! |
      | 2025 | provaTest4 | Agosto    | Cadastrado com sucesso! |

  @web @prova @vazio
  Scenario Outline: Cadastrar prova campos em branco
    And inserir codigo da prova "<codigo>"
    And inserir nome da prova "<nome>"
    And selecionar sementre "<semestre>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | ano  | nome       | semestre | mensagem                       |
      |      | provaTest1 | Janeiro  | O campo Ano é obrigatório      |
      | 2024 |            |          | O campo Semestre é obrigatório |

  @web @prova @consultar
  Scenario Outline: Consultar prova mapper
    And rolar pagina de prova
    And buscar a prova pelo "<ano>"
    Then retorna o "<ano>", "<nome>" e "<semestre>" da prova

    Examples: 
      | codigo | nome       | semestre  |
      |   2023 | provaTest1 | Janeiro   |
      |   2024 | provaTest2 | Fevereiro |
      |   2022 | provaTest3 | Junho     |
      |   2025 | provaTest4 | Agosto    |

  @web @prova @alterar
  Scenario Outline: Alterar prova mapper
    And rolar pagina de prova para baixo
    And buscar prova pelo "<ano>"
    When retorna o "<ano>", "<nome>" e "<semestre>" da prova buscada
    And clicar no icone de edicao da respectiva prova
    And os dados do prova serao retornados
    And altere "<ano2>", "<nome2>" e "<semestre2>"
    And clique em Alterar prova
    Then a mensagem de alteracao do prova "<mensagem>"

    Examples: 
      | codigo | nome       | semestre  | codigo2 | nome2       | semestre2   | mensagem              |
      |   2023 | provaTest1 | Janeiro   |    2024 | provaTeste1 | Anual       | Alterado com sucesso! |
      |   2024 | provaTest2 | Fevereiro |    2025 | provaTeste2 | 1º Semestre | Alterado com sucesso! |
      |   2022 | provaTest3 | Junho     |    2023 | provaTeste3 | Janeiro     | Alterado com sucesso! |
      |   2025 | provaTest4 | Agosto    |    2026 | provaTeste4 | Junho       | Alterado com sucesso! |

  @web @prova @excluir
  Scenario Outline: Excluir prova
    And role a pagina de prova
    And buscar o prova "<ano>"
    And clicar no icone de exclusão de prova
    Then a mensagem "<mensagem>"

    Examples: 
      | ano  | mensagem              |
      | 2024 | Deletado com sucesso! |
      | 2025 | Deletado com sucesso! |
      | 2023 | Deletado com sucesso! |
      | 2026 | Deletado com sucesso! |
