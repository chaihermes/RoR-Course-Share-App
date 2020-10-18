# Ruby on Rails - Course Share App Challenge

Este desafio é proposto para validar todas as habilidades consideradas básicas
para um desenvolvedor Ruby on Rails. A proposta é baseada em sistemas como a
_Udemy_ e o _Skillshare_, com certas modificações e sem necessidade da implementação
da área de cursos em si (maior complexidade), mas sim voltado para o Marketplace dos cursos.
No sistema todos os usuários poderão vender ou comprar cursos utilizando moedas
virtuais adquiridas com as vendas dos próprios cursos. Havendo também usuários
administradores com permissão para remover cursos da plataforma ou estornar compras.

- [Ruby on Rails - Course Share App Challenge](#ruby-on-rails---course-share-app-challenge)
  - [Requisitos gerais](#requisitos-gerais)
  - [Observações gerais](#observações-gerais)
  - [Bancos de dados](#bancos-de-dados)

## Requisitos gerais

Os requisitos deixados em itálico não são obrigatórios, mas o êxito em executá-los
seria bem vindo.

1. Deverá existir ao menos dois perfis de usuários, o usuário comum e o administrador
2. O sistema deverá possuir uma área administrativa, onde os usuários administradores
   poderão:
   1. Consultar as vendas dos cursos
   2. Estornar compras de cursos (removendo o acesso e devolvendo a pontuação)
   3. Apagar cursos, estornando todas as compras (para cursos que violem diretrizes de uso ou direitos autorais)
   4. *Banir usuários temporária ou permanentemente, impossibilitando o seu acesso por má conduta*
3. O usuário não autenticado poderá:
   1. Consultar a listagem e descrição dos cursos com seus preços e avaliações
   2. Se autenticar
      1. Utilizando credenciais de uso exclusivo da plataforma
      2. Utilizando um ou mais serviços de SSO (Google, Facebook, GitHub...)
   3. Criar uma nova conta (saldo inicial de 100 moedas virtuais)
      1. Utilizando credenciais de uso exclusivo da plataforma
      2. Utilizando um ou mais serviços de SSO (Google, Facebook, GitHub...)
   4. Buscar cursos pelo nome ou autor
4. O usuário comum autenticado poderá:
   1. Adicionar um novo curso, inserindo seu nome, uma imagem, uma descrição e preço.
      1. *Limitar o período de sua oferta ou a quantidade de vagas ofertadas,
         após o esgotamento, o curso ainda poderá ser visualizado para compra,
         mas deverá constar como esgotado, sem poder ser comprado.*
      2. *Os cursos esgotados podem ser filtrados da busca*
   1. Avaliar os cursos que adquiriu, indicando uma nota de 1 a 5 e podendo fazer
      algum comentário associado a sua nota
   1. Editar avaliações de curso que já realizou
   2. *Responder a avaliações deixadas no seu curso com algum comentário réplica*
   3. *Editar as réplicas de avaliação que escreveu*
   4. Adicionar cursos a um carrinho de compras, que deve ser persistido mesmo
      que o usuário saia da página
   5. Efetuar a compra de cursos diretamente dos seus detalhes ou a partir do
      carrinho de compras

## Observações gerais

O desafiado tem a liberdade de utilizar quaisquer tecnologias de frontend de sua
escolha, bem como templates ou quaisquer outras ferramentas ou bibliotecas que o
ajudem na elaboração do desafio.

É obrigatório o uso do Ruby on Rails versão 5.x para o backend.

É obrigatório o uso do PostgreSQL como banco de dados onde serão armazenadas
informações como os dados dos usuários e dos cursos, bem como o uso do Redis que
poderá ser utilizado para cache ou para eventual adoção do uso do sidekiq.

É obrigatório o uso do git para controle de versões no desenvolvimento do desafio.


## Bancos de dados

Para execução local do projeto, está disponibilizado neste repositório um arquivo
[docker-compose.yml](./docker-compose.yml) pré-configurado com o PostgreSQL e o Redis,
bem como ferramentas de manipulação e verificação dos mesmos.
