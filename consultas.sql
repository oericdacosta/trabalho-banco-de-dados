-- Disciplinas em que o aluno está atualmente matriculado:
SELECT d.nome 
FROM Faculdade.matriculadas m
JOIN Faculdade.disciplinas d ON m.disciplinas_Id = d.codigo
WHERE m.aluno_matricula = 2001;

-- Disciplinas que o aluno já concluiu:
SELECT d.nome 
FROM Faculdade.concluidas c
JOIN Faculdade.disciplinas d ON c.disciplinas_Id = d.codigo
WHERE c.aluno_matricula = 2001;

-- Cursos do aluno
SELECT 
    c.codigo AS curso_codigo, 
    c.departamento_codigo AS departamento_codigo, 
    d.nome AS curso_nome, 
    dep.codigo AS departamento_codigo
FROM Faculdade.aluno a
JOIN Faculdade.curso c 
    ON a.curso_codigo = c.codigo 
    AND a.curso_departamento_codigo = c.departamento_codigo
JOIN Faculdade.departamento dep 
    ON c.departamento_codigo = dep.codigo
JOIN Faculdade.disciplinas d 
    ON d.departamento_codigo = c.departamento_codigo
WHERE a.matricula = 2001;


-- Dados pessoais do aluno:
SELECT a.matricula, a.tipo_aluno, a.obrigatorias_concluidas, a.nenhuma_optativa 
FROM Faculdade.aluno a
WHERE a.matricula = 2001;

-- Cursos do departamento:
SELECT 
    c.codigo AS curso_codigo,
    d.nome AS departamento_nome
FROM Faculdade.curso c
JOIN Faculdade.departamento d
    ON c.departamento_codigo = d.codigo
WHERE d.codigo = departamento_codigo;

-- Detalhes sobre o departamento:
SELECT d.detalhes 
FROM Faculdade.departamento d
WHERE d.codigo = 1;

-- Disciplinas obrigatórias do curso:
SELECT d.nome 
FROM Faculdade.curso_obrigatorias co
JOIN Faculdade.disciplinas d ON co.disciplinas_codigo = d.codigo
WHERE co.curso_codigo = 101 AND co.curso_departamento_codigo = 1;

-- Disciplinas optativas do curso:
SELECT d.nome 
FROM Faculdade.curso_optativas co
JOIN Faculdade.disciplinas d ON co.disciplinas_codigo = d.codigo
WHERE co.curso_codigo = 101 AND co.curso_departamento_codigo = 1;


-- Alunos do curso:
SELECT a.matricula 
FROM Faculdade.aluno a
WHERE a.curso_codigo = 101 AND a.curso_departamento_codigo = 1;

-- Alunos que fizeram todas as disciplinas obrigatórias:
SELECT a.matricula 
FROM Faculdade.aluno a
WHERE a.curso_codigo = 101 AND a.curso_departamento_codigo = 1 AND a.obrigatorias_concluidas = 2;

-- Alunos que não fizeram nenhuma optativa:
SELECT a.matricula 
FROM Faculdade.aluno a
WHERE a.curso_codigo = 101 AND a.curso_departamento_codigo = 1 AND a.nenhuma_optativa = 1;

-- Alunos matriculados na disciplina:
SELECT m.aluno_matricula 
FROM Faculdade.matriculadas m
WHERE m.disciplinas_Id = 301;

-- Pré-requisitos da disciplina:
SELECT d2.nome 
FROM Faculdade.prerequesito p
JOIN Faculdade.disciplinas d2 ON p.prerequesito_codigo = d2.codigo
WHERE p.disciplinas_codigo = 303;

-- Disciplinas para as quais a disciplina é pré-requisito:
SELECT d.nome 
FROM Faculdade.prerequesito p
JOIN Faculdade.disciplinas d ON p.disciplinas_codigo = d.codigo
WHERE p.prerequesito_codigo = 301;

-- Alunos orientados pelo orientador:
SELECT a.matricula 
FROM Faculdade.aluno a
WHERE a.orientador_matricula = 1001;


-- Disciplinas dadas pelo orientador
SELECT d.nome 
FROM Faculdade.disciplinas d
WHERE d.orientador_matricula = 1001;















