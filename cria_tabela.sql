-- Criação do banco de dados
CREATE DATABASE controle_academico;

-- Usar o banco de dados criado
USE Equipe123456;

-- Tabela Departamento
CREATE TABLE Departamento (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ementa TEXT,
    numero_creditos INT NOT NULL,
    departamento_codigo INT,
    FOREIGN KEY (departamento_codigo) REFERENCES Departamento(codigo)
);

-- Tabela PreRequisito (associações de pré-requisitos entre disciplinas)
CREATE TABLE PreRequisito (
    disciplina_codigo INT,
    prerequisito_codigo INT,
    FOREIGN KEY (disciplina_codigo) REFERENCES Disciplina(codigo),
    FOREIGN KEY (prerequisito_codigo) REFERENCES Disciplina(codigo),
    PRIMARY KEY (disciplina_codigo, prerequisito_codigo)
);

-- Tabela Orientador
CREATE TABLE Orientador (
    numero INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_codigo INT,
    FOREIGN KEY (departamento_codigo) REFERENCES Departamento(codigo)
);

-- Tabela DisciplinaMinistrada (relações entre disciplinas e orientadores)
CREATE TABLE DisciplinaMinistrada (
    disciplina_codigo INT,
    orientador_numero INT,
    FOREIGN KEY (disciplina_codigo) REFERENCES Disciplina(codigo),
    FOREIGN KEY (orientador_numero) REFERENCES Orientador(numero),
    PRIMARY KEY (disciplina_codigo, orientador_numero)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    tipo_aluno ENUM('Graduação', 'Pós-graduação'),
    ano_ingresso INT,
    formacao_escolar VARCHAR(255),
    orientador_numero INT,
    FOREIGN KEY (orientador_numero) REFERENCES Orientador(numero)
);

-- Tabela MatriculaDisciplina (associações entre alunos e disciplinas)
CREATE TABLE MatriculaDisciplina (
    aluno_matricula INT,
    disciplina_codigo INT,
    media_final DECIMAL(5, 2),
    frequencia DECIMAL(5, 2),
    FOREIGN KEY (aluno_matricula) REFERENCES Aluno(matricula),
    FOREIGN KEY (disciplina_codigo) REFERENCES Disciplina(codigo),
    PRIMARY KEY (aluno_matricula, disciplina_codigo)
);
