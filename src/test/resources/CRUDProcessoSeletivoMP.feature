Feature: Crud processo seletivo

  Background: login processo seletivo mapper
    Given login processo seletivo mapper
    And clicar em Cadastramento
    And clicar em processo seletivo
    When abrira a tela de cadastro de processo seletivo

  @web @processo @sucesso
  Scenario Outline: Cadastrar processo seletivo com sucesso
    And inserir a sigla da processo seletivo "<sigla>"
    And inserir o nome da processo seletivo "<nome>"
    And inserir a imagem da processo seletivo "<imagem>"
    And clicar no botao Gravar processo seletivo
    Then a mensagem para processo seletivo "<mensagem>"

    Examples: 
      | sigla  | nome        | imagem                    | mensagem                |
      | PSTST1 | ProSelTest1 | D:\\processo-seletivo.png | Cadastrado com sucesso! |
      | PSTST2 | ProSelTest2 | D:\\processo-seletivo.png | Cadastrado com sucesso! |
      | PSTST3 | ProSelTest3 | D:\\processo-seletivo.png | Cadastrado com sucesso! |
      | PSTST4 | ProSelTest4 | D:\\processo-seletivo.png | Cadastrado com sucesso! |

  @web @processo @vazio
  Scenario Outline: Cadastrar processo seletivo campos em branco
    And inserir sigla da processo seletivo "<sigla>"
    And inserir nome da processo seletivo "<nome>"
    And inserir imagem da processo seletivo "<imagem>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | silga  | nome        | imagem                    | mensagem                     |
      |        | ProSelTest1 | D:\\processo-seletivo.png | O campo Sigla é obrigatório  |
      | PSTST2 |             | D:\\processo-seletivo.png | O campo Nome é obrigatório   |
      | PSTST3 | ProSelTest1 |                           | O campo Imagem é obrigatório |

  @web @processo @consultar
  Scenario Outline: Consultar processo seletivo mapper
    And rolar pagina de processo seletivo
    And buscar a processo seletivo pela "<sigla>"
    Then retorna o "<sigla>" e "<nome>" da processo seletivo

    Examples: 
      | sigla  | nome        |
      | PSTST1 | ProSelTest1 |
      | PSTST2 | ProSelTest2 |
      | PSTST3 | ProSelTest3 |
      | PSTST4 | ProSelTest4 |

  @web @processo @alterar
  Scenario Outline: Alterar processo seletivo mapper
    And rolar pagina de processo seletivo para baixo
    And buscar processo seletivo pela "<sigla>"
    When retorna o "<sigla>" e "<nome>" da processo seletivo buscada
    And clicar no icone de edicao da respectiva processo seletivo
    And os dados do processo seletivo serao retornados
    And altere "<sigla2>", "<nome2>" e "<imagem>"
    And clique em Alterar processo seletivo
    Then a mensagem de alteracao do processo seletivo "<mensagem>"

    Examples: 
      | sigla  | nome        | sigla2 | nome2        | imagem                    | mensagem              |
      | PSTST1 | ProSelTest1 | PSTS1  | ProSelTeste1 | D:\\processo-seletivo.png | Alterado com sucesso! |
      | PSTST2 | ProSelTest2 | PSTS2  | ProSelTeste2 | D:\\processo-seletivo.png | Alterado com sucesso! |
      | PSTST3 | ProSelTest3 | PSTS3  | ProSelTeste3 | D:\\processo-seletivo.png | Alterado com sucesso! |
      | PSTST4 | ProSelTest4 | PSTS4  | ProSelTeste4 | D:\\processo-seletivo.png | Alterado com sucesso! |

  @web @processo @excluir
  Scenario Outline: Excluir processo seletivo
    And role a pagina de processo seletivo
    And buscar o processo seletivo "<sigla>"
    And clicar no icone de exclusão de processo seletivo
    Then a mensagem "<mensagem>"

    Examples: 
      | sigla | mensagem              |
      | PSTS1 | Deletado com sucesso! |
      | PSTS2 | Deletado com sucesso! |
      | PSTS3 | Deletado com sucesso! |
      | PSTS4 | Deletado com sucesso! |
