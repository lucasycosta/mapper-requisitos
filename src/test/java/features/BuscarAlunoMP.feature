Feature: Buscar aluno - proceso seletivo, simulados e nota sisu

  Background: login buscarAluno
    Given login buscarAluno
    And clicar na Area do Aluno
    And clicar em Buscar Aluno
    And abrira a tela de pesquisar aluno
    When selecionar uma "<permissao>"
    And buscar aluno pelo "<nome>"

  @web @buscaraluno @geral
  Scenario Outline: buscar aluno
    Then o registro do aluno retorna o "<nome>", "<email>" e "<matricula>"

    Examples: 
      | permissao                                 | nome            | email                    | matricula               |
      | [20231240002] Convidados - PRE_VESTIBULAR | Alcenir Barbosa | alcenirbarbosa@gmail.com | Matrícula: 2020-1 39607 |
      | [20231240002] Convidados - PRE_VESTIBULAR | Dalton Franco   | dalton4002@gmail.com     | Matrícula: 2020-1 39607 |

  @web @buscaraluno @processoSeletivo
  Scenario Outline: buscar processos seletivo do aluno
    When o registro retorna o "<nome>", "<email>" e "<matricula>"
    And clicar no icone de opcoes
    And clicar em Processo Seletivo
    When abrir a pagina do processo com "<nome>" e "<email>" do aluno
    And clicar no icone para ver os detalhes
    Then informacoes sobre o processo do aluno serao apresentadas

    Examples: 
      | permissao                                 | nome            | email                    | matricula               |
      | [20231240002] Convidados - PRE_VESTIBULAR | Alcenir Barbosa | alcenirbarbosa@gmail.com | Matrícula: 2020-1 39607 |
      | [20231240002] Convidados - PRE_VESTIBULAR | Dalton Franco   | dalton4002@gmail.com     | Matrícula: 2020-1 39607 |

  @web @buscaraluno @simulado
  Scenario Outline: buscar simulados do aluno
    When o registro retornara o "<nome>", "<email>" e "<matricula>"
    And clicar no icone de opcoes do aluno
    And clicar em Simulados
    When abrir a pagina dos Simulados com "<nome>" e "<email>" do aluno
    Then retornar o "<nomeSim>", "<data>", "<area>" e "<nota>" dos simulados

    Examples: 
      | permissao                                 | nome        | email             | matricula               | nomeSim     | data       | area                 | nota   |
      | [20231240002] Convidados - PRE_VESTIBULAR | Raoni Karan | raonikg@gmail.com | Matrícula: 2020-1 39607 | Estilo ENEM | 09/02/2023 | Linguagens e Códigos | 348.35 |

  @web @buscaraluno @sisu
  Scenario Outline: buscar nota sisu do aluno
    When o registro retornara o "<nome>", "<email>" e "<matricula>" do aluno
    And clicar no icone de opcoes do aluno buscado
    And clicar em Nota SISU
    When abrir a pagina dos Simulados com "<nome>" e "<email>" do aluno
    Then retornar o "<lc>", "<ch>", "<curso>", "<cn>", "<m>", "<r>" e "<uf>" dos simulados

    Examples: 
      | permissao                                 | nome        | email             | lc  | ch  | curso    | cn  | m   | r   | uf  |
      | [20231240002] Convidados - PRE_VESTIBULAR | Raoni Karan | raonikg@gmail.com | 680 | 760 | Medicina | 740 | 820 | 940 | RNS |
