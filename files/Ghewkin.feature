Feature: GET /bank

    Scenario: 200 - Sucesso sem filtros
        Given que deseja listar todos os bancos
        When fizer a requisição para GET /bank
        Then a requisição deve voltar status "200"
        And deve ver a lista de bancos com as infomações de "id", "banco", "estadoAtuacao" e "juros"

    Scenario: 200 - Sucesso filtro por "Estado"
        Given que deseja listar todos os bancos de um determinado estado
        When fizer a requisição para GET /bank
        And tiver inserido o query param "estadoAtuacao" com um value correto
        Then a requisição deve voltar status "200"
        And deve ver a lista de bancos com as infomações de "id", "banco", "estadoAtuacao" e "juros"
        And deve ver apenas bancos do estado informado

    Scenario: 200 - Sucesso filtro por "Banco" - SUGESTÃO
        Given que deseja listar todos os bancos por determinado nome
        When fizer a requisição para GET /bank
        And tiver inserido o query param "banco" com um value exato ou parcial ao que deseja filtrar
        Then a requisição deve voltar status "200"
        And deve ver a lista de bancos com as infomações de "id", "banco", "estadoAtuacao" e "juros"
        And deve ver apenas bancos do estado informado

    Scenario: 200 - Sucesso filtro por "Juros" - SUGESTÃO
        Given que deseja listar todos os bancos por juros
        When fizer a requisição para GET /bank
        And tiver inserido o query param "juros" com um value correto
        Then a requisição deve voltar status "200"
        And deve ver a lista de bancos com as infomações de "id", "banco", "estadoAtuacao" e "juros"
        And deve ver apenas bancos do com valores do juros informado

    Scenario: 400 - Filtros com Tipagem inválida
        Given que deseja listar todos os bancos
        And insere no filtro <filtro> o value <value>
        When fizer a requisição para GET /bank
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | filtro        | value |
        | banco         | 123   |
        | estadoAtuação | 10    |
        | juros         | abc   |

    Scenario: 400 - Filtros em branco
        Given que deseja listar todos os bancos
        And insere no filtro <filtro> o value em branco
        When fizer a requisição para GET /bank
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | filtro        |
        | banco         |
        | estadoAtuação |
        | juros         |

    Scenario: 401 - Autenticação inválida
        Given que deseja listar todos os bancos
        When fizer a requisição para GET /bank
        And insere uma autenticação inválida
        Then a requisição deve voltar status "401"
        And deve ver a mensagem de erro conforme padrões de projeto

Feature: PUT /bank/{id}

    Scenario: 200 - Sucesso Atualização Parcial
        Given que deseja atualizar algumas informações um determinado banco
        And passa no path um id válido
        When fizer a requisição para PUT /bank/{id}
        Then a requisição deve voltar status "200"
        And deve atualizar o banco desejado conforme solicitação
        And deve retornar a "mensagem": "Registro alterado com sucesso!" 

    Scenario: 200 - Sucesso Atualização Completa
        Given que deseja atualizar todas as informações um determinado banco
        And passa no path um id válido
        When fizer a requisição para PUT /bank/{id}
        Then a requisição deve voltar status "200"
        And deve atualizar o banco desejado conforme solicitação
        And deve retornar a "mensagem": "Registro alterado com sucesso!" 


    Scenario: 400 - Campos com Tipagem inválida
        Given que deseja atualizar informações um determinado banco
        And insere no no campo <campo> o value <value>
        When fizer a requisição para PUT /bank/{id}
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | campo         | value |
        | banco         | 123   |
        | estadoAtuação | 10    |
        | juros         | abc   |

    Scenario: 400 - Campos em branco
        Given que deseja atualizar informações um determinado banco
        And insere no no campo <campo> o value em branco
        When fizer a requisição para PUT /bank/{id}
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | campo         |
        | banco         |
        | estadoAtuação |
        | juros         |

    Scenario: 401 - Autenticação inválida
        Given que deseja atualizar informações um determinado banco
        When fizer a requisição para PUT /bank/{id}
        And insere uma autenticação inválida
        Then a requisição deve voltar status "401"
        And deve ver a mensagem de erro conforme padrões de projeto

    Scenario: 404 - Id inexistente - SUGESTÃO
        Given que deseja atualizar informações um determinado banco
        And insere um id inválido
        When fizer a requisição para PUT /bank/{id}
        Then a requisição deve voltar status "404"
        And deve ver a mensagem de erro conforme padrões de projeto

Feature: POST /bank

    Scenario: 201 - Sucesso Cadastro
        Given que deseja cadastrar um novo banco
        And insere informações corretas
        When fizer a requisição para POST /bank
        Then a requisição deve voltar status "201"
        And deve cadastrar o banco conforme solicitação
        And deve retornar a "mensagem": "Banco adicionado com sucesso!" 

    Scenario: 400 - Cadastro com Tipagem inválida
        Given que deseja cadastrar um novo banco
        And insere no no campo <campo> o value <value>
        When fizer a requisição para POST /bank
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | campo         | value |
        | banco         | 123   |
        | estadoAtuação | 10    |
        | juros         | abc   |

    Scenario: 400 - Campos em branco
        Given que deseja cadastrar um novo banco
        And insere no no campo <campo> o value em branco
        When fizer a requisição para POST /bank
        Then a requisição deve voltar status "400"
        And deve ver a mensagem de erro conforme padrões de projeto
        Examples:
        | campo         |
        | banco         |
        | estadoAtuação |
        | juros         |

    Scenario: 401 - Autenticação inválida
        Given que deseja atualizar informações um determinado banco
        When fizer a requisição para PUT /bank/{id}
        And insere uma autenticação inválida
        Then a requisição deve voltar status "401"
        And deve ver a mensagem de erro conforme padrões de projeto

Feature: GET /bank/{id} - SUGESTÃO

    Scenario: 200 - Sucesso
        Given que deseja listar um banco específico
        When fizer a requisição para GET /bank/{id}
        Then a requisição deve voltar status "200"
        And deve ver o banco com as infomações de "id", "banco", "estadoAtuacao" e "juros"

    Scenario: 401 - Autenticação inválida
        Given que deseja listar um banco específico
        When fizer a requisição para GET /bank/{id}
        And insere uma autenticação inválida
        Then a requisição deve voltar status "401"
        And deve ver a mensagem de erro conforme padrões de projeto

    Scenario: 404 - Id inexistente
        Given que deseja listar um banco específico
        And insere um id inválido
        When fizer a requisição para GET /bank/{id}
        Then a requisição deve voltar status "404"
        And deve ver a mensagem de erro conforme padrões de projeto