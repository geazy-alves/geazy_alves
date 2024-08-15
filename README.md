# geazy_alves
Aula de ENGENHARIA DE SOFTWARE

Sistema para clinica veterinaria..
 
 Autor: Geazy Alves Lacerda  
---
# 1. Descrição de sistema
 Sistema para clinica veterinaria..
 
 Nome da clinica: Veterinaria São Paulo

1. Uma clínica veterinária atende apenas os animais: gatos e cachorros. 
2. Os clientes devem fazer um cadastro de si e dos animais. 
3. Os clientes devem informar as condições nas quais os animais chegam. 
4. Os clientes devem informar o tipo de ração que o animal come. 
5. O cliente deve informar hábitos do animal. 
6. Para cada animal é possível que mais de um veterinário o atenda. 
7. Os animais podem chegar e serem atendidos de acordo com uma agenda do dia. 
8. Cada animal atendido receberá uma ficha e um prontuário. 
9. Outros donos podem querer marcar horários de atendimento futuro. 
10. O atendimento gera uma receita para o animal. 
11. Quando um cliente chega na clínica veterinária ele é atendido por um atendente. 
12. O atendente deve verificar se existe agenda disponível com um veterinário. 
13. O atendente deve colocar o cliente e seu animal na fila de espera, se for o caso. 
14. O atendente deve levar o cliente e o animal até o veterinário. 
15. O veterinário deve realizar uma entrevista com o dono do animal. 
16. O resultado da entrevista deve ir para um formulário. 
17. O veterinário deverá examinar o animal e anotar em prontuário(ficha) suas observações. 
18. Dependendo da situação do animal este receberá uma receita.
19. Horário de funcionamento: das 07:00 às 15:00.
20. O acompanhamento em tempo real deve estar disponível.
21. A clínica deve oferecer serviços de vacinação e controle de parasitas.
22. A clínica deve manter um arquivo digitalizado de todos os prontuários e receitas.
23. A lista de espera deve seguir a ordem de prioridade.
24. O acompanhamento em tempo real deve estar disponível.
25. A clínica deve fornecer orientações pós.atendimento para os donos dos animais.
26. A clínica deve ter uma área de isolamento para animais com doenças contagiosas.
27. A clínica deve disponibilizar um serviço de emergência fora do horário de funcionamento.

---
 # 2. Diagrama do banco do dados
 ```mermaid
 
 erDiagram
    CLIENTE {
        int id_cliente PK
        string nome
        string telefone
        string endereco
    }
    
    ANIMAL {
        int id_animal PK
        string nome
        string tipo
        string condicao
        string racao
        string habitos
    }
    
    VETERINARIO {
        int id_veterinario PK
        string nome
        string especialidade
    }
    
    ATENDENTE {
        int id_atendente PK
        string nome
    }
    
    AGENDA {
        int id_agenda PK
        datetime data_hora
        int id_veterinario FK
        int id_animal FK
        boolean atendido
        string prioridade
    }
    
    FICHA {
        int id_ficha PK
        int id_animal FK
        datetime data_abertura
        string observacoes
        string receita
    }

    FORMULARIO {
        int id_formulario PK
        int id_animal FK
        int id_veterinario FK
        datetime data
        string detalhes_entrevista
    }

    CLIENTE ||--o{ ANIMAL: "possui"
    ANIMAL ||--o{ AGENDA: "tem"
    VETERINARIO ||--o{ AGENDA: "atua em"
    ANIMAL ||--o{ FICHA: "possui"
    CLIENTE ||--o{ AGENDA: "agenda"
    ATENDENTE ||--o{ AGENDA: "processa"
    ANIMAL ||--o{ FORMULARIO: "tem"
    VETERINARIO ||--o{ FORMULARIO: "preenche"

 ```
![Diagrama do banco do dados](https://github.com/geazy-alves/geazy_alves/blob/main/imagens/Diagrama%20do%20banco%20do%20dados.png)
---
 # 3. Diagrama de casos de uso


![](https://raw.githubusercontent.com/geazy-alves/geazy_alves/eb3d35062fb3a434f23ef299aefc34607efa41a0/imagens/Diagrama%20sem%20nome.drawio.png)

---
 # 4. Principais telas do sistema 
![]()

 ---
 # 5. Arquitetura do sistema 
![]()

...
