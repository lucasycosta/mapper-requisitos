Feature: Crud texto

  Background: login texto mapper
    Given login texto mapper
    And clicar em Simulado
    And clicar em texto
    When abrira a tela de cadastro de texto

  @web @texto @sucesso
  Scenario Outline: Cadastrar texto com sucesso
    And inserir o codigo do texto "<codigo>"
    And inserir o nome do texto "<nome>"
    Then na primeira parte insira "<imagem1>", "<imagem2>" e "<imagem3>"
    And inserir a "<fonte1>", "<fonte2>" e "<fonte3>" da primeira parte
    And inserir o texto1 "<texto1>"
    And inserir a fonte do texto1 "<fontetxt1>"
    And clicar no botao Gravar texto
    Then a mensagem para texto "<mensagem>"

    Examples: 
      | codigo | nome   | imagem1       | imagem2       | imagem3       | fonte1       | fonte2       | fonte3       | texto1   | fontetxt1 | mensagem              |
      | TXT1   | Texto1 | D:\\texto.jpg | D:\\texto.jpg | D:\\texto.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | TEXTOOOO | vazio     | Cadastro com sucesso! |
      | TXT2   | Texto2 | D:\\texto.jpg |               |               | fonteimagem1 |              |              | TEXTOOOO | vazio     | Cadastro com sucesso! |
      | TXT3   | Texto3 | D:\\texto.jpg |               |               |              |              |              | TEXTOOOO |           | Cadastro com sucesso! |
      | TXT4   | Texto4 |               | D:\\texto.jpg | D:\\texto.jpg |              | fonteimagem2 |              |          |           | Cadastro com sucesso! |
      | TXT5   | Texto5 |               |               |               |              |              |              | TEXTOOOO | vazio     | Cadastro com sucesso! |
      | TXT6   | Texto6 |               |               |               |              |              |              |          |           | Cadastro com sucesso! |
      | TXT7   | Texto7 |               |               |               |              |              |              | TEXTOOOO | vazio     | Cadastro com sucesso! |
      | TXT8   | Texto8 | D:\\texto.jpg | D:\\texto.jpg | D:\\texto.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | TEXTOOOO | vazio     | Cadastro com sucesso! |

  @web @texto @vazio
  Scenario Outline: Cadastrar texto campos em branco
    And inserir codigo do texto "<codigo>"
    And inserir nome do texto "<nome>"
    Then inserir "<imagem1>", "<imagem2>" e "<imagem3>"
    And inserir "<fonte1>", "<fonte2>" e "<fonte3>"
    And inserir texto1 "<texto1>"
    And inserir fonte do texto1 "<fontetxt1>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | codigo | nome   | imagem1       | imagem2       | imagem3       | fonte1       | fonte2       | fonte3       | texto1   | fontetxt1 | mensagem                     |
      |        | Texto1 | D:\\texto.jpg | D:\\texto.jpg | D:\\texto.jpg | fonteimagem1 | fonteimagem2 | fonteimagem3 | TEXTOOOO | vazio     | O campo Código é obrigatório |
      | TXT2   |        | D:\\texto.jpg |               |               | fonteimagem1 |              |              | TEXTOOOO | vazio     | O campo Nome é obrigatório   |

  @web @texto @consultar
  Scenario Outline: Consultar texto mapper
    And rolar pagina de texto
    And buscar o texto pelo "<codigo>"
    Then retorna o "<codigo>" e "<nome>" do texto

    Examples: 
      | codigo | nome   |
      | TXT1   | Texto1 |
      | TXT2   | Texto2 |
      | TXT3   | Texto3 |
      | TXT4   | Texto4 |
      | TXT5   | Texto5 |
      | TXT6   | Texto6 |
      | TXT7   | Texto7 |
      | TXT8   | Texto8 |

  @web @texto @alterar
  Scenario Outline: Alterar texto mapper
    And rolar pagina de texto para baixo
    And buscar texto pelo "<codigo>"
    When retorna o "<codigo>" e "<nome>" do texto buscada
    And clicar no icone de edicao da respectiva texto
    And os dados do texto serao retornados
    And altere "<codigo2>", "<nome2>", "<imagem>" e "<texto>"
    And clique em Alterar texto
    Then a mensagem de alteracao do texto "<mensagem>"

    Examples: 
      | codigo | nome   | codigo2 | nome2   | texto                   | imagem            | mensagem              |
      | TXT1   | Texto1 | TXTo1   | Textos1 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT2   | Texto2 | TXTo2   | Textos2 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT3   | Texto3 | TXTo3   | Textos3 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT4   | Texto4 | TXTo4   | Textos4 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT5   | Texto5 | TXTo5   | Textos5 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT6   | Texto6 | TXTo6   | Textos6 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT7   | Texto7 | TXTo7   | Textos7 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |
      | TXT8   | Texto8 | TXTo8   | Textos8 | textooooooooooo ooooooo | D:\\faculdade.jpg | Alterado com sucesso! |

  @web @texto @excluir
  Scenario Outline: Excluir texto
    And role a pagina de texto
    And buscar o texto "<codigo>"
    And clicar no icone de exclusão de texto
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
