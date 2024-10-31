CREATE SCHEMA BANCO;


USE BANCO;


CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15)
);


CREATE TABLE Contas (
    conta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    tipo_conta ENUM('Corrente', 'Poupança') NOT NULL,
    data_abertura DATE NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


CREATE TABLE Transacoes (
    transacao_id INT AUTO_INCREMENT PRIMARY KEY,
    conta_id INT,
    data_transacao DATETIME NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    tipo_transacao ENUM('Crédito', 'Débito') NOT NULL,
    descricao VARCHAR(255)
