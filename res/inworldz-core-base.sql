-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 10.0.0.228    Database: inworldz
-- ------------------------------------------------------
-- Server version	5.1.61-log

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
-- Table structure for table `InventoryMigrationStatus`
--

DROP TABLE IF EXISTS `InventoryMigrationStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InventoryMigrationStatus` (
  `user_id` char(36) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `IDX_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LoginHistory`
--

DROP TABLE IF EXISTS `LoginHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginHistory` (
  `session_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `session_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `last_region` char(36) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `IDX_LOGINTIME` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RdbHosts`
--

DROP TABLE IF EXISTS `RdbHosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RdbHosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RegionRdbMapping`
--

DROP TABLE IF EXISTS `RegionRdbMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegionRdbMapping` (
  `region_id` char(36) NOT NULL,
  `rdb_host_id` int(11) NOT NULL,
  PRIMARY KEY (`region_id`),
  KEY `IDX_RDB_HOST` (`rdb_host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ValidInboundMoneySources`
--

DROP TABLE IF EXISTS `ValidInboundMoneySources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValidInboundMoneySources` (
  `user_id` char(36) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `UUID` varchar(36) NOT NULL,
  `sessionID` varchar(36) NOT NULL,
  `secureSessionID` varchar(36) NOT NULL,
  `agentIP` varchar(16) NOT NULL,
  `agentPort` int(11) NOT NULL,
  `agentOnline` tinyint(4) NOT NULL,
  `loginTime` int(11) NOT NULL,
  `logoutTime` int(11) NOT NULL,
  `currentRegion` varchar(36) NOT NULL,
  `currentHandle` bigint(20) unsigned NOT NULL,
  `currentPos` varchar(64) NOT NULL,
  `currentLookAt` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `session` (`sessionID`),
  UNIQUE KEY `ssession` (`secureSessionID`),
  KEY `online` (`agentOnline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allparcels`
--

DROP TABLE IF EXISTS `allparcels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allparcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `ownerUUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `groupUUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `landingpoint` varchar(255) NOT NULL,
  `parcelUUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `infoUUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `parcelarea` int(11) unsigned NOT NULL,
  PRIMARY KEY (`parcelUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avatarappearance`
--

DROP TABLE IF EXISTS `avatarappearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatarappearance` (
  `Owner` char(36) NOT NULL,
  `Serial` int(10) unsigned NOT NULL,
  `Visual_Params` blob NOT NULL,
  `Texture` blob NOT NULL,
  `Avatar_Height` float NOT NULL,
  `Body_Item` char(36) NOT NULL,
  `Body_Asset` char(36) NOT NULL,
  `Skin_Item` char(36) NOT NULL,
  `Skin_Asset` char(36) NOT NULL,
  `Hair_Item` char(36) NOT NULL,
  `Hair_Asset` char(36) NOT NULL,
  `Eyes_Item` char(36) NOT NULL,
  `Eyes_Asset` char(36) NOT NULL,
  `Shirt_Item` char(36) NOT NULL,
  `Shirt_Asset` char(36) NOT NULL,
  `Pants_Item` char(36) NOT NULL,
  `Pants_Asset` char(36) NOT NULL,
  `Shoes_Item` char(36) NOT NULL,
  `Shoes_Asset` char(36) NOT NULL,
  `Socks_Item` char(36) NOT NULL,
  `Socks_Asset` char(36) NOT NULL,
  `Jacket_Item` char(36) NOT NULL,
  `Jacket_Asset` char(36) NOT NULL,
  `Gloves_Item` char(36) NOT NULL,
  `Gloves_Asset` char(36) NOT NULL,
  `Undershirt_Item` char(36) NOT NULL,
  `Undershirt_Asset` char(36) NOT NULL,
  `Underpants_Item` char(36) NOT NULL,
  `Underpants_Asset` char(36) NOT NULL,
  `Skirt_Item` char(36) NOT NULL,
  `Skirt_Asset` char(36) NOT NULL,
  `alpha_item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `alpha_asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `tattoo_item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `tattoo_asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `physics_item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `physics_asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PRIMARY KEY (`Owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avatarattachments`
--

DROP TABLE IF EXISTS `avatarattachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatarattachments` (
  `UUID` char(36) NOT NULL,
  `attachpoint` int(11) NOT NULL,
  `item` char(36) NOT NULL,
  `asset` char(36) NOT NULL,
  KEY `IDX_UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `botappearance`
--

DROP TABLE IF EXISTS `botappearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `botappearance` (
  `Owner` char(36) NOT NULL,
  `OutfitName` varchar(36) NOT NULL,
  `LastUsed` int(11) NOT NULL,
  `Serial` int(10) unsigned NOT NULL,
  `Visual_Params` blob NOT NULL,
  `Texture` blob NOT NULL,
  `Avatar_Height` float NOT NULL,
  `Body_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Body_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Skin_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Skin_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Hair_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Hair_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Eyes_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Eyes_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Shirt_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Shirt_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Pants_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Pants_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Shoes_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Shoes_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Socks_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Socks_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Jacket_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Jacket_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Gloves_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Gloves_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Undershirt_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Undershirt_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Underpants_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Underpants_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Skirt_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Skirt_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Alpha_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Alpha_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Tattoo_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Tattoo_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Physics_Item` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `Physics_Asset` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  PRIMARY KEY (`Owner`,`OutfitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `botattachments`
--

DROP TABLE IF EXISTS `botattachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `botattachments` (
  `UUID` char(36) NOT NULL,
  `outfitName` varchar(36) NOT NULL,
  `attachpoint` int(11) NOT NULL,
  `item` char(36) NOT NULL,
  `asset` char(36) NOT NULL,
  KEY `IDX_ID_OUTFIT` (`UUID`,`outfitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cachedbakedtextures`
--

DROP TABLE IF EXISTS `cachedbakedtextures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cachedbakedtextures` (
  `cache` char(36) NOT NULL,
  `texture` char(36) NOT NULL,
  PRIMARY KEY (`cache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classifieds`
--

DROP TABLE IF EXISTS `classifieds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classifieds` (
  `classifieduuid` char(36) NOT NULL,
  `creatoruuid` char(36) NOT NULL,
  `creationdate` int(20) NOT NULL,
  `expirationdate` int(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parceluuid` char(36) NOT NULL,
  `parentestate` int(11) NOT NULL,
  `snapshotuuid` char(36) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `posglobal` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `classifiedflags` int(8) NOT NULL,
  `priceforlisting` int(5) NOT NULL,
  PRIMARY KEY (`classifieduuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `economy_totals`
--

DROP TABLE IF EXISTS `economy_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `economy_totals` (
  `user_id` char(36) NOT NULL,
  `total` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `economy_transaction`
--

DROP TABLE IF EXISTS `economy_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `economy_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceAvatarID` varchar(36) NOT NULL,
  `destAvatarID` varchar(36) NOT NULL,
  `transactionAmount` int(11) NOT NULL,
  `transactionType` int(11) NOT NULL,
  `transactionDescription` varchar(255) DEFAULT NULL,
  `timeOccurred` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_destination` (`destAvatarID`),
  KEY `IDX_source` (`sourceAvatarID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER `upd_total_on_new_trans`
AFTER INSERT ON `economy_transaction`
FOR EACH ROW
BEGIN
  IF (SELECT COUNT(*) FROM economy_totals WHERE user_id = NEW.destAvatarId) = 0 THEN
		INSERT IGNORE INTO economy_totals SELECT NEW.destAvatarId, SUM(transactionAmount) FROM economy_transaction WHERE destAvatarID = NEW.destAvatarId;
  ELSE
		UPDATE economy_totals SET total = total + NEW.transactionAmount WHERE user_id = NEW.destAvatarId;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estate_groups`
--

DROP TABLE IF EXISTS `estate_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estate_groups` (
  `EstateID` int(10) unsigned NOT NULL,
  `uuid` char(36) NOT NULL,
  KEY `EstateID` (`EstateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estate_managers`
--

DROP TABLE IF EXISTS `estate_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estate_managers` (
  `EstateId` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `EstateID` (`EstateId`)
) ENGINE=InnoDB AUTO_INCREMENT=153638 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estate_map`
--

DROP TABLE IF EXISTS `estate_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estate_map` (
  `RegionID` varchar(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `EstateID` int(11) NOT NULL,
  PRIMARY KEY (`RegionID`),
  KEY `EstateID` (`EstateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estate_settings`
--

DROP TABLE IF EXISTS `estate_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estate_settings` (
  `EstateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EstateName` varchar(64) DEFAULT NULL,
  `AbuseEmailToEstateOwner` tinyint(4) NOT NULL,
  `DenyAnonymous` tinyint(4) NOT NULL,
  `ResetHomeOnTeleport` tinyint(4) NOT NULL,
  `FixedSun` tinyint(4) NOT NULL,
  `DenyTransacted` tinyint(4) NOT NULL,
  `BlockDwell` tinyint(4) NOT NULL,
  `DenyIdentified` tinyint(4) NOT NULL,
  `AllowVoice` tinyint(4) NOT NULL,
  `UseGlobalTime` tinyint(4) NOT NULL,
  `PricePerMeter` int(11) NOT NULL,
  `TaxFree` tinyint(4) NOT NULL,
  `AllowDirectTeleport` tinyint(4) NOT NULL,
  `RedirectGridX` int(11) NOT NULL,
  `RedirectGridY` int(11) NOT NULL,
  `ParentEstateID` int(10) unsigned NOT NULL,
  `SunPosition` double NOT NULL,
  `EstateSkipScripts` tinyint(4) NOT NULL,
  `BillableFactor` float NOT NULL,
  `PublicAccess` tinyint(4) NOT NULL,
  `AbuseEmail` varchar(255) NOT NULL,
  `EstateOwner` varchar(36) NOT NULL,
  `DenyMinors` tinyint(4) NOT NULL,
  PRIMARY KEY (`EstateID`)
) ENGINE=InnoDB AUTO_INCREMENT=195067 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estate_users`
--

DROP TABLE IF EXISTS `estate_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estate_users` (
  `EstateID` int(10) unsigned NOT NULL,
  `uuid` char(36) NOT NULL,
  KEY `EstateID` (`EstateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estateban`
--

DROP TABLE IF EXISTS `estateban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estateban` (
  `EstateID` int(10) unsigned NOT NULL,
  `bannedUUID` varchar(36) NOT NULL,
  `bannedIp` varchar(16) NOT NULL,
  `bannedIpHostMask` varchar(16) NOT NULL,
  `bannedNameMask` varchar(64) DEFAULT NULL,
  KEY `estateban_EstateID` (`EstateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `owneruuid` char(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `eventid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creatoruuid` char(40) NOT NULL,
  `category` int(2) NOT NULL,
  `description` text NOT NULL,
  `dateUTC` int(12) NOT NULL,
  `duration` int(3) NOT NULL,
  `covercharge` int(1) NOT NULL,
  `coveramount` int(10) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `globalPos` varchar(255) NOT NULL,
  `eventflags` int(10) NOT NULL,
  `mature` enum('true','false') NOT NULL,
  PRIMARY KEY (`eventid`),
  KEY `IDX_DATE` (`dateUTC`)
) ENGINE=InnoDB AUTO_INCREMENT=24408 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hostsregister`
--

DROP TABLE IF EXISTS `hostsregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostsregister` (
  `host` varchar(255) NOT NULL,
  `port` int(5) NOT NULL,
  `register` int(10) NOT NULL,
  `lastcheck` int(10) NOT NULL,
  `failcounter` int(1) NOT NULL,
  PRIMARY KEY (`host`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventoryfolders`
--

DROP TABLE IF EXISTS `inventoryfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventoryfolders` (
  `folderName` varchar(64) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `folderID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `agentID` char(36) DEFAULT NULL,
  `parentFolderID` char(36) DEFAULT NULL,
  PRIMARY KEY (`folderID`),
  KEY `inventoryfolders_agentid` (`agentID`),
  KEY `inventoryfolders_parentFolderid` (`parentFolderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventoryitems`
--

DROP TABLE IF EXISTS `inventoryitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventoryitems` (
  `assetID` varchar(36) DEFAULT NULL,
  `assetType` int(11) DEFAULT NULL,
  `inventoryName` varchar(64) DEFAULT NULL,
  `inventoryDescription` varchar(255) DEFAULT NULL,
  `inventoryNextPermissions` int(10) unsigned DEFAULT NULL,
  `inventoryCurrentPermissions` int(10) unsigned DEFAULT NULL,
  `invType` int(11) DEFAULT NULL,
  `creatorID` varchar(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `inventoryBasePermissions` int(10) unsigned NOT NULL DEFAULT '0',
  `inventoryEveryOnePermissions` int(10) unsigned NOT NULL DEFAULT '0',
  `salePrice` int(11) NOT NULL DEFAULT '0',
  `saleType` tinyint(4) NOT NULL DEFAULT '0',
  `creationDate` int(11) NOT NULL DEFAULT '0',
  `groupID` varchar(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `groupOwned` tinyint(4) NOT NULL DEFAULT '0',
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `inventoryID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `avatarID` char(36) DEFAULT NULL,
  `parentFolderID` char(36) DEFAULT NULL,
  `inventoryGroupPermissions` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`inventoryID`),
  KEY `inventoryitems_avatarid` (`avatarID`),
  KEY `inventoryitems_parentFolderid` (`parentFolderID`),
  KEY `inventoryitems_assetID` (`assetID`),
  KEY `IDX_ASSET_TYPE` (`assetType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `land`
--

DROP TABLE IF EXISTS `land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `land` (
  `UUID` varchar(255) NOT NULL,
  `RegionUUID` varchar(255) DEFAULT NULL,
  `LocalLandID` int(11) DEFAULT NULL,
  `Bitmap` longblob,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `OwnerUUID` varchar(255) DEFAULT NULL,
  `IsGroupOwned` int(11) DEFAULT NULL,
  `Area` int(11) DEFAULT NULL,
  `AuctionID` int(11) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  `ClaimDate` int(11) DEFAULT NULL,
  `ClaimPrice` int(11) DEFAULT NULL,
  `GroupUUID` varchar(255) DEFAULT NULL,
  `SalePrice` int(11) DEFAULT NULL,
  `LandStatus` int(11) DEFAULT NULL,
  `LandFlags` int(11) DEFAULT NULL,
  `LandingType` int(11) DEFAULT NULL,
  `MediaAutoScale` int(11) DEFAULT NULL,
  `MediaTextureUUID` varchar(255) DEFAULT NULL,
  `MediaURL` varchar(255) DEFAULT NULL,
  `MusicURL` varchar(255) DEFAULT NULL,
  `PassHours` float DEFAULT NULL,
  `PassPrice` int(11) DEFAULT NULL,
  `SnapshotUUID` varchar(255) DEFAULT NULL,
  `UserLocationX` float DEFAULT NULL,
  `UserLocationY` float DEFAULT NULL,
  `UserLocationZ` float DEFAULT NULL,
  `UserLookAtX` float DEFAULT NULL,
  `UserLookAtY` float DEFAULT NULL,
  `UserLookAtZ` float DEFAULT NULL,
  `AuthbuyerID` varchar(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `OtherCleanTime` int(11) NOT NULL DEFAULT '0',
  `Dwell` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landaccesslist`
--

DROP TABLE IF EXISTS `landaccesslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landaccesslist` (
  `LandUUID` varchar(255) DEFAULT NULL,
  `AccessUUID` varchar(255) DEFAULT NULL,
  `Flags` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `name` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mutelist`
--

DROP TABLE IF EXISTS `mutelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutelist` (
  `AgentID` varchar(128) NOT NULL,
  `MuteID` varchar(128) NOT NULL,
  `MuteType` int(11) NOT NULL,
  `MuteName` varchar(128) NOT NULL,
  `MuteFlags` int(11) unsigned NOT NULL,
  PRIMARY KEY (`AgentID`,`MuteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newestinvitem`
--

DROP TABLE IF EXISTS `newestinvitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newestinvitem` (
  `inventoryid` varchar(36) NOT NULL,
  `creationdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventoryid`),
  KEY `CREATIONDATE_IDX` (`creationdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `objectuuid` varchar(255) NOT NULL,
  `parceluuid` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `regionuuid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`objectuuid`,`parceluuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offlines`
--

DROP TABLE IF EXISTS `offlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offlines` (
  `fromAgentId` varchar(36) NOT NULL,
  `fromAgentName` varchar(36) NOT NULL,
  `toAgentId` varchar(36) NOT NULL,
  `dialogVal` tinyint(1) unsigned NOT NULL,
  `fromGroupVal` varchar(10) NOT NULL,
  `offlineMessage` text NOT NULL,
  `messageId` varchar(36) NOT NULL,
  `xPos` varchar(45) NOT NULL,
  `yPos` varchar(45) NOT NULL,
  `zPos` varchar(45) NOT NULL,
  `binaryBucket` varchar(45) NOT NULL,
  `parentEstateId` int(10) unsigned NOT NULL,
  `regionId` varchar(36) NOT NULL,
  `messageTimestamp` int(10) unsigned NOT NULL,
  `offlineVal` int(1) unsigned NOT NULL,
  KEY `IDX_toAgentId` (`toAgentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osagent`
--

DROP TABLE IF EXISTS `osagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osagent` (
  `AgentID` varchar(128) NOT NULL,
  `ActiveGroupID` varchar(128) NOT NULL,
  PRIMARY KEY (`AgentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osgroup`
--

DROP TABLE IF EXISTS `osgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osgroup` (
  `GroupID` varchar(128) CHARACTER SET utf8 NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Charter` varchar(1024) CHARACTER SET utf8 NOT NULL,
  `InsigniaID` varchar(128) CHARACTER SET utf8 NOT NULL,
  `FounderID` varchar(128) CHARACTER SET utf8 NOT NULL,
  `MembershipFee` int(11) unsigned NOT NULL,
  `OpenEnrollment` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ShowInList` tinyint(1) unsigned NOT NULL,
  `AllowPublish` tinyint(1) unsigned NOT NULL,
  `MaturePublish` tinyint(1) unsigned NOT NULL,
  `OwnerRoleID` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`GroupID`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osgroupinvite`
--

DROP TABLE IF EXISTS `osgroupinvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osgroupinvite` (
  `InviteID` varchar(128) NOT NULL,
  `GroupID` varchar(128) NOT NULL,
  `RoleID` varchar(128) NOT NULL,
  `AgentID` varchar(128) NOT NULL,
  `TMStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`InviteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osgroupmembership`
--

DROP TABLE IF EXISTS `osgroupmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osgroupmembership` (
  `GroupID` varchar(128) NOT NULL,
  `AgentID` varchar(128) NOT NULL,
  `SelectedRoleID` varchar(128) NOT NULL,
  `Contribution` int(11) unsigned NOT NULL,
  `ListInProfile` int(11) unsigned NOT NULL,
  `AcceptNotices` int(11) unsigned NOT NULL,
  PRIMARY KEY (`GroupID`,`AgentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osgroupnotice`
--

DROP TABLE IF EXISTS `osgroupnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osgroupnotice` (
  `GroupID` varchar(128) NOT NULL,
  `NoticeID` varchar(128) NOT NULL,
  `Timestamp` int(10) unsigned NOT NULL,
  `FromName` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Message` text NOT NULL,
  `BinaryBucket` text NOT NULL,
  PRIMARY KEY (`GroupID`,`NoticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osgrouprolemembership`
--

DROP TABLE IF EXISTS `osgrouprolemembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osgrouprolemembership` (
  `GroupID` varchar(128) NOT NULL,
  `RoleID` varchar(128) NOT NULL,
  `AgentID` varchar(128) NOT NULL,
  PRIMARY KEY (`GroupID`,`RoleID`,`AgentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `osrole`
--

DROP TABLE IF EXISTS `osrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osrole` (
  `GroupID` varchar(128) NOT NULL,
  `RoleID` varchar(128) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Powers` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`GroupID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parcels`
--

DROP TABLE IF EXISTS `parcels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `searchcategory` varchar(50) NOT NULL,
  `build` enum('true','false') NOT NULL,
  `script` enum('true','false') NOT NULL,
  `public` enum('true','false') NOT NULL,
  `dwell` float NOT NULL DEFAULT '0',
  `infouuid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`regionUUID`,`parcelUUID`),
  KEY `name` (`parcelname`),
  KEY `description` (`description`),
  KEY `searchcategory` (`searchcategory`),
  KEY `dwell` (`dwell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parcelsales`
--

DROP TABLE IF EXISTS `parcelsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcelsales` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `area` int(6) NOT NULL,
  `saleprice` int(11) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `infoUUID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `dwell` int(11) NOT NULL,
  `parentestate` int(11) NOT NULL DEFAULT '1',
  `mature` varchar(32) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`regionUUID`,`parcelUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `primitems`
--

DROP TABLE IF EXISTS `primitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primitems` (
  `invType` int(11) DEFAULT NULL,
  `assetType` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) DEFAULT NULL,
  `nextPermissions` int(11) DEFAULT NULL,
  `currentPermissions` int(11) DEFAULT NULL,
  `basePermissions` int(11) DEFAULT NULL,
  `everyonePermissions` int(11) DEFAULT NULL,
  `groupPermissions` int(11) DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `itemID` char(36) NOT NULL DEFAULT '',
  `primID` char(36) DEFAULT NULL,
  `assetID` char(36) DEFAULT NULL,
  `parentFolderID` char(36) DEFAULT NULL,
  `creatorID` char(36) DEFAULT NULL,
  `ownerID` char(36) DEFAULT NULL,
  `groupID` char(36) DEFAULT NULL,
  `lastOwnerID` char(36) DEFAULT NULL,
  `canDebitOwner` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`),
  KEY `primitems_primid` (`primID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prims`
--

DROP TABLE IF EXISTS `prims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prims` (
  `CreationDate` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Text` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SitName` varchar(255) DEFAULT NULL,
  `TouchName` varchar(255) DEFAULT NULL,
  `ObjectFlags` int(11) DEFAULT NULL,
  `OwnerMask` int(11) DEFAULT NULL,
  `NextOwnerMask` int(11) DEFAULT NULL,
  `GroupMask` int(11) DEFAULT NULL,
  `EveryoneMask` int(11) DEFAULT NULL,
  `BaseMask` int(11) DEFAULT NULL,
  `PositionX` double DEFAULT NULL,
  `PositionY` double DEFAULT NULL,
  `PositionZ` double DEFAULT NULL,
  `GroupPositionX` double DEFAULT NULL,
  `GroupPositionY` double DEFAULT NULL,
  `GroupPositionZ` double DEFAULT NULL,
  `VelocityX` double DEFAULT NULL,
  `VelocityY` double DEFAULT NULL,
  `VelocityZ` double DEFAULT NULL,
  `AngularVelocityX` double DEFAULT NULL,
  `AngularVelocityY` double DEFAULT NULL,
  `AngularVelocityZ` double DEFAULT NULL,
  `AccelerationX` double DEFAULT NULL,
  `AccelerationY` double DEFAULT NULL,
  `AccelerationZ` double DEFAULT NULL,
  `RotationX` double DEFAULT NULL,
  `RotationY` double DEFAULT NULL,
  `RotationZ` double DEFAULT NULL,
  `RotationW` double DEFAULT NULL,
  `SitTargetOffsetX` double DEFAULT NULL,
  `SitTargetOffsetY` double DEFAULT NULL,
  `SitTargetOffsetZ` double DEFAULT NULL,
  `SitTargetOrientW` double DEFAULT NULL,
  `SitTargetOrientX` double DEFAULT NULL,
  `SitTargetOrientY` double DEFAULT NULL,
  `SitTargetOrientZ` double DEFAULT NULL,
  `UUID` char(36) NOT NULL DEFAULT '',
  `RegionUUID` char(36) DEFAULT NULL,
  `CreatorID` char(36) DEFAULT NULL,
  `OwnerID` char(36) DEFAULT NULL,
  `GroupID` char(36) DEFAULT NULL,
  `LastOwnerID` char(36) DEFAULT NULL,
  `SceneGroupID` char(36) DEFAULT NULL,
  `PayPrice` int(11) NOT NULL DEFAULT '0',
  `PayButton1` int(11) NOT NULL DEFAULT '0',
  `PayButton2` int(11) NOT NULL DEFAULT '0',
  `PayButton3` int(11) NOT NULL DEFAULT '0',
  `PayButton4` int(11) NOT NULL DEFAULT '0',
  `LoopedSound` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `LoopedSoundGain` double NOT NULL DEFAULT '0',
  `TextureAnimation` blob,
  `OmegaX` double NOT NULL DEFAULT '0',
  `OmegaY` double NOT NULL DEFAULT '0',
  `OmegaZ` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetX` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetY` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetZ` double NOT NULL DEFAULT '0',
  `CameraAtOffsetX` double NOT NULL DEFAULT '0',
  `CameraAtOffsetY` double NOT NULL DEFAULT '0',
  `CameraAtOffsetZ` double NOT NULL DEFAULT '0',
  `ForceMouselook` tinyint(4) NOT NULL DEFAULT '0',
  `ScriptAccessPin` int(11) NOT NULL DEFAULT '0',
  `AllowedDrop` tinyint(4) NOT NULL DEFAULT '0',
  `DieAtEdge` tinyint(4) NOT NULL DEFAULT '0',
  `SalePrice` int(11) NOT NULL DEFAULT '10',
  `SaleType` tinyint(4) NOT NULL DEFAULT '0',
  `ColorR` int(11) NOT NULL DEFAULT '0',
  `ColorG` int(11) NOT NULL DEFAULT '0',
  `ColorB` int(11) NOT NULL DEFAULT '0',
  `ColorA` int(11) NOT NULL DEFAULT '0',
  `ParticleSystem` blob,
  `ClickAction` tinyint(4) NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '3',
  `CollisionSound` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `CollisionSoundVolume` double NOT NULL DEFAULT '0',
  `LinkNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UUID`),
  KEY `prims_regionuuid` (`RegionUUID`),
  KEY `prims_scenegroupid` (`SceneGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prims_copy_temps`
--

DROP TABLE IF EXISTS `prims_copy_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prims_copy_temps` (
  `CreationDate` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Text` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SitName` varchar(255) DEFAULT NULL,
  `TouchName` varchar(255) DEFAULT NULL,
  `ObjectFlags` int(11) DEFAULT NULL,
  `OwnerMask` int(11) DEFAULT NULL,
  `NextOwnerMask` int(11) DEFAULT NULL,
  `GroupMask` int(11) DEFAULT NULL,
  `EveryoneMask` int(11) DEFAULT NULL,
  `BaseMask` int(11) DEFAULT NULL,
  `PositionX` double DEFAULT NULL,
  `PositionY` double DEFAULT NULL,
  `PositionZ` double DEFAULT NULL,
  `GroupPositionX` double DEFAULT NULL,
  `GroupPositionY` double DEFAULT NULL,
  `GroupPositionZ` double DEFAULT NULL,
  `VelocityX` double DEFAULT NULL,
  `VelocityY` double DEFAULT NULL,
  `VelocityZ` double DEFAULT NULL,
  `AngularVelocityX` double DEFAULT NULL,
  `AngularVelocityY` double DEFAULT NULL,
  `AngularVelocityZ` double DEFAULT NULL,
  `AccelerationX` double DEFAULT NULL,
  `AccelerationY` double DEFAULT NULL,
  `AccelerationZ` double DEFAULT NULL,
  `RotationX` double DEFAULT NULL,
  `RotationY` double DEFAULT NULL,
  `RotationZ` double DEFAULT NULL,
  `RotationW` double DEFAULT NULL,
  `SitTargetOffsetX` double DEFAULT NULL,
  `SitTargetOffsetY` double DEFAULT NULL,
  `SitTargetOffsetZ` double DEFAULT NULL,
  `SitTargetOrientW` double DEFAULT NULL,
  `SitTargetOrientX` double DEFAULT NULL,
  `SitTargetOrientY` double DEFAULT NULL,
  `SitTargetOrientZ` double DEFAULT NULL,
  `OldUUID` char(36) NOT NULL DEFAULT '',
  `NewUUID` char(36) NOT NULL DEFAULT '',
  `RegionUUID` char(36) DEFAULT NULL,
  `CreatorID` char(36) DEFAULT NULL,
  `OwnerID` char(36) DEFAULT NULL,
  `GroupID` char(36) DEFAULT NULL,
  `LastOwnerID` char(36) DEFAULT NULL,
  `SceneGroupID` char(36) DEFAULT NULL,
  `PayPrice` int(11) NOT NULL DEFAULT '0',
  `PayButton1` int(11) NOT NULL DEFAULT '0',
  `PayButton2` int(11) NOT NULL DEFAULT '0',
  `PayButton3` int(11) NOT NULL DEFAULT '0',
  `PayButton4` int(11) NOT NULL DEFAULT '0',
  `LoopedSound` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `LoopedSoundGain` double NOT NULL DEFAULT '0',
  `TextureAnimation` blob,
  `OmegaX` double NOT NULL DEFAULT '0',
  `OmegaY` double NOT NULL DEFAULT '0',
  `OmegaZ` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetX` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetY` double NOT NULL DEFAULT '0',
  `CameraEyeOffsetZ` double NOT NULL DEFAULT '0',
  `CameraAtOffsetX` double NOT NULL DEFAULT '0',
  `CameraAtOffsetY` double NOT NULL DEFAULT '0',
  `CameraAtOffsetZ` double NOT NULL DEFAULT '0',
  `ForceMouselook` tinyint(4) NOT NULL DEFAULT '0',
  `ScriptAccessPin` int(11) NOT NULL DEFAULT '0',
  `AllowedDrop` tinyint(4) NOT NULL DEFAULT '0',
  `DieAtEdge` tinyint(4) NOT NULL DEFAULT '0',
  `SalePrice` int(11) NOT NULL DEFAULT '10',
  `SaleType` tinyint(4) NOT NULL DEFAULT '0',
  `ColorR` int(11) NOT NULL DEFAULT '0',
  `ColorG` int(11) NOT NULL DEFAULT '0',
  `ColorB` int(11) NOT NULL DEFAULT '0',
  `ColorA` int(11) NOT NULL DEFAULT '0',
  `ParticleSystem` blob,
  `ClickAction` tinyint(4) NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '3',
  `CollisionSound` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `CollisionSoundVolume` double NOT NULL DEFAULT '0',
  `LinkNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OldUUID`),
  KEY `prims_regionuuid` (`RegionUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `primshapes`
--

DROP TABLE IF EXISTS `primshapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primshapes` (
  `Shape` int(11) DEFAULT NULL,
  `ScaleX` double NOT NULL DEFAULT '0',
  `ScaleY` double NOT NULL DEFAULT '0',
  `ScaleZ` double NOT NULL DEFAULT '0',
  `PCode` int(11) DEFAULT NULL,
  `PathBegin` int(11) DEFAULT NULL,
  `PathEnd` int(11) DEFAULT NULL,
  `PathScaleX` int(11) DEFAULT NULL,
  `PathScaleY` int(11) DEFAULT NULL,
  `PathShearX` int(11) DEFAULT NULL,
  `PathShearY` int(11) DEFAULT NULL,
  `PathSkew` int(11) DEFAULT NULL,
  `PathCurve` int(11) DEFAULT NULL,
  `PathRadiusOffset` int(11) DEFAULT NULL,
  `PathRevolutions` int(11) DEFAULT NULL,
  `PathTaperX` int(11) DEFAULT NULL,
  `PathTaperY` int(11) DEFAULT NULL,
  `PathTwist` int(11) DEFAULT NULL,
  `PathTwistBegin` int(11) DEFAULT NULL,
  `ProfileBegin` int(11) DEFAULT NULL,
  `ProfileEnd` int(11) DEFAULT NULL,
  `ProfileCurve` int(11) DEFAULT NULL,
  `ProfileHollow` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `Texture` longblob,
  `ExtraParams` longblob,
  `UUID` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`UUID`),
  KEY `IDX_ATTACHMENT` (`PCode`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `uuid` varchar(36) NOT NULL,
  `regionHandle` bigint(20) unsigned NOT NULL,
  `regionName` varchar(32) DEFAULT NULL,
  `regionRecvKey` varchar(128) DEFAULT NULL,
  `regionSendKey` varchar(128) DEFAULT NULL,
  `regionSecret` varchar(128) DEFAULT NULL,
  `regionDataURI` varchar(255) DEFAULT NULL,
  `serverIP` varchar(64) DEFAULT NULL,
  `serverPort` int(10) unsigned DEFAULT NULL,
  `serverURI` varchar(255) DEFAULT NULL,
  `locX` int(10) unsigned DEFAULT NULL,
  `locY` int(10) unsigned DEFAULT NULL,
  `locZ` int(10) unsigned DEFAULT NULL,
  `eastOverrideHandle` bigint(20) unsigned DEFAULT NULL,
  `westOverrideHandle` bigint(20) unsigned DEFAULT NULL,
  `southOverrideHandle` bigint(20) unsigned DEFAULT NULL,
  `northOverrideHandle` bigint(20) unsigned DEFAULT NULL,
  `regionAssetURI` varchar(255) DEFAULT NULL,
  `regionAssetRecvKey` varchar(128) DEFAULT NULL,
  `regionAssetSendKey` varchar(128) DEFAULT NULL,
  `regionUserURI` varchar(255) DEFAULT NULL,
  `regionUserRecvKey` varchar(128) DEFAULT NULL,
  `regionUserSendKey` varchar(128) DEFAULT NULL,
  `regionMapTexture` varchar(36) DEFAULT NULL,
  `serverHttpPort` int(10) DEFAULT NULL,
  `serverRemotingPort` int(10) DEFAULT NULL,
  `owner_uuid` varchar(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `originUUID` varchar(36) DEFAULT NULL,
  `access` int(10) unsigned DEFAULT '1',
  `ScopeID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `sizeX` int(11) unsigned NOT NULL DEFAULT '0',
  `sizeY` int(11) unsigned NOT NULL DEFAULT '0',
  `product` tinyint(4) NOT NULL DEFAULT '0',
  `outside_ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `regionName` (`regionName`),
  KEY `regionHandle` (`regionHandle`),
  KEY `overrideHandles` (`eastOverrideHandle`,`westOverrideHandle`,`southOverrideHandle`,`northOverrideHandle`),
  KEY `IDX_XY` (`locX`,`locY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Rev. 3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regionsettings`
--

DROP TABLE IF EXISTS `regionsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regionsettings` (
  `regionUUID` char(36) NOT NULL,
  `block_terraform` int(11) NOT NULL,
  `block_fly` int(11) NOT NULL,
  `allow_damage` int(11) NOT NULL,
  `restrict_pushing` int(11) NOT NULL,
  `allow_land_resell` int(11) NOT NULL,
  `allow_land_join_divide` int(11) NOT NULL,
  `block_show_in_search` int(11) NOT NULL,
  `agent_limit` int(11) NOT NULL,
  `object_bonus` double NOT NULL,
  `maturity` int(11) NOT NULL,
  `disable_scripts` int(11) NOT NULL,
  `disable_collisions` int(11) NOT NULL,
  `disable_physics` int(11) NOT NULL,
  `terrain_texture_1` char(36) NOT NULL,
  `terrain_texture_2` char(36) NOT NULL,
  `terrain_texture_3` char(36) NOT NULL,
  `terrain_texture_4` char(36) NOT NULL,
  `elevation_1_nw` double NOT NULL,
  `elevation_2_nw` double NOT NULL,
  `elevation_1_ne` double NOT NULL,
  `elevation_2_ne` double NOT NULL,
  `elevation_1_se` double NOT NULL,
  `elevation_2_se` double NOT NULL,
  `elevation_1_sw` double NOT NULL,
  `elevation_2_sw` double NOT NULL,
  `water_height` double NOT NULL,
  `terrain_raise_limit` double NOT NULL,
  `terrain_lower_limit` double NOT NULL,
  `use_estate_sun` int(11) NOT NULL,
  `fixed_sun` int(11) NOT NULL,
  `sun_position` double NOT NULL,
  `covenant` char(36) DEFAULT NULL,
  `Sandbox` tinyint(4) NOT NULL,
  `sunvectorx` double NOT NULL DEFAULT '0',
  `sunvectory` double NOT NULL DEFAULT '0',
  `sunvectorz` double NOT NULL DEFAULT '0',
  `covenantTimeStamp` int(11) unsigned NOT NULL DEFAULT '1262307600',
  PRIMARY KEY (`regionUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telehubs`
--

DROP TABLE IF EXISTS `telehubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telehubs` (
  `RegionID` char(36) NOT NULL,
  `TelehubLoc` varchar(50) NOT NULL,
  `TelehubRot` varchar(50) NOT NULL,
  `ObjectUUID` char(36) NOT NULL,
  `Spawns` char(255) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terrain`
--

DROP TABLE IF EXISTS `terrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terrain` (
  `RegionUUID` varchar(255) NOT NULL DEFAULT '',
  `Revision` int(11) DEFAULT NULL,
  `Heightfield` longblob,
  PRIMARY KEY (`RegionUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_count`
--

DROP TABLE IF EXISTS `user_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_count` (
  `u_count` int(11) DEFAULT NULL,
  `online_u_count` int(11) DEFAULT NULL,
  `region_count` int(11) DEFAULT NULL,
  `private_isle_count` int(11) DEFAULT NULL,
  `mainland_count` int(11) DEFAULT NULL,
  `scenic_count` int(11) DEFAULT NULL,
  `sponsored_count` int(11) DEFAULT NULL,
  `last_refresh` int(11) DEFAULT NULL,
  `unique_user_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userfriends`
--

DROP TABLE IF EXISTS `userfriends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfriends` (
  `ownerID` varchar(37) NOT NULL,
  `friendID` varchar(37) NOT NULL,
  `friendPerms` int(11) NOT NULL,
  `datetimestamp` int(11) NOT NULL,
  UNIQUE KEY `ownerID` (`ownerID`,`friendID`),
  KEY `IDX_friendperms` (`friendPerms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userfriends_old`
--

DROP TABLE IF EXISTS `userfriends_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfriends_old` (
  `ownerID` varchar(37) NOT NULL,
  `friendID` varchar(37) NOT NULL,
  `friendPerms` int(11) NOT NULL,
  `datetimestamp` int(11) NOT NULL,
  UNIQUE KEY `ownerID` (`ownerID`,`friendID`),
  KEY `IDX_friendperms` (`friendPerms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usernotes`
--

DROP TABLE IF EXISTS `usernotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernotes` (
  `useruuid` varchar(36) NOT NULL,
  `targetuuid` varchar(36) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`useruuid`,`targetuuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpicks`
--

DROP TABLE IF EXISTS `userpicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpicks` (
  `pickuuid` varchar(36) NOT NULL,
  `creatoruuid` varchar(36) NOT NULL,
  `toppick` enum('true','false') NOT NULL,
  `parceluuid` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `snapshotuuid` varchar(36) NOT NULL,
  `user` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `posglobal` varchar(255) NOT NULL,
  `sortorder` int(2) NOT NULL,
  `enabled` enum('true','false') NOT NULL,
  PRIMARY KEY (`pickuuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `user_id` varchar(36) NOT NULL,
  `recv_ims_via_email` tinyint(1) NOT NULL,
  `listed_in_directory` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userprefs_bak`
--

DROP TABLE IF EXISTS `userprefs_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprefs_bak` (
  `user_id` char(36) NOT NULL,
  `recv_ims_via_email` tinyint(1) NOT NULL,
  `listed_in_directory` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UUID` varchar(36) NOT NULL DEFAULT '',
  `username` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `passwordHash` varchar(32) NOT NULL,
  `passwordSalt` varchar(32) NOT NULL,
  `homeRegion` bigint(20) unsigned DEFAULT NULL,
  `homeLocationX` float DEFAULT NULL,
  `homeLocationY` float DEFAULT NULL,
  `homeLocationZ` float DEFAULT NULL,
  `homeLookAtX` float DEFAULT NULL,
  `homeLookAtY` float DEFAULT NULL,
  `homeLookAtZ` float DEFAULT NULL,
  `created` int(11) NOT NULL,
  `lastLogin` int(11) NOT NULL,
  `userInventoryURI` varchar(255) DEFAULT NULL,
  `userAssetURI` varchar(255) DEFAULT NULL,
  `profileCanDoMask` int(10) unsigned DEFAULT NULL,
  `profileWantDoMask` int(10) unsigned DEFAULT NULL,
  `profileAboutText` text,
  `profileFirstText` text,
  `profileImage` varchar(36) DEFAULT NULL,
  `profileFirstImage` varchar(36) DEFAULT NULL,
  `webLoginKey` varchar(36) DEFAULT NULL,
  `homeRegionID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `userFlags` int(11) NOT NULL DEFAULT '0',
  `godLevel` int(11) NOT NULL DEFAULT '0',
  `iz_level` int(1) unsigned NOT NULL DEFAULT '0',
  `customType` varchar(32) NOT NULL DEFAULT '',
  `partner` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `email` varchar(250) DEFAULT NULL,
  `profileURL` varchar(100) DEFAULT NULL,
  `skillsMask` int(10) unsigned NOT NULL DEFAULT '0',
  `skillsText` varchar(255) NOT NULL DEFAULT 'None',
  `wantToMask` int(10) unsigned NOT NULL DEFAULT '0',
  `wantToText` varchar(255) NOT NULL DEFAULT 'None',
  `languagesText` varchar(255) NOT NULL DEFAULT 'English',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `usernames` (`username`,`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_bak`
--

DROP TABLE IF EXISTS `users_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_bak` (
  `UUID` varchar(36) NOT NULL DEFAULT '',
  `username` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `passwordHash` varchar(32) NOT NULL,
  `passwordSalt` varchar(32) NOT NULL,
  `homeRegion` bigint(20) unsigned DEFAULT NULL,
  `homeLocationX` float DEFAULT NULL,
  `homeLocationY` float DEFAULT NULL,
  `homeLocationZ` float DEFAULT NULL,
  `homeLookAtX` float DEFAULT NULL,
  `homeLookAtY` float DEFAULT NULL,
  `homeLookAtZ` float DEFAULT NULL,
  `created` int(11) NOT NULL,
  `lastLogin` int(11) NOT NULL,
  `userInventoryURI` varchar(255) DEFAULT NULL,
  `userAssetURI` varchar(255) DEFAULT NULL,
  `profileCanDoMask` int(10) unsigned DEFAULT NULL,
  `profileWantDoMask` int(10) unsigned DEFAULT NULL,
  `profileAboutText` text,
  `profileFirstText` text,
  `profileImage` varchar(36) DEFAULT NULL,
  `profileFirstImage` varchar(36) DEFAULT NULL,
  `webLoginKey` varchar(36) DEFAULT NULL,
  `homeRegionID` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `userFlags` int(11) NOT NULL DEFAULT '0',
  `godLevel` int(11) NOT NULL DEFAULT '0',
  `iz_level` int(1) unsigned NOT NULL,
  `customType` varchar(32) NOT NULL DEFAULT '',
  `partner` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
  `email` varchar(250) DEFAULT NULL,
  `profileURL` varchar(100) DEFAULT NULL,
  `skillsMask` int(10) unsigned NOT NULL DEFAULT '0',
  `skillsText` varchar(255) NOT NULL DEFAULT 'None',
  `wantToMask` int(10) unsigned NOT NULL DEFAULT '0',
  `wantToText` varchar(255) NOT NULL DEFAULT 'None',
  `languagesText` varchar(255) NOT NULL DEFAULT 'English',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `usernames` (`username`,`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-28 11:55:45
