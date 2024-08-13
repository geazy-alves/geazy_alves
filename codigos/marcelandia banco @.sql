CREATE TABLE `Clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` varchar(50) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Observacao` varchar(255) DEFAULT NULL,
  `Foto` longblob,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16le COMMENT='tabela de aluno clientes';

/////


CREATE TABLE `Animais` (
  `IdAnimal` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
 `Tipo` ENUM('Gato', 'Cachorro') NOT NULL,
 `Raca` varchar(30) DEFAULT NULL,
  `Sexo` ENUM('M', 'F') DEFAULT NULL,
  `Peso` int DEFAULT NULL,
 `CondicoesChegada` TEXT,
    `TipoRacao` VARCHAR(100),
    `Habitos` TEXT,
   `Foto` longblob,
  PRIMARY KEY (`IdAnimal`),
  KEY `idx_Animais` (`IdCliente`),
  CONSTRAINT `idx_Animais` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;


//////


CREATE TABLE `Veterinarios` (
    `IdVeterinarios` INT PRIMARY KEY AUTO_INCREMENT,
    `Nome` VARCHAR(100) NOT NULL,
    `Especialidades` VARCHAR(255),
 `Telefone` varchar(50) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL
);
//////

CREATE TABLE Atendente (
    `IdAtendente` INT PRIMARY KEY AUTO_INCREMENT,
    `Nome` VARCHAR(100) NOT NULL,
    `Identificacao` VARCHAR(50) NOT NULL
);
/////
CREATE TABLE `Agenda` (
    `IdAgenda` INT PRIMARY KEY AUTO_INCREMENT,
    `Data` DATE NOT NULL,
    `Horario` TIME NOT NULL,
    `Status` ENUM ('Agendado', 'Atendido', 'Cancelado') NOT NULL,
    `IdVeterinarios` INT,
    `IdCliente` INT,
    `IdAnimal` INT,
    FOREIGN KEY (`IdVeterinarios`) REFERENCES `Veterinarios`(`IdVeterinarios`),
    FOREIGN KEY (`IdCliente`) REFERENCES `Clientes`(`IdCliente`),
    FOREIGN KEY (`IdAnimal`) REFERENCES `Animais`(`IdAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;


////

CREATE TABLE `Prontuario` (
    `IdProntuario` INT PRIMARY KEY AUTO_INCREMENT,
    `DataAtendimento` DATE NOT NULL,
    `Observacoes` TEXT,
    `IdVeterinarios` INT,
    `IdAnimal` INT,
   FOREIGN KEY (`IdAnimal`) REFERENCES  a (`IdAnimal`),
	 FOREIGN KEY (`IdVeterinarios`) REFERENCES `Veterinarios`(`IdVeterinarios`)
   
);


INSERT INTO `pets` VALUES (1,'gato1',1,NULL,NULL,NULL,NULL,NULL),(2,'gato2',2,NULL,NULL,NULL,NULL,NULL),(3,'cao1',3,NULL,NULL,NULL,NULL,NULL),(4,'cao2',2,NULL,NULL,NULL,NULL,NULL),(5,'cao3',2,NULL,NULL,NULL,NULL,NULL),(6,'cao4',3,NULL,NULL,NULL,NULL,NULL),(7,'gato3',1,NULL,NULL,NULL,NULL,NULL);


CREATE TABLE `agenda` (
  `IdAgenda` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) DEFAULT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Responsavel` varchar(50) DEFAULT NULL,
  `Completado` int DEFAULT NULL,
  `Observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdAgenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;


CREATE TABLE `projetos` (
  `IdProjeto` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) DEFAULT NULL,
  `Valor` float(10,2) DEFAULT NULL,
  `DataTermino` date DEFAULT NULL,
  PRIMARY KEY (`IdProjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;
