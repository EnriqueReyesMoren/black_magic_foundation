-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: docs
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ewoimvkiydqyfkwvfwhvesntmnkjcbjesfkj` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_idyezuqtvinriqvzovhnliwxqdghdwwmmjmo` (`dateRead`),
  KEY `fk_ziwuleuznunlunkpxvquxrrpfdslpwtnyndd` (`pluginId`),
  CONSTRAINT `fk_qlloorymosstsfecxwywodupcvzjrxhnvvpi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ziwuleuznunlunkpxvquxrrpfdslpwtnyndd` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jakomimuefqiixmnhrqcaphspbzotgowpqci` (`sessionId`,`volumeId`),
  KEY `idx_xtwxnsnnplorpfupjxwgxdcjcwwoirxxkpfv` (`volumeId`),
  CONSTRAINT `fk_mugyohytcazkbwpgpmnmftrvyhuykqoiophy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tdoqhrryctregfmwwyghgmvlmwzdydeqaqdi` (`filename`,`folderId`),
  KEY `idx_fxnuubdsnqiyamnbldohobvtcrmqsfwkalay` (`folderId`),
  KEY `idx_juwgjokipxeqekqoqykuwhkehyrhagjhahpc` (`volumeId`),
  KEY `fk_vwljoeyfvkiqmkkadiojmttcsfuokexbhuyi` (`uploaderId`),
  CONSTRAINT `fk_djqgliyqgxmhqcfohiecosoecbblsgdaxwcj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gfkhwuptmwmpiwphhiwlxlqrnjhucalzyfbf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qelyyqbbienukgkoqkbpitunbgveligtvdor` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwljoeyfvkiqmkkadiojmttcsfuokexbhuyi` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ixyyocuxirtbqxtotsqlvnpcatzqakworcvv` (`volumeId`,`assetId`,`location`),
  KEY `idx_buqooyadhfecsqxxxjotqzbcqfhlqrvwtjck` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_auzzyhqmanwqktlthettduestbhhjbpqltuh` (`name`),
  KEY `idx_sayuxxvaiujuvajocdlisbjevuwyttqaumoe` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lqejwhtjfiddwqhwusdmozuakzsqrjtjojhn` (`groupId`),
  KEY `fk_qrdwwhoxeunbowztybjhtfqqofwiwdpfzpkm` (`parentId`),
  CONSTRAINT `fk_ohuoupqmohcwfwmhmshcbsqmsidhfjzovfnc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qrdwwhoxeunbowztybjhtfqqofwiwdpfzpkm` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tlerqtqffzvzteeewczobwwzryjfqxkfjeax` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qaznxcffwialiapuffqwkyhztztxtdndnjoz` (`name`),
  KEY `idx_gmdklwnsnavogjdjtmiasgyucdvphgruqnrd` (`handle`),
  KEY `idx_ugnviwhanfyhfkrkmozztrtygdknzbeyvtvp` (`structureId`),
  KEY `idx_yibhdlfnyiuuqztrdbycjfrojxllqokykdbt` (`fieldLayoutId`),
  KEY `idx_hsuaueomvgwgtxmcqhzbzynqbzjxtpqfdadl` (`dateDeleted`),
  CONSTRAINT `fk_exysgrjrlecptfjuzqgdfctxcnnbedikkknb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_muevlojiflkddiqxrlzwvgligunuluwliczf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rohwboeqkgvvnmwemegvyudqhjmzzmzlejew` (`groupId`,`siteId`),
  KEY `idx_pmytsqsfkggpdpbubewqcimixrpjrwuhljdz` (`siteId`),
  CONSTRAINT `fk_ltktimmslhcgkvjtlgwflritjbnjenvmfdzl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mniytnlhahvnuyvtatgzagrjlhtfebjoclkd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_zsajtpkaligzzibpaspfvdbktwchbwzruaaj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_yzfwthvfaetimtyvgtwcouextysronzecqon` (`siteId`),
  KEY `fk_ouiqwdjlmohhypnhlnliheekrgovuleqafkt` (`userId`),
  CONSTRAINT `fk_fyizijcdbydizesrhkirylhackdzzycltncs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ouiqwdjlmohhypnhlnliheekrgovuleqafkt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_yzfwthvfaetimtyvgtwcouextysronzecqon` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_zracrzmmisjnoohxkjummgxhayblvxizdvcc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_nsunecxktbcsllfvlvjnpfzwrcdmxekjzjnr` (`siteId`),
  KEY `fk_jmelkvgymyfqexcaqbvzdalccjkjmedhdkjt` (`fieldId`),
  KEY `fk_tafctahpkeprvwowtncbuhrkebgywdztvqkd` (`userId`),
  CONSTRAINT `fk_jmelkvgymyfqexcaqbvzdalccjkjmedhdkjt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nsunecxktbcsllfvlvjnpfzwrcdmxekjzjnr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sdbubzfxzascotnquqngfosmousivphjxows` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tafctahpkeprvwowtncbuhrkebgywdztvqkd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vdbgkwpxkbsxrwltcedvqyymggzpqxkhdhie` (`elementId`,`siteId`),
  KEY `idx_jqavdgenjslymsqzkjiexavjchkqlpobgasp` (`siteId`),
  KEY `idx_iopmyhebywhuecpwngiztincutayxmtiyxjw` (`title`),
  CONSTRAINT `fk_cdfihxzfthqqjxjpfwxuomfbmybtktqnydhn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oamiwnxokxrxppbslgywkjoxnluocfdkgopb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_eelsasqzeojdnnanrovxgzbwrzqedjuhemqu` (`userId`),
  CONSTRAINT `fk_eelsasqzeojdnnanrovxgzbwrzqedjuhemqu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `traces` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_abyzomintnycijylqticgvseoveolyhsyycx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_rewoeioaltkfghxaclvonbiktdyhdwyhmywx` (`creatorId`,`provisional`),
  KEY `idx_dsuziuictaefeptrmjnnoqbvksotgfxchsfs` (`saved`),
  KEY `fk_zvdonpmigwpjndskepqikxyqceyzywcrzuag` (`sourceId`),
  CONSTRAINT `fk_kcogokeqympzfbsfflgidfdzlmmaltaipbjp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zvdonpmigwpjndskepqikxyqceyzywcrzuag` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bwcycrgpivwxaouasdcfncixypolsefwwieo` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zkauaunvyhrovlfygofulmzuccytfetkybyo` (`dateDeleted`),
  KEY `idx_quzwwmvwryczzxsmmluoiyeacegzhlldkahh` (`fieldLayoutId`),
  KEY `idx_xygpifwehmprybergwhfmylnenduikqripbm` (`type`),
  KEY `idx_kckjpgldqzvqrceerxfanikxoewobcndhdva` (`enabled`),
  KEY `idx_ksjeaeurugvigdtnmqfrlgstehvsuzoncdns` (`archived`,`dateCreated`),
  KEY `idx_voydbjebcsmlzaqvexsesydgjpagxgznuzgj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_fyeecjmpiiswvtmiaftsiksuzkzobpcrdjsi` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_qnajwoeqqtnhdcdujshajqdilnlrmdqzlvdf` (`canonicalId`),
  KEY `fk_payclbyvgthkgzjleukcqfthcdzunglvtsuk` (`draftId`),
  KEY `fk_mcwwbjgxlsajbyswvcmvsntuaanottlqhzkx` (`revisionId`),
  CONSTRAINT `fk_jwerepqfsjtwfkkghqncheqdzapznoxaywnw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mcwwbjgxlsajbyswvcmvsntuaanottlqhzkx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payclbyvgthkgzjleukcqfthcdzunglvtsuk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qnajwoeqqtnhdcdujshajqdilnlrmdqzlvdf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emduguioxasktzgnnkkbjmtppdzcuqbljsre` (`elementId`,`siteId`),
  KEY `idx_hvzwuhqbkadyfdbuzhfpmpghytuyuvkjrekq` (`siteId`),
  KEY `idx_auvaulijnxydhibqcthvueuxpixlglpazswb` (`slug`,`siteId`),
  KEY `idx_uikteparfvxqulaqjmkdwcpwkdczazxymrgt` (`enabled`),
  KEY `idx_hzsbljybculrjfrhepmqfeozszlopgqggvol` (`uri`,`siteId`),
  CONSTRAINT `fk_psibzztxdavafxoepepttpntbzgnmddumfix` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zoigkewcljfazbswjrutuosbaezyujeyicrk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xkrnyomtinkjxmzhuyqlopqiigbloinkbqrx` (`postDate`),
  KEY `idx_nsgfpeugnxwrofptyselubqcdsyrgtyrfbny` (`expiryDate`),
  KEY `idx_pzjjfnwqkyzgcwplzfbpuwnyfcmwdvgbvmoh` (`authorId`),
  KEY `idx_iocrorpbnfecuvozkbbnheyvwmxlbdlwusuq` (`sectionId`),
  KEY `idx_hudasmuekupfgcgpbmigqkxtpoikkcdhedif` (`typeId`),
  KEY `fk_wbgyvbwexymfxffnboazojxcubwksplvgfwt` (`parentId`),
  CONSTRAINT `fk_anfmwbyuqqlqyxagsluzmwyytkywtbhvlshc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egujwnfurqqswkqngkqrhpsmdzkdjjezstnj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gdgwduycmdheqmgcoshcykcjnkbtadawjznn` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tewjekpyitayyopzetwndhqaupnjvysamboq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wbgyvbwexymfxffnboazojxcubwksplvgfwt` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gbchfgsdqxakgayusvyczjabdwrromeapbix` (`name`,`sectionId`),
  KEY `idx_mntgujbondmuzdqiconrubakwhxzmwfkhrjm` (`handle`,`sectionId`),
  KEY `idx_yxoncspmdqzkoriqfynndrxuwkjtdekocljm` (`sectionId`),
  KEY `idx_ifpqwfmhodjwsqnfkrosysdnwnoyxgvzbcpx` (`fieldLayoutId`),
  KEY `idx_vhkgwmgxzctpmxywdgsdpyupjybohoacrpwk` (`dateDeleted`),
  CONSTRAINT `fk_ceiinqufrssvatrdjmfywowblpkqfniyzsjg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hpvbthwvomzbxdeykqzlwafcuplugfmttlgc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qbbjksxgxfarxzfguqtoeaepkmjlmvckacos` (`name`),
  KEY `idx_dzqglmziolwemvtrmzjahcjonxoqnsklpkdr` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ruxcdbxvefgsozoafrmzupxqwvzgfmrzmput` (`layoutId`,`fieldId`),
  KEY `idx_kezyysnyraaontfioklsosiqfhwsxbymdzrv` (`sortOrder`),
  KEY `idx_igchmfxgnofyjbdsoujzqjvwbukdlynrkdyx` (`tabId`),
  KEY `idx_anxldpwhjyddpxhseavtnrtdikckzsnmytgp` (`fieldId`),
  CONSTRAINT `fk_ohtwwifnfhrtddszfifaiewbxqwfxboxtzuu` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oxlmyxxlpjpuopymmsynvhsmevjksydbtmhz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pimzmhvfkiedavpbedhimlxicrwfsivmvamy` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oulcsbbksngxerbvqsbogjfrkefqkoqvpxpi` (`dateDeleted`),
  KEY `idx_wupupibbppayhvtqynkdozuzkeggsgjgvnax` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nubdfbdnuhngsjgqtupetqnpqwprphgsrygl` (`sortOrder`),
  KEY `idx_doahkjtnipttoamtydkazgtwxkesyfiqogdq` (`layoutId`),
  CONSTRAINT `fk_fvsbgklklrabvolcavqokzqtudfdukknjvee` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_haykekvjihfoziyhpofdtettziwlextpcuyi` (`handle`,`context`),
  KEY `idx_oimwnxrxardrdqjpcdvkyydlgcwbeuyozgis` (`groupId`),
  KEY `idx_vrvzklkvkbkmnahuowryyupjsalfqooolvaw` (`context`),
  CONSTRAINT `fk_lvbxwpsknnjmlxeaphyfipgyqkmhylhmmdyy` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wjbmdvevxupttoswzvolhdbpdxeoedzgavmm` (`name`),
  KEY `idx_anjoxnadbrcidfnncvmpbbznhvwpioekehsp` (`handle`),
  KEY `idx_ywqkcexkxmfdmacopsfeihpcxqyhrjljlcfb` (`fieldLayoutId`),
  KEY `idx_sfdagywbypfmoeuuihbgeaaxnqhryijzfuub` (`sortOrder`),
  CONSTRAINT `fk_aeiklhlkoebidrxufmoekdptscdghclejsap` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ipqxmulteexalyvnbqruzvsuvilbfbffzngq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scope` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jvxzvwkmjsioseqwilfktjwvjbkufogaqqcw` (`accessToken`),
  UNIQUE KEY `idx_gkdsnamqepbunpckmbknzvplaezijaxrcnaj` (`name`),
  KEY `fk_slhnugbfunoyoiihyrdawnjcjrdiuxsfaplq` (`schemaId`),
  CONSTRAINT `fk_slhnugbfunoyoiihyrdawnjcjrdiuxsfaplq` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qqezdtwhrekzzysudffdxcrkmtzplmqjbnsk` (`ownerId`),
  KEY `idx_ubbpgesgpllkcgjbpjfgeoyirbbmalctssaq` (`fieldId`),
  KEY `idx_jvvwwdjzskihjfejfsgvtlbxeyomgeuwytyg` (`typeId`),
  KEY `idx_yeqbcrbcucjppuiibpbimsbewblskcewddyu` (`sortOrder`),
  CONSTRAINT `fk_knvaoubotwhqcgxirqphdibbrmmzamfyfltv` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lmjwmwqfaooxtgohfjhtyqdirkqffkjmzbum` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofywqabxfvxspebbwcxteizynnubjywnfdny` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_owbemyisfhmhuhstlbkfndhauuwntjagrtwf` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mcbecuqvoenchhqejqzkwucnmjecbnwpsrwd` (`name`,`fieldId`),
  KEY `idx_kkfsntprxdzfxzjuertmkshmtlkhsfrorqbp` (`handle`,`fieldId`),
  KEY `idx_oacmmwehkxgnbetwnlsevmnjjrzymwobmrrz` (`fieldId`),
  KEY `idx_gjtudbvldwiqxuprbmlqkfyflwlqcyllsapm` (`fieldLayoutId`),
  CONSTRAINT `fk_tzyqiqonryinpomnevxgfzgzgftzdnocgkdn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uytfgvscpncfionbigaohtyotuusltezmuom` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_itrvwogkarxdjfkfypfpstxlspscrvjzqqym` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navigation_navs`
--

DROP TABLE IF EXISTS `navigation_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_navs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `propagateNodes` tinyint(1) DEFAULT '0',
  `maxNodes` int DEFAULT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `siteSettings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zbltxujjqzdudhpjthgnkbjnvyiadzinfptq` (`handle`),
  KEY `idx_qfwnjwcbbvggiegvuptdufoyqtxqkhchlyqk` (`structureId`),
  KEY `idx_yyevlkicjierbwlzpbmcdnztcgroybcvhfif` (`fieldLayoutId`),
  KEY `idx_ftcheueuuvpabjecwmaeuisezgbutvwxzrzx` (`dateDeleted`),
  CONSTRAINT `fk_qgravyqwranmuellvnybiqzplhdfouinwrou` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sorvdfpynhjdijcxhqvxxdsfxpgpedpttvak` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navigation_nodes`
--

DROP TABLE IF EXISTS `navigation_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_nodes` (
  `id` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `navId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `classes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlSuffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customAttributes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `newWindow` tinyint(1) DEFAULT '0',
  `deletedWithNav` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eiyaxfgertdquajetdjtlbypyagtpjwzbdia` (`navId`),
  KEY `fk_uqawvjaymckotsxmwmorixbirwrrpiykmsvh` (`elementId`),
  CONSTRAINT `fk_ktwpspwnwthaayqqvuhxybelwkoapghnclmh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqawvjaymckotsxmwmorixbirwrrpiykmsvh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wynyuogvmexrzcvagadyxaxgmluopfmdvkut` FOREIGN KEY (`navId`) REFERENCES `navigation_navs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks`
--

DROP TABLE IF EXISTS `neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `ownerSiteId` int DEFAULT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dfqtumpfqtctrifdycwfsboiexatpzswwtpo` (`ownerId`),
  KEY `idx_bcfmczycjaffxhcjnhswdufylvyudxrabcee` (`ownerSiteId`),
  KEY `idx_yzfpbhixhjsunrprmriualkdqtuvtzkmryfx` (`fieldId`),
  KEY `idx_yywreqkvslcnydefrtnbtytdtszrvcxfssci` (`typeId`),
  CONSTRAINT `fk_axvbzqqirrutqdnflgtsvdhjjwztaeplihip` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ikcukmzqsrezzbifukxzzndotvgdwjjuyvpr` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mvsrsrtelwdepawbpwrkmilyzvffhpsyfren` FOREIGN KEY (`typeId`) REFERENCES `neoblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rkpkzfazbevfsbsijyrhjkuptdibtfbukafp` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_usawndonrsmrmhmmswfloqsydwumrlzbwqva` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblockstructures`
--

DROP TABLE IF EXISTS `neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblockstructures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `ownerId` int NOT NULL,
  `ownerSiteId` int DEFAULT NULL,
  `fieldId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_olnolobofuanerjvahfenqkwqfuwbjvznkzd` (`structureId`),
  KEY `idx_gmwpcqmbbvbvsxaieipypvtsoxesyhkkkbxc` (`ownerId`),
  KEY `idx_mbseomnvcjrsitfmtgdenizlbqbmhtituqqq` (`ownerSiteId`),
  KEY `idx_hequtrqwcgziykrxsebgnzklskeenewkgqnz` (`fieldId`),
  CONSTRAINT `fk_dzkqmphepemcptueyzimbwkzcqvufxpbanjg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lqatghwbsdjockbweywqiozzuqsuygciwqex` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_walcbeonosiiphmqlhfhbwnplefapyejheeb` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_weeysovfbrkqddtnahraemqjsduwuxmfgwqo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypegroups`
--

DROP TABLE IF EXISTS `neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocktypegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdivazdelafyrovvipairfeoqufiptzgkanz` (`name`,`fieldId`),
  KEY `idx_yirmuxqyiaffmkxwtjkzgmeaphbieywvgkly` (`fieldId`),
  CONSTRAINT `fk_fodpkakewpbetnbdhkwuagmcquycutwcgkuc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypes`
--

DROP TABLE IF EXISTS `neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neoblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `maxBlocks` smallint unsigned DEFAULT NULL,
  `maxSiblingBlocks` smallint unsigned DEFAULT '0',
  `maxChildBlocks` smallint unsigned DEFAULT NULL,
  `childBlocks` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) NOT NULL DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wdsayuexzzjniwfyjopjorthhgsihmdeudfx` (`handle`,`fieldId`),
  KEY `idx_awsaigaucwaeulzglgyxxtmxcxpbhbmedhqk` (`name`,`fieldId`),
  KEY `idx_fgfiuiaevjgifuoxfxzxxbhlvakyfkhpakqo` (`fieldId`),
  KEY `idx_axjjdfwpzabilgedtekueriklrogjprvxiir` (`fieldLayoutId`),
  KEY `idx_inqyzxwmyguaxiwtrywpuvvdlvwoidnixykr` (`groupId`),
  CONSTRAINT `fk_jwclnoqgypkwpyjvgxoehmmxrfxoesvkszed` FOREIGN KEY (`groupId`) REFERENCES `neoblocktypegroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pjiujlhfgfzmpckzcebedcqzpvktfxghqxtt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzglgdglhzrxkddjylqidwnwutnrjpjxanhf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tdzbtqyhweuhzkhrykbkkdrpkvtauxtvukuw` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_gyyjkvcbntwokymkxptxiosgnwpizfroqnic` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_qtmympcczkycugncetlxkkamairlpmihreib` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbnpwslwgaxlmhywcicwrcatjmchoagmving` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_khxrwretmmabcasnrtghygimitofzlmswpwc` (`sourceId`),
  KEY `idx_pafbuckinmmtqolmigrllexjthwcxsxrrfsn` (`targetId`),
  KEY `idx_gdthmwfjaqbxxvveiwupvyclqwzmwyjopfkp` (`sourceSiteId`),
  CONSTRAINT `fk_krscipohunihwfpdleliavzkxdviwzsbgvwq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqryxvjlruygrvunvqvdiptibqxcjhohfkuf` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wuredvtlhdhuwrpubqdaynznxwxawlrngvgw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xkvfazeehxcmvmziexeybmckykldlfyghult` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lcggxiygswmxxjcymrnpdohgzzsupewgspte` (`sourceId`,`num`),
  KEY `fk_msocngsyzjnknjfbdfepgxuegdhanztanorp` (`creatorId`),
  CONSTRAINT `fk_biprwpyvitclaofxfhdyplpbwmbxaqlwufhe` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msocngsyzjnknjfbdfepgxuegdhanztanorp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_wruvrtskhkcxpjaxficwacfvnpvnsrbqnpeb` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xiesnvlzanpegkbzhxagiwhkwelaoinpttoh` (`handle`),
  KEY `idx_lwnspylzwolzhnjixkhgaolmzkcihgfzplnv` (`name`),
  KEY `idx_arinpwhggcuzzrgbixmvsckvjtjmmcvnihzy` (`structureId`),
  KEY `idx_nevqxuzkqgdpdownonavzhpetsyowkleoulo` (`dateDeleted`),
  CONSTRAINT `fk_retikvqcejprimulsymxppdscywmgerxjjad` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ebwnggrhpunyuhckixyrrefgvuwcvyalbnpr` (`sectionId`,`siteId`),
  KEY `idx_snigmikhlpvsmvowxztlgwrxyvnkkkjsvvrk` (`siteId`),
  CONSTRAINT `fk_iyxljxquqtklwabrvyfwnsyhyhqhftccwkfb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvzmmitzyjvliczglndkkhmqiikpotxvhpen` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seo_redirects`
--

DROP TABLE IF EXISTS `seo_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('301','302') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `siteId` int DEFAULT NULL,
  `order` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seo_sitemap`
--

DROP TABLE IF EXISTS `seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_sitemap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group` enum('sections','categories','productTypes','customUrls') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mnzrvwncpkmzchdvjdpkmwftzgpemzozqzak` (`uid`),
  KEY `idx_rxanoxfqxayfbaxkzlnkpgvctapqibwzkmvk` (`token`),
  KEY `idx_zeggrvkkcyggjkmbpzdtdipchrwfsymorlut` (`dateUpdated`),
  KEY `idx_kqpasrjjmbizsowamxpqggzcrqhwfliiehnb` (`userId`),
  CONSTRAINT `fk_xrywaytbxguahstqqzuoymuwwoalpjntstzp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pfwjkrazirbzlyrvdybngltgmyajhfycriqi` (`userId`,`message`),
  CONSTRAINT `fk_vcwtfpphttgimpuowrsjjqylhjyakkhcstuz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xchiyjpiltycweiknfasvfoisvjrzbaktcng` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khwihkiajykabbiggylwsoimlqpsmfwbebld` (`dateDeleted`),
  KEY `idx_lbkhlcjhrpfpskwqqofzcfxkapeawncmyhco` (`handle`),
  KEY `idx_sbifrbugeylmhcmcucsmbxbjfgzfbwultwhc` (`sortOrder`),
  KEY `fk_rjpsikmitgmblpnmtraeulmkdawvuibphwvz` (`groupId`),
  CONSTRAINT `fk_rjpsikmitgmblpnmtraeulmkdawvuibphwvz` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_txwlotochdxnusxcvulfxgtnzblcqkqhtyeo` (`structureId`,`elementId`),
  KEY `idx_yztmepqrksxngrnfwzhdaxondspxjycyndpb` (`root`),
  KEY `idx_fvylrvlkbfcczziyzffbcnsrcdwzjgvvwaso` (`lft`),
  KEY `idx_cfphxusiddfbfzbrrlrbkqytvueovmxxhdbw` (`rgt`),
  KEY `idx_vaubtfxygpzzuhnzgyvtubnqazbmrdbmsgdl` (`level`),
  KEY `idx_jjakqozeywuuknhqansflqnalcuqncqlszam` (`elementId`),
  CONSTRAINT `fk_ekqrjxgezqbxjqmjhstxbcxeayrbeagvyzhj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qmjmsfiaetbacrbczdogbowvuzwyqihybhwb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cwiqftlgcojnumhhrhhwfkpabbojcbyzetlw` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_etlrmfagqtfadhevyzkibjkukekqvjovuamt` (`key`,`language`),
  KEY `idx_maavfdwtolqpfbpetftimcgmzpstqrkxevqa` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fbwdlltsfbmrhnbhojjqelxpizwpaotjlnui` (`name`),
  KEY `idx_mwlwdpljmvsezbixuxkrxocvgnqkzjwezksr` (`handle`),
  KEY `idx_ieczicpzcfmxlxbwbdgvfkazznpurhyfauvm` (`dateDeleted`),
  KEY `fk_mpaixutaviihimrhrqgkxiukazsgjlctcort` (`fieldLayoutId`),
  CONSTRAINT `fk_mpaixutaviihimrhrqgkxiukazsgjlctcort` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ksplpqxqhkuwpmhbaycsajycbvwtvxzajzae` (`groupId`),
  CONSTRAINT `fk_gtdqelrudldouigrynhenwkfdwfhprxrcnqx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lfotltggojszbcfzxapyawxduodxhmlneimu` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gxnestvxjwptzrarcayljbtgvpwvmkndwkob` (`cacheId`),
  KEY `idx_wfdlexmrmhyuhcxojtiyonqzwoqegwvmcnyz` (`elementId`),
  CONSTRAINT `fk_woyepofqyxhqeoealslxyjumgwdmqycqjtlr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yacbztjevvodmfhuuqbcexeovcbmvtibfvhw` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nvgayxwqkkpvoyiqsgsecrvijfntcxsgcxeu` (`cacheId`),
  KEY `idx_rlgxzymooyraedquokzcoktcilafibcvybai` (`type`),
  CONSTRAINT `fk_ynzkppmekkfddtqbqwnhfheobhjdkgqifbfi` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_euhjslbrqtttafhcmpktogodqabepyagvjty` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_ybtfhnhrlulvdxdyyblimlknplsqtegntthq` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_qplpkqugkzblqotqncvcvwyifpipztpfepvi` (`siteId`),
  CONSTRAINT `fk_cgxhrddzadjznkmbeqygvwgjnksqmoltyohs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ulovbjnmdnostpopnplsiimtwsttrticdtzx` (`token`),
  KEY `idx_qpzbozytgjscyssevfjzusmcmdagidanjclp` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vzgmqdgiervthsrcgzkjsltszxerjrmnuzek` (`handle`),
  KEY `idx_bkxjvpdniadneoyvxfcpgismkjwaldihjhpx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_viclpqqdeepvncxfuayolagrjrdfwzssnugz` (`groupId`,`userId`),
  KEY `idx_csygdduekletuxfjunnpvugsalnzwijowblc` (`userId`),
  CONSTRAINT `fk_ddcbvmfsjbanoddypjbekiudmbrbvbezgpna` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rxlprtnsghtcezibxbmxcqrxdxwzlxlynrwg` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ogrjhmmzqgxdskvwrrjycxiqeazoifpqowzw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wopixeietrdfhwlfvkvvoessxsxedozfddns` (`permissionId`,`groupId`),
  KEY `idx_kjecwmvdfhzocyhhsoyqfpdwbiclbqhyntlk` (`groupId`),
  CONSTRAINT `fk_qxdwnexwbsckhjifqtzynzxucsvkpymweidn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsgbikfxinskilldaebyyipexrqrkeqwpvoi` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ernolzgmlnfaslwtqnebdtkkzijncbqlpazj` (`permissionId`,`userId`),
  KEY `idx_jqxkivjesuecwtzrfyfztnjveylbjstveecc` (`userId`),
  CONSTRAINT `fk_auygbqtiprbrzagfsdvlkoqcjpwsabljalff` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xxqjczntfevqmujwnuwzshuwoxtshawyfgmk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_rvrltzbsqytlwzarrjrbedcaotxlkdrpteec` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zkynhdvvjdbykxrlqlhkbeytrwuobcdlzfnf` (`uid`),
  KEY `idx_gevvwrpayedbiipezdkxqlgrwqejppfxlmga` (`verificationCode`),
  KEY `idx_xwdgglgqxhmbtlfmqdorcwpeydxsqazcwain` (`email`),
  KEY `idx_ddcraqonwdregcnrorajbdklvkmwhpblcsec` (`username`),
  KEY `fk_zwmdvyswiggmvccepmxqdxzsfrbfuxviaiof` (`photoId`),
  CONSTRAINT `fk_zurudldtafipnpjxggxkvwcngtiotuslnsgt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwmdvyswiggmvccepmxqdxzsfrbfuxviaiof` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eusnovwuoqlyuousoxhzlmqqvxqvphvqmlxz` (`name`,`parentId`,`volumeId`),
  KEY `idx_lzispmigfvscuectxciqtqpzpewjwsvpteeg` (`parentId`),
  KEY `idx_opxrkeijknvxenrohfghtxjusbrezslqvxqb` (`volumeId`),
  CONSTRAINT `fk_ldyhbuqyhgninpmeicilqahoccliapyupzgz` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mrtdorwdjijauomddopieabwdanlmxrwvgem` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhauwnkukxldrdnalcwcrdtjqunvinplktdt` (`name`),
  KEY `idx_lxfvehdzgjekmsvpgoibdfmiwfvclvupgfwb` (`handle`),
  KEY `idx_bbnjxpzsqmwlazxltbymylbsptejjhpguswc` (`fieldLayoutId`),
  KEY `idx_rrufxjnxzkoxcwiwgvsfsbndxtuittyuuezz` (`dateDeleted`),
  CONSTRAINT `fk_vzydtvioxbajhdsigfudmplidhzivpqpnysn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khtenxwdxqllvnawilfrzjqmimryfdkdxlud` (`userId`),
  CONSTRAINT `fk_iinuafygmhryewthtyxefjdckhkldgmiqfzj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'docs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 14:21:45
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: docs
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2022-04-22 19:21:01',0,1),(1,1,'lastName','2022-04-22 19:21:01',0,1),(1,1,'lastPasswordChangeDate','2022-04-22 19:21:01',0,1),(1,1,'password','2022-04-22 19:21:01',0,1),(1,1,'username','2022-04-22 19:21:01',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-04-21 22:20:58','2022-04-22 19:21:00','8a4b8b44-adef-4f27-a479-19a708768812');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-04-21 22:20:58','2022-04-22 19:21:00',NULL,NULL,'35fab4ab-5b88-4161-ad7a-4ba148219991');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-04-21 22:20:58','2022-04-21 22:20:58','19c5314d-2953-4933-a5c8-a17052d4ceb6');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-04-21 22:20:58','2022-04-21 22:20:58',NULL,'b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.7.38','3.7.33',0,'rdihexsijgzs','3@fjbrjxzbuo','2022-04-21 22:20:58','2022-04-22 19:20:26','109c0101-5287-45c3-bbb3-04d1152de1aa');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e917e5e-5fe5-4164-b98f-9dcec9a610e3'),(2,'craft','m150403_183908_migrations_table_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','66f1b6fc-24ad-4fbf-81c7-254d70658a80'),(3,'craft','m150403_184247_plugins_table_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bc5fce7-3727-4311-a2b8-511aa8e5cdd5'),(4,'craft','m150403_184533_field_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','134ce4e8-9f53-46a1-81a8-df9f4f7f69da'),(5,'craft','m150403_184729_type_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e5db53a1-0785-4d6d-b5a0-3f168f51de08'),(6,'craft','m150403_185142_volumes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5c2b7a38-8a1e-4abd-a7b8-c7a6960d9853'),(7,'craft','m150428_231346_userpreferences','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','67590567-dfb5-49f8-8280-ffa58e363a7b'),(8,'craft','m150519_150900_fieldversion_conversion','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a93074dc-7f1e-4529-b54b-c00bf93f0ef1'),(9,'craft','m150617_213829_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','63525200-0104-43bc-84f8-b30503874a78'),(10,'craft','m150721_124739_templatecachequeries','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e51b85ca-3457-4cf3-9934-ff4bfff8ffe4'),(11,'craft','m150724_140822_adjust_quality_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4e3fad87-3cd3-4d7a-9767-a57cee2b6826'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','90623e2b-1ed9-4962-b277-84db67baa3be'),(13,'craft','m151002_095935_volume_cache_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c19cadf3-f513-46f6-861b-924bd0f08530'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e79c7db-f609-432e-9d57-642363c212e6'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e71a11d-0b22-437e-b44a-343b68abc938'),(16,'craft','m151209_000000_move_logo','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','38668414-be9c-4ad3-953d-a5e3ccda7160'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c1802fc-e815-4b73-808b-855b8f5a1248'),(18,'craft','m151215_000000_rename_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','dfc7a998-871c-4621-87ca-52ee04b98be6'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c3f2f547-617a-4eef-af00-2ee3bf76c579'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f3a14faa-9a96-4cbe-a3e1-216d26ad9ee2'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f59692e5-dd0d-428f-9b8b-8a833bf700b5'),(22,'craft','m160727_194637_column_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','99bcd07c-3dcc-41a9-bb0d-681745268873'),(23,'craft','m160804_110002_userphotos_to_assets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','acb5d885-2bb7-4402-b274-af6e1aaed1ed'),(24,'craft','m160807_144858_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','16791a07-ecb1-4e46-ab20-a68f06a3c896'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3dc7c2f0-a24c-49eb-9c58-f3e64843e02d'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47a5e0bc-8795-470b-ba88-f4d7b3b7c94d'),(27,'craft','m160912_230520_require_entry_type_id','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','31ec445d-a8ab-4959-8850-450b6c3c41f2'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b96527e5-62ce-4f03-a388-d1752734c1e0'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','44893c66-1ca7-4584-be2e-bea9911e8b5e'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c95b5eb0-f0da-4cad-8692-e03632eea22f'),(31,'craft','m160925_113941_route_uri_parts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','275da5e2-8f57-418a-92f9-0e93580d52dd'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d66ba1a5-a8e0-4b4c-a6fd-bfc6458cbceb'),(33,'craft','m161007_130653_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','339bc815-3be0-406e-a1b9-4525c6fb5246'),(34,'craft','m161013_175052_newParentId','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1544bf3d-62d2-4261-860a-33c6d2fd2696'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1e0a4361-678a-493a-899b-cdeba0c6ea21'),(36,'craft','m161021_182140_rename_get_help_widget','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','20242522-719f-4366-badc-601f438fcf7d'),(37,'craft','m161025_000000_fix_char_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8de6671c-70a4-49bf-9f90-9893e75e83c0'),(38,'craft','m161029_124145_email_message_languages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','64f09f83-1b1a-42a1-837b-87667256bc58'),(39,'craft','m161108_000000_new_version_format','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','29d4a410-bd83-4f07-8237-205e98334115'),(40,'craft','m161109_000000_index_shuffle','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5ace9a13-5940-4ff9-a649-f17b4180afce'),(41,'craft','m161122_185500_no_craft_app','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','56ccd9af-b355-48bf-9f61-f610a25d36a8'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','9c98c80d-9f0d-4856-a545-858ddbc12cd7'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33497179-b1d0-4316-9838-8a39f72eccdb'),(44,'craft','m170114_161144_udates_permission','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7d4725e3-5549-4e9d-8445-5f9bea5a15a7'),(45,'craft','m170120_000000_schema_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e935ccb7-2959-478d-8a08-b8f0dd489314'),(46,'craft','m170126_000000_assets_focal_point','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e48d135-06d0-40ab-a8a3-f1290e1539a7'),(47,'craft','m170206_142126_system_name','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d3ad866a-ffe8-4ca6-a7a3-a6df8ff046a8'),(48,'craft','m170217_044740_category_branch_limits','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','17028d86-6245-4f63-ae02-0d25c2ba02b5'),(49,'craft','m170217_120224_asset_indexing_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c4166677-c50b-4432-82e5-57de127b1f50'),(50,'craft','m170223_224012_plain_text_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6a4fc557-ee28-45d0-86e7-6de840e0a802'),(51,'craft','m170227_120814_focal_point_percentage','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','02a22dd3-1ed9-4c39-8857-c69f030740f5'),(52,'craft','m170228_171113_system_messages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','60ad338b-f9c6-430f-a915-a878753975d0'),(53,'craft','m170303_140500_asset_field_source_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','78f32c45-03b8-4b94-9bd4-f5cbbcd8f579'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','41002932-92f1-4b3b-957a-418edff2b515'),(55,'craft','m170523_190652_element_field_layout_ids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5113d954-78b2-4600-839f-a4ff83e46fc4'),(56,'craft','m170621_195237_format_plugin_handles','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','84bc61ac-21d1-4239-9c02-2f069a67e6e0'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7624721a-7406-4aec-b41c-9069f7561061'),(58,'craft','m170630_161028_deprecation_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','9e488955-6f81-4e9d-92d1-57faaf0ea3f3'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5783b2d6-e005-4198-96fe-ad05cb588d75'),(60,'craft','m170704_134916_sites_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33745be7-15b1-4927-99dc-fcf51006675f'),(61,'craft','m170706_183216_rename_sequences','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','889d3843-c7b2-48da-bee4-d89e40ae4df0'),(62,'craft','m170707_094758_delete_compiled_traits','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f0ec964b-064e-42e8-87bd-201a729775af'),(63,'craft','m170731_190138_drop_asset_packagist','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7f018004-2fe2-4112-8826-8a95bf7c1126'),(64,'craft','m170810_201318_create_queue_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a85a9770-1b07-4441-bafa-0bf54f88a223'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5df1f1b3-8573-4aea-be00-4b01959d67d8'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1f3e80cd-9b27-41e7-842b-9a0fb66697b8'),(67,'craft','m171011_214115_site_groups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4fcd3d26-dce9-4b22-a4f5-f862ff5f1038'),(68,'craft','m171012_151440_primary_site','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3129141b-8d3b-4811-aeb0-adedaefd7d0a'),(69,'craft','m171013_142500_transform_interlace','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7a0ec821-f5b7-4e1d-a6c8-ed31eac7d7ab'),(70,'craft','m171016_092553_drop_position_select','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3b3f48ed-04c5-4b3e-b8d9-cb596afc5b7f'),(71,'craft','m171016_221244_less_strict_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6904ebf5-78c7-4a78-bf07-290f7a24d6a8'),(72,'craft','m171107_000000_assign_group_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e956a35b-ae91-4335-831b-c5764421b4b0'),(73,'craft','m171117_000001_templatecache_index_tune','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','98e860b5-6b07-48ee-97ed-cb35d56a7302'),(74,'craft','m171126_105927_disabled_plugins','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','197a851a-2f70-4f86-9cc1-060b4a135a73'),(75,'craft','m171130_214407_craftidtokens_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b5fa2df8-9c21-4771-ba02-568d6fa906b3'),(76,'craft','m171202_004225_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f3609024-b482-49f2-ba6f-666e9a39ecc8'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6aa3383a-40ed-4716-926f-403a2a2ec68b'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47a5210b-e428-4f58-af34-4b699066cd9d'),(79,'craft','m171218_143135_longtext_query_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f6b5a581-9b02-4a5e-98ac-a352211c9fd4'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c1d7e9db-b1b7-41ad-b5b4-d24f4fb33ddc'),(81,'craft','m180113_153740_drop_users_archived_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f59f7901-6615-40ed-b973-3347c54d0ca7'),(82,'craft','m180122_213433_propagate_entries_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','dbb653a8-9b64-4daa-923e-dd073ca8096a'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a9792928-00d2-4e10-b202-ec71315b4a4f'),(84,'craft','m180128_235202_set_tag_slugs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c56853b-809e-43c3-9963-d26acea329d2'),(85,'craft','m180202_185551_fix_focal_points','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47085121-7461-481d-b77c-057acf891d13'),(86,'craft','m180217_172123_tiny_ints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','cd08088b-22fd-407a-bf0d-ebfb2fd85124'),(87,'craft','m180321_233505_small_ints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3d6eba04-d3fa-4adc-896d-9932311dd201'),(88,'craft','m180404_182320_edition_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d6cb1cb9-4a6a-4144-8137-8d0c4f26ced8'),(89,'craft','m180411_102218_fix_db_routes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b7e5c06f-2ac0-49a6-af9e-047dcc81c142'),(90,'craft','m180416_205628_resourcepaths_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','28471d8b-22aa-429a-ae81-565104351244'),(91,'craft','m180418_205713_widget_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b451b3ae-a730-4735-869c-3ef57516434c'),(92,'craft','m180425_203349_searchable_fields','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33d249ba-70bd-40d1-b8b3-32b80193100f'),(93,'craft','m180516_153000_uids_in_field_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b377b90a-8b48-410e-b38d-d5587ac95104'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3c0dad4f-af62-48f8-a4f1-216a92b9b2d1'),(95,'craft','m180518_173000_permissions_to_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6fc7221f-8ff9-4f94-97d1-e827819fe0c0'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8567fc51-9eeb-4a24-99c2-4ed6442709be'),(97,'craft','m180521_172900_project_config_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','80d8d096-90df-487c-93cc-078ce1b9f6a1'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1219a534-c855-41e5-8287-1e51dcbd62a1'),(99,'craft','m180731_162030_soft_delete_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fdae9dc8-fb87-47f9-96d8-f1dee0f8f67e'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d1f7378e-a76f-481e-b7b0-e769df31e960'),(101,'craft','m180810_214439_soft_delete_elements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','584209f3-1a3f-4535-af40-1e06c939644a'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','10e1fe2e-942f-47a3-890c-682734eed682'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6156441e-3bf8-4edf-a641-74894ab903c3'),(104,'craft','m180904_112109_permission_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3b29939d-9998-4148-8280-19a765ac03ca'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0a2213df-031e-4124-86a1-86404b9c5e82'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b480030e-2c16-49ea-8bf5-6e5f5715397a'),(107,'craft','m181016_183648_set_default_user_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3735f068-e737-4d16-90ec-28e32fe9e7e5'),(108,'craft','m181017_225222_system_config_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','edcbb207-c1d9-4649-b6f8-730547e53ece'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','84d11463-9674-45f2-9bb7-f9c569418039'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','22d73aab-1ad0-4a98-a163-ad7a15dcec48'),(111,'craft','m181112_203955_sequences_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','aaa98284-6a1b-487e-982f-4b7928305955'),(112,'craft','m181121_001712_cleanup_field_configs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','eba0ea75-453a-4a8a-92a4-cd4f5753b20f'),(113,'craft','m181128_193942_fix_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b8b9d58b-1472-4367-b66d-d1f65b957db9'),(114,'craft','m181130_143040_fix_schema_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bc944fcb-8e06-43b1-95dc-775ad9baf8b9'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','53181e8f-15e0-476a-8cef-9f3e8b475c73'),(116,'craft','m181217_153000_fix_structure_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e7bfef46-78dd-44f3-be77-e3437c219f3a'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a0f0c1c2-d6d3-470b-8e66-a126179f8601'),(118,'craft','m190108_110000_cleanup_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d170415c-bef3-483b-b677-3658e29563ef'),(119,'craft','m190108_113000_asset_field_setting_change','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','abe6f2d4-2725-4b02-9c63-45e889e438ee'),(120,'craft','m190109_172845_fix_colspan','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','800166e5-20f5-4f3e-89b1-d89fcfbc5d5b'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6d39aefb-8ab3-4492-bdb1-6c5af112c07f'),(122,'craft','m190110_214819_soft_delete_volumes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5b78195e-a724-461d-9c1b-48593278afd0'),(123,'craft','m190112_124737_fix_user_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bc18352-6283-40b4-8211-5049b483aca6'),(124,'craft','m190112_131225_fix_field_layouts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','2cced6c7-0afe-4cba-ba5e-60251e050544'),(125,'craft','m190112_201010_more_soft_deletes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','028671cd-bfae-4517-8d43-7caef167abe0'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e2fdf021-f632-4d85-bebf-17423b0f8abc'),(127,'craft','m190121_120000_rich_text_config_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a5e9a3f6-5dd6-46b9-a89a-1141b4878c1f'),(128,'craft','m190125_191628_fix_email_transport_password','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6ae77b79-6a8f-4901-b50c-17efb839c89f'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5c2bfb83-9183-4750-b749-e98a5960d895'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','40e9afdb-0df8-4231-b8c2-9d6f0e5edd6e'),(131,'craft','m190218_143000_element_index_settings_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b955a807-9de7-45ac-a2f0-1a7421445496'),(132,'craft','m190312_152740_element_revisions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c833db5-e870-4e33-89f9-16924e612714'),(133,'craft','m190327_235137_propagation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','57c25265-2170-4d86-9599-675d40f4395d'),(134,'craft','m190401_223843_drop_old_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e70642c9-b200-4453-859c-6283c7bb7d3f'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','77415e77-1375-44a6-9062-afe958cf8e03'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e7b19e96-1113-4f3f-ab18-bc3acc00af30'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8558b530-b90d-4c47-9aef-9c95e67240c7'),(138,'craft','m190504_150349_preview_targets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0031ee4d-a05b-482d-9c98-d0f916d21106'),(139,'craft','m190516_184711_job_progress_label','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5fd5cb91-61f7-4d68-a5f1-4b17a9a294e8'),(140,'craft','m190523_190303_optional_revision_creators','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0268eac2-01d0-4a4a-8740-a0f34c8fd62c'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','143b4dfc-9b03-4f00-8131-dd0989eaa75a'),(142,'craft','m190605_223807_unsaved_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d7d9af05-e2cf-4a92-9dda-12bb8e640ccb'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','976962bd-2c27-4a01-89ec-59bc97ac2aff'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a37f59cd-a449-4847-8886-95268343a6a2'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e8cc99a5-8d34-4871-94c2-99ac321e4d74'),(146,'craft','m190624_234204_matrix_propagation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f6356394-1b71-447c-9e5c-84f554cd9a89'),(147,'craft','m190711_153020_drop_snapshots','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','39b39412-9066-41ef-986f-3eefa63f7df3'),(148,'craft','m190712_195914_no_draft_revisions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','605533c9-db9c-46c9-8c9b-4465c6de70f9'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d96fd863-8331-43a4-a60f-dbb6c4edffa0'),(150,'craft','m190820_003519_flush_compiled_templates','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','34c79efc-28e1-4b39-9c55-6d456ab58d06'),(151,'craft','m190823_020339_optional_draft_creators','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','327a78d4-2b0b-4748-8cc5-3db0a2d97dca'),(152,'craft','m190913_152146_update_preview_targets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8efcb05b-bc1a-41c0-bb7d-37b771655d1a'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','460d4ada-d766-46f9-be63-befbacbb9cb4'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','665d2469-2b9e-40ce-90d4-fb7d431a5b62'),(155,'craft','m191206_001148_change_tracking','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7c57ef95-447f-41db-9aec-18ee5d21717f'),(156,'craft','m191216_191635_asset_upload_tracking','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5bab7c33-b93b-4cd6-8554-b78964a1c440'),(157,'craft','m191222_002848_peer_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8d3a0199-d320-43a7-8f62-8524b6440398'),(158,'craft','m200127_172522_queue_channels','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c4c30a96-47cb-4e70-ab83-1032199757f5'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bff8e207-4a21-4499-b0d0-542bd3c7cb48'),(160,'craft','m200213_172522_new_elements_index','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c32b5f6a-0f05-40b1-95d8-773fd2e560dd'),(161,'craft','m200228_195211_long_deprecation_messages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4aa9886a-19a6-4904-b0e6-73a814c35e38'),(162,'craft','m200306_054652_disabled_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3f2e6f0b-d312-4fdf-836e-89898e164006'),(163,'craft','m200522_191453_clear_template_caches','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fe2d7804-2963-43b6-bd0b-764aeaef7b3d'),(164,'craft','m200606_231117_migration_tracks','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','43354f04-dac5-45e1-82f6-f9252d110bb4'),(165,'craft','m200619_215137_title_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e75a582e-53c8-4708-8cd5-313f383e2eff'),(166,'craft','m200620_005028_user_group_descriptions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c926c18a-dcc6-4cca-b934-702b6286de06'),(167,'craft','m200620_230205_field_layout_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5a1ade15-39ee-4de9-8bf3-3cb11e1536ca'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','334d741f-09c4-41eb-953f-00bedc0342d9'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','58e70596-065a-4601-879d-3a1034fc2870'),(170,'craft','m200630_183000_drop_configmap','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','da0fa9d6-f658-4ea2-9414-d432c8e69887'),(171,'craft','m200715_113400_transform_index_error_flag','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bdb32a8-cff3-4c9c-9e06-0338e434cd0a'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','17536926-5c29-4e83-9e0f-21faee21ab18'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','814ac8a2-a18c-44d6-b51c-222b5a96a795'),(174,'craft','m200720_175543_drop_unique_constraints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4108fa6c-7878-4538-8b85-7e30318c6c16'),(175,'craft','m200825_051217_project_config_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','ef72169f-4f54-41a0-86ff-06095e575d51'),(176,'craft','m201116_190500_asset_title_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b31d6895-9099-4bd3-9c6b-04d4d552a952'),(177,'craft','m201124_003555_plugin_trials','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bd1fef9-2fd3-4931-a221-e74374d433f4'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','51c5355d-bbaf-4d71-8309-0ae7c6c115ee'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','cbf918f4-b157-4edc-84bd-ba87b785e1b3'),(180,'craft','m210214_202731_track_saved_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e05ee98-f8a6-46ff-9742-0da2f6fcae6d'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4f3f13e4-ad66-4477-a84f-6c0af1e3bfad'),(182,'craft','m210302_212318_canonical_elements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fa13d2ec-ebf2-4b1c-b7ba-dcf1370da29c'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','27f88076-66e5-4667-80b1-d283c9bbca97'),(184,'craft','m210329_214847_field_column_suffixes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f184dd09-f121-4cfe-bc14-fea48fa16211'),(185,'craft','m210331_220322_null_author','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e291138-da4f-4f37-b1a2-0620d4f72bb4'),(186,'craft','m210405_231315_provisional_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bc8fdc82-ca4b-49d6-954a-c96545e6d058'),(187,'craft','m210602_111300_project_config_names_in_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8ebee7a1-767e-4bad-9bd0-08e8ebe1cc82'),(188,'craft','m210611_233510_default_placement_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8858e4b6-4005-4ff5-89cd-4b437f73e5b1'),(189,'craft','m210613_145522_sortable_global_sets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c0700c2a-3e8a-4180-9e0f-dbed7a46af60'),(190,'craft','m210613_184103_announcements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','ba17cb0f-cda3-4879-9292-f426ed2a6879'),(191,'craft','m210829_000000_element_index_tweak','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','21285b9b-2930-473d-a562-ce63a90bca22'),(192,'craft','m220209_095604_add_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','da626387-d46b-4d68-b7c6-27f4e9c7aec4'),(193,'craft','m220214_000000_truncate_sessions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7ea32892-0b8f-4a8b-b79f-aabbd48d7ecb'),(194,'plugin:redactor','m180430_204710_remove_old_plugins','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','351dc29e-b6e9-4eae-a9da-ce656db44c75'),(195,'plugin:redactor','Install','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','2f97ff86-aa6f-4dd8-acdc-bf4aec7c1bb8'),(196,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','0ee6162b-e989-402e-9acc-8d2652a0412e'),(197,'plugin:seo','Install','2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 00:42:52','1f7bc11f-20b5-4626-b6fc-63e7a21827a7'),(198,'plugin:seo','m180906_152947_add_site_id_to_redirects','2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 00:42:52','b3b1b2bd-e752-46c0-b07e-ffeee79a9f46'),(199,'plugin:seo','m190114_152300_upgrade_to_new_data_format','2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 00:42:52','5f52d13c-2adc-4db8-a8a8-a1d8da5dd5a0'),(200,'plugin:seo','m200518_110721_add_order_to_redirects','2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 00:42:52','e5a3b194-68a5-4801-a172-b3366400606b'),(201,'plugin:seo','m201207_124200_add_product_types_to_sitemap','2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 00:42:52','be0f4518-6cdd-40cc-935b-e519a12b86ee'),(202,'plugin:neo','Install','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','a74fd03f-9c61-4c41-a79a-c0f492263892'),(203,'plugin:neo','m181022_123749_craft3_upgrade','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','4f35e8e1-3ddf-4a1b-92bb-529eeec675c5'),(204,'plugin:neo','m190127_023247_soft_delete_compatibility','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','fa1f0832-473f-4215-a13e-a1af1e168015'),(205,'plugin:neo','m200313_015120_structure_update','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','8deaaf2b-ef86-460e-977e-cb0762a92a05'),(206,'plugin:neo','m200722_061114_add_max_sibling_blocks','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','29e791cb-73d5-4775-bd67-70cfa59621ee'),(207,'plugin:neo','m201108_123758_block_propagation_method_fix','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','39a19bea-26c1-42b1-bfba-045f872f9722'),(208,'plugin:neo','m201208_110049_delete_blocks_without_sort_order','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','687f056a-599a-457a-af69-a5a6c466d036'),(209,'plugin:neo','m201223_024137_delete_blocks_with_invalid_owner','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','3591dd0a-580e-4c7b-85c0-23265573f308'),(210,'plugin:neo','m210603_032745_remove_blank_child_block_types','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','f4ef1f80-8782-4e0c-b2c9-d4b2f8bed95e'),(211,'plugin:neo','m210812_052349_fix_single_site_block_structures','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','d480d0df-f4d2-4163-9275-a405cac64bf2'),(212,'plugin:neo','m220228_081104_add_group_id_to_block_types','2022-04-22 00:43:02','2022-04-22 00:43:02','2022-04-22 00:43:02','0cc31198-dbe3-4d68-a56e-68d287d4d061'),(213,'plugin:navigation','Install','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','1b7069e4-a538-45e7-8b7f-67938a898bfa'),(214,'plugin:navigation','m180826_000000_propagate_nav_setting','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','6177ad17-8a9e-4283-8004-ae72666e27fa'),(215,'plugin:navigation','m180827_000000_propagate_nav_setting_additional','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','2fa3fc62-f749-4446-9660-9ef079011e40'),(216,'plugin:navigation','m181110_000000_add_elementSiteId','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','43fb1ff8-86ba-47aa-9fcf-b96af8526f2e'),(217,'plugin:navigation','m181123_000000_populate_elementSiteIds','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','9d46a122-9f31-4bec-9b0b-f64dfd07ed5c'),(218,'plugin:navigation','m190203_000000_add_instructions','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','f5d0153c-47d4-4cbf-98ea-0cb25bbb867a'),(219,'plugin:navigation','m190209_000000_project_config','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','a3fbbdc3-e82d-4053-af40-3abed13d726b'),(220,'plugin:navigation','m190223_000000_permissions','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','c8696e31-1aeb-486a-9052-9e948d2bb82a'),(221,'plugin:navigation','m190307_000000_update_field_content','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','734595d7-4cdc-4216-b968-1bb2109c1f0e'),(222,'plugin:navigation','m190310_000000_migrate_elementSiteId','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','baab8d94-1946-4efa-859f-151a1cda1e80'),(223,'plugin:navigation','m190314_000000_soft_deletes','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','eb5daed8-413d-4f17-a19a-a4f3d1a599bc'),(224,'plugin:navigation','m190315_000000_project_config','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','10d5bd10-3682-4bba-81a7-e1adf691a650'),(225,'plugin:navigation','m191127_000000_fix_nav_handle','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','31cd8cbc-d210-4023-a584-666b5e9ceb1e'),(226,'plugin:navigation','m191230_102505_add_fieldLayoutId','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','743b77ff-8b3b-4290-9a98-b2be28060695'),(227,'plugin:navigation','m200108_000000_add_attributes','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','12670d7a-e14e-48d9-8bca-63ab6fb7379e'),(228,'plugin:navigation','m200108_100000_add_url_suffix','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','3bd2fb12-afac-4d52-bce3-bdbea5509018'),(229,'plugin:navigation','m200108_200000_add_max_nodes','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','34e2b0f3-d092-4dda-8949-f7834e72f65f'),(230,'plugin:navigation','m200205_000000_add_data','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','b298d203-4175-48c1-8a23-eb0d9e0718f0'),(231,'plugin:navigation','m200810_000000_fix_elementsiteid','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','bfdf54e0-19e5-4c7c-bcdf-376f77b26722'),(232,'plugin:navigation','m200811_000000_fix_uris','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','2fe3ff32-d132-477e-95f5-46dc727bc23f'),(233,'plugin:navigation','m201017_000000_add_permissions','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','3a93f643-6c1d-41a1-a65e-2f9c353f3763'),(234,'plugin:navigation','m201018_000000_site_settings','2022-04-22 00:45:14','2022-04-22 00:45:14','2022-04-22 00:45:14','91a5c20d-fea7-40f3-b59b-b8372d3b214c');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `navigation_navs`
--

LOCK TABLES `navigation_navs` WRITE;
/*!40000 ALTER TABLE `navigation_navs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `navigation_navs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `navigation_nodes`
--

LOCK TABLES `navigation_nodes` WRITE;
/*!40000 ALTER TABLE `navigation_nodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `navigation_nodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'minify','1.2.11','1.0.0','unknown',NULL,'2022-04-22 00:42:28','2022-04-22 00:42:29','2022-04-22 19:20:34','f8258587-22d0-48fc-b0f7-fa05da5557a4'),(2,'mix','1.5.2','1.0.0','unknown',NULL,'2022-04-22 00:42:36','2022-04-22 00:42:36','2022-04-22 19:20:34','b1b3ac70-921c-4df1-9f25-494868dbecd5'),(3,'redactor','2.10.6','2.3.0','unknown',NULL,'2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 19:20:34','aaf11a5b-0405-47af-a5da-078c005669bb'),(4,'seo','3.7.4','3.2.0','unknown',NULL,'2022-04-22 00:42:52','2022-04-22 00:42:52','2022-04-22 19:20:34','94dc3532-1338-4fff-9c20-c593197b6a59'),(5,'neo','2.13.5','2.13.0','trial',NULL,'2022-04-22 00:43:01','2022-04-22 00:43:01','2022-04-22 19:20:34','3b74ae2f-b9dc-4b19-a9bb-ffec7ed490f2'),(6,'navigation','1.4.25','1.0.21','trial',NULL,'2022-04-22 00:45:13','2022-04-22 00:45:13','2022-04-22 19:20:34','7475840d-3048-4e42-88fe-3924f0bde3b9'),(7,'field-manager','2.2.4','1.0.0','unknown',NULL,'2022-04-22 00:45:21','2022-04-22 00:45:21','2022-04-22 19:20:34','0b8436ee-3887-45cb-8940-5eb5644813c9'),(8,'cloner','1.2.2','1.0.0','unknown',NULL,'2022-04-22 00:45:29','2022-04-22 00:45:29','2022-04-22 19:20:34','3bb72f3d-cc19-436e-b312-818d4f278501'),(9,'image-resizer','2.1.1','2.0.0','unknown',NULL,'2022-04-22 00:45:39','2022-04-22 00:45:39','2022-04-22 19:20:34','98d855fa-9a2d-4ad9-838e-38007d273389');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1650655226'),('email.fromEmail','\"anuar@heyblackmagic.com\"'),('email.fromName','\"Foundation Site\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd.name','\"Common\"'),('meta.__names__.310cbb9c-a852-47b6-a6a9-ffc29afeab1f','\"Black Magic Docs\"'),('meta.__names__.b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd','\"Common\"'),('meta.__names__.c3cd35fb-d5dd-487b-84fa-ccc84aecff94','\"Black Magic Docs\"'),('plugins.cloner.edition','\"standard\"'),('plugins.cloner.enabled','true'),('plugins.cloner.schemaVersion','\"1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.image-resizer.edition','\"standard\"'),('plugins.image-resizer.enabled','true'),('plugins.image-resizer.schemaVersion','\"2.0.0\"'),('plugins.minify.edition','\"standard\"'),('plugins.minify.enabled','true'),('plugins.minify.schemaVersion','\"1.0.0\"'),('plugins.mix.edition','\"standard\"'),('plugins.mix.enabled','true'),('plugins.mix.schemaVersion','\"1.0.0\"'),('plugins.navigation.edition','\"standard\"'),('plugins.navigation.enabled','true'),('plugins.navigation.licenseKey','\"BOM0N2MVOKR17J0P9Z9RI14G\"'),('plugins.navigation.schemaVersion','\"1.0.21\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"F5NWMPTL8QF1W2CFGQR504TB\"'),('plugins.neo.schemaVersion','\"2.13.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seo.edition','\"standard\"'),('plugins.seo.enabled','true'),('plugins.seo.schemaVersion','\"3.2.0\"'),('siteGroups.c3cd35fb-d5dd-487b-84fa-ccc84aecff94.name','\"Black Magic Docs\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.baseUrl','\"@web\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.enabled','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.handle','\"default\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.hasUrls','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.language','\"en-US\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.name','\"Black Magic Docs\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.primary','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.siteGroup','\"c3cd35fb-d5dd-487b-84fa-ccc84aecff94\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Black Magic Docs\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Mexico_City\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin docs '),(1,'lastname',0,1,''),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' anuar heyblackmagic com '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seo_redirects`
--

LOCK TABLES `seo_redirects` WRITE;
/*!40000 ALTER TABLE `seo_redirects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `seo_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seo_sitemap`
--

LOCK TABLES `seo_sitemap` WRITE;
/*!40000 ALTER TABLE `seo_sitemap` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Black Magic Docs','2022-04-21 22:20:58','2022-04-22 19:20:26',NULL,'c3cd35fb-d5dd-487b-84fa-ccc84aecff94');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Black Magic Docs','default','en-US',1,'@web',1,'2022-04-21 22:20:58','2022-04-22 19:20:09',NULL,'310cbb9c-a852-47b6-a6a9-ffc29afeab1f');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin_docs',NULL,'','','anuar@heyblackmagic.com','$2y$13$TrHLLn/YLpGpSSrQufuJsOfndtmfnolqtv3Xm3Njhi0seo2IcNztC',1,0,0,0,'2022-04-22 19:19:38',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-04-22 19:21:01','2022-04-21 22:20:59','2022-04-22 19:21:01','37bc68db-97e3-4c60-8226-fb7a56b65d7e');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-04-21 22:24:00','2022-04-21 22:24:00','05c3500a-d100-4779-950f-54be459b1f68'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-04-21 22:24:00','2022-04-21 22:24:00','1e448d29-04dc-4b9e-92d0-26027af28cfe'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-04-21 22:24:00','2022-04-21 22:24:00','b1479288-7541-4209-988b-70557c691a29'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-04-21 22:24:00','2022-04-21 22:24:00','ccc6d4e9-e64c-47cf-a131-a4e3e3324ed9');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'docs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 14:21:45
