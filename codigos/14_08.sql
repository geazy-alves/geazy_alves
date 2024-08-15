-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para novo
DROP DATABASE IF EXISTS `novo`;
CREATE DATABASE IF NOT EXISTS `novo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `novo`;

-- Copiando estrutura para tabela novo.agenda
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime DEFAULT NULL,
  `id_veterinario` int DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `atendido` tinyint(1) DEFAULT NULL,
  `prioridade` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `id_veterinario` (`id_veterinario`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.agenda: ~0 rows (aproximadamente)
INSERT INTO `agenda` (`id_agenda`, `data_hora`, `id_veterinario`, `id_animal`, `atendido`, `prioridade`) VALUES
	(1, '2024-08-13 08:00:00', 1, 1, 0, 'Normal'),
	(2, '2024-08-13 09:00:00', 2, 2, 1, 'Alta'),
	(3, '2024-08-13 10:00:00', 3, 3, 0, 'Normal'),
	(4, '2024-08-13 11:00:00', 4, 4, 1, 'Baixa'),
	(5, '2024-08-13 12:00:00', 5, 5, 0, 'Normal');

-- Copiando estrutura para tabela novo.animal
DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` enum('Cachorro','Gato') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condicao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `racao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `habitos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `peso` int DEFAULT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.animal: ~5 rows (aproximadamente)
INSERT INTO `animal` (`id_animal`, `nome`, `tipo`, `condicao`, `racao`, `habitos`, `id_cliente`, `peso`) VALUES
	(1, 'Rex', 'Cachorro', 'Saudável', 'Ração Premium', 'Corre no parque', 1, 2),
	(2, 'Miau', 'Gato', 'Leve resfriado', 'Ração de Peixe', 'Dormir o dia todo', 2, 3),
	(3, 'Bolt', 'Cachorro', 'Problema na pata', 'Ração para cães idosos', 'Brinca com bola', 3, 4),
	(4, 'Luna', 'Gato', 'Vacinação atrasada', 'Ração para filhotes', 'Explora a casa', 4, 8),
	(5, 'Max', 'Cachorro', 'Alergia alimentar', 'Ração hipoalergênica', 'Gosta de nadar', 5, 5);

-- Copiando estrutura para tabela novo.atendente
DROP TABLE IF EXISTS `atendente`;
CREATE TABLE IF NOT EXISTS `atendente` (
  `id_atendente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_atendente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.atendente: ~5 rows (aproximadamente)
INSERT INTO `atendente` (`id_atendente`, `nome`) VALUES
	(1, 'Paulo Santos'),
	(2, 'Carla Mendes'),
	(3, 'Ricardo Alves'),
	(4, 'Sofia Gomes'),
	(5, 'Lucas Lima');

-- Copiando estrutura para tabela novo.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `endereco` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.cliente: ~5 rows (aproximadamente)
INSERT INTO `cliente` (`id_cliente`, `nome`, `telefone`, `endereco`) VALUES
	(1, 'Carlos Silva', '123456789', 'Rua A, 123'),
	(2, 'Ana Souza', '987654321', 'Rua B, 456'),
	(3, 'João Pereira', '456123789', 'Rua C, 789'),
	(4, 'Mariana Lima', '789456123', 'Rua D, 101'),
	(5, 'Fernando Alves', '321654987', 'Rua E, 202');

-- Copiando estrutura para tabela novo.ficha
DROP TABLE IF EXISTS `ficha`;
CREATE TABLE IF NOT EXISTS `ficha` (
  `id_ficha` int NOT NULL AUTO_INCREMENT,
  `id_animal` int DEFAULT NULL,
  `data_abertura` datetime DEFAULT NULL,
  `observacoes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `receita` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_ficha`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `ficha_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.ficha: ~5 rows (aproximadamente)
INSERT INTO `ficha` (`id_ficha`, `id_animal`, `data_abertura`, `observacoes`, `receita`) VALUES
	(1, 1, '2024-08-13 08:30:00', 'Animal saudável, recomenda-se check-up anual.', 'Suplemento vitamínico A'),
	(2, 2, '2024-08-13 09:30:00', 'Gato com resfriado leve. Receitar antibiótico.', 'Amoxicilina 5ml'),
	(3, 3, '2024-08-13 10:30:00', 'Problema na pata, precisa de exame de raio-x.', 'Anti-inflamatório por 5 dias'),
	(4, 4, '2024-08-13 11:30:00', 'Vacinas atrasadas, aplicar as vacinas.', 'Vacina antirrábica e polivalente'),
	(5, 5, '2024-08-13 12:30:00', 'Alergia alimentar identificada. Trocar ração.', 'Ração hipoalergênica marca X');

-- Copiando estrutura para tabela novo.formulario
DROP TABLE IF EXISTS `formulario`;
CREATE TABLE IF NOT EXISTS `formulario` (
  `id_formulario` int NOT NULL AUTO_INCREMENT,
  `id_animal` int DEFAULT NULL,
  `id_veterinario` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `detalhes_entrevista` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_formulario`),
  KEY `id_animal` (`id_animal`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  CONSTRAINT `formulario_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.formulario: ~5 rows (aproximadamente)
INSERT INTO `formulario` (`id_formulario`, `id_animal`, `id_veterinario`, `data`, `detalhes_entrevista`) VALUES
	(1, 1, 1, '2024-08-13 08:15:00', 'O dono relatou que o animal está em boas condições, sem problemas recentes.'),
	(2, 2, 2, '2024-08-13 09:15:00', 'O gato está com sintomas leves de resfriado. Está comendo normalmente.'),
	(3, 3, 3, '2024-08-13 10:15:00', 'O cão tem mancado levemente, sem histórico de lesões anteriores.'),
	(4, 4, 4, '2024-08-13 11:15:00', 'O gato não tem histórico de vacinas recentes, recomenda-se atualização.'),
	(5, 5, 5, '2024-08-13 12:15:00', 'O cão tem mostrado sinais de alergia após alimentação.');

-- Copiando estrutura para tabela novo.sec_settings
DROP TABLE IF EXISTS `sec_settings`;
CREATE TABLE IF NOT EXISTS `sec_settings` (
  `set_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `set_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.sec_settings: ~33 rows (aproximadamente)
INSERT INTO `sec_settings` (`set_name`, `set_value`) VALUES
	('brute_force', 'N'),
	('brute_force_attempts', '10'),
	('brute_force_time_block', '10'),
	('captcha', 'N'),
	('cookie_expiration_time', '30'),
	('enable_2fa', 'N'),
	('enable_2fa_api', ''),
	('enable_2fa_api_type', ''),
	('enable_2fa_expiration_time', '300'),
	('enable_2fa_mode', 'individual'),
	('group_default', '2'),
	('language', 'N'),
	('login_mode', 'username'),
	('mfa_last_updated', '30'),
	('new_users', 'Y'),
	('password_min', '5'),
	('password_strength', ''),
	('pswd_last_updated', '60'),
	('recover_pswd', 'send_link'),
	('remember_me', 'Y'),
	('req_email_act', 'Y'),
	('retrieve_password', 'Y'),
	('send_email_adm', 'Y'),
	('session_expire', '0'),
	('smtp_api', 'custom'),
	('smtp_from_email', 'admin@teste.com'),
	('smtp_from_name', 'admin@teste.com'),
	('smtp_pass', '123'),
	('smtp_port', '465'),
	('smtp_security', 'ssl'),
	('smtp_server', 'Teste.smtp.com.br'),
	('smtp_user', 'admin@teste.com'),
	('theme', 'scriptcase__NM__Sc9_SoftCloud');

-- Copiando estrutura para tabela novo.sec_users
DROP TABLE IF EXISTS `sec_users`;
CREATE TABLE IF NOT EXISTS `sec_users` (
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pswd` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activation_code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priv_admin` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mfa` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture` blob,
  `role` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pswd_last_updated` timestamp NULL DEFAULT NULL,
  `mfa_last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.sec_users: ~1 rows (aproximadamente)
INSERT INTO `sec_users` (`login`, `pswd`, `name`, `email`, `active`, `activation_code`, `priv_admin`, `mfa`, `picture`, `role`, `phone`, `pswd_last_updated`, `mfa_last_updated`) VALUES
	('admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'admin@admin.com', 'Y', NULL, 'Y', NULL, NULL, NULL, NULL, '2024-08-15 02:38:30', NULL);

-- Copiando estrutura para tabela novo.veterinario
DROP TABLE IF EXISTS `veterinario`;
CREATE TABLE IF NOT EXISTS `veterinario` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `especialidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela novo.veterinario: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
