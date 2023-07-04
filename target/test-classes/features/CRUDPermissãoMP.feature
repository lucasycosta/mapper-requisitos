Feature: Crud permissao

  Background: login permissao mapper
    Given login permissao mapper
    And clicar em Administracao no menu lateral
    And clicar em Permissao
    And abrira a tela de cadastro de Permissao

  @web @permissao @sucesso
  Scenario Outline: Cadastrar permissao com sucesso
    And inserir a data de inicio "<data>"
    And inserir o ano "<ano>"
    And selecione a serie "<serie>"
    And selecione a duração "<duração>"
    And selecione a permissao "<permissao>"
    And clicar no botão Gravar
    Then a mensagem "<mensagem>"

    Examples: 
      | data     | ano  | serie  | duração | escola          | mensagem                |
      | 01102023 | 2023 | 1º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |
      | 01102023 | 2023 | 2º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |
      | 01102023 | 2023 | 3º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |

  @web @permissao @vazio
  Scenario Outline: Cadastrar permissao com campos vazios
    And inserir data de inicio "<data>"
    And inserir ano "<ano>"
    And selecione serie "<serie>"
    And selecione duração "<duração>"
    And selecione permissao "<permissao>"
    Then a mensagem "<mensagem>" nos campos

    Examples: 
      | data     | ano | serie  | duração | escola | mensagem                                   |
      |          |   3 | 1º ano | 01 Mês  | CDF    | O campo Data de Início é obrigatório       |
      | 07092023 |   2 |        | 01 Mês  | CDF    | O campo Série é obrigatório                |
      | 20092023 |     | 1º ano | 01 Mês  | CDF    | O campo Ano é obrigatório                  |
      | 05092023 |   2 | 1º ano |         | CDF    | O campo Duração da Permissão é obrigatório |
      | 06092023 |   2 | 1º ano | 01 Mês  |        | O campo permissao é obrigatório            |

  @web @permissao @consultar
  Scenario Outline: Consultar permissao
    And rolar pagina de permissao
    And buscar a permissao pelo "<nome>" da escola
    Then retorna o "<escola>", "<dataIn>", "<dataVal>", "<periodo>" e "<duracao>" da permissao

    Examples: 
      | nome            | escola          | dataIn   | dataVal  | periodo       | duração |
      | Escola de Teste | Escola de Teste | 01102023 | 01112023 | 2023 - 1º ano | 01 Mês  |
      | Escola de Teste | Escola de Teste | 01102023 | 01112023 | 2023 - 2º ano | 01 Mês  |
      | Escola de Teste | Escola de Teste | 01102023 | 01112023 | 2023 - 3º ano | 01 Mês  |

  @web @permissao @alterar
  Scenario Outline: Alterar permissao
    And rolar pagina de permssao para baixo
    And buscar a permissao com "<nome>"
    Then retorna o "<escola>", "<dataIn>", "<dataVal>", "<periodo>" e "<duracao>" da permissao  buscada
    And clicar no icone de edicao da respectiva permissao
    And os dados da permissao serao retornados
    And altere "<duracao2>" e "<serie>"
    And clique em Alterar permissao
    Then a mensagem de alteracao da permissao "<mensagem>"

    Examples: 
      | nome            | escola          | dataIn   | dataVal  | periodo       | duração | duracao2 | serie          |
      | Escola de Teste | Escola de Teste | 01102023 | 01112023 | 2023 - 1º ano | 01 Mês  | 12 Meses | Pré-Vestibular |

  @web
  Scenario Outline: Excluir permissao
    And role a pagina de permissao
    And buscar a permissao "<nome>"
    And clicar no icone de exclusão de permissao
    Then a mensagem "<mensagem>" em permissao

    Examples: 
      | email           | mensagem              |
      | Escola de Teste | Deletado com sucesso! |
