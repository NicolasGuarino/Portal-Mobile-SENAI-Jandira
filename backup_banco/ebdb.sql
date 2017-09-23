-- MySQL dump 10.13  Distrib 5.7.10, for Win64 (x86_64)
--
-- Host: localhost    Database: dbportalmobile
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_aluguel_livro`
--

DROP TABLE IF EXISTS `tbl_aluguel_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aluguel_livro` (
  `id_aluguel` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `dt_aluguel` date NOT NULL,
  `dt_devolucao` date DEFAULT NULL,
  `id_livro` int(11) NOT NULL,
  PRIMARY KEY (`id_aluguel`),
  UNIQUE KEY `id_aluno_UNIQUE` (`id_aluno`),
  KEY `id_aluguel_livro_idx` (`id_livro`),
  CONSTRAINT `aluno_aluguelLivro` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_aluguel_livro` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livro` (`id_livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aluguel_livro`
--

LOCK TABLES `tbl_aluguel_livro` WRITE;
/*!40000 ALTER TABLE `tbl_aluguel_livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aluguel_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aluno`
--

DROP TABLE IF EXISTS `tbl_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aluno` (
  `id_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` int(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nasc` date NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `genero` varchar(15) NOT NULL,
  `email_institucional` varchar(100) NOT NULL,
  `id_turma` int(11) NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `id_aluno_UNIQUE` (`id_aluno`),
  KEY `id_aluno_turma_idx` (`id_turma`),
  CONSTRAINT `turma_aluno` FOREIGN KEY (`id_turma`) REFERENCES `tbl_turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aluno`
--

LOCK TABLES `tbl_aluno` WRITE;
/*!40000 ALTER TABLE `tbl_aluno` DISABLE KEYS */;
INSERT INTO `tbl_aluno` VALUES (14,16165801,'Giovanna Silva Resende','2000-03-25','32931588890','giovanna','giovanna10silva@gmail.com','http://sample-env-4.5ragbgqcqd.us-west-2.elasticbeanstalk.com/uploads/14.jpg','Feminino','giovanna.resende@senaisp.edu.br',1),(12,16165872,'Marcelo Bruno Oliveira Santos Farias','2000-08-15','44417658862','1521','bruno27ffarias@gmail.com.br','http://sample-env-4.5ragbgqcqd.us-west-2.elasticbeanstalk.com/uploads/12.jpg','Masculino','marcelo.farias@senaisp.edu.br',1),(11,16165882,'Matheus Silva da Cruz','1999-11-26','41702922863','matheus','matheusxx20111@hotmail.com','http://sample-env-4.5ragbgqcqd.us-west-2.elasticbeanstalk.com/uploads/11.jpg','Masculino','matheus.cruz@senaisp.edu.br',1),(13,16165886,'Nicolas Guarino Sanrana','2000-07-24','46595346850','nicolas','guarinoooooloo.nicolas.santana@gmail.com','','Masculino','nicolas.santana@senaisp.edu.br',1),(10,16165895,'Vinicius Ivan Colutti','2000-03-12','50382435842','colutti','viniciuscolutti@hotmail.com\r','http://sample-env-4.5ragbgqcqd.us-west-2.elasticbeanstalk.com/uploads/10.jpg','Masculino','vinicius.colutti@senaisp.edu.br',1);
/*!40000 ALTER TABLE `tbl_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anotacoes`
--

DROP TABLE IF EXISTS `tbl_anotacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_anotacoes` (
  `id_anotacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `anotacao` text NOT NULL,
  `dt_criacao` date NOT NULL,
  `dt_ultimaEdicao` date NOT NULL,
  PRIMARY KEY (`id_anotacao`),
  KEY `anotacao_aluno_idx` (`id_aluno`),
  CONSTRAINT `anotacao_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anotacoes`
--

LOCK TABLES `tbl_anotacoes` WRITE;
/*!40000 ALTER TABLE `tbl_anotacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anotacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_autor`
--

DROP TABLE IF EXISTS `tbl_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_autor` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeAutor` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_autor`
--

LOCK TABLES `tbl_autor` WRITE;
/*!40000 ALTER TABLE `tbl_autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contato`
--

DROP TABLE IF EXISTS `tbl_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_contato` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) NOT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `contato_do_aluno_idx` (`id_aluno`),
  CONSTRAINT `contato_do_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contato`
--

LOCK TABLES `tbl_contato` WRITE;
/*!40000 ALTER TABLE `tbl_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_curso`
--

DROP TABLE IF EXISTS `tbl_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipocurso` int(11) NOT NULL,
  `nome_curso` varchar(100) NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `nome_curso_UNIQUE` (`nome_curso`),
  KEY `id_tipocurso_idx` (`id_tipocurso`),
  CONSTRAINT `tbl_tipocurso` FOREIGN KEY (`id_tipocurso`) REFERENCES `tbl_tipocurso` (`id_tipoCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_curso`
--

LOCK TABLES `tbl_curso` WRITE;
/*!40000 ALTER TABLE `tbl_curso` DISABLE KEYS */;
INSERT INTO `tbl_curso` VALUES (8,4,'Informática'),(9,5,'Mecânico de Usinagem'),(10,6,'Mecânico automobilistico');
/*!40000 ALTER TABLE `tbl_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editora`
--

DROP TABLE IF EXISTS `tbl_editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_editora` (
  `id_editora` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEditora` varchar(45) NOT NULL,
  PRIMARY KEY (`id_editora`),
  UNIQUE KEY `nomeEditora_UNIQUE` (`nomeEditora`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editora`
--

LOCK TABLES `tbl_editora` WRITE;
/*!40000 ALTER TABLE `tbl_editora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_email`
--

DROP TABLE IF EXISTS `tbl_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_email` (
  `id_aluno` int(11) NOT NULL,
  `id_email` int(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_aluno`),
  CONSTRAINT `email_do_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_email`
--

LOCK TABLES `tbl_email` WRITE;
/*!40000 ALTER TABLE `tbl_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventos`
--

DROP TABLE IF EXISTS `tbl_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_eventos` (
  `id_anotacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_anotacao` varchar(100) NOT NULL,
  `texto_anotacao` text NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id_anotacao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventos`
--

LOCK TABLES `tbl_eventos` WRITE;
/*!40000 ALTER TABLE `tbl_eventos` DISABLE KEYS */;
INSERT INTO `tbl_eventos` VALUES (1,'Encontro com Marcelo Bruno Oliveira Santos de Farias','Amorzinho meu <3','2017-05-03');
/*!40000 ALTER TABLE `tbl_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventos_aluno`
--

DROP TABLE IF EXISTS `tbl_eventos_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_eventos_aluno` (
  `id_aluno` int(11) NOT NULL,
  `id_anotacao` int(11) NOT NULL,
  KEY `id_aluno_anotacao_idx` (`id_aluno`),
  KEY `id_anotacao_idx` (`id_anotacao`),
  CONSTRAINT `id_aluno_anotacao` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_anotacao` FOREIGN KEY (`id_anotacao`) REFERENCES `tbl_eventos` (`id_anotacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventos_aluno`
--

LOCK TABLES `tbl_eventos_aluno` WRITE;
/*!40000 ALTER TABLE `tbl_eventos_aluno` DISABLE KEYS */;
INSERT INTO `tbl_eventos_aluno` VALUES (10,1);
/*!40000 ALTER TABLE `tbl_eventos_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genero`
--

DROP TABLE IF EXISTS `tbl_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `genero_UNIQUE` (`genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genero`
--

LOCK TABLES `tbl_genero` WRITE;
/*!40000 ALTER TABLE `tbl_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genero_livro`
--

DROP TABLE IF EXISTS `tbl_genero_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genero_livro` (
  `id_livro` int(11) NOT NULL,
  `id_genero_livro` int(11) NOT NULL,
  KEY `id_livro_genero_idx` (`id_livro`),
  KEY `id_genero_idx` (`id_genero_livro`),
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero_livro`) REFERENCES `tbl_genero` (`id_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_livro_genero` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livro` (`id_livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genero_livro`
--

LOCK TABLES `tbl_genero_livro` WRITE;
/*!40000 ALTER TABLE `tbl_genero_livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_genero_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livro`
--

DROP TABLE IF EXISTS `tbl_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_livro` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `id_editora` int(11) NOT NULL,
  `id_genero_livro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `editora_livro'_idx` (`id_editora`),
  CONSTRAINT `editora_livro'` FOREIGN KEY (`id_editora`) REFERENCES `tbl_editora` (`id_editora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livro`
--

LOCK TABLES `tbl_livro` WRITE;
/*!40000 ALTER TABLE `tbl_livro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livroautor`
--

DROP TABLE IF EXISTS `tbl_livroautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_livroautor` (
  `id_livro` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  KEY `referenciaLivro_idx` (`id_livro`),
  KEY `referenciaAutor_idx` (`id_autor`),
  CONSTRAINT `referenciaAutor` FOREIGN KEY (`id_autor`) REFERENCES `tbl_autor` (`id_autor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `referenciaLivro` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livro` (`id_livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livroautor`
--

LOCK TABLES `tbl_livroautor` WRITE;
/*!40000 ALTER TABLE `tbl_livroautor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_livroautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materia`
--

DROP TABLE IF EXISTS `tbl_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nome_materia` varchar(60) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materia`
--

LOCK TABLES `tbl_materia` WRITE;
/*!40000 ALTER TABLE `tbl_materia` DISABLE KEYS */;
INSERT INTO `tbl_materia` VALUES (1,'Comunicação Oral e Escrita'),(2,'Fundamentos de Hardware'),(3,'Fundamentos da Informática'),(4,'Fundamentos de Programação'),(5,'Fundamentos de Rede'),(6,'Inglês Técnico'),(7,'Algoritmos'),(8,'Interfaces para Web'),(9,'Programação Orientada a Objetos'),(10,'Banco de Dados'),(11,'Progração para Web'),(12,'Programação para Dispositivos Móveis'),(13,'Gestão de Pessoas'),(14,'Projetos');
/*!40000 ALTER TABLE `tbl_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materia_turma`
--

DROP TABLE IF EXISTS `tbl_materia_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_materia_turma` (
  `id_materia` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  KEY `id_materia_idx` (`id_materia`),
  KEY `id_turmafk_idx` (`id_turma`),
  CONSTRAINT `id_materiafk` FOREIGN KEY (`id_materia`) REFERENCES `tbl_materia` (`id_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_turmafk` FOREIGN KEY (`id_turma`) REFERENCES `tbl_turma` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materia_turma`
--

LOCK TABLES `tbl_materia_turma` WRITE;
/*!40000 ALTER TABLE `tbl_materia_turma` DISABLE KEYS */;
INSERT INTO `tbl_materia_turma` VALUES (10,1),(11,1),(12,1);
/*!40000 ALTER TABLE `tbl_materia_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nota`
--

DROP TABLE IF EXISTS `tbl_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `valor_nota` int(11) NOT NULL,
  `id_materia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `nota_materia` (`id_materia`),
  CONSTRAINT `nota_materia` FOREIGN KEY (`id_materia`) REFERENCES `tbl_materia` (`id_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nota`
--

LOCK TABLES `tbl_nota` WRITE;
/*!40000 ALTER TABLE `tbl_nota` DISABLE KEYS */;
INSERT INTO `tbl_nota` VALUES (1,100,10),(2,90,11),(3,80,12),(4,50,10),(5,60,11),(6,70,12);
/*!40000 ALTER TABLE `tbl_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nota_aluno`
--

DROP TABLE IF EXISTS `tbl_nota_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nota_aluno` (
  `id_aluno` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  KEY `nota_valor_idx` (`id_nota`),
  KEY `nota_aluno_idx` (`id_aluno`),
  CONSTRAINT `nota_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `tbl_aluno` (`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_valor` FOREIGN KEY (`id_nota`) REFERENCES `tbl_nota` (`id_nota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nota_aluno`
--

LOCK TABLES `tbl_nota_aluno` WRITE;
/*!40000 ALTER TABLE `tbl_nota_aluno` DISABLE KEYS */;
INSERT INTO `tbl_nota_aluno` VALUES (14,1),(14,2),(14,3),(12,4),(12,5),(12,6);
/*!40000 ALTER TABLE `tbl_nota_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_professor`
--

DROP TABLE IF EXISTS `tbl_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_professor` (
  `id_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_professor` varchar(45) NOT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_professor`
--

LOCK TABLES `tbl_professor` WRITE;
/*!40000 ALTER TABLE `tbl_professor` DISABLE KEYS */;
INSERT INTO `tbl_professor` VALUES (1,'Kassiano Resende'),(2,'Marcel Teixeira'),(3,'Celso Furtado');
/*!40000 ALTER TABLE `tbl_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_professor_materia`
--

DROP TABLE IF EXISTS `tbl_professor_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_professor_materia` (
  `id_professor` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  KEY `id_materia_professorfk_idx` (`id_materia`),
  KEY `id_professor_fk_idx` (`id_professor`),
  CONSTRAINT `id_materia_professorfk` FOREIGN KEY (`id_materia`) REFERENCES `tbl_materia` (`id_materia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_professor_fk` FOREIGN KEY (`id_professor`) REFERENCES `tbl_professor` (`id_professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_professor_materia`
--

LOCK TABLES `tbl_professor_materia` WRITE;
/*!40000 ALTER TABLE `tbl_professor_materia` DISABLE KEYS */;
INSERT INTO `tbl_professor_materia` VALUES (1,12),(2,11),(3,10);
/*!40000 ALTER TABLE `tbl_professor_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_provas`
--

DROP TABLE IF EXISTS `tbl_provas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_provas` (
  `id_prova` int(11) NOT NULL AUTO_INCREMENT,
  `disciplina_prova` varchar(45) NOT NULL,
  `data_prova` date NOT NULL,
  `observacao` text NOT NULL,
  PRIMARY KEY (`id_prova`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_provas`
--

LOCK TABLES `tbl_provas` WRITE;
/*!40000 ALTER TABLE `tbl_provas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_provas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipocurso`
--

DROP TABLE IF EXISTS `tbl_tipocurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipocurso` (
  `id_tipoCurso` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipoCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipocurso`
--

LOCK TABLES `tbl_tipocurso` WRITE;
/*!40000 ALTER TABLE `tbl_tipocurso` DISABLE KEYS */;
INSERT INTO `tbl_tipocurso` VALUES (4,'Técnico'),(5,'CAI'),(6,'FIC');
/*!40000 ALTER TABLE `tbl_tipocurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_turma`
--

DROP TABLE IF EXISTS `tbl_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_turma` (
  `id_turma` int(11) NOT NULL AUTO_INCREMENT,
  `nome_turma` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `id_curso_idx` (`id_curso`),
  CONSTRAINT `id_curso` FOREIGN KEY (`id_curso`) REFERENCES `tbl_curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_turma`
--

LOCK TABLES `tbl_turma` WRITE;
/*!40000 ALTER TABLE `tbl_turma` DISABLE KEYS */;
INSERT INTO `tbl_turma` VALUES (1,'INF3T','Tarde',8);
/*!40000 ALTER TABLE `tbl_turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-16 16:50:56
