/*a*/
SELECT 
	tb_historico.MAT_ALUNO as Matrícula
#    tb_historico.nota as Nota,
#    tb_turmas.COD_DISC as Disciplina
	FROM tb_historico
INNER JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_historico.nota < 5 AND tb_turmas.COD_DISC = 'BD';
    
    /*b*/
    SELECT
	tb_historico.MAT_ALUNO as `Matrícula`,
    tb_historico.nota as `Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_turmas.COD_DISC = 'POO';

SELECT
    AVG(tb_historico.nota) as `Média da Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.ano = 2015 AND tb_turmas.COD_DISC = 'POO'
GROUP BY tb_turmas.ID;

/*c*/

SELECT
	tb_historico.MAT_ALUNO as `Matrícula`,
    tb_historico.nota as `Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
LEFT JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.COD_DISC = 'POO';

SELECT
    AVG(tb_historico.nota) as `Média da Nota`,
    tb_turmas.COD_DISC as `Disciplina`
	FROM tb_historico
INNER JOIN tb_turmas 
	ON tb_historico.ID_TURMA = tb_turmas.ID
WHERE 
	tb_turmas.COD_DISC = 'POO' AND tb_turmas.ano = 2015 
GROUP BY 
	tb_turmas.ID
HAVING 
	AVG(tb_historico.nota) > 6;
    
/*d*/
SELECT
	COUNT(*) as `Qdte de alunos que não moram na cidade de Natal` 
FROM tb_alunos
WHERE 
	NOT cidade = 'NATAL';