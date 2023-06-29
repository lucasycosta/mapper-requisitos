Feature: Ranking simulados

  Background: login ranking
    Given login ranking
    And clicar em Area do Aluno no menu
    And clicar em Ranking Simulado

  @web @ranking @visualizar
  Scenario Outline: Visualizar ranking
    And selecionar um "<simulado>"
    Then o ranking desse simulado sera apresentado

    Examples: 
      | simulado         |
      | [MT1C2] MT_(C2)  |
      | [CN1C2] CNT_(C2) |

  @web @ranking @buscar
  Scenario Outline: buscar aluno do ranking
    And selecionar o "<simulado>"
    When o ranking sera apresentado
    And buscar um aluno pelo "<nome>"
    Then o "<nome>", "<serie>", "<escola>", "<cidade>", "<uf>", "<nota>", "<brasil>", "<estado>" e "<escola>" do aluno retorna

    Examples: 
      | simulado         | nome                | serie  | escola | cidade                | uf    | nota   | brasil | estado | escola |
      | [MT1C2] MT_(C2)  | Larissa Sousa Brito | 2º Ano | Cetep  | Águas Lindas de Goiás | Goiás | 755.75 |      1 |      1 |      1 |
      | [CN1C2] CNT_(C2) | Augusto Soares      | 2º Ano | Cetep  | Águas Lindas de Goiás | Goiás | 738.05 |      1 |      1 |      1 |
