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