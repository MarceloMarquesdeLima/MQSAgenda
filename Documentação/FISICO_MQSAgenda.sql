-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE MQSAgenda;

USE MQSAgenda;

CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY,
    DsCliente VARCHAR(100),
    DtNascimento DATE,
    NrCpf VARCHAR(11),
    NrRg VARCHAR(11),
    NrNumero VARCHAR(10),
    DsBairro VARCHAR(60),
    DsUf VARCHAR(2),
    NrTelefone VARCHAR(14),
    NrCelular VARCHAR(14),
    DsCidade VARCHAR(70),
    NrCep VARCHAR(8),
    DsCompleento VARCHAR(30),
    DsEndereco VARCHAR(100),
    DsObservacao VARCHAR(255)
);

CREATE TABLE Profissionais (
    Id_Profissional INT PRIMARY KEY,
    NrContato VARCHAR(12),
    DsEspecialidade VARCHAR(50),
    DsProfissional VARCHAR(100)
);

CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY,
    DsUsuario VARCHAR(50),
    DsLogin VARCHAR(50),
    DsSenha VARCHAR(20)
);

CREATE TABLE Agendamento (
    Id_Agendamento INT PRIMARY KEY,
    DtData DATE,
    HrHora CHAR(5),
    DsObservacao VARCHAR(255),
    Id_Usuario INT,
    Id_Profissional INT,
    Id_Cliente INT,
FOREIGN KEY(Id_Usuario) REFERENCES Usuario (Id_Usuario),
FOREIGN KEY(Id_Profissional) REFERENCES Profissionais (Id_Profissional),
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

