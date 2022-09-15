CREATE DATABASE QUESTAO1;

CREATE TABLE questao1(
ID_NF INT NOT NULL,
ID_ITEM INT NOT NULL,
COD_PROD INT NOT NULL,
VALOR_UNIT DECIMAL(5,2),
QUANTIDADE INT,
DESCONTO DECIMAL(5,2)
);

/*a)
Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.*/
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM questao1
WHERE DESCONTO IS NULL;

/*b)
Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR VENDIDO.OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).*/
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) AS VALOR_VENDIDO
FROM questao1
WHERE DESCONTO IS NOT NULL;

/*c)
Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.*/
/*UPTADE questao1
SET DESCONTO = 0 
WHERE DESCONTO IS NULL*/

/*d)
Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).*/
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL, DESCONTO, (VALOR_UNIT-(VALOR_UNIT*(DESCONTO/100))) AS VALOR_VENDIDO 
FROM questao1
WHERE QUANTIDADE IS NOT NULL;

/*e)
Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: OVALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.*/
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM questao1
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC;

/*f)
Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe o resultado da consulta por ID_NF.*/
SELECT ID_NF, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) AS VALOR_TOTAL
FROM questao1
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC;

/*g)
Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD.*/
SELECT COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE
FROM questao1
GROUP BY COD_PROD
ORDER BY QUANTIDADE DESC
LIMIT 1;

/*h)
Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto. As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por ID_NF, COD_PROD.*/
SELECT ID_NF, COD_PROD, QUANTIDADE
FROM questao1
WHERE QUANTIDADE > 10;

/*i)
Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.*/
SELECT ID_NF, SUM(QUANTIDADE*VALOR_UNIT) AS QUANTIDADE
FROM questao1
GROUP BY ID_NF
HAVING QUANTIDADE > 500
ORDER BY QUANTIDADE DESC;

/*j)
Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PROD.*/
SELECT COD_PROD, AVG(DESCONTO) AS MEDIA
FROM questao1
GROUP BY COD_PROD;

/*k)
 Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe o resultado da consulta por COD_PROD.*/
SELECT COD PROD, MIN(DESCONTO) AS MENOR, MAX(DESCONTO) AS MAIOR, AVG(DESCONTO) AS MEDIA
FROM questao1
GROUP BY COD_PROD;

/*l)
Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o resultado da consulta por ID_NF.*/
SELECT ID_NF, COUNT(QUANTIDADE) AS QUANTIDADE
FROM questao1
GROUP BY ID_NF
HAVING QUANTIDADE>3;