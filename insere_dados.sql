-- Populando a tabela departamento
INSERT INTO `Faculdade`.`departamento` (`codigo`, `detalhes`, `nome`) VALUES
(1, 'Departamento de Ciência da Computação', 'DCC'),
(2, 'Departamento de Engenharia Elétrica', 'DEE'),
(3, 'Departamento de Matemática', 'DMAT');

-- Populando a tabela curso
INSERT INTO `Faculdade`.`curso` (`codigo`, `departamento_codigo`) VALUES
(101, 1),  -- Curso de Ciência da Computação
(102, 1),  -- Curso de Engenharia de Software
(201, 2),  -- Curso de Engenharia Elétrica
(301, 3);  -- Curso de Matemática

-- Populando a tabela orientador
INSERT INTO `Faculdade`.`orientador` (`matricula`, `nome`, `departamento_codigo`, `endereco`) VALUES
(1001, 'Prof. João Silva', 1, 'Rua A, 123'),
(1002, 'Prof. Maria Lima', 2, 'Rua B, 456'),
(1003, 'Prof. Pedro Santos', 3, 'Rua C, 789');

-- Populando a tabela aluno
INSERT INTO `Faculdade`.`aluno` (`matricula`, `curso_codigo`, `curso_departamento_codigo`, `obrigatorias_concluidas`, `nenhuma_optativa`, `orientador_matricula`, `tipo_aluno`) VALUES
(2001, 101, 1, 2, 0, 1001, 'grad'),
(2002, 102, 1, 1, 1, 1001, 'grad'),
(2003, 201, 2, 3, 0, 1002, 'grad'),
(2004, 301, 3, 0, 2, 1003, 'grad');

-- Populando a tabela disciplinas
INSERT INTO `Faculdade`.`disciplinas` (`codigo`, `orientador_matricula`, `creditos`, `nome`, `departamento_codigo`) VALUES
(301, 1001, 4, 'Algoritmos', 1),
(302, 1001, 3, 'Estruturas de Dados', 1),
(303, 1001, 4, 'Redes de Computadores', 1),
(304, 1002, 5, 'Circuitos Elétricos', 2),
(305, 1002, 3, 'Eletrônica Digital', 2),
(306, 1003, 3, 'Cálculo I', 3),
(307, 1003, 3, 'Álgebra Linear', 3);

-- Populando a tabela matriculadas
INSERT INTO `Faculdade`.`matriculadas` (`aluno_matricula`, `disciplinas_Id`, `frequencia`, `nome`, `media_final`) VALUES
(2001, 301, 90, 'Algoritmos', NULL),
(2001, 302, 85, 'Estruturas de Dados', NULL),
(2002, 303, 80, 'Redes de Computadores', NULL),
(2003, 304, 88, 'Circuitos Elétricos', NULL),
(2004, 306, 95, 'Cálculo I', NULL);

-- Populando a tabela concluidas
INSERT INTO `Faculdade`.`concluidas` (`aluno_matricula`, `disciplinas_Id`, `frequencia`, `nome`, `media_final`) VALUES
(2001, 303, 92, 'Redes de Computadores', 9),
(2001, 304, 85, 'Algoritmos', 8),
(2002, 305, 80, 'Eletrônica Digital', 7),
(2003, 307, 90, 'Álgebra Linear', 8),
(2004, 307, 88, 'Álgebra Linear', 9);

-- Populando a tabela curso_obrigatorias
INSERT INTO `Faculdade`.`curso_obrigatorias` (`curso_codigo`, `curso_departamento_codigo`, `disciplinas_codigo`) VALUES
(101, 1, 301),
(101, 1, 302),
(102, 1, 303),
(201, 2, 304),
(201, 2, 305),
(301, 3, 306),
(301, 3, 307);

-- Populando a tabela curso_optativas
INSERT INTO `Faculdade`.`curso_optativas` (`curso_codigo`, `curso_departamento_codigo`, `disciplinas_codigo`) VALUES
(101, 1, 303),
(102, 1, 305),
(201, 2, 305);

-- Populando a tabela prerequesito
INSERT INTO `Faculdade`.`prerequesito` (`disciplinas_codigo`, `prerequesito_codigo`) VALUES
(303, 301), -- Redes de Computadores requer Algoritmos
(305, 304); -- Eletrônica Digital requer Circuitos Elétricos

