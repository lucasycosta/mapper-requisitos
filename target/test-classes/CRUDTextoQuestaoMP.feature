Feature: Crud textoQuestao

  Background: login textoQuestao mapper
    Given login textoQuestao mapper
    And clicar em Cadastramento
    And clicar em textoQuestao
    When abrira a tela de cadastro de textoQuestao

  @web @textoQuestao @sucesso
  Scenario Outline: Cadastrar textoQuestao com sucesso
    And inserir o codigo do textoQuestao "<codigo>"
    And inserir o nome do textoQuestao "<nome>"
    Then na primeira parte insira "<imagem1>", "<imagem2>" e "<imagem3>" de texto
    And inserir a "<fonte1>", "<fonte2>" e "<fonte3>" da primeira parte de texto
    And inserir o textoQuestao1 "<textoQuestao1>"
    And inserir a fonte do textoQuestao1 "<fontetxt1>"
    And clicar no botao Gravar textoQuestao
    Then a mensagem para textoQuestao "<mensagem>"

    Examples: 
      | codigo | nome          | imagem1              | imagem2              | imagem3              | fonte1       | fonte2       | fonte3       | textoQuestao1   | fontetxt1 | mensagem              |
      | TXT1   | textoQuestao1 | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | textoQuestaoOOO | vazio     | Cadastro com sucesso! |
      | TXT2   | textoQuestao2 | D:\\textoQuestao.jpg |                      |                      | fonteimagem1 |              |              | textoQuestaoOOO | vazio     | Cadastro com sucesso! |
      | TXT3   | textoQuestao3 | D:\\textoQuestao.jpg |                      |                      |              |              |              | textoQuestaoOOO |           | Cadastro com sucesso! |
      | TXT4   | textoQuestao4 |                      | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg |              | fonteimagem2 |              |                 |           | Cadastro com sucesso! |
      | TXT5   | textoQuestao5 |                      |                      |                      |              |              |              | textoQuestaoOOO | vazio     | Cadastro com sucesso! |
      | TXT6   | textoQuestao6 |                      |                      |                      |              |              |              |                 |           | Cadastro com sucesso! |
      | TXT7   | textoQuestao7 |                      |                      |                      |              |              |              | textoQuestaoOOO | vazio     | Cadastro com sucesso! |
      | TXT8   | textoQuestao8 | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | textoQuestaoOOO | vazio     | Cadastro com sucesso! |

  @web @textoQuestao @vazio
  Scenario Outline: Cadastrar textoQuestao campos em branco
    And inserir codigo do textoQuestao "<codigo>"
    And inserir nome do textoQuestao "<nome>"
    Then inserir "<imagem1>", "<imagem2>" e "<imagem3>"
    And inserir "<fonte1>", "<fonte2>" e "<fonte3>"
    And inserir textoQuestao1 "<textoQuestao1>"
    And inserir fonte do textoQuestao1 "<fontetxt1>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | codigo | nome          | imagem1              | imagem2              | imagem3              | fonte1       | fonte2       | fonte3       | textoQuestao1   | fontetxt1 | mensagem                     |
      |        | textoQuestao1 | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | D:\\textoQuestao.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | textoQuestaoOOO | vazio     | O campo Código é obrigatório |
      | TXT2   |               | D:\\textoQuestao.jpg |                      |                      | fonteimagem1 |              |              | textoQuestaoOOO | vazio     | O campo Nome é obrigatório   |

  @web @textoQuestao @consultar
  Scenario Outline: Consultar textoQuestao mapper
    And rolar pagina de textoQuestao
    And buscar o textoQuestao pelo "<codigo>"
    Then retorna o "<codigo>" e "<nome>" do textoQuestao

    Examples: 
      | codigo | nome          |
      | TXT1   | textoQuestao1 |
      | TXT2   | textoQuestao2 |
      | TXT3   | textoQuestao3 |
      | TXT4   | textoQuestao4 |
      | TXT5   | textoQuestao5 |
      | TXT6   | textoQuestao6 |
      | TXT7   | textoQuestao7 |
      | TXT8   | textoQuestao8 |

  @web @textoQuestao @alterar
  Scenario Outline: Alterar textoQuestao mapper
    And rolar pagina de textoQuestao para baixo
    And buscar textoQuestao pelo "<codigo>"
    When retorna o "<codigo>" e "<nome>" do textoQuestao buscada
    And clicar no icone de edicao da respectiva textoQuestao
    And os dados do textoQuestao serao retornados
    And altere "<codigo2>", "<nome2>", "<imagem>" e "<textoQuestao>"
    And clique em Alterar textoQuestao
    Then a mensagem de alteracao do textoQuestao "<mensagem>"

    Examples: 
      | codigo | nome          | codigo2 | nome2          | textoQuestao                   | imagem            | mensagem              |
      | TXT1   | textoQuestao1 | TXTo1   | textoQuestaos1 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT2   | textoQuestao2 | TXTo2   | textoQuestaos2 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT3   | textoQuestao3 | TXTo3   | textoQuestaos3 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT4   | textoQuestao4 | TXTo4   | textoQuestaos4 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT5   | textoQuestao5 | TXTo5   | textoQuestaos5 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT6   | textoQuestao6 | TXTo6   | textoQuestaos6 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT7   | textoQuestao7 | TXTo7   | textoQuestaos7 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT8   | textoQuestao8 | TXTo8   | textoQuestaos8 | textoQuestaooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |

  @web @textoQuestao @excluir
  Scenario Outline: Excluir textoQuestao
    And role a pagina de textoQuestao
    And buscar o textoQuestao "<codigo>"
    And clicar no icone de exclusão de textoQuestao
    Then a mensagem "<mensagem>"

    Examples: 
      | sigla | mensagem              |
      | TXT1  | Deletado com sucesso! |
      | TXT2  | Deletado com sucesso! |
      | TXT3  | Deletado com sucesso! |
      | TXT4  | Deletado com sucesso! |
      | TXT5  | Deletado com sucesso! |
      | TXT6  | Deletado com sucesso! |
      | TXT7  | Deletado com sucesso! |
      | TXT8  | Deletado com sucesso! |
