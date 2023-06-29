Feature: Crud questao

  Background: login questao mapper
    Given login questao mapper
    And clicar em Simulado
    And clicar em questao simulado
    When abrira a tela de cadastro de questao

  @web @questao @certoerrado
  Scenario Outline: Cadastrar questao certo errado
    And selecione um simulado "<simulado>"
    And selecione um texto "<texto>"
    And inserir um codigo "<codigo>"
    And inserir um numero "<numero>"
    And selecione o "<tipo>" da questao
    And insira o "<comando>" da questao
    And inserir o primeiro "<gabarito1>", "<enunciado1>", "<assunto1>", "<recorrencia1>" e "<orientação1>"
    And inserir o segundo "<gabarito2>", "<enunciado2>", "<assunto2>", "<recorrencia2>" e "<orientação2>"
    And clicar no botao Gravar questao
    Then a mensagem para questao "<mensagem>"

    Examples: 
      | simulado  | texto     | codigo | numero | tipo         | comando         | gabarito1 | enunciado1     | recorrencia1 | orientação1 | gabarito2 | enunciado2     | recorrencia2 | orientação2 | mensagem              |
      | TST-TESTE | TXT-TEXTO | QST1   |      1 | Certo Errado | Julgue os itens | C         | textoenunciado | alta         | vazio       | E         | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST2   |      2 | Certo Errado |                 | E         | textoenunciado | alta         | vazio       | C         | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST3   |      3 | Certo Errado | Julgue os itens |           | textoenunciado | alta         | vazio       |           | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST4   |      4 | Certo Errado | Julgue os itens | E         |                | alta         | vazio       | E         |                | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST5   |      5 | Certo Errado | Julgue os itens | E         | textoenunciado |              | vazio       | C         | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST6   |      6 | Certo Errado | Julgue os itens | E         | textoenunciado | alta         |             | C         | textoenunciado | alta         |             | Cadastro com sucesso! |

  @web @questao @multipla
  Scenario Outline: Cadastrar questao multiplaescolha
    And selecione um dos simulado "<simulado>"
    And selecione um dos texto "<texto>"
    And inserir o codigo "<codigo>"
    And inserir o numero "<numero>"
    And selecione "<tipo>" da questao
    And insira o "<comando>" da questao multiplaescolha
    And inserir a alternativa A "<enunciadoA>", "<assuntoA>", "<recorrenciaA>" e "<orientaçãoA>"
    And inserir a alternativa B "<enunciadoB>", "<assuntoB>", "<recorrenciaB>" e "<orientaçãoB>"
    And marque a laternativa correta "<gabarito>"
    And clicar no botao de Gravar questao
    Then a mensagem para questao multi "<mensagem>"

    Examples: 
      | simulado  | texto     | codigo | numero | tipo            | comando                      | enunciadoA     | recorrenciaA | orientaçãoA | enunciadoB     | recorrenciaB | orientaçãoB | mensagem              |
      | TST-TESTE | TXT-TEXTO | QST7   |      7 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST8   |      8 | Multiplaescolha | Marque a alternativa correta |                | alta         | vazio       |                | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST9   |      9 | Multiplaescolha | Marque a alternativa correta | textoenunciado |              | vazio       | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST10  |     10 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         |             | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST11  |     11 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TESTE | TXT-TEXTO | QST12  |     12 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |

  @web @questao @outros
  Scenario Outline: Cadastrar demais tipos de questao
    And selecione simulado "<simulado>"
    And selecione texto "<texto>"
    And adicionar codigo "<codigo>"
    And adicionar numero "<numero>"
    And selecione "<tipo>" questao
    And insira o "<comando>" da questao multiplaescolha
    And inserir a alternativa A "<enunciadoA>", "<assuntoA>", "<recorrenciaA>" e "<orientaçãoA>"
    And inserir a alternativa B "<enunciadoB>", "<assuntoB>", "<recorrenciaB>" e "<orientaçãoB>"
    And marque a laternativa correta "<gabarito>"
    And clicar no botao de Gravar questao
    Then a mensagem para questao multi "<mensagem>"

    Examples: 
      | simulado | texto      | codigo | numero | tipo     | comando                      | enunciadoA     | recorrenciaA | orientaçãoA | mensagem              |
      | TST-TEST | TEXT-TEXTO | QST13  |     13 | Numérico | Marque a alternativa correta | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | TST-TEST | TEXT-TEXTO | QST14  |     14 | Texto    | Marque a alternativa correta |                | alta         | vazio       | Cadastro com sucesso! |
      | TST-TEST | TEXT-TEXTO | QST15  |     15 | Imagem   | Marque a alternativa correta | textoenunciado |              | vazio       | Cadastro com sucesso! |

  @web @questao @vazio
  Scenario Outline: Cadastrar questao campos em branco
    And selecionar simulado "<simulado>"
    And selecionar texto "<texto>"
    And insira codigo "<codigo>"
    And insira numero "<numero>"
    And escolher "<tipo>" questao
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | simulado | texto      | codigo | numero | tipo     | mensagem                         |
      |          | TEXT-TEXTO | QST    |      1 | Numérico | Campo Simulado obrigatório       |
      | TST-TEST |            | QST    |      2 | texto    | Campo Texto Simulado obrigatório |
      | TST-TEST | TEXT-TEXTO |        |      3 | imagem   | Campo Código obrigatório         |
      | TST-TEST | TEXT-TEXTO | QST    |        | imagem   | Campo Número obrigatório         |
      | TST-TEST | TEXT-TEXTO | QST    |      3 |          | Campo Tipo Questão obrigatório   |

  @web @questao @consultar
  Scenario Outline: Consultar questao mapper
    And rolar pagina de questao
    And buscar o questao pelo "<codigo>"
    Then retorna o "<codigoSimulado>", "<nomeSimulado>", "<codigo>", "<numero>" e "<tipo>" da questao

    Examples: 
      | codigoSimulado | nomeSimulado | codigo | numero | tipo         |
      | TST-TEST       | TESTE        | QST1   |      1 | Certo Errado |
      | TST-TEST       | TESTE        | QST2   |      2 | Certo Errado |
      | TST-TEST       | TESTE        | QST3   |      3 | Certo Errado |
      | TST-TEST       | TESTE        | QST4   |      4 | Certo Errado |
      | TST-TEST       | TESTE        | QST5   |      5 | Certo Errado |
      | TST-TEST       | TESTE        | QST6   |      6 | Certo Errado |

  @web @questao @alterar
  Scenario Outline: Alterar questao mapper
    And rolar pagina de questao para baixo
    And buscar questao pelo "<codigo>"
    When retorna o "<codigoSimulado>", "<nomeSimulado>", "<codigo>", "<numero>" e "<tipo>" da questao buscada
    And clicar no icone de edicao da respectiva questao
    And os dados do questao serao retornados
    And altere "<codigo2>", "<numero2>", "<tipo2>"
    And clique em Alterar questao
    Then a mensagem de alteracao do questao "<mensagem>"

    Examples: 
      | codigoSimulado | nomeSimulado | codigo | numero | tipo            | codigo2 | numero2 | tipo2 | mensagem              |
      | TST-TEST       | TESTE        | QST1   |      1 | Certo Errado    | QS1     |       2 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST2   |      2 | Certo Errado    | QS2     |       3 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST3   |      3 | Certo Errado    | QS3     |       4 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST4   |      4 | Certo Errado    | QS4     |       5 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST5   |      5 | Certo Errado    | QS5     |       6 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST6   |      6 | Certo Errado    | QS6     |       7 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST7   |      7 | Multiplaescolha | QS7     |       8 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST8   |      8 | Multiplaescolha | QS8     |       9 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST9   |      9 | Multiplaescolha | QS9     |      10 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST10  |     10 | Multiplaescolha | QS10    |      11 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST11  |     11 | Multiplaescolha | QS11    |      12 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST12  |     12 | Multiplaescolha | QS12    |      13 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST13  |     13 | Multiplaescolha | QS13    |      14 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST14  |     14 | Multiplaescolha | QS14    |      15 | Texto | Alterado com sucesso! |
      | TST-TEST       | TESTE        | QST15  |     15 | Multiplaescolha | QS15    |      16 | Texto | Alterado com sucesso! |

  @web @questao @excluir
  Scenario Outline: Excluir questao
    And role a pagina de questao
    And buscar o questao "<codigo>"
    And clicar no icone de exclusão de questao
    Then a mensagem "<mensagem>"

    Examples: 
      | codigo | mensagem              |
      | QST1   | Deletado com sucesso! |
      | QST2   | Deletado com sucesso! |
      | QST3   | Deletado com sucesso! |
      | QST4   | Deletado com sucesso! |
      | QST5   | Deletado com sucesso! |
      | QST6   | Deletado com sucesso! |
      | QST7   | Deletado com sucesso! |
      | QST8   | Deletado com sucesso! |
      | QST9   | Deletado com sucesso! |
      | QST10  | Deletado com sucesso! |
      | QST11  | Deletado com sucesso! |
      | QST12  | Deletado com sucesso! |
      | QST13  | Deletado com sucesso! |
      | QST14  | Deletado com sucesso! |
      | QST15  | Deletado com sucesso! |
