CREATE TABLE paciente (
  nome varchar(500),
  data_de_nascimento date,
  endereco varchar(500),
  telefone char(11),
  email varchar(200),
  CPF char(11),
  RG char(12)
);

CREATE TABLE consulta (
  data_consulta date,
  hora timestamp,
  medico_responsavel varchar(500),
  paciente varchar(500),
  valor_da_consulta float,
  tipo_da_consulta varchar(500),
  nome_do_convenio varchar(500),
  numero_da_carteirinha int
);

CREATE TABLE convenio (
  id serial,
  nome varchar(500),
  CNPJ char(14),
  tempo_de_carencia int,
  numero_da_carteirinha int
);


CREATE TABLE internacao (
  id serial,
  data_de_entrada datetime,
  data_prev_alta datetime,
  data_alta datetime,
  procedimento nvarchar(100)
);

CREATE TABLE quarto (
  id serial,
  tipo nvarchar(255),
  numero int
);


CREATE TABLE tipo_de_quarto (
  id serial,
  descricao nvarchar(255),
  valor_diaria float
);


CREATE TABLE enfermeiro (
  id serial,
  nome varchar(500),
  cpf char(11),
  cre int (11)
);


CREATE TABLE medico (
  id serial,
  nome varchar(500),
  CRM int(11),
  CPF char(11),
  CEP int(8),
  cidade nvarchar(255),
  endereco nvarchar(255),
  bairro nvarchar(255),
  telefone char(11)
);


CREATE TABLE especializacao (
  id serial,
  especializacao_1 varchar(500),
  especializacao_2 varchar(500)
);


CREATE TABLE receita (
  id serial,
  medicamentos_receitados nvarchar(255),
  quantidade int,
  instrucoes_de_uso nvarchar(255)
);
ALTER TABLE quarto ADD FOREIGN KEY (id) REFERENCES internacao (id)
;


ALTER TABLE tipo_de_quarto ADD FOREIGN KEY (id) REFERENCES quarto (id)
;

ALTER TABLE enfermeiro ADD FOREIGN KEY (id) REFERENCES internacao (id)
;

ALTER TABLE medico ADD FOREIGN KEY (id) REFERENCES consulta (paciente)
;

ALTER TABLE especializacao ADD FOREIGN KEY (id) REFERENCES medico (id)
;

ALTER TABLE receita ADD FOREIGN KEY (id) REFERENCES medico (id)
;

ALTER TABLE convenio ADD FOREIGN KEY (id) REFERENCES paciente (nome)
;

ALTER TABLE consulta ADD FOREIGN KEY (paciente) REFERENCES paciente (nome)
;

ALTER TABLE paciente ADD FOREIGN KEY (nome) REFERENCES receita (id)
;

ALTER TABLE internacao ADD FOREIGN KEY (id) REFERENCES paciente (nome)

