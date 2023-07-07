Feature: Crud permissao

  Background: login permissao mapper
    Given login permissao mapper
    And clicar em Administracao no menu lateral
    And clicar em Permissao
    And abrira a tela de cadastro de Permissao

  @web @permissao @sucesso
  Scenario Outline: Cadastrar permissao com sucesso
    And inserir a data de inicio "<data>" da permissao
    And inserir o ano "<ano>" da permissao
    And selecione a serie "<serie>" da permissao
    And selecione a duração "<duracao>" da permissao
    And selecione a escola "<escola>" da permissao
    And clicar no botão Gravar permissao
    Then a mensagem "<mensagem>" da permissao

    Examples: 
      | data     | ano  | serie  | duracao | escola          | mensagem                |
      | 01102023 | 2023 | 1º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |
      | 01102023 | 2023 | 2º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |
      | 01102023 | 2023 | 3º Ano | 01 Mês  | Escola de Teste | Cadastrado com sucesso! |

  @web @permissao @vazio
  Scenario Outline: Cadastrar permissao com campos vazios
    And inserir data de inicio "<data>" da permissao
    And inserir ano "<ano>" da permissao
    And selecione serie "<serie>" da permissao
    And selecione duração "<duracao>" da permissao
    And selecione escola "<escola>" da permissao
    Then a mensagem "<mensagem>" para permissao

    Examples: 
      | data     | ano | serie  | duracao | escola | mensagem                                   |
      |          |   3 | 1º ano | 01 Mês  | CDF    | O campo Data de Início é obrigatório       |
      | 07092023 |   2 |        | 01 Mês  | CDF    | O campo Série é obrigatório                |
      | 20092023 |     | 1º ano | 01 Mês  | CDF    | O campo Ano é obrigatório                  |
      | 05092023 |   2 | 1º ano |         | CDF    | O campo Duração da Permissão é obrigatório |
      | 06092023 |   2 | 1º ano | 01 Mês  |        | O campo Escola é obrigatório               |

  @web @permissao @consultar
  Scenario Outline: Consultar permissao
    And rolar pagina de permissao
    And buscar a permissao pelo "<codigo>" da permissao
    Then retorna o "<codigo>", "<escola>", "<dataIn>", "<dataVal>", "<periodo>" e "<duracao>" da permissao

    Examples: 
      | codigo      | nome            | escola          | dataIn     | dataVal    | periodo       | duracao |
      | 20230110048 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 1º Ano | 01 Mês  |
      | 20230120049 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 2º Ano | 01 Mês  |
      | 20230130050 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 3º Ano | 01 Mês  |

  @web @permissao @alterar
  Scenario Outline: Alterar permissao
    And rolar pagina de permissao para baixo
    And buscar a permissao com "<codigo>" da permissao
    Then retorna o "<codigo>", "<escola>", "<dataIn>", "<dataVal>", "<periodo>" e "<duracao>" da permissao buscada
    And clicar no icone de edicao da respectiva permissao
    And os dados da permissao serao retornados
    And altere "<duracao2>" e "<serie>"
    And clique em Alterar permissao
    Then a mensagem de alteracao da permissao "<mensagem>"

    Examples: 
      | codigo      | nome            | escola          | dataIn     | dataVal    | periodo       | duracao | duracao2 | serie          | mensagem              |
      | 20230110048 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 1º Ano | 01 Mês  | 12 Meses | Pré-Vestibular | Alterado com sucesso! |
      | 20230120049 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 2º Ano | 01 Mês  | 06 Meses | 3º Ano         | Alterado com sucesso! |
      | 20230130050 | Escola de Teste | Escola de Teste | 01/10/2023 | 01/11/2023 | 2023 - 3º Ano | 01 Mês  | 03 Meses | Pré-Vestibular | Alterado com sucesso! |

  @web @permissao @deletar
  Scenario Outline: Excluir permissao
    And role a pagina de permissao
    And buscar a permissao "<codigo>"
    And clicar no icone de exclusão de permissao
    Then a mensagem "<mensagem>" em permissao

    Examples: 
      | codigo      | mensagem              |
      | 20230110048 | Deletado com sucesso! |
      | 20230120049 | Deletado com sucesso! |
      | 20230130050 | Deletado com sucesso! |
