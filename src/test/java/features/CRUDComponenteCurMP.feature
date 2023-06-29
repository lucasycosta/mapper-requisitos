Feature: Crud componente

  Background: login componente mapper
    Given login componente mapper
    And clicar em Cadastramento
    And clicar em componente
    When abrira a tela de cadastro de componente

  @web @componente @sucesso
  Scenario Outline: Cadastrar componente com sucesso
    And inserir o nome do componente "<nome>"
    And inserir a imagem do componente "<imagem>"
    And clicar no botao Gravar componente
    Then a mensagem para componente "<mensagem>"

    Examples: 
      | nome      | imagem             | mensagem                |
      | CompTest1 | D:\\componente.jpg | Cadastrado com sucesso! |
      | CompTest2 | D:\\componente.jpg | Cadastrado com sucesso! |
      | CompTest3 | D:\\componente.jpg | Cadastrado com sucesso! |
      | CompTest4 | D:\\componente.jpg | Cadastrado com sucesso! |

  @web @componente @vazio
  Scenario Outline: Cadastrar componente campos em branco
    And inserir nome da componente "<nome>"
    And inserir imagem da componente "<imagem>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | nome      | imagem             | mensagem                     |
      |           | D:\\componente.jpg | O campo Nome é obrigatório   |
      | CompTest1 |                    | O campo Imagem é obrigatório |

  @web @componente @consultar
  Scenario Outline: Consultar componente mapper
    And rolar pagina de componente
    And buscar a componente pelo "<nome>"
    Then retorna o "<nome>" da componente

    Examples: 
      | nome      |
      | CompTest1 |
      | CompTest2 |
      | CompTest3 |
      | CompTest4 |

  @web @componente @alterar
  Scenario Outline: Alterar componente mapper
    And rolar pagina de componente para baixo
    And buscar componente pelo "<nome>"
    When retorna o "<nome>" da componente buscada
    And clicar no icone de edicao da respectiva componente
    And os dados do componente serao retornados
    And altere "<nome2>"
    And clique em Alterar componente
    Then a mensagem de alteracao do componente "<mensagem>"

    Examples: 
      | nome      | nome2      | mensagem              |
      | CompTest1 | CompTeste1 | Alterado com sucesso! |
      | CompTest2 | CompTeste2 | Alterado com sucesso! |
      | CompTest3 | CompTeste3 | Alterado com sucesso! |
      | CompTest4 | CompTeste4 | Alterado com sucesso! |

  @web @componente @excluir
  Scenario Outline: Excluir componente
    And role a pagina de componente
    And buscar o componente "<sigla>"
    And clicar no icone de exclusão de componente
    Then a mensagem "<mensagem>"

    Examples: 
      | sigla      | mensagem              |
      | CompTeste1 | Deletado com sucesso! |
      | CompTeste2 | Deletado com sucesso! |
      | CompTeste3 | Deletado com sucesso! |
      | CompTeste4 | Deletado com sucesso! |
