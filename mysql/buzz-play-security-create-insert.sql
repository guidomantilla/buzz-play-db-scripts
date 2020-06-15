CREATE DATABASE IF NOT EXISTS `buzz-play-security` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `buzz-play-security`;
-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: buzz-play-security
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `auth_authority`
--

DROP TABLE IF EXISTS `auth_authority`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `auth_authority`
(
    `username`  varchar(50) NOT NULL,
    `authority` varchar(50) NOT NULL,
    UNIQUE KEY `ix_auth_username` (`username`, `authority`),
    CONSTRAINT `fk_auth_authority_auth_user` FOREIGN KEY (`username`) REFERENCES `auth_user` (`username`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_authority`
--

LOCK TABLES `auth_authority` WRITE;
/*!40000 ALTER TABLE `auth_authority`
    DISABLE KEYS */;
INSERT INTO `auth_authority`
VALUES ('Admin', 'role_admin'),
       ('Jon', 'role_free_user'),
       ('Mike', 'role_premium_user');
/*!40000 ALTER TABLE `auth_authority`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_app_client`
--

DROP TABLE IF EXISTS `oauth_app_client`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `oauth_app_client`
(
    `client_id`               varchar(256) NOT NULL,
    `resource_ids`            varchar(256)  DEFAULT NULL,
    `client_secret`           varchar(256)  DEFAULT NULL,
    `scope`                   varchar(256)  DEFAULT NULL,
    `authorized_grant_types`  varchar(256)  DEFAULT NULL,
    `web_server_redirect_uri` varchar(256)  DEFAULT NULL,
    `authorities`             varchar(256)  DEFAULT NULL,
    `access_token_validity`   int(11)       DEFAULT NULL,
    `refresh_token_validity`  int(11)       DEFAULT NULL,
    `additional_information`  varchar(4096) DEFAULT NULL,
    `autoapprove`             varchar(256)  DEFAULT NULL,
    PRIMARY KEY (`client_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_app_client`
--

LOCK TABLES `oauth_app_client` WRITE;
/*!40000 ALTER TABLE `oauth_app_client`
    DISABLE KEYS */;
INSERT INTO `oauth_app_client`
VALUES ('BUZZ_PLAY_WEB_LEGACY', 'USER_CLIENT_RESOURCE,USER_ADMIN_RESOURCE',
        '{bcrypt}$2y$12$giiy6NkEk.3z0hGocibHm.TrizNiwWn2WXlliVzHcn1jWYzfVtXxa', 'role_admin,role_user',
        'authorization_code,password,refresh_token,implicit', '', NULL, 900, 180, '{}', 'true');
/*!40000 ALTER TABLE `oauth_app_client`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `auth_user`
(
    `username` varchar(50)  NOT NULL,
    `password` varchar(500) NOT NULL,
    `enabled`  tinyint(1)   NOT NULL,
    PRIMARY KEY (`username`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user`
    DISABLE KEYS */;
INSERT INTO `auth_user`
VALUES ('Admin', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 1),
       ('Jon', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 1),
       ('Mike', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 1);
/*!40000 ALTER TABLE `auth_user`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2020-05-02 11:18:12