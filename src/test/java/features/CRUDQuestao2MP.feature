Feature: Crud questao2

  Background: login questao2 mapper
    Given login questao2 mapper
    And clicar em Cadastramento
    And clicar em questao2 simulado
    When abrira a tela de cadastro de questao2

  @web @questao2 @certoerrado
  Scenario Outline: Cadastrar questao2 certo errado
    And insira um codigo "<codigo>" da questao2
    And selecione um texto "<texto>" da questao2
    And selecionar uma dica "<dica>" da questao2
    And inserir um numero "<numero>" da questao2
    And selecione o "<tipo>" da questao2
    And insira o "<comando>" da questao2
    And inserir o primeiro "<gabarito1>", "<enunciado1>", "<assunto1>", "<recorrencia1>" e "<orientação1>" da questao2
    And inserir o segundo "<gabarito2>", "<enunciado2>", "<assunto2>", "<recorrencia2>" e "<orientação2>" da questao2
    And clicar no botao Gravar questao2
    Then a mensagem para questao2 "<mensagem>"

    Examples: 
      | codigo     | texto     | dica | numero | tipo         | comando         | gabarito1 | enunciado1     | recorrencia1 | orientação1 | gabarito2 | enunciado2     | recorrencia2 | orientação2 | mensagem              |
      | COD-TESTE1 | TXT-TEXTO | DC1  |      1 | Certo Errado | Julgue os itens | C         | textoenunciado | alta         | vazio       | E         | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE2 | TXT-TEXTO | DC1  |      2 | Certo Errado |                 | E         | textoenunciado | alta         | vazio       | C         | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE3 | TXT-TEXTO | DC1  |      3 | Certo Errado | Julgue os itens |           | textoenunciado | alta         | vazio       |           | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE4 | TXT-TEXTO | DC1  |      4 | Certo Errado | Julgue os itens | E         |                | alta         | vazio       | E         |                | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE5 | TXT-TEXTO | DC1  |      5 | Certo Errado | Julgue os itens | E         | textoenunciado |              | vazio       | C         | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | COD-TESTE6 | TXT-TEXTO | DC1  |      6 | Certo Errado | Julgue os itens | E         | textoenunciado | alta         |             | C         | textoenunciado | alta         |             | Cadastro com sucesso! |

  @web @questao2 @multipla
  Scenario Outline: Cadastrar questao2 multiplaescolha
    And insira codigo "<codigo>" da questao2
    And selecione texto "<texto>" da questao2
    And selecionar dica "<dica>" da questao2
    And inserir numero "<numero>" da questao2
    And selecione "<tipo>" da questao2
    And insira o "<comando>" da questao2 multiplaescolha
    And inserir a alternativa A "<enunciadoA>", "<assuntoA>", "<recorrenciaA>" e "<orientaçãoA>" da questao2
    And inserir a alternativa B "<enunciadoB>", "<assuntoB>", "<recorrenciaB>" e "<orientaçãoB>" da questao2
    And marque a laternativa correta "<gabarito>" da questao2
    And clicar no botao de Gravar questao2
    Then a mensagem para questao2 multi "<mensagem>"

    Examples: 
      | codigo      | texto     | dica | numero | tipo            | comando                      | enunciadoA     | recorrenciaA | orientaçãoA | enunciadoB     | recorrenciaB | orientaçãoB | mensagem              |
      | COD-TESTE7  | TXT-TEXTO | DC1  |      7 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE8  | TXT-TEXTO | DC1  |      8 | Multiplaescolha | Marque a alternativa correta |                | alta         | vazio       |                | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE9  | TXT-TEXTO | DC1  |      9 | Multiplaescolha | Marque a alternativa correta | textoenunciado |              | vazio       | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | COD-TESTE10 | TXT-TEXTO | DC1  |     10 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         |             | textoenunciado |              | vazio       | Cadastro com sucesso! |
      | COD-TESTE11 | TXT-TEXTO | DC1  |     11 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TESTE12 | TXT-TEXTO | DC1  |     12 | Multiplaescolha | Marque a alternativa correta | textoenunciado | alta         | vazio       | textoenunciado | alta         | vazio       | Cadastro com sucesso! |

  @web @questao2 @outros
  Scenario Outline: Cadastrar demais tipos de questao2
    And insira codigo "<codigo>" da questao
    And selecione texto "<texto>" da questao
    And selecionar dica "<dica>" da questao
    And inserir numero "<numero>" da questao
    And selecione "<tipo>" da questao
    And insira o "<comando>" da questao de multiplaescolha
    And inserir a alternativa A "<enunciadoA>", "<assuntoA>", "<recorrenciaA>" e "<orientaçãoA>" da COD-TEST
    And inserir a alternativa B "<enunciadoB>", "<assuntoB>", "<recorrenciaB>" e "<orientaçãoB>" da COD-TEST
    And marque a laternativa correta "<gabarito>"
    And clicar no botao de Gravar da questao2
    Then a mensagem para questao2 multi "<mensagem>"

    Examples: 
      | codigo     | texto      | dica | numero | tipo     | comando                      | enunciadoA     | recorrenciaA | orientaçãoA | mensagem              |
      | COD-TEST13 | TEXT-TEXTO | DC1  |     13 | Numérico | Marque a alternativa correta | textoenunciado | alta         | vazio       | Cadastro com sucesso! |
      | COD-TEST14 | TEXT-TEXTO | DC1  |     14 | Texto    | Marque a alternativa correta |                | alta         | vazio       | Cadastro com sucesso! |
      | COD-TEST15 | TEXT-TEXTO | DC1  |     15 | Imagem   | Marque a alternativa correta | textoenunciado |              | vazio       | Cadastro com sucesso! |

  @web @questao2 @vazio
  Scenario Outline: Cadastrar questao2 campos em branco
    And insira codigo "<codigo>" para questao
    And selecione texto "<texto>" para questao
    And selecionar dica "<dica>" para questao
    And inserir numero "<numero>" para questao
    And selecione "<tipo>" para questao
    Then a mensagem dos campos "<mensagem>" para questao2

    Examples: 
      | codigo   | texto      | dica     | numero | tipo     | mensagem                         |
      |          | TEXT-TEXTO | COD-TEST |      1 | Numérico | Campo Código obrigatório         |
      | COD-TEST |            | COD-TEST |      2 | texto    | Campo Texto Simulado obrigatório |
      | COD-TEST | TEXT-TEXTO |          |      3 | imagem   | Campo Dica obrigatório           |
      | COD-TEST | TEXT-TEXTO | COD-TEST |        | imagem   | Campo Número obrigatório         |
      | COD-TEST | TEXT-TEXTO | COD-TEST |      3 |          | Campo Tipo questao obrigatório   |

  @web @questao2 @consultar
  Scenario Outline: Consultar questao2 mapper
    And rolar pagina de questao2
    And buscar o questao2 pelo "<codigo>"
    Then retorna o "<codigo>", "<numero>" e "<tipo>" da questao2

    Examples: 
      | codigo    | numero | tipo         |
      | COD-TEST1 |      1 | Certo Errado |
      | COD-TEST2 |      2 | Certo Errado |
      | COD-TEST3 |      3 | Certo Errado |
      | COD-TEST4 |      4 | Certo Errado |
      | COD-TEST5 |      5 | Certo Errado |
      | COD-TEST5 |      6 | Certo Errado |

  @web @questao2 @alterar
  Scenario Outline: Alterar questao2 mapper
    And rolar pagina de questao2 para baixo
    And buscar questao2 pelo "<codigo>"
    When retorna o "<codigo>", "<numero>" e "<tipo>" da questao2 buscada
    And clicar no icone de edicao da respectiva questao2
    And os dados do questao2 serao retornados
    And altere "<codigo2>", "<numero2>", "<tipo2>"
    And clique em Alterar questao2
    Then a mensagem de alteracao do questao2 "<mensagem>"

    Examples: 
      | codigo     | numero | tipo            | codigo2     | numero2 | tipo2 | mensagem              |
      | COD-TEST1  |      1 | Certo Errado    | COD-TESTe1  |       2 | Texto | Alterado com sucesso! |
      | COD-TEST2  |      2 | Certo Errado    | COD-TESTe2  |       3 | Texto | Alterado com sucesso! |
      | COD-TEST3  |      3 | Certo Errado    | COD-TESTe3  |       4 | Texto | Alterado com sucesso! |
      | COD-TEST4  |      4 | Certo Errado    | COD-TESTe4  |       5 | Texto | Alterado com sucesso! |
      | COD-TEST5  |      5 | Certo Errado    | COD-TESTe5  |       6 | Texto | Alterado com sucesso! |
      | COD-TEST6  |      6 | Certo Errado    | COD-TESTe6  |       7 | Texto | Alterado com sucesso! |
      | COD-TEST7  |      7 | Multiplaescolha | COD-TESTe7  |       8 | Texto | Alterado com sucesso! |
      | COD-TEST8  |      8 | Multiplaescolha | COD-TESTe8  |       9 | Texto | Alterado com sucesso! |
      | COD-TEST9  |      9 | Multiplaescolha | COD-TESTe9  |      10 | Texto | Alterado com sucesso! |
      | COD-TEST10 |     10 | Multiplaescolha | COD-TESTe10 |      11 | Texto | Alterado com sucesso! |
      | COD-TEST11 |     11 | Multiplaescolha | COD-TESTe11 |      12 | Texto | Alterado com sucesso! |
      | COD-TEST12 |     12 | Multiplaescolha | COD-TESTe12 |      13 | Texto | Alterado com sucesso! |
      | COD-TEST13 |     13 | Multiplaescolha | COD-TESTe13 |      14 | Texto | Alterado com sucesso! |
      | COD-TEST14 |     14 | Multiplaescolha | COD-TESTe14 |      15 | Texto | Alterado com sucesso! |
      | COD-TEST15 |     15 | Multiplaescolha | COD-TESTe15 |      16 | Texto | Alterado com sucesso! |

  @web @questao2 @excluir
  Scenario Outline: Excluir questao2
    And role a pagina de questao2
    And buscar o questao2 "<codigo>"
    And clicar no icone de exclusão de questao2
    Then a mensagem "<mensagem>"

    Examples: 
      | codigo      | mensagem              |
      | COD-TESTe1  | Deletado com sucesso! |
      | COD-TESTe2  | Deletado com sucesso! |
      | COD-TESTe3  | Deletado com sucesso! |
      | COD-TESTe4  | Deletado com sucesso! |
      | COD-TESTe5  | Deletado com sucesso! |
      | COD-TESTe6  | Deletado com sucesso! |
      | COD-TESTe7  | Deletado com sucesso! |
      | COD-TESTe8  | Deletado com sucesso! |
      | COD-TESTe9  | Deletado com sucesso! |
      | COD-TESTe10 | Deletado com sucesso! |
      | COD-TESTe11 | Deletado com sucesso! |
      | COD-TESTe12 | Deletado com sucesso! |
      | COD-TESTe13 | Deletado com sucesso! |
      | COD-TESTe14 | Deletado com sucesso! |
      | COD-TESTe15 | Deletado com sucesso! |
