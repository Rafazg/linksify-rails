# Linksify - Aplicação de Gerenciamento de Links Shopify

## Visão Geral
Linksify é uma aplicação desenvolvida em Ruby on Rails para gerenciamento de links de produtos do Shopify. Os usuários podem pesquisar, filtrar e adicionar produtos à lista de desejos. A aplicação possui um design moderno e responsivo, construído com o framework Bulma, garantindo facilidade de uso em diversos dispositivos.

## Funcionalidades
- **Filtragem de Produtos:** Os usuários podem filtrar produtos por faixa de preço e pesquisar por palavras-chave.
- **Lista de Desejos:** Os usuários podem adicionar produtos à lista de desejos.
- **Design Responsivo:** A interface se adapta a diferentes tamanhos de tela, proporcionando uma ótima experiência tanto em dispositivos móveis quanto em desktops.
- **Integração com Shopify:** A aplicação utiliza dados de produtos obtidos de URLs de lojas Shopify.

## Arquitetura
### Backend
- **Ruby on Rails:** O back-end foi desenvolvido utilizando o framework Ruby on Rails, com PostgreSQL como banco de dados.
- **Rake Tasks:** O processamento de links do Shopify é feito através de uma tarefa `rake`, que busca informações dos produtos e atualiza ou cria registros no banco de dados.
- **Modelos:** A aplicação inclui os modelos `Product` para os produtos e `Wishlist` para gerenciar os itens adicionados à lista de desejos.

### Frontend
- **Bulma:** Utilizado como framework CSS para construir uma interface limpa e moderna.
- **Formulários de Filtro:** O front-end permite que os usuários filtrem produtos com base em parâmetros de busca como preço mínimo e máximo.

## Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/Rafazg/linksify-rails.git
2. Clone o repositório:
    ```bash
    cd linksify-rails
3. Instale as dependências:
    ```bash
    bundle install
    or
    yarn install
4. Configure o banco de dados:
    ```bash
    rails db:create
    rails db:migrate
5. Execute a aplicação:
    ```bash
    rails server

## Uso
### Filtragem de Produtos
Na página de produtos, os usuários podem aplicar filtros de preço e pesquisar por nome. O formulário de filtro está disponível no topo da página e os resultados são exibidos em um grid de produtos.

### Adicionar à Lista de Desejos
Os usuários podem adicionar produtos à lista de desejos clicando no botão "Adicionar à Lista de Desejos" abaixo de cada produto.

## Estrutura de Pastas
- **app/models/:** Modelos da aplicação.
- **app/controllers/:** Controladores responsáveis pelo fluxo de dados.
- **app/views/:** Templates de visualização das páginas.
- **app/assets/:** Arquivos CSS e JavaScript.

<<<<<<< HEAD
* Database initialization++
=======
## Problemas Conhecidos
- **Compatibilidade de CSS:** Algumas classes do Bulma podem não funcionar como esperado em navegadores mais antigos.
## License
>>>>>>> 05e560b791516a16f8ef98e4ca9fd2e10cde7d2c

[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c)

 A permissão é concedida, gratuitamente, a qualquer pessoa que obtenha uma cópia
 deste software e arquivos de documentação associados (o "Software"), para lidar com
 no Software sem restrição, incluindo, sem limitação, os direitos
 usar, copiar, modificar, mesclar, publicar, distribuir, sublicenciar e/ou vender
 cópias do Software e permitir que as pessoas a quem o Software seja
 fornecido para o efeito, nas seguintes condições:

O aviso de direitos autorais acima e este aviso de permissão devem ser incluídos em
 todas as cópias ou partes substanciais do Software.

O SOFTWARE É FORNECIDO "NO ESTADO EM QUE SE ENCONTRA", SEM GARANTIA DE QUALQUER TIPO, EXPRESSA OU
 IMPLÍCITO, INCLUINDO, MAS NÃO SE LIMITANDO ÀS GARANTIAS DE COMERCIALIZAÇÃO,
 ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA E NÃO VIOLAÇÃO. EM NENHUM CASO O
 OS AUTORES OU DETENTORES DE DIREITOS AUTORAIS SERÃO RESPONSÁVEIS POR QUALQUER RECLAMAÇÃO, DANOS OU OUTROS
 RESPONSABILIDADE, SEJA EM UMA AÇÃO DE CONTRATO, ATO ILÍCITO OU DE OUTRA FORMA, DECORRENTE DE,
 FORA DE OU
