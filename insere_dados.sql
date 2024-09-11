-- Inserir dados na tabela Departamento
INSERT INTO Departamento (codigo, nome) VALUES (1, 'Departamento de Ciência da Computação');
INSERT INTO Departamento (codigo, nome) VALUES (2, 'Departamento de Matemática');

-- Inserir dados na tabela Disciplina
INSERT INTO Disciplina (codigo, nome, ementa, numero_creditos, departamento_codigo)
VALUES (101, 'Algoritmos', 'Introdução aos algoritmos e estruturas de dados', 4, 1);
INSERT INTO Disciplina (codigo, nome, ementa, numero_creditos, departamento_codigo)
VALUES (102, 'Cálculo I', 'Fundamentos de cálculo diferencial e integral', 4, 2);

-- Inserir dados na tabela PreRequisito
INSERT INTO PreRequisito (disciplina_codigo, prerequisito_codigo) VALUES (102, 101);

-- Inserir dados na tabela Orientador
INSERT INTO Orientador (numero, nome, departamento_codigo) VALUES (1, 'Dr. João Silva', 1);
INSERT INTO Orientador (numero, nome, departamento_codigo) VALUES (2, 'Dra. Maria Souza', 2);

-- Inserir dados na tabela DisciplinaMinistrada
INSERT INTO DisciplinaMinistrada (disciplina_codigo, orientador_numero) VALUES (101, 1);
INSERT INTO DisciplinaMinistrada (disciplina_codigo, orientador_numero) VALUES (102, 2);

-- Inserir dados na tabela Aluno
INSERT INTO Aluno (matricula, nome, endereco, telefone, tipo_aluno, ano_ingresso, formacao_escolar, orientador_numero)
VALUES (123456, 'Pedro Oliveira', 'Rua A, 123', '99999-9999', 'Graduação', 2020, NULL, NULL);
INSERT INTO Aluno (matricula, nome, endereco, telefone, tipo_aluno, ano_ingresso, formacao_escolar, orientador_numero)
VALUES (789012, 'Ana Pereira', 'Rua B, 456', '88888-8888', 'Pós-graduação', NULL, 'Bacharelado em Física', 2);

-- Inserir dados na tabela MatriculaDisciplina
INSERT INTO MatriculaDisciplina (aluno_matricula, disciplina_codigo, media_final, frequencia)
VALUES (123456, 101, 8.5, 90.0);
INSERT INTO MatriculaDisciplina (aluno_matricula, disciplina_codigo, media_final, frequencia)
VALUES (789012, 102, 9.0, 95.0);
