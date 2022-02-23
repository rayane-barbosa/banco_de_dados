# Modelo conceitual

Conhecido como DER, o modelo conceitual tem como objetivo demonstrar graficamente ao cliente  as relações  e entidades levantadas na fase de requisitos



**Pratica de Competência  -  1;**

Considere um cenário em um ambiente de um banco:
\- Um banco tem várias agências.
\- As contas de uma agência podem se referir a pessoas físicas ou jurídicas.
\- Há contas que podem ter um único titular e contas que podem ter mais de um.
\- Não há contas sem cliente e nenhum cliente da agência sem conta.
\- Uma agência exige necessariamente um banco e não há banco sem agência.
\- As agências fazem empréstimos aos seus clientes e há cliente que tem mais de um empréstimo, mas o número de empréstimos de cada agência é limitado a 1000.


Desenvolva, usando o brModelo, o modelo conceitual do banco de dados descrito.



**Prática de Competência  - 2**

Ex - 1:  Projetar um Banco de Dados satisfazendo as seguintes restrições e requisitos:
Uma empresa de agenciamento de mão-de-obra pretende informatizar o seu cadastro de profissionais, candidatos a empregos temporários, objetivando construir um banco de dados onde possa manter os dados cadastrais dos profissionais e seus contratos temporários com as empresas clientes. O profissional é identificado por um número de controle e, além dessa informação, ficam registrados o seu nome, endereço, nascimento e profissão. Os contratos de mão-de-obra temporária são feitos individualmente (um contrato para cada profissional) com as empresas clientes. Cada contrato é identificado por um número único e nele são registrados a empresa contratante, a vigência do contrato (data de início e de término) e o valor pago por hora trabalhada. As empresas clientes são identificadas por um CPF e possuem um nome e endereço. Faça um DER que apresente uma solução para o problema.



Ex - 2: 

1.  Projetar um Banco de Dados satisfazendo as seguintes restrições e requisitos:
   A fábrica mantém o cadastro de seus fornecedores por CNPJ, razão social, endereço, fone e nome do contato. As peças são associadas aos fornecedores que as fornecem, através de cotações, sendo necessário manter o preço, a data da cotação e o período de validade. De posse das informações sobre cotações válidas a fábrica seleciona qual(quais) fornecedor(es) atenderá(ão) seus pedidos. Os pedidos emitidos aos fornecedores possuem um número, a data da compra, data prevista para entrega e são associados às peças através de seus itens que mantém o preço unitário e quantidade pedida daquela peça. As peças possuem um código, nome, descrição e quantidade mínima, quantidade máxima e quantidade em estoque; elas vão à composição dos produtos (eletrodomésticos) em determinadas quantidades, essa informação é utilizada para determinar quando é necessário comprar mais peças para produzir determinadas quantidades de determinado produto. Os produtos possuem um código, nome, descrição, preço unitário e quantidade em estoque. Toda venda de produtos envolve a emissão de uma nota fiscal que possui um número, data de emissão, taxa de desconto fornecida àquela venda; e está associada tanto aos clientes que fizeram a compra como aos produtos (itens) que estão sendo vendidos em determinadas quantidades e por um determinado preço (equivale ao preço unitário do produto no dia da venda). Os clientes são cadastrados por código, nome (contato), endereço, fone e podem ser pessoas físicas (que possuem um CPF) ou jurídicas (que tem um CGC e uma razão social)

   Ver atividade