CREATE DATABASE hospital2;
USE hospital2;

CREATE TABLE pacientes(
id_pac VARCHAR(8) NOT NULL PRIMARY KEY,
nome_pac VARCHAR(100) NOT NULL,
cpf_pac VARCHAR(11) NOT NULL,
endereco_pac VARCHAR(100) NOT NULL,
idade_pac INT NOT NULL,
contato_pac VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL
);

CREATE TABLE medico(
id_medico VARCHAR(8) NOT NULL PRIMARY KEY,
nome_medico VARCHAR(100) NOT NULL,
cpf_medico VARCHAR(11) NOT NULL,
especializacao_med VARCHAR(100) NOT NULL,
cpf_pac VARCHAR(11) NOT NULL,
id_pac_fk VARCHAR(8) NOT NULL,
CONSTRAINT medico_paciente_fk FOREIGN KEY (id_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE enfermeiros(
id_enfer VARCHAR(8) NOT NULL PRIMARY KEY,
nome_enfer VARCHAR(100) NOT NULL,
cpf_enfer VARCHAR(11) NOT NULL,
cpf_pac_fk VARCHAR(11) NOT NULL,
CONSTRAINT enfermeiros_pacientes_fk FOREIGN KEY (cpf_pac_fk)
REFERENCES pacientes(id_pac)
);

CREATE TABLE farmaceuticos(
id_farm VARCHAR(8) NOT NULL PRIMARY KEY,
nome_farm VARCHAR(100) NOT NULL,
cpf_farm VARCHAR(11) NOT NULL,
cpf_enfer_fk VARCHAR(11) NOT NULL,
nome_remedio VARCHAR(100) NOT NULL,
CONSTRAINT farmaceuticos_enfemeiros_fk FOREIGN KEY (cpf_enfer_fk)
REFERENCES enfermeiros(id_enfer)
);

CREATE TABLE remedio(
id_remedio VARCHAR(8) NOT NULL PRIMARY KEY,
nome_remedio VARCHAR(100) NOT NULL,
qntd_remedio DECIMAL(4,2) NOT NULL,
dtv_remedio DATE NOT NULL,
horario_remedio TIME NOT NULL,
cpf_pac_fk VARCHAR(11) NOT NULL,
CONSTRAINT remedio_paciente_fk FOREIGN KEY (cpf_pac_fk)
REFERENCES pacientes(id_pac)
);

INSERT INTO pacientes
(id_pac, nome_pac, cpf_pac, endereco_pac, idade_pac, contato_pac, data_nasc)
VALUES
("PAC00001", "Joao da Silva", "12345678901", "Rua das Flores, 100", 25, "41999990001", "2001-03-15"),
("PAC00002", "Maria Oliveira", "23456789012", "Avenida Brasil, 250", 32, "41999990002", "1994-07-22"),
("PAC00003", "Carlos Santos", "34567890123", "Rua Curitiba, 350", 41, "41999990003", "1985-01-10"),
("PAC00004", "Ana Pereira", "45678901234", "Rua das Palmeiras, 480", 28, "41999990004", "1998-11-05"),
("PAC00005", "Pedro Souza", "56789012345", "Avenida Parana, 550", 55, "41999990005", "1971-06-18");


INSERT INTO medico (id_medico, nome_medico, cpf_medico, especializacao_med, cpf_pac, id_pac_fk) VALUES
('MED00001', 'Dr. Roberto Alves', '12345678901', 'Cardiologia', '11122233344', 'PAC00001'),
('MED00002', 'Dra. Patricia Lima', '23456789012', 'Pediatria', '22233344455', 'PAC00002'),
('MED00003', 'Dr. Carlos Eduardo', '34567890123', 'Ortopedia', '33344455566', 'PAC00003'),
('MED00004', 'Dra. Juliana Mendes', '45678901234', 'Dermatologia', '44455566677', 'PAC00004'),
('MED00005', 'Dr. Fernando Rocha', '56789012345', 'Neurologia', '55566677788', 'PAC00005');


INSERT INTO enfermeiros (id_enfer, nome_enfer, cpf_enfer, cpf_pac_fk) VALUES
('ENF00001', 'Enf. Mariana Costa', '98765432100', 'PAC00001'),
('ENF00002', 'Enf. Lucas Martins', '87654321009', 'PAC00002'),
('ENF00003', 'Enf. Beatriz Ramos', '76543210098', 'PAC00003'),
('ENF00004', 'Enf. Gabriel Almeida', '65432100987', 'PAC00004'),
('ENF00005', 'Enf. Camilla Barbosa', '54321009876', 'PAC00005');


INSERT INTO farmaceuticos (id_farm, nome_farm, cpf_farm, cpf_enfer_fk, nome_remedio) VALUES
('FAR00001', 'Farm. Thiago Mendes', '11223344556', 'ENF00001', 'Amoxicilina 500mg'),
('FAR00002', 'Farm. Vanessa Dias', '22334455667', 'ENF00002', 'Dipirona 1g'),
('FAR00003', 'Farm. Rodrigo Faria', '33445566778', 'ENF00003', 'Omeprazol 20mg'),
('FAR00004', 'Farm. Larissa Xavier', '44556677889', 'ENF00004', 'Ibuprofeno 600mg'),
('FAR00005', 'Farm. Henrique Nunes', '55667788990', 'ENF00005', 'Paracetamol 750mg');


INSERT INTO remedio (id_remedio, nome_remedio, qntd_remedio, dtv_remedio, horario_remedio, cpf_pac_fk) VALUES
('REM00001', 'Paracetamol 750mg', 1.00, '2026-12-31', '08:00:00', 'PAC00001'),
('REM00002', 'Amoxicilina 500mg', 2.00, '2025-08-15', '14:30:00', 'PAC00002'),
('REM00003', 'Dipirona 1g', 1.50, '2027-03-20', '12:00:00', 'PAC00003'),
('REM00004', 'Ibuprofeno 600mg', 1.00, '2026-06-10', '20:00:00', 'PAC00004'),
('REM00005', 'Omeprazol 20mg', 0.50, '2028-01-01', '06:00:00', 'PAC00005');

