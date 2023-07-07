Feature: Crud materia

  Background: login materia mapper
    Given login materia   mapper
    And clicar em Cadastramento
    And clicar em materia
    When abrira a tela de cadastro de materia

  @web @materia @sucesso
  Scenario Outline: Cadastrar materia com sucesso
    And inserir o codigo da materia "<codigo>"
    And inserir o nome da materia "<nome>"
    And inserir o "<texto>" e o "<pdf>" da materia
    And inserir o "<textoUrl>" e a "<url>" da materia
    And clicar no botao Gravar materia
    Then a mensagem para materia "<mensagem>"

    Examples: 
      | codigo  | nome         | texto         | pdf              | textoUrl      | url                                                                                 | mensagem                |
      | MATTST1 | MateriaTest1 | TESTE MATERIA | D:\\materia-.pdf | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | Cadastrado com sucesso! |
      | MATTST2 | MateriaTest2 | TESTE MATERIA | D:\\materia.pdf  | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | Cadastrado com sucesso! |
      | MATTST3 | MateriaTest3 | TESTE MATERIA | D:\\materia.pdf  | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | Cadastrado com sucesso! |
      | MATTST4 | MateriaTest4 | TESTE MATERIA | D:\\materia.pdf  | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | Cadastrado com sucesso! |

  @web @materia @vazio
  Scenario Outline: Cadastrar materia campos em branco
    And inserir codigo da materia "<codigo>"
    And inserir nome da materia "<nome>"
    And inserir "<texto>" e o "<pdf>" da materia
    And inserir "<textoUrl>" e a "<url>" da materia
    Then a mensagem dos campos "<mensagem>"

    Examples: 
      | codigo  | nome         | texto         | pdf              | textoUrl      | url                                                                                 | mensagem                     |
      |         | MateriaTest1 | TESTE MATERIA | D:\\materia-.pdf | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | O campo Código é obrigatório |
      | MATTST2 |              | TESTE MATERIA | D:\\materia.pdf  | TESTE MATERIA | https://www.youtube.com/watch?v=e78_5WIssSU&list=PLTPg64KdGgYhYpS5nXdFgdqEZDOS5lARB | O campo Nome é obrigatório   |

  @web @materia @consultar
  Scenario Outline: Consultar materia mapper
    And rolar pagina de materia
    And buscar a materia pelo "<nome>"
    Then retorna o "<codigo>" e "<nome>" da materia

    Examples: 
      | codigo  | nome         |
      | MATTST1 | MateriaTest1 |
      | MATTST2 | MateriaTest2 |
      | MATTST3 | MateriaTest3 |
      | MATTST4 | MateriaTest4 |

  @web @materia @alterar
  Scenario Outline: Alterar materia mapper
    And rolar pagina de materia para baixo
    And buscar materia pelo "<nome>"
    When retorna o "<codigo>" e "<nome>" da materia buscada
    And clicar no icone de edicao da respectiva materia
    And os dados do materia serao retornados
    And altere "<codigo2>" e "<nome2>"
    And clique em Alterar materia
    Then a mensagem de alteracao do materia   "<mensagem>"

    Examples: 
      | codigo  | nome         | codigo2 | nome2         | mensagem              |
      | MATTST1 | MateriaTest1 | PSTS1   | MateriaTeste1 | Alterado com sucesso! |
      | MATTST2 | MateriaTest2 | PSTS2   | MateriaTeste2 | Alterado com sucesso! |
      | MATTST3 | MateriaTest3 | PSTS3   | MateriaTeste3 | Alterado com sucesso! |
      | MATTST4 | MateriaTest4 | PSTS4   | MateriaTeste4 | Alterado com sucesso! |

  @web @materia @excluir
  Scenario Outline: Excluir materia
    And role a pagina de materia
    And buscar o materia "<nome>"
    And clicar no icone de exclusão de materia
    Then a mensagem "<mensagem>"

    Examples: 
      | nome          | mensagem              |
      | MateriaTeste1 | Deletado com sucesso! |
      | MateriaTeste2 | Deletado com sucesso! |
      | MateriaTeste3 | Deletado com sucesso! |
      | MateriaTeste4 | Deletado com sucesso! |
