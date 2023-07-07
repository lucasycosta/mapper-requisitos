Feature: Crud faculdade

  Background: login faculdade mapper
    Given login faculdade mapper
    And clicar em Simulado
    And clicar em Faculdade
    When abrira a tela de cadastro de faculdade

  @web @faculdade @sucesso
  Scenario Outline: Cadastrar faculdade com sucesso
    And inserir a sigla da faculdade "<sigla>"
    And inserir o nome da faculdade "<nome>"
    And inserir a imagem da faculdade "<imagem>"
    And clicar no botao Gravar faculdade
    Then a mensagem para faculdade "<mensagem>"

    Examples: 
      | silga | nome     | imagem            | mensagem                |
      | UTST1 | UniTest1 | D:\\faculdade.png | Cadastrado com sucesso! |
      | UTST2 | UniTest2 | D:\\faculdade.png | Cadastrado com sucesso! |
      | UTST3 | UniTest3 | D:\\faculdade.png | Cadastrado com sucesso! |
      | UTST4 | UniTest4 | D:\\faculdade.png | Cadastrado com sucesso! |

  @web @faculdade @vazio
  Scenario Outline: Cadastrar faculdade campos em branco
    And inserir sigla da faculdade "<sigla>"
    And inserir nome da faculdade "<nome>"
    And inserir imagem da faculdade "<imagem>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | silga | nome     | imagem            | mensagem                     |
      |       | UniTest1 | D:\\faculdade.png | O campo Sigla é obrigatório  |
      | UTST2 |          | D:\\faculdade.png | O campo Nome é obrigatório   |
      | UTST3 | UniTest1 |                   | O campo Imagem é obrigatório |

  @web @faculdade @consultar
  Scenario Outline: Consultar faculdade mapper
    And rolar pagina de faculdade
    And buscar a faculdade pela "<sigla>"
    Then retorna o "<sigla>" e "<nome>" da faculdade

    Examples: 
      | sigla | nome     |
      | UTST1 | UniTest1 |
      | UTST2 | UniTest2 |
      | UTST3 | UniTest3 |
      | UTST4 | UniTest4 |

  @web @faculdade @alterar
  Scenario Outline: Alterar faculdade mapper
    And rolar pagina de faculdade para baixo
    And buscar faculdade pela "<sigla>"
    When retorna o "<sigla>" e "<nome>" da faculdade buscada
    And clicar no icone de edicao da respectiva faculdade
    And os dados do faculdade serao retornados
    And altere "<sigla2>", "<nome2>" e "<imagem>"
    And clique em Alterar faculdade
    Then a mensagem de alteracao do faculdade "<mensagem>"

    Examples: 
      | sigla | nome     | sigla2 | nome2     | imagem            | mensagem              |
      | UTST1 | UniTest1 | UTS1   | UniTeste1 | D:\\faculdade.png | Alterado com sucesso! |
      | UTST2 | UniTest2 | UTS2   | UniTeste2 | D:\\faculdade.png | Alterado com sucesso! |
      | UTST3 | UniTest3 | UTS3   | UniTeste3 | D:\\faculdade.png | Alterado com sucesso! |
      | UTST4 | UniTest4 | UTS4   | UniTeste4 | D:\\faculdade.png | Alterado com sucesso! |

  @web @faculdade @excluir
  Scenario Outline: Excluir faculdade
    And role a pagina de faculdade
    And buscar o faculdade "<sigla>"
    And clicar no icone de exclusão de faculdade
    Then a mensagem "<mensagem>"

    Examples: 
      | sigla | mensagem              |
      | UTS1  | Deletado com sucesso! |
      | UTS2  | Deletado com sucesso! |
      | UTS3  | Deletado com sucesso! |
      | UTS4  | Deletado com sucesso! |
