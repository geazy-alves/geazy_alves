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


-- Copiando estrutura do banco de dados para veterinaria_sao_paulo
CREATE DATABASE IF NOT EXISTS `veterinaria_sao_paulo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria_sao_paulo`;

-- Copiando estrutura para tabela veterinaria_sao_paulo.agenda
CREATE TABLE IF NOT EXISTS `agenda` (
  `IdAgenda` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Horario` time NOT NULL,
  `Status` enum('Agendado','Atendido','Cancelado') NOT NULL,
  `IdVeterinarios` int DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `IdAnimal` int DEFAULT NULL,
  PRIMARY KEY (`IdAgenda`),
  KEY `IdVeterinarios` (`IdVeterinarios`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdAnimal` (`IdAnimal`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`IdVeterinarios`) REFERENCES `veterinarios` (`IdVeterinarios`),
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `agenda_ibfk_3` FOREIGN KEY (`IdAnimal`) REFERENCES `animais` (`IdAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- Copiando dados para a tabela veterinaria_sao_paulo.agenda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela veterinaria_sao_paulo.animais
CREATE TABLE IF NOT EXISTS `animais` (
  `IdAnimal` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `Tipo` enum('Gato','Cachorro') NOT NULL,
  `Raca` varchar(30) DEFAULT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `Peso` int DEFAULT NULL,
  `CondicoesChegada` text,
  `TipoRacao` varchar(100) DEFAULT NULL,
  `Habitos` text,
  `Foto` longblob,
  PRIMARY KEY (`IdAnimal`),
  KEY `idx_Animais` (`IdCliente`),
  CONSTRAINT `idx_Animais` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- Copiando dados para a tabela veterinaria_sao_paulo.animais: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela veterinaria_sao_paulo.atendente
CREATE TABLE IF NOT EXISTS `atendente` (
  `IdAtendente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Identificacao` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`IdAtendente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela veterinaria_sao_paulo.atendente: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela veterinaria_sao_paulo.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` varchar(50) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Observacao` varchar(255) DEFAULT NULL,
  `Foto` longblob,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf16le COMMENT='tabela de clientes';

-- Copiando dados para a tabela veterinaria_sao_paulo.clientes: ~4 rows (aproximadamente)
INSERT INTO `clientes` (`IdCliente`, `Nome`, `Telefone`, `Endereco`, `Email`, `Observacao`, `Foto`) VALUES
	(1, 'Geazy', '91234-9876', 'Rua das Flores, 123', NULL, NULL, NULL),
	(2, 'teste', '5555', NULL, NULL, NULL, NULL),
	(3, 'João Silva', '91234-5678', 'Rua das Flores, 123', 'joao@email.com', NULL, NULL),
	(4, 'Maria Oliveira', '91234-9876', 'Avenida Central, 456', 'maria@email.com', NULL, NULL);

-- Copiando estrutura para tabela veterinaria_sao_paulo.prontuario
CREATE TABLE IF NOT EXISTS `prontuario` (
  `IdProntuario` int NOT NULL AUTO_INCREMENT,
  `DataAtendimento` date NOT NULL,
  `Observacoes` text COLLATE utf8mb4_general_ci,
  `IdVeterinarios` int DEFAULT NULL,
  `IdAnimal` int DEFAULT NULL,
  PRIMARY KEY (`IdProntuario`),
  KEY `IdAnimal` (`IdAnimal`),
  KEY `IdVeterinarios` (`IdVeterinarios`),
  CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`IdAnimal`) REFERENCES `animais` (`IdAnimal`),
  CONSTRAINT `prontuario_ibfk_2` FOREIGN KEY (`IdVeterinarios`) REFERENCES `veterinarios` (`IdVeterinarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela veterinaria_sao_paulo.prontuario: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela veterinaria_sao_paulo.veterinarios
CREATE TABLE IF NOT EXISTS `veterinarios` (
  `IdVeterinarios` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Especialidades` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Telefone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Endereco` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`IdVeterinarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela veterinaria_sao_paulo.veterinarios: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
