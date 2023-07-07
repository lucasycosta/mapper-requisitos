Feature: Crud simulado

  Background: login simulado mapper
    Given login simulado mapper
    And clicar em Simulado no menu
    And clicar em simulado
    When abrira a tela de cadastro de simulado

  @web @simulado @sucesso
  Scenario Outline: Cadastrar simulado com sucesso
    And inserir o codigo do simulado "<codigo>"
    And inserir o nome do simulado "<nome>"
    And inserir o tempo do simulado "<tempo>"
    And selecione o semetre do simulado "<semestre>"
    And insira o gabarito do simulado "<gabarito>"
    And selecione a faculdade do simulado "<faculdade>"
    And selecione a area de conhecimento do simulado "<area>"
    And insira a data do simulado "<data>"
    And selecione o ano do simulado "<ano>"
    And clicar no botao Gravar simulado
    Then a mensagem para simulado "<mensagem>"

    Examples: 
      | codigo | nome      | tempo | semestre    | gabarito         | faculade                                | area               | data     | ano  | mensagem                |
      | SML1   | Simulado1 |  0230 | Anual       | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | Cadastrado com sucesso! |
      | SML2   | Simulado2 |  0230 | 1º Semestre | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | Cadastrado com sucesso! |
      | SML3   | Simulado3 |  0230 | 2º Sementre | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | Cadastrado com sucesso! |
      | SML4   | Simulado4 |  0230 | Anual       | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | Cadastrado com sucesso! |

  @web @simulado @vazio
  Scenario Outline: Cadastrar simulado campos em branco
    And inserir codigo do simulado "<codigo>"
    And inserir nome do simulado "<nome>"
    And inserir tempo do simulado "<tempo>"
    And selecione semetre do simulado "<semestre>"
    And insira gabarito do simulado "<gabarito>"
    And selecione faculdade do simulado "<faculdade>"
    And selecione area de conhecimento do simulado "<area>"
    And insira data do simulado "<data>"
    And selecione ano do simulado "<ano>"
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | codigo | nome      | tempo | semestre    | gabarito         | faculade                                | area               | data     | ano  | mensagem                                |
      |        | Simulado1 |  0230 | Anual       | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | O campo Codigo é obrigatório            |
      | SML2   |           |  0230 | 1º Semestre | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | O campo Nome é obrigatório              |
      | SML3   | Simulado3 |       | 2º Sementre | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | O campo Tempo é obrigatório             |
      | SML4   | Simulado4 |  0230 |             | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | O campo Semestre é obrigatório          |
      | SML5   | Simulado5 |  0230 | Anual       |                  | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 | 2023 | O campo Gabarito é obrigatório          |
      | SML6   | Simulado6 |  0230 | 1º Semestre | D:\\gabarito.pdf |                                         | Conhecimento Geral | 30062023 | 2023 | O campo Faculdade é obrigatório         |
      | SML7   | Simulado7 |  0230 | 2º Sementre | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio |                    | 30062023 | 2023 | O campo Área Conhecimento é obrigatório |
      | SML8   | Simulado8 |  0230 | Anual       | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral |          | 2023 | O campo Data Início é obrigatório       |
      | SML9   | Simulado9 |  0230 | Anual       | D:\\gabarito.pdf | Enem MEC-Exame Nacional do Ensino Médio | Conhecimento Geral | 30062023 |      | O campo Ano é obrigatório               |

  @web @simulado @consultar
  Scenario Outline: Consultar simulado mapper
    And rolar pagina de simulado
    And buscar simulado pelo "<codigo>"
    Then retorna o "<codigo>", "<nome>", "<data>" e "<periodo>" do simulado

    Examples: 
      | codigo | nome      | data       | periodo          |
      | SML1   | Simulado1 | 30/06/2023 | Anual/2023       |
      | SML1   | Simulado1 | 30/06/2023 | 1º Sementre/2023 |
      | SML1   | Simulado1 | 30/06/2023 | 2º Sementre/2023 |
      | SML1   | Simulado1 | 30/06/2023 | Anual/2023       |

  @web @simulado @alterar
  Scenario Outline: Alterar simulado mapper
    And rolar pagina de simulado para baixo
    And buscar o simulado pelo "<codigo>"
    When retorna o "<codigo>", "<nome>", "<data>" e "<periodo>" do simulado buscado
    And clicar no icone de edicao da respectiva simulado
    And os dados do simulado serao retornados
    And altere "<codigo2>", "<nome2>", "<tempo>", "<semestre>", "<faculdade>", "<area>", "<data>", "<ano>"
    And clique em Finalizado
    And clique em Alterar simulado
    Then a mensagem de alteracao do simulado "<mensagem>"

    Examples: 
      | codigo | nome      | data       | periodo          | codigo2 | nome2 | tempo | semestre | faculdade                               | area    | data     | ano  | mensagem              |
      | SML1   | Simulado1 | 30/06/2023 | Anual/2023       | SIML1   | Sim1  |  0300 | Janeiro  | Enem MEC-Exame Nacional do Ensino Médio | Redação | 01072023 | 2024 | Alterado com sucesso! |
      | SML2   | Simulado2 | 30/06/2023 | 1º Sementre/2023 | SIML2   | Sim2  |  0300 | Janeiro  | Enem MEC-Exame Nacional do Ensino Médio | Redação | 01072023 | 2024 | Alterado com sucesso! |
      | SML3   | Simulado3 | 30/06/2023 | 2º Sementre/2023 | SIML3   | Sim3  |  0300 | Janeiro  | Enem MEC-Exame Nacional do Ensino Médio | Redação | 01072023 | 2024 | Alterado com sucesso! |
      | SML4   | Simulado4 | 30/06/2023 | Anual/2023       | SIML4   | Sim4  |  0300 | Janeiro  | Enem MEC-Exame Nacional do Ensino Médio | Redação | 01072023 | 2024 | Alterado com sucesso! |

  @web @simulado @excluir
  Scenario Outline: Excluir simulado
    And role a pagina de simulado
    And buscar o simulado "<codigo>"
    And clicar no icone de exclusão de simulado
    Then a mensagem "<mensagem>"

    Examples: 
      | sigla | mensagem              |
      | SIML1 | Deletado com sucesso! |
      | SIML2 | Deletado com sucesso! |
      | SIML3 | Deletado com sucesso! |
      | SIML4 | Deletado com sucesso! |
