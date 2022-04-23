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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_blocks`
--

DROP TABLE IF EXISTS `matrixcontent_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixcontent_blocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_text_text` text COLLATE utf8_unicode_ci,
  `field_code_code` text COLLATE utf8_unicode_ci,
  `field_blockquote_blockquote` text COLLATE utf8_unicode_ci,
  `field_image_caption` text COLLATE utf8_unicode_ci,
  `field_video_caption` text COLLATE utf8_unicode_ci,
  `field_image_imageModal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tncjederhcmsxobkvevfjkjqskjnqlfedtlf` (`elementId`,`siteId`),
  KEY `fk_fslfpoivnpxeuaobvuhsudvhietwmcqdthwv` (`siteId`),
  CONSTRAINT `fk_fslfpoivnpxeuaobvuhsudvhietwmcqdthwv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hslheatqqgcaiytxxvcgholeppnjwtizvvca` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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

-- Dump completed on 2022-04-23  4:44:15
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
INSERT INTO `assets` VALUES (123,1,2,1,'carbon.png','image',1776,948,128361,NULL,NULL,NULL,'2022-04-23 08:58:33','2022-04-23 08:58:33','2022-04-23 08:58:33','e6734b5a-6107-4c15-8481-ef08f5a6b208');
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
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2022-04-22 19:21:01',0,1),(1,1,'lastName','2022-04-22 19:21:01',0,1),(1,1,'lastPasswordChangeDate','2022-04-22 19:21:01',0,1),(1,1,'password','2022-04-22 19:21:01',0,1),(1,1,'username','2022-04-22 19:21:01',0,1),(4,1,'fieldLayoutId','2022-04-23 07:17:32',0,1),(4,1,'slug','2022-04-23 02:36:16',0,1),(4,1,'title','2022-04-23 02:36:16',0,1),(4,1,'typeId','2022-04-23 07:17:32',0,1),(34,1,'slug','2022-04-23 01:25:20',0,1),(34,1,'title','2022-04-23 01:26:01',0,1),(53,1,'slug','2022-04-23 03:09:24',0,1),(53,1,'title','2022-04-23 03:09:24',0,1),(61,1,'slug','2022-04-23 03:10:20',0,1),(61,1,'title','2022-04-23 03:10:20',0,1),(68,1,'slug','2022-04-23 03:11:02',0,1),(68,1,'title','2022-04-23 03:11:02',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2022-04-22 22:07:17',0,1),(4,1,1,'2022-04-23 08:13:14',0,NULL),(32,1,2,'2022-04-23 07:10:14',0,1),(34,1,1,'2022-04-23 08:13:14',0,NULL),(36,1,2,'2022-04-23 01:27:03',0,1),(38,1,1,'2022-04-23 08:13:14',0,NULL),(39,1,1,'2022-04-23 09:06:56',0,1),(53,1,1,'2022-04-23 09:34:18',0,1),(60,1,2,'2022-04-23 09:34:18',0,1),(61,1,1,'2022-04-23 08:25:28',0,1),(68,1,1,'2022-04-23 09:04:12',0,1),(129,1,7,'2022-04-23 09:01:10',0,1),(129,1,9,'2022-04-23 09:04:12',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-04-21 22:20:58','2022-04-22 19:21:00','8a4b8b44-adef-4f27-a479-19a708768812'),(2,2,1,NULL,'2022-04-22 22:07:13','2022-04-22 22:07:17','23ad91fa-3fec-4eff-94dd-119389943015'),(3,4,1,'Getting Started','2022-04-23 01:16:54','2022-04-23 08:13:14','ebd4d0c9-301b-4023-b16a-5dab756ccc32'),(4,34,1,'Development Good Practices / Common cases','2022-04-23 01:25:04','2022-04-23 08:13:14','65a486d6-8ab2-4cae-abff-742cb4956887'),(5,37,1,NULL,'2022-04-23 01:27:21','2022-04-23 01:27:21','c24cb82e-bcae-4e44-b761-f340ae0d72e1'),(6,38,1,'Craft CMS','2022-04-23 01:27:43','2022-04-23 08:13:14','554c9533-f796-4578-943b-d1e45f297b25'),(7,39,1,'Simple header','2022-04-23 01:28:07','2022-04-23 09:06:56','94f2f6ea-b414-4b5d-b025-38fe90025b13'),(13,53,1,'Development Stage','2022-04-23 03:09:02','2022-04-23 09:34:18','2e815fea-d196-4ab9-ad4e-aba570ecb4af'),(15,61,1,'Development Technologies','2022-04-23 03:09:48','2022-04-23 08:25:48','db1246d8-606a-4fa3-a04b-0d2430fadc02'),(16,68,1,'Local Development Requirements','2022-04-23 03:10:44','2022-04-23 09:04:12','366141ac-5376-4efd-be53-5b532f24b6b9'),(25,110,1,'Development Technologies','2022-04-23 08:25:28','2022-04-23 08:25:28','c0760747-2de5-4483-93c8-8106f2f34a7a'),(26,113,1,'Development Technologies','2022-04-23 08:25:28','2022-04-23 08:25:28','1a846b05-5f16-478f-93db-785361566f66'),(27,116,1,'Development Technologies','2022-04-23 08:25:48','2022-04-23 08:25:48','f397cd6d-d509-4617-b604-c126fda8ceb7'),(29,123,1,'Carbon','2022-04-23 08:58:33','2022-04-23 08:58:33','fd8f40fa-4744-4ae8-aa3d-f1b9b882e98f'),(30,127,1,'Local Development Requirements','2022-04-23 08:58:48','2022-04-23 08:58:48','885d915d-fb93-4a83-97fb-6ca78ea21ca4'),(31,130,1,'Local Development Requirements','2022-04-23 08:58:48','2022-04-23 08:58:48','c3b48da4-1317-4d88-b6a8-b612bdba8564'),(32,133,1,'Local Development Requirements','2022-04-23 09:00:14','2022-04-23 09:00:14','673fcfdb-a229-4f2a-9f1e-fc00355d0624'),(33,136,1,'Local Development Requirements','2022-04-23 09:01:10','2022-04-23 09:01:10','5652a951-b8f9-4508-843d-9af0eacd9ca3'),(35,142,1,'Local Development Requirements','2022-04-23 09:04:12','2022-04-23 09:04:12','736d14de-e4f9-48c0-9146-88ae88a49aaf'),(37,149,1,'Simple header','2022-04-23 09:06:56','2022-04-23 09:06:56','03a0847c-4b6e-472e-ab5b-180b75f9ac1d'),(38,152,1,'Simple header','2022-04-23 09:06:56','2022-04-23 09:06:56','1e6d0483-71e4-4bc4-a5db-0dd3d71d56c9'),(40,157,1,'Development Stage','2022-04-23 09:14:03','2022-04-23 09:14:03','130871fd-e12c-4cf0-863a-db252aec190f'),(41,159,1,'Development Stage','2022-04-23 09:14:03','2022-04-23 09:14:03','82e5f07b-4ec5-4fa9-a3bf-0b019e325349'),(43,163,1,'Development Stage','2022-04-23 09:34:18','2022-04-23 09:34:18','f8b5ac68-64e7-4b41-9b0b-3b1bff6e50e4');
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
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft','',0,NULL,1),(4,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementindexsettings` VALUES (1,'craft\\elements\\Entry','{\"sources\":{\"section:79036237-60bd-4a7a-b558-05776ab2f208\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"link\"}}}}','2022-04-23 01:31:20','2022-04-23 01:31:20','5c0e2406-150d-425f-9936-3fc1de06b31b');
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-04-21 22:20:58','2022-04-22 19:21:00',NULL,NULL,'35fab4ab-5b88-4161-ad7a-4ba148219991'),(2,NULL,1,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-22 22:07:13','2022-04-22 22:07:17',NULL,'2022-04-22 22:07:33','8cad5891-c21f-4c84-8260-7b75d3a2ab1a'),(3,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-22 22:07:17','2022-04-22 22:07:17',NULL,'2022-04-22 22:07:33','683d6438-2261-4ca7-a87e-35a1fb9dc025'),(4,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2022-04-23 01:16:54','2022-04-23 07:17:32',NULL,NULL,'6788a861-a8f3-4f87-bd92-665f56a84873'),(5,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:17:39','2022-04-23 01:17:39',NULL,'2022-04-23 01:18:26','77dddfcb-14e3-403e-abd0-66a049d77f7b'),(6,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:18:25','2022-04-23 01:18:25',NULL,'2022-04-23 01:18:27','c6a2fd29-9012-4924-a65e-1b4b122be7b3'),(7,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:18:27','2022-04-23 01:18:27',NULL,'2022-04-23 01:23:19','5b17fcfe-bdac-4cb6-b326-5d2127ba659e'),(8,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:19','2022-04-23 01:23:19',NULL,'2022-04-23 01:23:21','efb84f4a-39b0-418f-b2dd-f4ac55765e36'),(9,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:19','2022-04-23 01:23:19',NULL,'2022-04-23 01:23:21','3858321e-c4b0-4a3c-8d23-faff92367007'),(10,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:21','2022-04-23 01:23:21',NULL,'2022-04-23 01:23:44','33dca066-5f02-48ec-b91a-8b2fbbf206cb'),(11,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:21','2022-04-23 01:23:21',NULL,'2022-04-23 01:23:45','1fd8832a-6c60-4559-8ba7-4fade97146d4'),(12,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:44','2022-04-23 01:23:44',NULL,'2022-04-23 01:23:46','ad0c8db6-d213-4243-b6c5-09ce216cd564'),(13,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:44','2022-04-23 01:23:44',NULL,'2022-04-23 01:23:46','8e65fda2-8eba-4aa8-8be7-965810a4e810'),(14,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:46','2022-04-23 01:23:46',NULL,'2022-04-23 01:23:48','a92329c4-ebec-4145-a425-7a5097c2f5c2'),(15,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:46','2022-04-23 01:23:46',NULL,'2022-04-23 01:23:48','9f1fda9a-1903-4cd3-a48c-11362ffda628'),(16,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:48','2022-04-23 01:23:48',NULL,'2022-04-23 01:23:53','0109286c-b5a9-4728-bdfd-5e98ea3f3219'),(17,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:48','2022-04-23 01:23:48',NULL,'2022-04-23 01:23:53','177d3a6b-7132-4b86-a9cf-5ec1e9c3fdb2'),(18,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:53','2022-04-23 01:23:53',NULL,'2022-04-23 01:24:12','29903fb4-9cf7-4ce5-a73b-59581a94f180'),(19,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:23:53','2022-04-23 01:23:53',NULL,'2022-04-23 01:24:12','f1552c8f-4420-4cfa-be6d-354ef2900a53'),(20,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:12','2022-04-23 01:24:12',NULL,'2022-04-23 01:24:19','7daf84ee-a9f0-47d5-aae3-384d8ee4dc9f'),(21,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:12','2022-04-23 01:24:12',NULL,'2022-04-23 01:24:19','66f06f7f-1cc7-462b-b118-1b57c293de93'),(22,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:19','2022-04-23 01:24:19',NULL,'2022-04-23 01:24:24','e96ab0d8-6255-4597-8d8f-883d190d5361'),(23,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:19','2022-04-23 01:24:19',NULL,'2022-04-23 01:24:24','df26edea-9a8c-46b4-aca8-35f0b8e3e824'),(24,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:24','2022-04-23 01:24:24',NULL,'2022-04-23 01:24:30','8d4240f7-2a55-4621-91f2-d8a7ab87c371'),(25,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:24','2022-04-23 01:24:24',NULL,'2022-04-23 01:24:30','5f82866e-33a0-43bd-9695-8f522292f69f'),(26,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:30','2022-04-23 01:24:30',NULL,'2022-04-23 01:24:31','7fc14756-951d-4e08-8a25-0b1d58183cad'),(27,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:30','2022-04-23 01:24:30',NULL,'2022-04-23 01:24:31','af72dcc7-4883-48aa-8963-26189dca5104'),(28,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:30','2022-04-23 01:24:30',NULL,'2022-04-23 01:24:39','e95d51ec-4af7-464e-baf3-64b130554216'),(29,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:31','2022-04-23 01:24:31',NULL,'2022-04-23 01:24:39','fe3ac6e4-0052-402c-81dc-1995b6f51b8d'),(30,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:38','2022-04-23 01:24:38',NULL,'2022-04-23 01:24:43','baf9355b-f8f0-4cb5-8b34-100e7dd4530e'),(31,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:38','2022-04-23 01:24:38',NULL,'2022-04-23 01:24:43','e047f948-a1d7-46bb-9397-834a7c3d7042'),(32,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:43','2022-04-23 08:13:14',NULL,NULL,'c71c7ff5-012e-47e6-9d05-b0ed8f94e36b'),(33,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:24:43','2022-04-23 08:13:14',NULL,NULL,'fc6f70df-a1b0-4e17-97d0-f77b8c579233'),(34,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 01:25:04','2022-04-23 01:27:08',NULL,NULL,'2b7c55eb-59b4-44a3-a80b-28cc7c7c2358'),(35,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:25:13','2022-04-23 01:25:13',NULL,'2022-04-23 01:25:15','9028da34-fd41-4204-9aec-6e4d5cf6f0ef'),(36,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:25:15','2022-04-23 08:13:14',NULL,NULL,'3cf81e06-8f1f-4a6c-bcf0-bd6df6cb0787'),(37,NULL,4,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 01:27:21','2022-04-23 01:27:21',NULL,NULL,'e6144517-6634-4088-9d00-28de425eec13'),(38,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 01:27:43','2022-04-23 01:28:43',NULL,NULL,'a32e4902-5013-496d-8f64-0f86bd297820'),(39,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 01:28:07','2022-04-23 09:06:56',NULL,NULL,'72aadb77-9ca4-40ef-bba0-3c8dbe763db3'),(40,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 01:28:07','2022-04-23 09:06:56',NULL,NULL,'127a243e-9b2b-451e-88a5-ee9fc60e7aec'),(53,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 03:09:02','2022-04-23 09:34:18',NULL,NULL,'5145d8c3-9fab-48e4-aceb-46cc1a6902fe'),(57,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:14','2022-04-23 03:09:14',NULL,'2022-04-23 03:09:15','299db960-f19e-4cef-91be-719d16ed29f8'),(58,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:15','2022-04-23 03:09:15',NULL,'2022-04-23 03:09:20','97e881ba-5061-406c-af9e-431358730ff6'),(59,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:20','2022-04-23 03:09:20',NULL,'2022-04-23 03:09:21','d6ea3b8f-fec2-4c2a-a7aa-76a068abeec1'),(60,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:21','2022-04-23 09:34:18',NULL,NULL,'7c50db95-cfb4-418a-b7ad-2183c4e78afd'),(61,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 03:09:48','2022-04-23 08:25:48',NULL,NULL,'8062cb46-e41a-4edf-9c0d-3e0480ffa87b'),(62,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:57','2022-04-23 03:09:57',NULL,'2022-04-23 03:09:58','020acf79-81e1-4265-994f-7bd85e35fce2'),(63,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:09:58','2022-04-23 03:09:58',NULL,'2022-04-23 03:10:01','24abd73c-d02f-4a7f-9bfa-13c12abb7e34'),(64,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:01','2022-04-23 03:10:01',NULL,'2022-04-23 03:10:05','ab4acf6a-5ef8-4411-bd37-21f166cbd52a'),(65,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:05','2022-04-23 03:10:05',NULL,'2022-04-23 03:10:05','3ecd7376-c36f-46f2-817e-ea70d32170cc'),(66,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:05','2022-04-23 03:10:05',NULL,'2022-04-23 03:10:11','12e167bb-081b-4e4f-a5ec-d6c6829f97e6'),(67,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:11','2022-04-23 08:25:28',NULL,NULL,'3ac090cf-7cb4-47e9-ba0b-36b56ddcd059'),(68,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-04-23 03:10:44','2022-04-23 09:04:12',NULL,NULL,'ab80c40c-6e1c-42c1-8233-8972deae48d4'),(69,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:47','2022-04-23 03:10:47',NULL,'2022-04-23 03:10:48','67ee42be-e481-4bb7-af04-0a1834f2f99a'),(70,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:48','2022-04-23 03:10:48',NULL,'2022-04-23 03:10:50','631c8f31-410d-4d1e-bfa1-a27400869140'),(71,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:50','2022-04-23 03:10:50',NULL,'2022-04-23 03:10:51','258c8b82-d9cf-4b7b-ae43-8e70baed3952'),(72,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:51','2022-04-23 03:10:51',NULL,'2022-04-23 03:11:00','04c41a37-bc76-47d9-9fee-3d65412afc77'),(73,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:10:59','2022-04-23 03:10:59',NULL,'2022-04-23 03:11:11','26327489-c1e8-4bc9-aac2-c9c8988557dc'),(74,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:11:11','2022-04-23 03:11:11',NULL,'2022-04-23 03:11:12','255dc9e9-6edb-4a48-b1e1-cfafb5f99d40'),(75,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 03:11:12','2022-04-23 09:04:12',NULL,NULL,'816e5ee9-7d4e-49fc-a261-1c4353a7e6fe'),(93,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:24:56','2022-04-23 08:24:56',NULL,'2022-04-23 08:24:59','644f2a41-2c6e-4d1d-aea6-fcaba0429639'),(94,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:24:59','2022-04-23 08:24:59',NULL,'2022-04-23 08:25:00','b5f9ac85-4302-4c30-9ed8-a7097f96e1f7'),(95,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:00','2022-04-23 08:25:00',NULL,'2022-04-23 08:25:01','8c5a15f5-05c2-4567-b2e9-07b6a3f5c389'),(96,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:01','2022-04-23 08:25:01',NULL,'2022-04-23 08:25:07','25886aa7-ce90-42c9-bfe9-c787de25d967'),(97,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:07','2022-04-23 08:25:07',NULL,'2022-04-23 08:25:08','98ef41ad-ff73-48b8-b080-d93b2db295f4'),(98,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:08','2022-04-23 08:25:08',NULL,'2022-04-23 08:25:10','79037251-4aa1-4b97-898f-3f3caa67e7da'),(99,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:10','2022-04-23 08:25:10',NULL,'2022-04-23 08:25:11','731f6200-6c6a-4d78-93aa-c7e08429587b'),(100,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:11','2022-04-23 08:25:11',NULL,'2022-04-23 08:25:15','b3980eb6-a5b1-426c-a365-f68abca1ae8a'),(101,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:15','2022-04-23 08:25:15',NULL,'2022-04-23 08:25:15','e52df419-854e-43ce-95c0-00af896eed17'),(102,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:15','2022-04-23 08:25:15',NULL,'2022-04-23 08:25:16','7dc130ae-f0dd-465b-9e3d-5de6daf10da3'),(103,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:16','2022-04-23 08:25:16',NULL,'2022-04-23 08:25:21','888a0b58-577a-44e8-a4a3-977b0ac042be'),(104,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:21','2022-04-23 08:25:21',NULL,'2022-04-23 08:25:22','3a4f6947-2897-4ff7-9413-9a0f72981cc9'),(105,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:22','2022-04-23 08:25:22',NULL,'2022-04-23 08:25:23','a80962eb-39ac-41b7-a610-25fcb981436c'),(106,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:23','2022-04-23 08:25:23',NULL,'2022-04-23 08:25:26','fcfd27e1-18a2-4124-aa1c-8018c10bdbe1'),(107,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:26','2022-04-23 08:25:26',NULL,'2022-04-23 08:25:27','141a87e7-fba6-4a7b-8b63-f9fc4438eb22'),(108,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:27','2022-04-23 08:25:27',NULL,'2022-04-23 08:25:28','d15f90c6-dc2f-415c-a3ab-8f305aa28899'),(110,61,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-04-23 07:28:58','2022-04-23 08:25:28',NULL,NULL,'6ad4ec0f-101e-4a65-88f6-391d9a0e2042'),(111,67,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:28','2022-04-23 08:25:28',NULL,NULL,'7b69e743-4712-4322-8a9d-20721cf59144'),(112,NULL,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:28','2022-04-23 08:25:28',NULL,NULL,'7013f261-d089-491a-8623-918aa2f570f4'),(113,61,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-04-23 08:25:28','2022-04-23 08:25:28',NULL,NULL,'42cf3c83-eaee-4639-a0ea-538cf1a40b03'),(114,67,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:28','2022-04-23 08:25:28',NULL,NULL,'bbff01f0-187b-4aff-af73-e09467f9ae6b'),(115,112,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:28','2022-04-23 08:25:28',NULL,NULL,'7dd0744d-0f3a-4eb8-bd5d-cc3c7841572b'),(116,61,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-04-23 08:25:48','2022-04-23 08:25:48',NULL,NULL,'e065a5ee-a0f7-43cb-a61c-6055e192475a'),(117,67,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:48','2022-04-23 08:25:48',NULL,NULL,'03d76a55-d1cf-4e79-a5f2-8e1c65698c26'),(118,112,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:25:48','2022-04-23 08:25:48',NULL,NULL,'691ab1e5-6c6b-49b1-8de9-67a232238e91'),(121,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:21','2022-04-23 08:58:21',NULL,'2022-04-23 08:58:25','3a1547c7-6a4a-4588-8d23-f6a1c0e29256'),(122,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:26','2022-04-23 08:58:26',NULL,'2022-04-23 08:58:34','a1a5ca83-d363-41c0-92a3-d40413633537'),(123,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-04-23 08:58:33','2022-04-23 08:58:33',NULL,NULL,'9bba4f58-5c8d-4bbc-8472-7eaf4b105b5c'),(124,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:33','2022-04-23 08:58:33',NULL,'2022-04-23 08:58:42','fe0b56ba-684d-4af4-a3eb-fbda0b8f8c8b'),(125,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:42','2022-04-23 08:58:42',NULL,'2022-04-23 08:58:46','64baa924-b266-4129-bed0-094c78b4cc16'),(127,68,NULL,4,1,'craft\\elements\\Entry',1,0,'2022-04-23 07:28:47','2022-04-23 08:58:48',NULL,NULL,'9e597244-0169-4b68-a3ab-1df19ecffaea'),(128,75,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:48','2022-04-23 08:58:48',NULL,NULL,'cf496c07-efef-4590-9253-b08534d26666'),(129,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:48','2022-04-23 09:04:12',NULL,NULL,'b94aec8f-09e2-4122-8462-44d1e257765b'),(130,68,NULL,5,1,'craft\\elements\\Entry',1,0,'2022-04-23 08:58:48','2022-04-23 08:58:48',NULL,NULL,'54ad91b8-7159-4ad9-9032-a099b9e8b30c'),(131,75,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:48','2022-04-23 08:58:48',NULL,NULL,'455d798c-5735-4765-b892-5e9f10981056'),(132,129,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 08:58:48','2022-04-23 08:58:48',NULL,NULL,'8dd85bf7-1d4d-4194-81a7-22bd7a1520b9'),(133,68,NULL,6,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:00:14','2022-04-23 09:00:14',NULL,NULL,'7fff5480-455f-4e8d-9b25-b1d30d362439'),(134,75,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:00:14','2022-04-23 09:00:14',NULL,NULL,'0915d686-324b-4688-aa84-7c20306e5a14'),(135,129,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:00:14','2022-04-23 09:00:14',NULL,NULL,'07293132-ef2b-4516-b266-495c2797a5ab'),(136,68,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:01:10','2022-04-23 09:01:10',NULL,NULL,'6138218b-e923-4c35-a0d8-a38c9ed3eb43'),(137,75,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:01:10','2022-04-23 09:01:10',NULL,NULL,'fdfc0950-4594-4722-892a-d3aa86d348da'),(138,129,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:01:10','2022-04-23 09:01:10',NULL,NULL,'4ba87c15-2772-4849-bb12-806bd2dab2a7'),(142,68,NULL,8,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:04:12','2022-04-23 09:04:12',NULL,NULL,'7f25def0-6994-4e19-8f13-a31a69a9618a'),(143,75,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:04:12','2022-04-23 09:04:12',NULL,NULL,'d559da8b-6374-4c2a-857b-dcff7b7d3fd2'),(144,129,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:04:12','2022-04-23 09:04:12',NULL,NULL,'050d3e29-c712-4bc1-b0d7-aa5edad5fdab'),(147,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:06:51','2022-04-23 09:06:51',NULL,'2022-04-23 09:06:53','0714982e-4030-4b32-b13a-aaca2b9a2e08'),(149,39,NULL,9,1,'craft\\elements\\Entry',1,0,'2022-04-23 01:28:31','2022-04-23 09:06:56',NULL,NULL,'f47a93c0-7bcd-4448-8d10-eb3baf21adc3'),(150,40,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:06:56','2022-04-23 09:06:56',NULL,NULL,'dad88b3e-5630-4a33-864b-75deab0e631a'),(151,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:06:56','2022-04-23 09:06:56',NULL,NULL,'d0e327ce-323b-4d37-8cc9-0e9ceec8bf49'),(152,39,NULL,10,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:06:56','2022-04-23 09:06:56',NULL,NULL,'5b511601-fbc6-45ff-a121-87de6d37e5f0'),(153,40,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:06:56','2022-04-23 09:06:56',NULL,NULL,'fc1e2f08-e908-469b-801a-115779e714f5'),(154,151,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:06:56','2022-04-23 09:06:56',NULL,NULL,'567601bf-efca-4ac4-9837-a4d54c9ad847'),(157,53,NULL,11,1,'craft\\elements\\Entry',1,0,'2022-04-23 07:26:00','2022-04-23 09:14:03',NULL,NULL,'9b5977bc-29d6-4f6f-9b77-b34e25865178'),(158,60,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:14:03','2022-04-23 09:14:03',NULL,NULL,'67439c64-ad7a-4194-9061-2effff7b194c'),(159,53,NULL,12,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:14:03','2022-04-23 09:14:03',NULL,NULL,'0a824bba-af7b-4158-8507-849475895bd3'),(160,60,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:14:03','2022-04-23 09:14:03',NULL,NULL,'76efe2e8-9bf7-4f78-bb0b-3975ee05f9bc'),(163,53,NULL,13,1,'craft\\elements\\Entry',1,0,'2022-04-23 09:34:18','2022-04-23 09:34:18',NULL,NULL,'0e7a5eff-8849-4b9c-bb1e-c356ed285e31'),(164,60,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2022-04-23 09:34:18','2022-04-23 09:34:18',NULL,NULL,'ae08a344-702b-4e1e-b675-7225e75a235f');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-04-21 22:20:58','2022-04-21 22:20:58','19c5314d-2953-4933-a5c8-a17052d4ceb6'),(2,2,1,'__temp_zzsjlwhtdqamllckasabzabbhiztsslipbue',NULL,1,'2022-04-22 22:07:13','2022-04-22 22:07:13','4c974892-e01c-429c-a73c-4051b9e37d01'),(3,3,1,NULL,NULL,1,'2022-04-22 22:07:17','2022-04-22 22:07:17','fb1b7ff3-6b2a-4820-aed8-8140d386acc2'),(4,4,1,'getting-started',NULL,1,'2022-04-23 01:16:54','2022-04-23 08:11:26','497cd475-a446-4ae6-be7c-bdf40c3649c5'),(5,5,1,NULL,NULL,1,'2022-04-23 01:17:39','2022-04-23 01:17:39','bd7de46b-dc99-4489-bf89-cb922c345f4e'),(6,6,1,NULL,NULL,1,'2022-04-23 01:18:25','2022-04-23 01:18:25','a46c0ca1-afb2-438c-b2c1-d428864ff9bf'),(7,7,1,NULL,NULL,1,'2022-04-23 01:18:27','2022-04-23 01:18:27','ea2e49f7-0181-416c-8eb8-6de9373e30a6'),(8,8,1,NULL,NULL,1,'2022-04-23 01:23:19','2022-04-23 01:23:19','db01a6b5-6480-4d40-80f9-7939f95ccead'),(9,9,1,NULL,NULL,1,'2022-04-23 01:23:19','2022-04-23 01:23:19','9dee4097-2a85-490b-bc2f-a268b85d32f4'),(10,10,1,NULL,NULL,1,'2022-04-23 01:23:21','2022-04-23 01:23:21','a32a4c57-5ca3-41fd-a761-da8ad794d372'),(11,11,1,NULL,NULL,1,'2022-04-23 01:23:21','2022-04-23 01:23:21','973180c5-b332-499f-9d0a-09a59e89a03c'),(12,12,1,NULL,NULL,1,'2022-04-23 01:23:44','2022-04-23 01:23:44','bf88d03c-32b9-40e0-b834-5f83affa8c7a'),(13,13,1,NULL,NULL,1,'2022-04-23 01:23:44','2022-04-23 01:23:44','c9bedd2e-4e71-443d-ad3c-2f4d3cca16e4'),(14,14,1,NULL,NULL,1,'2022-04-23 01:23:46','2022-04-23 01:23:46','3fc76d99-7886-4bde-9685-2218034c1bd0'),(15,15,1,NULL,NULL,1,'2022-04-23 01:23:46','2022-04-23 01:23:46','4b9e83db-1ee5-45df-a397-cfc61e58f52e'),(16,16,1,NULL,NULL,1,'2022-04-23 01:23:48','2022-04-23 01:23:48','df85c0db-8d6a-42ae-afeb-68788dab7598'),(17,17,1,NULL,NULL,1,'2022-04-23 01:23:48','2022-04-23 01:23:48','a2f0f033-b2da-4b25-ab34-42085fd0a86d'),(18,18,1,NULL,NULL,1,'2022-04-23 01:23:53','2022-04-23 01:23:53','d96938a8-c1f8-482d-8743-b27b0f57696b'),(19,19,1,NULL,NULL,1,'2022-04-23 01:23:53','2022-04-23 01:23:53','90e6207e-d038-4a94-b036-e3b8225c8213'),(20,20,1,NULL,NULL,1,'2022-04-23 01:24:12','2022-04-23 01:24:12','9838dd5d-c0a2-49d6-a038-591536283d1a'),(21,21,1,NULL,NULL,1,'2022-04-23 01:24:12','2022-04-23 01:24:12','39d534c5-56be-4757-9579-86fe27157e2f'),(22,22,1,NULL,NULL,1,'2022-04-23 01:24:19','2022-04-23 01:24:19','23a4ba30-087b-43bc-ba64-e562768311c9'),(23,23,1,NULL,NULL,1,'2022-04-23 01:24:19','2022-04-23 01:24:19','67afda85-82f5-4dc1-a865-6cfb8b31c5b6'),(24,24,1,NULL,NULL,1,'2022-04-23 01:24:24','2022-04-23 01:24:24','7768af44-8796-455a-a7d7-a7a173dbf4c4'),(25,25,1,NULL,NULL,1,'2022-04-23 01:24:24','2022-04-23 01:24:24','92aa70b0-219f-400e-b162-7fe7fcb59a12'),(26,26,1,NULL,NULL,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','54859b22-552c-4879-a765-1c0faedc369c'),(27,27,1,NULL,NULL,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','9dfd25a5-99aa-4feb-b5fa-b6c26a8ede0f'),(28,28,1,NULL,NULL,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','2451bb93-1e96-4748-9308-301a62823ee7'),(29,29,1,NULL,NULL,1,'2022-04-23 01:24:31','2022-04-23 01:24:31','03126788-af3f-46c6-8b33-6dde1f139ab8'),(30,30,1,NULL,NULL,1,'2022-04-23 01:24:38','2022-04-23 01:24:38','b1f5b57c-3b2f-4525-980c-2af87f18dbfb'),(31,31,1,NULL,NULL,1,'2022-04-23 01:24:38','2022-04-23 01:24:38','b598e946-b96e-47a9-8eb0-6256363068bb'),(32,32,1,NULL,NULL,1,'2022-04-23 01:24:43','2022-04-23 01:24:43','f577a703-4f74-4989-bb49-440e8eb41e06'),(33,33,1,NULL,NULL,1,'2022-04-23 01:24:43','2022-04-23 01:24:43','e8d88844-75af-4d2a-a9a5-4f9cdb104494'),(34,34,1,'craft-cms',NULL,1,'2022-04-23 01:25:04','2022-04-23 08:11:26','fa5a8b00-479d-428b-8bde-d526558a358e'),(35,35,1,NULL,NULL,1,'2022-04-23 01:25:13','2022-04-23 01:25:13','99960b13-7ce5-4535-97fe-e5707b9dafdb'),(36,36,1,NULL,NULL,1,'2022-04-23 01:25:15','2022-04-23 01:25:15','5eefa6bb-6154-4dee-ad3c-fcbd78a47b24'),(37,37,1,'__temp_zescearebocsamykbontgomsouxbccqxmtct',NULL,1,'2022-04-23 01:27:21','2022-04-23 01:27:21','92fd2d4a-bcac-4884-b705-b8b78b840986'),(38,38,1,'craft-cms',NULL,1,'2022-04-23 01:27:43','2022-04-23 08:13:18','5f682286-7560-4149-911a-bcf789f0fe40'),(39,39,1,'simple-header',NULL,1,'2022-04-23 01:28:07','2022-04-23 08:13:18','c392c569-52f2-44c8-9580-b5a1641734e7'),(40,40,1,NULL,NULL,1,'2022-04-23 01:28:07','2022-04-23 01:28:07','5b712337-9941-450e-bc48-6d853dcf76dd'),(53,53,1,'development-stage',NULL,1,'2022-04-23 03:09:02','2022-04-23 08:11:26','045ec7b1-9482-46f4-b4cb-08cbe3303c7c'),(57,57,1,NULL,NULL,1,'2022-04-23 03:09:14','2022-04-23 03:09:14','33384780-2a0e-4ee4-b42d-019176be9ef5'),(58,58,1,NULL,NULL,1,'2022-04-23 03:09:15','2022-04-23 03:09:15','742344a6-65f5-4e84-9617-d41b45211d78'),(59,59,1,NULL,NULL,1,'2022-04-23 03:09:20','2022-04-23 03:09:20','dd99be24-23d2-4ae0-ac1a-ca89c94a3581'),(60,60,1,NULL,NULL,1,'2022-04-23 03:09:21','2022-04-23 03:09:21','acde6e72-2d69-4980-a885-b320309569fe'),(61,61,1,'development-technologies',NULL,1,'2022-04-23 03:09:48','2022-04-23 09:34:19','c3d43993-50b6-45a2-b526-0ce5a7e5fcad'),(62,62,1,NULL,NULL,1,'2022-04-23 03:09:57','2022-04-23 03:09:57','78eec543-41f6-486f-95f3-d62c93af84a2'),(63,63,1,NULL,NULL,1,'2022-04-23 03:09:58','2022-04-23 03:09:58','104c3aa8-30b5-444c-83c0-8a0d7255dd55'),(64,64,1,NULL,NULL,1,'2022-04-23 03:10:01','2022-04-23 03:10:01','3a61db5c-f619-416e-95be-a4a2eebb53f8'),(65,65,1,NULL,NULL,1,'2022-04-23 03:10:05','2022-04-23 03:10:05','add398c9-c97e-4a83-8427-28fe39fe4b59'),(66,66,1,NULL,NULL,1,'2022-04-23 03:10:05','2022-04-23 03:10:05','d9325ecc-554a-4145-8bc5-6f12b8c082ee'),(67,67,1,NULL,NULL,1,'2022-04-23 03:10:11','2022-04-23 03:10:11','48c6621c-4b44-440c-ba7a-c2b18c1d545b'),(68,68,1,'local-development-requirements',NULL,1,'2022-04-23 03:10:44','2022-04-23 09:34:19','9f68e031-f1a2-461e-9e88-53b6338c2fb1'),(69,69,1,NULL,NULL,1,'2022-04-23 03:10:47','2022-04-23 03:10:47','76e220bf-c9bb-4e84-9175-eb8856d1cf13'),(70,70,1,NULL,NULL,1,'2022-04-23 03:10:48','2022-04-23 03:10:48','7f48d629-6b91-4601-9ae6-7452ac0d99ac'),(71,71,1,NULL,NULL,1,'2022-04-23 03:10:50','2022-04-23 03:10:50','5d1d88bd-3ffc-45a4-8bd7-758e15eaf08b'),(72,72,1,NULL,NULL,1,'2022-04-23 03:10:51','2022-04-23 03:10:51','2c58c468-e5b9-4c08-8f9d-3b16cb8eef13'),(73,73,1,NULL,NULL,1,'2022-04-23 03:10:59','2022-04-23 03:10:59','6574d2b2-24f8-4d62-9d2e-e2d2390b8541'),(74,74,1,NULL,NULL,1,'2022-04-23 03:11:11','2022-04-23 03:11:11','fc9a315b-6b48-47a0-a375-e0f9151e1a32'),(75,75,1,NULL,NULL,1,'2022-04-23 03:11:12','2022-04-23 03:11:12','39141f27-2adf-4a7a-a019-d194a9e54f7c'),(93,93,1,NULL,NULL,1,'2022-04-23 08:24:56','2022-04-23 08:24:56','485437ec-0953-41c8-becd-77ea00539db6'),(94,94,1,NULL,NULL,1,'2022-04-23 08:24:59','2022-04-23 08:24:59','a93cfc28-3c8c-4908-85b3-f7d33ce31beb'),(95,95,1,NULL,NULL,1,'2022-04-23 08:25:00','2022-04-23 08:25:00','2693cd4a-2a67-4b63-8437-34344be9598c'),(96,96,1,NULL,NULL,1,'2022-04-23 08:25:01','2022-04-23 08:25:01','fc2a9914-2994-4989-b880-86f68016d7dc'),(97,97,1,NULL,NULL,1,'2022-04-23 08:25:07','2022-04-23 08:25:07','1848a6e8-3fe4-46f8-a3c8-1cb4b19cd211'),(98,98,1,NULL,NULL,1,'2022-04-23 08:25:08','2022-04-23 08:25:08','a4f3f353-43bf-4a00-bddc-207988ee1a6d'),(99,99,1,NULL,NULL,1,'2022-04-23 08:25:10','2022-04-23 08:25:10','5576fe95-61bc-46f6-9adb-0037a16bb37c'),(100,100,1,NULL,NULL,1,'2022-04-23 08:25:11','2022-04-23 08:25:11','e31b6e3e-0475-46c5-8003-d59b83b98bb2'),(101,101,1,NULL,NULL,1,'2022-04-23 08:25:15','2022-04-23 08:25:15','0e213611-f5fa-4be3-94a5-369bcd71b09a'),(102,102,1,NULL,NULL,1,'2022-04-23 08:25:15','2022-04-23 08:25:15','f0e8d1f5-f50f-49f0-901a-b2bc18f013b6'),(103,103,1,NULL,NULL,1,'2022-04-23 08:25:16','2022-04-23 08:25:16','19b1ca88-da89-42d1-bbcb-914bddc5a782'),(104,104,1,NULL,NULL,1,'2022-04-23 08:25:21','2022-04-23 08:25:21','ad9e9679-dd98-4362-a7d6-780a3e2afc57'),(105,105,1,NULL,NULL,1,'2022-04-23 08:25:22','2022-04-23 08:25:22','e589b618-5d6d-41e6-83f8-b62deda28078'),(106,106,1,NULL,NULL,1,'2022-04-23 08:25:23','2022-04-23 08:25:23','47a98370-38ce-46b3-92ed-64b036814a0e'),(107,107,1,NULL,NULL,1,'2022-04-23 08:25:26','2022-04-23 08:25:26','64850379-f3e5-4d21-9488-97837fd034ef'),(108,108,1,NULL,NULL,1,'2022-04-23 08:25:27','2022-04-23 08:25:27','bd20de74-6a59-4348-9db5-17039168ca3c'),(110,110,1,'development-technologies',NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','5a38ea35-db8d-45b8-b063-a8c660d17e94'),(111,111,1,NULL,NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','afa17ce3-00e5-49f2-b8ab-5c88f7b8e92a'),(112,112,1,NULL,NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','bd8b1b25-52c4-4b16-b2af-f86082eb9792'),(113,113,1,'development-technologies',NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','5174ad56-c5d4-4486-a199-d718e61c2259'),(114,114,1,NULL,NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','52489e6e-d5f7-4494-8730-d866294c31cb'),(115,115,1,NULL,NULL,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','741681e8-adfa-47e9-a71c-22292c6aaea3'),(116,116,1,'development-technologies',NULL,1,'2022-04-23 08:25:48','2022-04-23 08:25:48','2c5ce9a5-3351-4bf2-9cff-8bde71de8854'),(117,117,1,NULL,NULL,1,'2022-04-23 08:25:48','2022-04-23 08:25:48','f35041ef-1ba6-4bf3-a735-4ee5c3f9f958'),(118,118,1,NULL,NULL,1,'2022-04-23 08:25:48','2022-04-23 08:25:48','eeede0b9-2e79-45b2-b505-b6869d2936bf'),(121,121,1,NULL,NULL,1,'2022-04-23 08:58:21','2022-04-23 08:58:21','c64cfbc0-ef13-4883-abbf-70b55c98cab9'),(122,122,1,NULL,NULL,1,'2022-04-23 08:58:26','2022-04-23 08:58:26','a791730c-b250-4ae0-a360-0585e24b2c83'),(123,123,1,NULL,NULL,1,'2022-04-23 08:58:33','2022-04-23 08:58:33','73ffc6dc-5d4d-413b-a5ec-8d739d418dad'),(124,124,1,NULL,NULL,1,'2022-04-23 08:58:33','2022-04-23 08:58:33','a3bebd7c-01b7-4438-b132-f5745d4302d4'),(125,125,1,NULL,NULL,1,'2022-04-23 08:58:42','2022-04-23 08:58:42','1a767b5c-9d0a-44dd-bae8-8a050d81d23d'),(127,127,1,'local-development-requirements',NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','1dd8c8ac-6daf-4180-ac40-6a7ac65ec72a'),(128,128,1,NULL,NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','3bfe193f-0a3e-4476-b190-4a9f3eca47b9'),(129,129,1,NULL,NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','4df702b0-af0a-496d-891a-69772e3462d2'),(130,130,1,'local-development-requirements',NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','4d6664ce-2bb8-4127-8966-609331c4fd67'),(131,131,1,NULL,NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','793f20c5-1727-4890-bd92-3ab87d54247c'),(132,132,1,NULL,NULL,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','1089d57c-3468-45c7-b3be-425da664688e'),(133,133,1,'local-development-requirements',NULL,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','04426717-6375-418a-9dda-e8156c907b9b'),(134,134,1,NULL,NULL,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','39361bd0-3107-444e-a04b-be0f02010a00'),(135,135,1,NULL,NULL,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','150aab18-49ab-4a14-a945-82a7a0c92e8f'),(136,136,1,'local-development-requirements',NULL,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','b9f3fd78-93b3-424f-9ef6-1574f51f5528'),(137,137,1,NULL,NULL,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','ff974e6a-a90a-4c14-a7bc-77910277095b'),(138,138,1,NULL,NULL,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','ee275c7d-1b7a-464c-9ec5-36704487f7df'),(142,142,1,'local-development-requirements',NULL,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','63a9db10-4bba-46dc-96e7-9d9020caa23f'),(143,143,1,NULL,NULL,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','b29e2583-25bd-4b1b-9666-7579863f7566'),(144,144,1,NULL,NULL,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','c1d14f42-4ad5-4124-9684-0c0427820739'),(147,147,1,NULL,NULL,1,'2022-04-23 09:06:51','2022-04-23 09:06:51','954c6ba2-1854-4f2e-9fde-d66d8af60732'),(149,149,1,'simple-header',NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','b7b40719-20fa-4bb7-bb41-e9efec2b5752'),(150,150,1,NULL,NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','5c80d7a8-1b66-4f94-9cb7-41e2507e9ee7'),(151,151,1,NULL,NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','cc61918a-b234-48d9-915f-c312c4ca80f7'),(152,152,1,'simple-header',NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','4cdb7617-776e-4454-b567-34257d344955'),(153,153,1,NULL,NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','869d4aac-8729-43da-97c5-35f691fe4b4b'),(154,154,1,NULL,NULL,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','ff63ca68-432e-4106-b803-9dcd51feec85'),(157,157,1,'development-stage',NULL,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','d9a7e39c-cb7c-4ba3-8556-40110c201ae9'),(158,158,1,NULL,NULL,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','ea4226dc-973c-43dc-9094-79003c3724fb'),(159,159,1,'development-stage',NULL,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','4d09f196-1f00-44f5-b1fe-c52364d72350'),(160,160,1,NULL,NULL,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','d4434244-6eaf-4bfd-ba34-285f6f33893f'),(163,163,1,'development-stage',NULL,1,'2022-04-23 09:34:18','2022-04-23 09:34:18','fc702244-ec62-48a3-950a-0b295609e556'),(164,164,1,NULL,NULL,1,'2022-04-23 09:34:18','2022-04-23 09:34:18','37ced9b2-4728-4824-b207-d8503607594f');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2022-04-22 22:07:00',NULL,0,'2022-04-22 22:07:13','2022-04-22 22:07:13','2b4e8dc9-b93e-45d7-9c39-b1abe0c410e2'),(4,1,NULL,2,1,'2022-04-23 01:16:00',NULL,NULL,'2022-04-23 01:16:54','2022-04-23 07:17:32','43b4b877-7343-4bac-b5d7-5a98e860f8cf'),(34,1,NULL,1,1,'2022-04-23 01:25:00',NULL,NULL,'2022-04-23 01:25:04','2022-04-23 01:25:04','ce7a8403-00e6-4c34-892c-54692daae924'),(37,1,NULL,1,1,'2022-04-23 01:27:00',NULL,NULL,'2022-04-23 01:27:21','2022-04-23 01:27:21','a2440351-c0b0-4ebc-aaab-a6088afeb5c7'),(38,1,NULL,1,1,'2022-04-23 01:27:00',NULL,NULL,'2022-04-23 01:27:43','2022-04-23 01:27:43','28f2585f-7fea-4983-9ff7-14aaa7f18e42'),(39,1,NULL,1,1,'2022-04-23 01:28:00',NULL,NULL,'2022-04-23 01:28:07','2022-04-23 01:28:07','4154abac-f07d-4da5-80d5-d7df716d3eb8'),(53,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 03:09:02','2022-04-23 03:09:02','fa2be1ad-9a88-4e02-b8ad-690a5e56d456'),(61,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 03:09:48','2022-04-23 03:09:48','9338b59b-476b-4b8f-8c4f-89505128450d'),(68,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 03:10:44','2022-04-23 03:10:44','5955f7dc-c6b3-412b-97e5-8d267dc846fd'),(110,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','b98c0811-7b13-45fc-8d48-0b6d05a8e8e6'),(113,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','d72a2d69-c39a-47a5-ace3-ce2c56bf1d52'),(116,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 08:25:48','2022-04-23 08:25:48','699eb19c-be7a-463d-8871-845b159ab591'),(127,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','0ce39dad-1fbf-44d7-b408-b69468fa094e'),(130,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','f4c70dc8-a21b-485a-9268-2dfe0e5c336c'),(133,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 09:00:14','2022-04-23 09:00:14','2e27e8bc-1305-46b8-8b26-2a9b82318df5'),(136,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 09:01:10','2022-04-23 09:01:10','c8a8ad58-ec73-41b0-94af-cd4c0f86062f'),(142,1,NULL,1,1,'2022-04-23 03:10:00',NULL,NULL,'2022-04-23 09:04:12','2022-04-23 09:04:12','34d9941a-8ae8-4a61-b1c0-d621a4242a98'),(149,1,NULL,1,1,'2022-04-23 01:28:00',NULL,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','9b81bbac-1ef1-47e5-8874-9334119b5cf2'),(152,1,NULL,1,1,'2022-04-23 01:28:00',NULL,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','8ae6d4e6-28de-460d-b2c1-8fafc1b3ec15'),(157,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 09:14:03','2022-04-23 09:14:03','d9b0d8d5-d462-474f-8b0b-efc79a56f058'),(159,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 09:14:03','2022-04-23 09:14:03','0e936619-ae3d-428f-9cc8-5301cba666de'),(163,1,NULL,1,1,'2022-04-23 03:09:00',NULL,NULL,'2022-04-23 09:34:18','2022-04-23 09:34:18','96c6ee40-e93b-4821-9e73-2bcd1ca2265d');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2022-04-22 19:43:56','2022-04-22 19:43:56',NULL,'7aceaed4-2bfc-4a10-8283-035b91e2f8c2'),(2,1,8,'Intro','intro',1,'site',NULL,NULL,2,'2022-04-23 07:16:58','2022-04-23 07:16:58',NULL,'428f65fe-9958-4654-98a8-5a18cd762f6d');
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
INSERT INTO `fieldlayoutfields` VALUES (21,1,24,1,0,1,'2022-04-22 20:00:59','2022-04-22 20:00:59','19ff67ee-1770-4cab-8fb0-ddfb861c6d36'),(26,8,27,1,0,1,'2022-04-23 07:16:58','2022-04-23 07:16:58','588bf023-8032-4bc3-b0bf-f7bd851b9e0b'),(35,2,33,2,0,0,'2022-04-23 09:01:01','2022-04-23 09:01:01','876a01cf-3465-4f2a-9d2b-a5a2f15731db'),(36,4,34,3,0,0,'2022-04-23 09:01:01','2022-04-23 09:01:01','68f0e276-33ed-477e-a88c-11855294a620'),(37,4,34,9,0,1,'2022-04-23 09:01:01','2022-04-23 09:01:01','c5b68636-a3a1-49d8-bad5-924c7812ebda'),(38,4,34,7,0,2,'2022-04-23 09:01:01','2022-04-23 09:01:01','a5a52249-a230-4615-a2cd-07853902b2a3'),(39,5,35,4,0,0,'2022-04-23 09:01:01','2022-04-23 09:01:01','84f6b899-11b7-44e5-94e7-f386e8759ed6'),(40,5,35,8,0,1,'2022-04-23 09:01:01','2022-04-23 09:01:01','dea4cc8c-67ba-4f03-9999-17f5fceddbdd'),(41,6,36,5,0,0,'2022-04-23 09:01:01','2022-04-23 09:01:01','c04343e3-fb0e-477c-ae96-e58da08d62c9'),(42,7,37,6,0,0,'2022-04-23 09:01:01','2022-04-23 09:01:01','97c8a969-8f56-44ac-a5f5-784d5874a586');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-04-22 19:43:56','2022-04-22 19:43:56',NULL,'7a4086f4-0a72-4703-838e-c904b642dd2f'),(2,'craft\\elements\\MatrixBlock','2022-04-22 19:50:43','2022-04-22 19:50:43',NULL,'c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa'),(3,'craft\\elements\\Asset','2022-04-22 19:52:15','2022-04-22 19:52:15',NULL,'9595a652-e302-4412-ab11-448fac84619d'),(4,'craft\\elements\\MatrixBlock','2022-04-22 19:55:12','2022-04-22 19:55:12',NULL,'2a8ebc31-78d5-4a64-b499-5e1a73f28bca'),(5,'craft\\elements\\MatrixBlock','2022-04-22 19:55:56','2022-04-22 19:55:56',NULL,'472c178e-14a5-4dee-b772-57d852c37f7e'),(6,'craft\\elements\\MatrixBlock','2022-04-22 19:56:36','2022-04-22 19:56:36',NULL,'57e6473a-5681-429b-8e25-0f9a6d29fea1'),(7,'craft\\elements\\MatrixBlock','2022-04-22 19:57:34','2022-04-22 19:57:34',NULL,'46171e49-beee-4231-91d1-fad995dfabe9'),(8,'craft\\elements\\Entry','2022-04-23 07:16:58','2022-04-23 07:16:58',NULL,'e47bb4d8-2403-4db6-abf2-6ae9a2237adf');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (4,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2022-04-22 19:53:27','2022-04-22 19:53:27','7c0db3a0-a540-4b0e-8057-2dee6e64d58c'),(24,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"}]',1,'2022-04-22 20:00:59','2022-04-22 20:00:59','38c001d2-f641-445f-86ee-bcb83749e116'),(27,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"}]',0,'2022-04-23 07:16:58','2022-04-23 07:16:58','5110c684-08bb-4066-99ed-707475eb9932'),(33,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"3b53818e-db5e-40fe-a966-f84478128b5d\"}]',1,'2022-04-23 09:01:01','2022-04-23 09:01:01','b49f3a3e-499d-455f-8f8e-d14a30f21cc0'),(34,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":50,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"d8abe207-76dd-4308-95f3-b623080169a6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":50,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c932de98-0288-4c4a-8160-b0b80ea4c6a5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a\"}]',1,'2022-04-23 09:01:01','2022-04-23 09:01:01','734e60fc-0b42-466c-879b-f670010dcf6c'),(35,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"5bc99274-d138-4da9-9a81-b4ca97e30012\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"f67e2256-059c-443f-8808-6e34d72084cb\"}]',1,'2022-04-23 09:01:01','2022-04-23 09:01:01','3f269e4b-d809-47c9-bc78-6612207a610a'),(36,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad\"}]',1,'2022-04-23 09:01:01','2022-04-23 09:01:01','83bad153-4b60-4163-99ba-2500a920c706'),(37,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"abf5b55d-598e-462f-b045-82a72d9925be\"}]',1,'2022-04-23 09:01:01','2022-04-23 09:01:01','71a74eac-0c4c-492d-8b33-1b1ba23b1cf6');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Blocks','blocks','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_blocks}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2022-04-22 19:50:43','2022-04-22 19:50:43','0c9da4ed-c32a-4005-adb2-8af66b613d8e'),(2,NULL,'Text','text','matrixBlockType:89a9bf71-5d7f-41de-9bda-98b30337a1a6',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-04-22 19:50:43','2022-04-22 19:55:12','3b53818e-db5e-40fe-a966-f84478128b5d'),(3,NULL,'Image','image','matrixBlockType:fba99691-a856-4400-8a12-f504c60b3059',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\",\"singleUploadLocationSubpath\":\"image\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-04-22 19:55:12','2022-04-22 19:55:56','d8abe207-76dd-4308-95f3-b623080169a6'),(4,NULL,'Video','video','matrixBlockType:b1772479-93cf-472e-844a-9969f822491c',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"video\"],\"defaultUploadLocationSource\":\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\",\"defaultUploadLocationSubpath\":\"video\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-04-22 19:55:56','2022-04-22 19:56:36','5bc99274-d138-4da9-9a81-b4ca97e30012'),(5,NULL,'Code','code','matrixBlockType:85bb94ac-ee0b-44f4-881a-a00190595a35',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"1\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-04-22 19:56:36','2022-04-22 19:57:34','e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad'),(6,NULL,'Blockquote','blockquote','matrixBlockType:0b797197-2780-406a-a3ac-2651f463ac74',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"1\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":true,\"uiMode\":\"enlarged\"}','2022-04-22 19:57:34','2022-04-22 20:00:41','abf5b55d-598e-462f-b045-82a72d9925be'),(7,NULL,'Caption','caption','matrixBlockType:fba99691-a856-4400-8a12-f504c60b3059',NULL,'',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"1\",\"multiline\":\"1\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-04-22 22:07:05','2022-04-23 09:01:01','a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a'),(8,NULL,'Caption','caption','matrixBlockType:b1772479-93cf-472e-844a-9969f822491c',NULL,'',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2022-04-22 22:07:05','2022-04-23 08:58:11','f67e2256-059c-443f-8808-6e34d72084cb'),(9,NULL,'Open image in a modal?','imageModal','matrixBlockType:fba99691-a856-4400-8a12-f504c60b3059',NULL,'',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2022-04-23 08:58:11','2022-04-23 09:01:01','c932de98-0288-4c4a-8160-b0b80ea4c6a5');
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
INSERT INTO `info` VALUES (1,'3.7.38','3.7.33',0,'qtftomlfwrrj','3@ejuyapdkrk','2022-04-21 22:20:58','2022-04-23 09:01:01','109c0101-5287-45c3-bbb3-04d1152de1aa');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (3,2,1,2,1,1,'2022-04-22 22:07:17','2022-04-22 22:07:17','263d1d52-7d19-4b6f-bfed-1c5d81164385'),(5,4,1,1,1,0,'2022-04-23 01:17:39','2022-04-23 01:17:39','3677df38-6302-4573-ba7c-5ab878cc39b0'),(6,4,1,1,1,0,'2022-04-23 01:18:26','2022-04-23 01:18:26','c0aedbd5-bed6-41d1-9479-622e8b47be53'),(7,4,1,1,1,0,'2022-04-23 01:18:27','2022-04-23 01:18:27','2938b68d-fa80-49fa-bde7-eaebffd2f40f'),(8,4,1,1,1,0,'2022-04-23 01:23:19','2022-04-23 01:23:19','f1dec0a0-caad-476d-a39b-11dd02fb76c1'),(9,4,1,1,2,0,'2022-04-23 01:23:19','2022-04-23 01:23:19','06ba371b-caf3-4823-b27d-1aad33298da2'),(10,4,1,1,1,0,'2022-04-23 01:23:21','2022-04-23 01:23:21','5e7f9f8c-1580-49d6-9e68-18e848de98ad'),(11,4,1,1,2,0,'2022-04-23 01:23:21','2022-04-23 01:23:21','241029a9-142c-46bd-8a62-1d0f824dc70c'),(12,4,1,1,1,0,'2022-04-23 01:23:44','2022-04-23 01:23:44','4e7fe56d-806e-48d5-95bd-4fad9caae73e'),(13,4,1,1,2,0,'2022-04-23 01:23:44','2022-04-23 01:23:44','805fb8bf-d97e-426e-b7ef-37f638373a54'),(14,4,1,1,1,0,'2022-04-23 01:23:46','2022-04-23 01:23:46','a4135595-a1ed-4896-bd66-73062c64c20c'),(15,4,1,1,2,0,'2022-04-23 01:23:46','2022-04-23 01:23:46','2d99c3ed-2f76-4c4a-9b62-5bd2a0e603e0'),(16,4,1,1,1,0,'2022-04-23 01:23:48','2022-04-23 01:23:48','085cfe06-1fa6-49c4-855d-d684786f76d9'),(17,4,1,1,2,0,'2022-04-23 01:23:48','2022-04-23 01:23:48','8184f578-238a-4ba5-a844-8dbd7dd6e25a'),(18,4,1,1,1,0,'2022-04-23 01:23:53','2022-04-23 01:23:53','51b75690-1c64-4445-abf8-1e4ffcfaecc3'),(19,4,1,1,2,0,'2022-04-23 01:23:53','2022-04-23 01:23:53','ffd57928-cf08-4472-9209-867e8d42c9ec'),(20,4,1,1,1,0,'2022-04-23 01:24:12','2022-04-23 01:24:12','0a5fe98b-c34f-427c-a27e-13f49c177c9d'),(21,4,1,1,2,0,'2022-04-23 01:24:12','2022-04-23 01:24:12','6b90921d-838a-46c6-8949-6d5451d8af83'),(22,4,1,1,1,0,'2022-04-23 01:24:19','2022-04-23 01:24:19','4fe78864-2d81-4217-adcc-0355afb62266'),(23,4,1,1,2,0,'2022-04-23 01:24:19','2022-04-23 01:24:19','9c344aff-a737-4f35-bc97-1c7de9907a95'),(24,4,1,1,1,0,'2022-04-23 01:24:24','2022-04-23 01:24:24','7aefa511-9014-42e6-b27b-cf0fd8e01940'),(25,4,1,1,2,0,'2022-04-23 01:24:24','2022-04-23 01:24:24','942e78fd-b834-4b43-a560-b4c6af75302a'),(26,4,1,1,1,0,'2022-04-23 01:24:30','2022-04-23 01:24:30','08174c17-f3d5-4b57-a1a1-01b2a13ad83c'),(27,4,1,1,2,0,'2022-04-23 01:24:30','2022-04-23 01:24:30','16818d8e-e3d1-4c64-92fe-fb5a4cf0e6eb'),(28,4,1,1,1,0,'2022-04-23 01:24:31','2022-04-23 01:24:31','b7275ea3-63ff-4f48-879d-82aaa698fc4e'),(29,4,1,1,2,0,'2022-04-23 01:24:31','2022-04-23 01:24:31','9ecfeedd-4661-46ed-a61b-d3492b73f837'),(30,4,1,1,1,0,'2022-04-23 01:24:38','2022-04-23 01:24:38','b7f4df3e-7569-44ca-aa3a-7c629bdb2efc'),(31,4,1,1,2,0,'2022-04-23 01:24:39','2022-04-23 01:24:39','c2026e3c-e643-478b-b19e-f27f32a31043'),(32,4,1,1,1,NULL,'2022-04-23 01:24:43','2022-04-23 01:24:43','4d599689-1c7e-4b5a-a4e3-bc4a1b4a2bc0'),(33,4,1,1,2,NULL,'2022-04-23 01:24:43','2022-04-23 01:24:43','4a402757-6f3f-4dfb-a5f0-46be651de9d0'),(35,34,1,1,1,0,'2022-04-23 01:25:13','2022-04-23 01:25:13','cfc6792b-2141-4b98-b128-ebc149866157'),(36,34,1,1,1,NULL,'2022-04-23 01:25:15','2022-04-23 01:25:15','84bdaad9-e8f7-437b-8bcd-b8697f064a48'),(40,39,1,1,1,NULL,'2022-04-23 01:28:08','2022-04-23 01:28:08','6519e055-4dae-4b2a-9944-65f5d34129f7'),(57,53,1,1,1,0,'2022-04-23 03:09:14','2022-04-23 03:09:14','93b5edfb-2818-49ad-a39e-5295391012bd'),(58,53,1,1,1,0,'2022-04-23 03:09:15','2022-04-23 03:09:15','d89b5cd0-ca7d-4e9b-b532-e56d99916a55'),(59,53,1,1,1,0,'2022-04-23 03:09:20','2022-04-23 03:09:20','b00a828c-df78-45bb-ab2d-0abc315ed8a3'),(60,53,1,1,1,NULL,'2022-04-23 03:09:21','2022-04-23 03:09:21','8d9cf697-d9b2-4c60-968b-6d1b97ce8e52'),(62,61,1,1,1,0,'2022-04-23 03:09:57','2022-04-23 03:09:57','06e4878e-07a0-421c-b946-ae441cf5eb35'),(63,61,1,1,1,0,'2022-04-23 03:09:58','2022-04-23 03:09:58','95271f37-c66c-4aa3-94ea-df1acc558306'),(64,61,1,1,1,0,'2022-04-23 03:10:01','2022-04-23 03:10:01','2005072f-3f74-4d20-974a-7fa1166ab6c0'),(65,61,1,1,1,0,'2022-04-23 03:10:05','2022-04-23 03:10:05','af9a4bc4-fe0a-4d81-b591-ae0e43e1ef0e'),(66,61,1,1,1,0,'2022-04-23 03:10:05','2022-04-23 03:10:05','2e04a064-14ef-4b10-b18a-a7774fffd947'),(67,61,1,1,1,NULL,'2022-04-23 03:10:11','2022-04-23 03:10:11','3686e83d-d13a-4958-bc61-502f7072dd19'),(69,68,1,1,1,0,'2022-04-23 03:10:47','2022-04-23 03:10:47','dc3ccede-2b3d-4ccc-9c07-be614d220db2'),(70,68,1,1,1,0,'2022-04-23 03:10:48','2022-04-23 03:10:48','f18d1a00-1e71-41fd-b44f-c37192e4adb0'),(71,68,1,1,1,0,'2022-04-23 03:10:50','2022-04-23 03:10:50','c727ebc9-7ec6-4232-97b0-c871ef1532f8'),(72,68,1,1,1,0,'2022-04-23 03:10:51','2022-04-23 03:10:51','978839ac-8350-4309-b40e-0494e66cbaf0'),(73,68,1,1,1,0,'2022-04-23 03:10:59','2022-04-23 03:10:59','96962834-d775-4bf1-92c7-0f28ddbf24f2'),(74,68,1,1,1,0,'2022-04-23 03:11:11','2022-04-23 03:11:11','21636174-db71-4102-9291-82a811a785ab'),(75,68,1,1,1,NULL,'2022-04-23 03:11:12','2022-04-23 03:11:12','d678085a-b6d0-4da0-904b-152ed96a67ef'),(111,110,1,1,1,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','46c64b50-1681-47e0-85e9-a7950436b880'),(112,61,1,4,2,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','3cf44f4b-a498-4b6a-a910-0b74ec7c9b04'),(114,113,1,1,1,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','c9ce98eb-8e97-44f0-95e8-a23c3f454812'),(115,113,1,4,2,NULL,'2022-04-23 08:25:28','2022-04-23 08:25:28','7715d78a-8b7e-45eb-a736-ee7e3276cf95'),(117,116,1,1,1,NULL,'2022-04-23 08:25:48','2022-04-23 08:25:48','31c29333-567c-4f67-a1b3-d8b578ff4ce2'),(118,116,1,4,2,NULL,'2022-04-23 08:25:48','2022-04-23 08:25:48','c4a63c1e-474f-420c-881b-48b6f85cc8bf'),(128,127,1,1,1,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','64e484a5-d373-4cb2-a3af-ec80e544897d'),(129,68,1,2,2,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','848cd010-bb5f-4ab3-a18c-0aa9bc071b3f'),(131,130,1,1,1,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','1d8080ea-081d-4e39-9efe-f0927cfa93ec'),(132,130,1,2,2,NULL,'2022-04-23 08:58:48','2022-04-23 08:58:48','cec19d0d-76f9-4b84-acf4-ae5a4e675107'),(134,133,1,1,1,NULL,'2022-04-23 09:00:14','2022-04-23 09:00:14','b007fd61-5936-4c65-a273-adc701d1b595'),(135,133,1,2,2,NULL,'2022-04-23 09:00:14','2022-04-23 09:00:14','2c8e39da-e208-4b9f-ab86-44033351633a'),(137,136,1,1,1,NULL,'2022-04-23 09:01:10','2022-04-23 09:01:10','5929f2e1-f21f-41d7-a759-273dc34f23c9'),(138,136,1,2,2,NULL,'2022-04-23 09:01:10','2022-04-23 09:01:10','186cd924-ea12-40cd-b83a-5560740a4cfd'),(143,142,1,1,1,NULL,'2022-04-23 09:04:12','2022-04-23 09:04:12','e1a85219-46eb-4042-b838-45ce5f1491b3'),(144,142,1,2,2,NULL,'2022-04-23 09:04:12','2022-04-23 09:04:12','7c388120-ae3e-4342-88a9-bce84bdd9e8d'),(150,149,1,1,1,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','856e8787-affe-4434-8150-d1acd06b11f1'),(151,39,1,5,2,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','2916f04e-3583-47d8-98d9-c5da159eb2d6'),(153,152,1,1,1,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','fafe5f33-2f3b-4ae3-9a7f-89240a1971b2'),(154,152,1,5,2,NULL,'2022-04-23 09:06:56','2022-04-23 09:06:56','8143a988-adb1-404e-927e-b2047c59cf61'),(158,157,1,1,1,NULL,'2022-04-23 09:14:03','2022-04-23 09:14:03','ddc095ab-c729-46e1-9e38-c838d38f5e99'),(160,159,1,1,1,NULL,'2022-04-23 09:14:03','2022-04-23 09:14:03','78434335-ea1e-4eb5-990d-ff82f15f12c4'),(164,163,1,1,1,NULL,'2022-04-23 09:34:18','2022-04-23 09:34:18','5e9a69f1-d2f3-4715-9764-7ea1c6cc91dd');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,1,2,'Text','text',1,'2022-04-22 19:50:43','2022-04-22 19:50:43','89a9bf71-5d7f-41de-9bda-98b30337a1a6'),(2,1,4,'Image','image',2,'2022-04-22 19:55:12','2022-04-22 19:55:12','fba99691-a856-4400-8a12-f504c60b3059'),(3,1,5,'Video','video',3,'2022-04-22 19:55:56','2022-04-22 19:55:56','b1772479-93cf-472e-844a-9969f822491c'),(4,1,6,'Code','code',4,'2022-04-22 19:56:36','2022-04-22 19:56:36','85bb94ac-ee0b-44f4-881a-a00190595a35'),(5,1,7,'Blockquote','blockquote',5,'2022-04-22 19:57:34','2022-04-22 19:57:34','0b797197-2780-406a-a3ac-2651f463ac74');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_blocks`
--

LOCK TABLES `matrixcontent_blocks` WRITE;
/*!40000 ALTER TABLE `matrixcontent_blocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_blocks` VALUES (1,3,1,'2022-04-22 22:07:17','2022-04-22 22:07:17','14bdfefa-c6ab-4894-9c78-876736823331',NULL,NULL,NULL,NULL,NULL,NULL),(2,5,1,'2022-04-23 01:17:39','2022-04-23 01:17:39','1158624b-8442-4e77-aa50-609284367188',NULL,NULL,NULL,NULL,NULL,NULL),(3,6,1,'2022-04-23 01:18:25','2022-04-23 01:18:25','8b3c9582-aca3-49e7-80e6-b540cdaada3e','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>',NULL,NULL,NULL,NULL,NULL),(4,7,1,'2022-04-23 01:18:27','2022-04-23 01:18:27','04fe3089-dd44-400e-8a86-5e799045eb74','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(5,8,1,'2022-04-23 01:23:19','2022-04-23 01:23:19','796d0407-ce65-41db-9664-137c0f9907bc','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(6,9,1,'2022-04-23 01:23:19','2022-04-23 01:23:19','87dd5dbf-4c9c-4f74-98b1-31f9699ece28',NULL,NULL,NULL,NULL,NULL,NULL),(7,10,1,'2022-04-23 01:23:21','2022-04-23 01:23:21','f8c60c03-545d-4cea-8b64-e6a422670a36','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(8,11,1,'2022-04-23 01:23:21','2022-04-23 01:23:21','fab3928d-4d3d-46da-985f-91826159165a','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(9,12,1,'2022-04-23 01:23:44','2022-04-23 01:23:44','30452d45-f129-4809-9696-dd4de5b8cb62','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(10,13,1,'2022-04-23 01:23:44','2022-04-23 01:23:44','4dbb1983-3877-41c1-8719-144dcad36f11','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(11,14,1,'2022-04-23 01:23:46','2022-04-23 01:23:46','f77547a2-5b0b-4d1b-8e71-5ef965efd053','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(12,15,1,'2022-04-23 01:23:46','2022-04-23 01:23:46','54b8771e-1e01-478f-99df-e1d018e4fc15','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(13,16,1,'2022-04-23 01:23:48','2022-04-23 01:23:48','40aefe9f-84d3-451d-b06e-7fca7e8b9b60','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(14,17,1,'2022-04-23 01:23:48','2022-04-23 01:23:48','b42cfdd3-ef90-4fe8-b5a8-23ea26366a22','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(15,18,1,'2022-04-23 01:23:53','2022-04-23 01:23:53','7cf392e9-47ab-4d4b-8426-94f959da2fc7','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(16,19,1,'2022-04-23 01:23:53','2022-04-23 01:23:53','5f7909b0-ffd1-438c-96ca-1a7e935e814f','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(17,20,1,'2022-04-23 01:24:12','2022-04-23 01:24:12','ac657bb0-fa6d-4f93-ac00-8304d29650c8','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(18,21,1,'2022-04-23 01:24:12','2022-04-23 01:24:12','dfe1da4d-28c4-4922-a3ee-6cb8f10db42b','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(19,22,1,'2022-04-23 01:24:19','2022-04-23 01:24:19','db5c35da-1052-4e68-8b30-90f6147fe776','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h2>Local Development Requirements</h2>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h3>Craft CMS dependencies</h3>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(20,23,1,'2022-04-23 01:24:19','2022-04-23 01:24:19','b04755d1-8b30-4e91-ac01-edd56898da34','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(21,24,1,'2022-04-23 01:24:24','2022-04-23 01:24:24','30200ef2-e175-4840-8a63-a7848d4d4e92','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h2>Local Development Requirements</h2>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h2>Craft CMS dependencies</h2>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h3>Front-End dependencies</h3>',NULL,NULL,NULL,NULL,NULL),(22,25,1,'2022-04-23 01:24:24','2022-04-23 01:24:24','de2a0f36-96b5-4f76-9f18-ade17a33b5f7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(23,26,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','56d87001-bf3c-43b5-b0dc-50ba79017bda','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h2>Local Development Requirements</h2>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h2>Craft CMS dependencies</h2>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h2>Front-End dependencies</h2>',NULL,NULL,NULL,NULL,NULL),(24,27,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','729e27a2-8b10-4581-9842-fe8deea1e5b8','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(25,28,1,'2022-04-23 01:24:30','2022-04-23 01:24:30','758d0e36-fdef-45a0-aa8d-e19d451438cf','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h2>Local Development Requirements</h2>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h2>Craft CMS dependencies</h2>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h2>Front-End dependencies</h2>',NULL,NULL,NULL,NULL,NULL),(26,29,1,'2022-04-23 01:24:31','2022-04-23 01:24:31','55dfa04a-c348-4c60-94a4-ded0c5d5af4d','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(27,30,1,'2022-04-23 01:24:38','2022-04-23 01:24:38','d80144ce-9cff-4c4e-b6c1-4158767fa8ac','<h2>Development Stage</h2>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>\n<h2>Development Technologies</h2>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>\n<h2>Local Development Requirements</h2>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>\n<h2>Craft CMS dependencies</h2>\n<ul><li><a href=\"https://github.com/verbb/cloner\">Cloner</a>.</li><li><a href=\"https://github.com/mister-bk/craft-plugin-mix\">Craft Mix</a>.</li><li><a href=\"https://github.com/verbb/field-manager\">Field Manager</a>.</li><li><a href=\"https://github.com/nystudio107/craft-minify\">Minify</a>.</li><li><a href=\"https://github.com/craftcms/redactor\">Redactor</a>.</li></ul>\n<h2>Front-End dependencies</h2>',NULL,NULL,NULL,NULL,NULL),(28,31,1,'2022-04-23 01:24:39','2022-04-23 01:24:39','19884260-35f3-4a00-9123-5261cfbb1df5','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n',NULL,NULL,NULL,NULL,NULL),(29,32,1,'2022-04-23 01:24:43','2022-04-23 08:13:14','9f063165-fb9e-4a05-88ad-6af766d525f2','<h2 style=\"text-align: center\">Black Magic Docs &#x1f52e;</h2>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>',NULL,NULL,NULL,NULL,NULL),(30,33,1,'2022-04-23 01:24:43','2022-04-23 08:13:14','ba680e38-8407-48e3-82c3-e23532e9397b','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>',NULL,NULL,NULL,NULL,NULL),(31,35,1,'2022-04-23 01:25:13','2022-04-23 01:25:13','5a29b01e-d8cc-4f79-aa5b-73d8df4b9c05',NULL,NULL,NULL,NULL,NULL,NULL),(32,36,1,'2022-04-23 01:25:15','2022-04-23 08:13:14','fd7df7e1-29e8-43e3-b928-d2e2e0bb6a5e','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<ul><li>Craft CMS<ul><li>Simple header</li><li>Header with dropdown items </li></ul></li></ul>\n',NULL,NULL,NULL,NULL,NULL),(33,40,1,'2022-04-23 01:28:08','2022-04-23 09:06:56','ff5f54ab-258e-4b5d-85fe-713ea6a4f3ce','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n<p>Mauris arcu augue, efficitur sit amet vestibulum ut, rhoncus sit amet libero. Nulla ac lacinia dolor. Ut tristique lectus sit amet massa maximus feugiat. Aenean malesuada neque et magna accumsan, vitae scelerisque orci suscipit. Nunc vitae semper sapien, quis lacinia leo. Suspendisse potenti. Suspendisse id quam eget orci volutpat fermentum gravida eget diam. Morbi vel nulla dictum sem vulputate sodales et efficitur arcu. In venenatis eleifend enim, quis pulvinar lectus eleifend sit amet. Vivamus euismod tortor nec mi ullamcorper, nec rutrum enim mattis. In vel justo eros. Aliquam mollis nulla eget magna congue porta. Nullam a augue vitae ante efficitur porta.</p>',NULL,NULL,NULL,NULL,NULL),(43,57,1,'2022-04-23 03:09:14','2022-04-23 03:09:14','d9c044c8-3281-4bb4-801b-d2cc3311dd1d',NULL,NULL,NULL,NULL,NULL,NULL),(44,58,1,'2022-04-23 03:09:15','2022-04-23 03:09:15','059f625c-5877-4c51-9182-7e2a3242c2b2','<h3>Development Stage</h3>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL),(45,59,1,'2022-04-23 03:09:20','2022-04-23 03:09:20','ef5204ba-e852-4a1a-b298-025681e5367e','<h3><br /></h3>\n<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL),(46,60,1,'2022-04-23 03:09:21','2022-04-23 09:34:18','df0533ac-857d-4aba-8bbd-d4e9f54563ea','<p><kbd>npx mix watch:</kbd> Creates an instance of <strong>BrowserSync</strong> proxying to the virtual host configured in the <kbd>PRIMARY_SITE_URL</kbd> variable of the Craft CMS <kbd>.env</kbd> file.</p>\n<p><kbd>npx mix</kbd>: Compiles and processes the <kbd>./resources</kbd> directories. The compiled files are passed to the <kbd>./public</kbd> directory.</p>\n<p><kbd>npx mix -p</kbd>: Compiles and processes the <kbd>./resources</kbd> directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL),(47,62,1,'2022-04-23 03:09:57','2022-04-23 03:09:57','8f862800-a5fa-4d04-bcce-7bcf52e5e396',NULL,NULL,NULL,NULL,NULL,NULL),(48,63,1,'2022-04-23 03:09:58','2022-04-23 03:09:58','e0e28822-c22b-4d3f-a387-bec9d9dbcd8c','<h3>Development Technologies</h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(49,64,1,'2022-04-23 03:10:01','2022-04-23 03:10:01','fb230ca0-e033-4b08-aa6d-fa48807c0a78','<h3><br /></h3>\n<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(50,65,1,'2022-04-23 03:10:05','2022-04-23 03:10:05','80927600-9045-4eb8-9f52-242c018f9d94','<h3><br /></h3>\n<p><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</p><ul><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(51,66,1,'2022-04-23 03:10:05','2022-04-23 03:10:05','885f202a-ac9f-47fd-a4c3-6ddf7cf79f12','<h3><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.<br /></h3><ul><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(52,67,1,'2022-04-23 03:10:11','2022-04-23 08:25:28','82f17c1c-d304-457d-b76b-9b52efa708cf','<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(53,69,1,'2022-04-23 03:10:47','2022-04-23 03:10:47','a1815ddd-6729-4a7a-8d0c-14ae2e0e9566',NULL,NULL,NULL,NULL,NULL,NULL),(54,70,1,'2022-04-23 03:10:48','2022-04-23 03:10:48','d05cd6e4-5fd2-422c-b6cf-726a2b1a7d36','<h3>Local Development Requirements</h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(55,71,1,'2022-04-23 03:10:50','2022-04-23 03:10:50','ee197ce7-7a1b-403c-b7c2-55f0546dc297','<h3><br /></h3>\n<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(56,72,1,'2022-04-23 03:10:51','2022-04-23 03:10:51','f2feffc9-f314-471b-98a1-9fc38de4ed2d','<h3><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.<br /></h3><ul><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(57,73,1,'2022-04-23 03:10:59','2022-04-23 03:10:59','aad4cdb0-3873-4c4e-9a49-a2292d87d73a','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li></ul><ul><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(58,74,1,'2022-04-23 03:11:11','2022-04-23 03:11:11','94fb4340-2703-4822-bc55-807ac6c42491','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.<a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(59,75,1,'2022-04-23 03:11:12','2022-04-23 09:04:12','a6d5d677-8553-4979-b02d-f3993df9beed','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(69,93,1,'2022-04-23 08:24:56','2022-04-23 08:24:56','7603577c-76b4-4d18-91e1-8b9cb99a7bdf',NULL,NULL,NULL,NULL,NULL,NULL),(70,94,1,'2022-04-23 08:24:59','2022-04-23 08:24:59','5eb93631-f2a7-42bf-a030-3f0821baba4e',NULL,'{',NULL,NULL,NULL,NULL),(71,95,1,'2022-04-23 08:25:00','2022-04-23 08:25:00','18123663-3d5d-4b2d-a7ad-5d18bf648621',NULL,'{%',NULL,NULL,NULL,NULL),(72,96,1,'2022-04-23 08:25:01','2022-04-23 08:25:01','b1f51926-3144-497d-ae35-d18777e9e5cc',NULL,'{%',NULL,NULL,NULL,NULL),(73,97,1,'2022-04-23 08:25:07','2022-04-23 08:25:07','162d73db-c0d8-4603-aa98-78e2610d9b1e',NULL,'{% set test = \'hola0',NULL,NULL,NULL,NULL),(74,98,1,'2022-04-23 08:25:08','2022-04-23 08:25:08','44bd6db3-a111-4411-90e2-5d916c7c5966',NULL,'{% set test = \'hola\'',NULL,NULL,NULL,NULL),(75,99,1,'2022-04-23 08:25:10','2022-04-23 08:25:10','ba4433e2-7f1c-4780-b8ee-9ec0a17b784f',NULL,'{% set test = \'hola\' %}',NULL,NULL,NULL,NULL),(76,100,1,'2022-04-23 08:25:11','2022-04-23 08:25:11','ac7bf8d7-c292-461d-93bf-fe3752f4ca64',NULL,'{% set test = \'hola\' %}',NULL,NULL,NULL,NULL),(77,101,1,'2022-04-23 08:25:15','2022-04-23 08:25:15','cfa6a14a-0de0-4e5f-85c5-635f139e1aa5',NULL,'{% set test = \'hola\' %}\n\n<script',NULL,NULL,NULL,NULL),(78,102,1,'2022-04-23 08:25:15','2022-04-23 08:25:15','802b5717-70e1-442e-aa83-8e997e8dbd78',NULL,'{% set test = \'hola\' %}\n\n<script>',NULL,NULL,NULL,NULL),(79,103,1,'2022-04-23 08:25:16','2022-04-23 08:25:16','714b4733-2f3a-4d8f-ba49-1ffe8a06fce6',NULL,'{% set test = \'hola\' %}\n\n<script>',NULL,NULL,NULL,NULL),(80,104,1,'2022-04-23 08:25:21','2022-04-23 08:25:21','83c8278a-cb59-48f1-9a29-15421a04777a',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\'',NULL,NULL,NULL,NULL),(81,105,1,'2022-04-23 08:25:22','2022-04-23 08:25:22','0c51c2cd-343b-40b5-8c6a-ecfdb7f3702e',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')',NULL,NULL,NULL,NULL),(82,106,1,'2022-04-23 08:25:23','2022-04-23 08:25:23','45ece269-7ca5-4f42-a373-32f4022f314f',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n<',NULL,NULL,NULL,NULL),(83,107,1,'2022-04-23 08:25:26','2022-04-23 08:25:26','93e27674-6d49-4a06-99e7-b47fdcdfda1e',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n</scriptZ',NULL,NULL,NULL,NULL),(84,108,1,'2022-04-23 08:25:27','2022-04-23 08:25:27','f394b9a5-f676-4d1e-872c-70bf683ab22c',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n</script',NULL,NULL,NULL,NULL),(86,111,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','12b45b04-1ac4-4ff5-b552-a6f5845fac3e','<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(87,112,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','42dc6414-8301-468d-b7ea-a46100bd5338',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n</script>',NULL,NULL,NULL,NULL),(88,114,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','fe61fb80-baa0-49c0-aabe-b543c59d217d','<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(89,115,1,'2022-04-23 08:25:28','2022-04-23 08:25:28','193fc518-deb0-49ce-9f4c-a444e7c4b3dd',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n</script>',NULL,NULL,NULL,NULL),(90,117,1,'2022-04-23 08:25:48','2022-04-23 08:25:48','bdfbabdd-7132-41e6-b10b-562ba0015fc7','<ul><li><a href=\"https://craftcms.com/docs/3.x/\">Craft CMS 3</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li>Native Twig Templates</li></ul>',NULL,NULL,NULL,NULL,NULL),(91,118,1,'2022-04-23 08:25:48','2022-04-23 08:25:48','944eb269-590f-49a5-9b90-ceffbb912599',NULL,'{% set test = \'hola\' %}\n\n<script>\nconsole.log(\'hola\')\n</script>',NULL,NULL,NULL,NULL),(93,121,1,'2022-04-23 08:58:21','2022-04-23 08:58:21','16b1b4f8-a49c-4137-8a45-d401b77abd73',NULL,NULL,NULL,NULL,NULL,NULL),(94,122,1,'2022-04-23 08:58:26','2022-04-23 08:58:26','f4435628-baae-4179-8146-d3f382aae1ca',NULL,NULL,NULL,NULL,NULL,0),(95,124,1,'2022-04-23 08:58:33','2022-04-23 08:58:33','f70a325c-f313-46d7-b3cb-c63ca59a6a5d',NULL,NULL,NULL,NULL,NULL,0),(96,125,1,'2022-04-23 08:58:42','2022-04-23 08:58:42','f54fe4ab-fc01-43d8-886a-7743b3bd2ead',NULL,NULL,NULL,'<p>Simple </p>',NULL,0),(98,128,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','3b2ffa10-59cb-4c58-83de-af13ff0a08cf','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(99,129,1,'2022-04-23 08:58:48','2022-04-23 09:04:12','2982c036-a20a-4ddc-9652-37a85858cf8a',NULL,NULL,NULL,'Simple screenshot code.',NULL,1),(100,131,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','68ab0c9e-897e-4743-b514-e064d811d209','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(101,132,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','bad4f064-0b24-409e-8440-5a213e9d2341',NULL,NULL,NULL,'<p>Simple screenshot code.</p>',NULL,0),(102,134,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','84d9cb38-aea8-4d5e-8cc2-89b6fbc5b78f','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(103,135,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','6b4f1c44-5e02-4f60-acc0-1ee97e9536be',NULL,NULL,NULL,'<p>Simple screenshot code.</p>',NULL,0),(104,137,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','7a921641-addf-448e-8ee8-ee91bdb7e99b','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(105,138,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','8ed7eb77-1d7d-4fa4-9f8b-08b9c139a855',NULL,NULL,NULL,'Simple screenshot code.',NULL,0),(108,143,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','9869ba13-a7af-4388-a894-35c11b435d09','<ul><li><a href=\"https://laravel.com/docs/9.x/valet\">Laravel Valet</a>.</li><li><a href=\"https://formulae.brew.sh/formula/php\">PHP 8.1.5</a>.</li><li><a href=\"https://dev.mysql.com/downloads/mysql/\">MySQL Community Server 8</a>.</li><li><a href=\"https://laravel-mix.com/\">Laravel Mix 6</a>.</li><li><a href=\"https://nodejs.org/\">Node.JS</a> v16.14.2 or the latest version of Long Term Support, managed by <a href=\"https://github.com/nvm-sh/nvm\">NVM</a>.</li><li><a href=\"https://npmjs.com/\">NPM</a>.</li></ul>',NULL,NULL,NULL,NULL,NULL),(109,144,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','a60396f7-c954-40ec-bcc5-cf376913a34b',NULL,NULL,NULL,'Simple screenshot code.',NULL,1),(111,147,1,'2022-04-23 09:06:51','2022-04-23 09:06:51','08022e9b-aa76-4a9e-814f-6f7984608845',NULL,NULL,NULL,NULL,NULL,NULL),(113,150,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','1a0899c1-e3b6-431e-a9be-81f9c3276b88','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n<p>Mauris arcu augue, efficitur sit amet vestibulum ut, rhoncus sit amet libero. Nulla ac lacinia dolor. Ut tristique lectus sit amet massa maximus feugiat. Aenean malesuada neque et magna accumsan, vitae scelerisque orci suscipit. Nunc vitae semper sapien, quis lacinia leo. Suspendisse potenti. Suspendisse id quam eget orci volutpat fermentum gravida eget diam. Morbi vel nulla dictum sem vulputate sodales et efficitur arcu. In venenatis eleifend enim, quis pulvinar lectus eleifend sit amet. Vivamus euismod tortor nec mi ullamcorper, nec rutrum enim mattis. In vel justo eros. Aliquam mollis nulla eget magna congue porta. Nullam a augue vitae ante efficitur porta.</p>',NULL,NULL,NULL,NULL,NULL),(114,151,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','f9b607de-91b4-40ba-aaf7-da53b3d9b1c5',NULL,NULL,'<p>Mauris arcu augue, efficitur sit amet vestibulum ut, rhoncus sit amet libero. Nulla ac lacinia dolor. Ut tristique lectus sit amet massa maximus feugiat. Aenean malesuada neque et magna accumsan, vitae scelerisque orci suscipit. Nunc vitae semper sapien, quis lacinia leo. Suspendisse potenti. Suspendisse id quam eget orci volutpat fermentum gravida eget diam. Morbi vel nulla dictum sem vulputate sodales et efficitur arcu. In venenatis eleifend enim, quis pulvinar lectus eleifend sit amet. Vivamus euismod tortor nec mi ullamcorper, nec rutrum enim mattis. In vel justo eros. Aliquam mollis nulla eget magna congue porta. Nullam a augue vitae ante efficitur porta.</p>',NULL,NULL,NULL),(115,153,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','d1b62af3-5038-4f35-bae9-f2b42ec4f3ec','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus eu elit eget pharetra. Nullam consectetur sed mi vitae cursus. Nulla laoreet ac tellus in molestie. Sed cursus vehicula libero eu posuere. Fusce condimentum nulla odio, sed fringilla mauris laoreet eu. Mauris molestie lobortis pharetra. Aenean mattis lectus nisi. Donec ut nibh vitae nibh laoreet tempus. Aenean tincidunt, nisl sed pulvinar scelerisque, turpis diam vestibulum libero, nec convallis dolor tortor ac lacus.</p>\n<p>Ut ut sem eget massa eleifend feugiat eget nec dui. Cras quis lorem risus. Maecenas pellentesque urna eu erat pharetra, at eleifend lacus sagittis. Integer nisi eros, venenatis ac molestie eu, venenatis ac ex. Vivamus dignissim tortor a iaculis consectetur. Ut vitae commodo eros. Nam volutpat nulla eu placerat iaculis. Etiam malesuada nibh ut pulvinar fermentum. Maecenas vestibulum urna ac arcu semper tempor vitae pellentesque mi. Cras vitae porttitor est. Cras vitae massa ante.</p>\n<p>Mauris arcu augue, efficitur sit amet vestibulum ut, rhoncus sit amet libero. Nulla ac lacinia dolor. Ut tristique lectus sit amet massa maximus feugiat. Aenean malesuada neque et magna accumsan, vitae scelerisque orci suscipit. Nunc vitae semper sapien, quis lacinia leo. Suspendisse potenti. Suspendisse id quam eget orci volutpat fermentum gravida eget diam. Morbi vel nulla dictum sem vulputate sodales et efficitur arcu. In venenatis eleifend enim, quis pulvinar lectus eleifend sit amet. Vivamus euismod tortor nec mi ullamcorper, nec rutrum enim mattis. In vel justo eros. Aliquam mollis nulla eget magna congue porta. Nullam a augue vitae ante efficitur porta.</p>',NULL,NULL,NULL,NULL,NULL),(116,154,1,'2022-04-23 09:06:56','2022-04-23 09:06:56','84345c8c-59cb-4a9d-9ac7-773cf03f0642',NULL,NULL,'<p>Mauris arcu augue, efficitur sit amet vestibulum ut, rhoncus sit amet libero. Nulla ac lacinia dolor. Ut tristique lectus sit amet massa maximus feugiat. Aenean malesuada neque et magna accumsan, vitae scelerisque orci suscipit. Nunc vitae semper sapien, quis lacinia leo. Suspendisse potenti. Suspendisse id quam eget orci volutpat fermentum gravida eget diam. Morbi vel nulla dictum sem vulputate sodales et efficitur arcu. In venenatis eleifend enim, quis pulvinar lectus eleifend sit amet. Vivamus euismod tortor nec mi ullamcorper, nec rutrum enim mattis. In vel justo eros. Aliquam mollis nulla eget magna congue porta. Nullam a augue vitae ante efficitur porta.</p>',NULL,NULL,NULL),(118,158,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','fd20043a-1332-443e-8bf4-c1b6d573b3c0','<p><code>npx mix watch</code>: Creates an instance of BrowserSync proxying to the virtual host configured in the <code>PRIMARY_SITE_URL</code> variable of the Craft CMS <code>.env</code> file.</p>\n<p><code>npx mix</code>: Compiles and processes the <code>./resources</code> directories. The compiled files are passed to the <code>./public</code> directory.</p>\n<p><code>npx mix -p</code>: Compiles and processes the ./resources directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL),(119,160,1,'2022-04-23 09:14:03','2022-04-23 09:14:03','ff56eaa5-12ec-4ca0-b229-5a7f83e2e11f','<p><kbd>npx mix watch:</kbd> Creates an instance of BrowserSync proxying to the virtual host configured in the <kbd>PRIMARY_SITE_URL</kbd> variable of the Craft CMS <kbd>.env</kbd> file.</p>\n<p><kbd>npx mix</kbd>: Compiles and processes the <kbd>./resources</kbd> directories. The compiled files are passed to the <kbd>./public</kbd> directory.</p>\n<p><kbd>npx mix -p</kbd>: Compiles and processes the <kbd>./resources</kbd> directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL),(121,164,1,'2022-04-23 09:34:18','2022-04-23 09:34:18','9562beb6-b165-420f-832f-19be8c2ca39c','<p><kbd>npx mix watch:</kbd> Creates an instance of <strong>BrowserSync</strong> proxying to the virtual host configured in the <kbd>PRIMARY_SITE_URL</kbd> variable of the Craft CMS <kbd>.env</kbd> file.</p>\n<p><kbd>npx mix</kbd>: Compiles and processes the <kbd>./resources</kbd> directories. The compiled files are passed to the <kbd>./public</kbd> directory.</p>\n<p><kbd>npx mix -p</kbd>: Compiles and processes the <kbd>./resources</kbd> directories for the production environment.</p>',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `matrixcontent_blocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e917e5e-5fe5-4164-b98f-9dcec9a610e3'),(2,'craft','m150403_183908_migrations_table_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','66f1b6fc-24ad-4fbf-81c7-254d70658a80'),(3,'craft','m150403_184247_plugins_table_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bc5fce7-3727-4311-a2b8-511aa8e5cdd5'),(4,'craft','m150403_184533_field_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','134ce4e8-9f53-46a1-81a8-df9f4f7f69da'),(5,'craft','m150403_184729_type_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e5db53a1-0785-4d6d-b5a0-3f168f51de08'),(6,'craft','m150403_185142_volumes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5c2b7a38-8a1e-4abd-a7b8-c7a6960d9853'),(7,'craft','m150428_231346_userpreferences','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','67590567-dfb5-49f8-8280-ffa58e363a7b'),(8,'craft','m150519_150900_fieldversion_conversion','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a93074dc-7f1e-4529-b54b-c00bf93f0ef1'),(9,'craft','m150617_213829_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','63525200-0104-43bc-84f8-b30503874a78'),(10,'craft','m150721_124739_templatecachequeries','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e51b85ca-3457-4cf3-9934-ff4bfff8ffe4'),(11,'craft','m150724_140822_adjust_quality_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4e3fad87-3cd3-4d7a-9767-a57cee2b6826'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','90623e2b-1ed9-4962-b277-84db67baa3be'),(13,'craft','m151002_095935_volume_cache_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c19cadf3-f513-46f6-861b-924bd0f08530'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e79c7db-f609-432e-9d57-642363c212e6'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e71a11d-0b22-437e-b44a-343b68abc938'),(16,'craft','m151209_000000_move_logo','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','38668414-be9c-4ad3-953d-a5e3ccda7160'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c1802fc-e815-4b73-808b-855b8f5a1248'),(18,'craft','m151215_000000_rename_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','dfc7a998-871c-4621-87ca-52ee04b98be6'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c3f2f547-617a-4eef-af00-2ee3bf76c579'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f3a14faa-9a96-4cbe-a3e1-216d26ad9ee2'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f59692e5-dd0d-428f-9b8b-8a833bf700b5'),(22,'craft','m160727_194637_column_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','99bcd07c-3dcc-41a9-bb0d-681745268873'),(23,'craft','m160804_110002_userphotos_to_assets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','acb5d885-2bb7-4402-b274-af6e1aaed1ed'),(24,'craft','m160807_144858_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','16791a07-ecb1-4e46-ab20-a68f06a3c896'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3dc7c2f0-a24c-49eb-9c58-f3e64843e02d'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47a5e0bc-8795-470b-ba88-f4d7b3b7c94d'),(27,'craft','m160912_230520_require_entry_type_id','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','31ec445d-a8ab-4959-8850-450b6c3c41f2'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b96527e5-62ce-4f03-a388-d1752734c1e0'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','44893c66-1ca7-4584-be2e-bea9911e8b5e'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c95b5eb0-f0da-4cad-8692-e03632eea22f'),(31,'craft','m160925_113941_route_uri_parts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','275da5e2-8f57-418a-92f9-0e93580d52dd'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d66ba1a5-a8e0-4b4c-a6fd-bfc6458cbceb'),(33,'craft','m161007_130653_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','339bc815-3be0-406e-a1b9-4525c6fb5246'),(34,'craft','m161013_175052_newParentId','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1544bf3d-62d2-4261-860a-33c6d2fd2696'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1e0a4361-678a-493a-899b-cdeba0c6ea21'),(36,'craft','m161021_182140_rename_get_help_widget','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','20242522-719f-4366-badc-601f438fcf7d'),(37,'craft','m161025_000000_fix_char_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8de6671c-70a4-49bf-9f90-9893e75e83c0'),(38,'craft','m161029_124145_email_message_languages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','64f09f83-1b1a-42a1-837b-87667256bc58'),(39,'craft','m161108_000000_new_version_format','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','29d4a410-bd83-4f07-8237-205e98334115'),(40,'craft','m161109_000000_index_shuffle','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5ace9a13-5940-4ff9-a649-f17b4180afce'),(41,'craft','m161122_185500_no_craft_app','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','56ccd9af-b355-48bf-9f61-f610a25d36a8'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','9c98c80d-9f0d-4856-a545-858ddbc12cd7'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33497179-b1d0-4316-9838-8a39f72eccdb'),(44,'craft','m170114_161144_udates_permission','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7d4725e3-5549-4e9d-8445-5f9bea5a15a7'),(45,'craft','m170120_000000_schema_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e935ccb7-2959-478d-8a08-b8f0dd489314'),(46,'craft','m170126_000000_assets_focal_point','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e48d135-06d0-40ab-a8a3-f1290e1539a7'),(47,'craft','m170206_142126_system_name','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d3ad866a-ffe8-4ca6-a7a3-a6df8ff046a8'),(48,'craft','m170217_044740_category_branch_limits','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','17028d86-6245-4f63-ae02-0d25c2ba02b5'),(49,'craft','m170217_120224_asset_indexing_columns','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c4166677-c50b-4432-82e5-57de127b1f50'),(50,'craft','m170223_224012_plain_text_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6a4fc557-ee28-45d0-86e7-6de840e0a802'),(51,'craft','m170227_120814_focal_point_percentage','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','02a22dd3-1ed9-4c39-8857-c69f030740f5'),(52,'craft','m170228_171113_system_messages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','60ad338b-f9c6-430f-a915-a878753975d0'),(53,'craft','m170303_140500_asset_field_source_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','78f32c45-03b8-4b94-9bd4-f5cbbcd8f579'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','41002932-92f1-4b3b-957a-418edff2b515'),(55,'craft','m170523_190652_element_field_layout_ids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5113d954-78b2-4600-839f-a4ff83e46fc4'),(56,'craft','m170621_195237_format_plugin_handles','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','84bc61ac-21d1-4239-9c02-2f069a67e6e0'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7624721a-7406-4aec-b41c-9069f7561061'),(58,'craft','m170630_161028_deprecation_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','9e488955-6f81-4e9d-92d1-57faaf0ea3f3'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5783b2d6-e005-4198-96fe-ad05cb588d75'),(60,'craft','m170704_134916_sites_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33745be7-15b1-4927-99dc-fcf51006675f'),(61,'craft','m170706_183216_rename_sequences','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','889d3843-c7b2-48da-bee4-d89e40ae4df0'),(62,'craft','m170707_094758_delete_compiled_traits','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f0ec964b-064e-42e8-87bd-201a729775af'),(63,'craft','m170731_190138_drop_asset_packagist','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7f018004-2fe2-4112-8826-8a95bf7c1126'),(64,'craft','m170810_201318_create_queue_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a85a9770-1b07-4441-bafa-0bf54f88a223'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5df1f1b3-8573-4aea-be00-4b01959d67d8'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1f3e80cd-9b27-41e7-842b-9a0fb66697b8'),(67,'craft','m171011_214115_site_groups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4fcd3d26-dce9-4b22-a4f5-f862ff5f1038'),(68,'craft','m171012_151440_primary_site','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3129141b-8d3b-4811-aeb0-adedaefd7d0a'),(69,'craft','m171013_142500_transform_interlace','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7a0ec821-f5b7-4e1d-a6c8-ed31eac7d7ab'),(70,'craft','m171016_092553_drop_position_select','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3b3f48ed-04c5-4b3e-b8d9-cb596afc5b7f'),(71,'craft','m171016_221244_less_strict_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6904ebf5-78c7-4a78-bf07-290f7a24d6a8'),(72,'craft','m171107_000000_assign_group_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e956a35b-ae91-4335-831b-c5764421b4b0'),(73,'craft','m171117_000001_templatecache_index_tune','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','98e860b5-6b07-48ee-97ed-cb35d56a7302'),(74,'craft','m171126_105927_disabled_plugins','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','197a851a-2f70-4f86-9cc1-060b4a135a73'),(75,'craft','m171130_214407_craftidtokens_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b5fa2df8-9c21-4771-ba02-568d6fa906b3'),(76,'craft','m171202_004225_update_email_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f3609024-b482-49f2-ba6f-666e9a39ecc8'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6aa3383a-40ed-4716-926f-403a2a2ec68b'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47a5210b-e428-4f58-af34-4b699066cd9d'),(79,'craft','m171218_143135_longtext_query_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f6b5a581-9b02-4a5e-98ac-a352211c9fd4'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c1d7e9db-b1b7-41ad-b5b4-d24f4fb33ddc'),(81,'craft','m180113_153740_drop_users_archived_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f59f7901-6615-40ed-b973-3347c54d0ca7'),(82,'craft','m180122_213433_propagate_entries_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','dbb653a8-9b64-4daa-923e-dd073ca8096a'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a9792928-00d2-4e10-b202-ec71315b4a4f'),(84,'craft','m180128_235202_set_tag_slugs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c56853b-809e-43c3-9963-d26acea329d2'),(85,'craft','m180202_185551_fix_focal_points','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','47085121-7461-481d-b77c-057acf891d13'),(86,'craft','m180217_172123_tiny_ints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','cd08088b-22fd-407a-bf0d-ebfb2fd85124'),(87,'craft','m180321_233505_small_ints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3d6eba04-d3fa-4adc-896d-9932311dd201'),(88,'craft','m180404_182320_edition_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d6cb1cb9-4a6a-4144-8137-8d0c4f26ced8'),(89,'craft','m180411_102218_fix_db_routes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b7e5c06f-2ac0-49a6-af9e-047dcc81c142'),(90,'craft','m180416_205628_resourcepaths_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','28471d8b-22aa-429a-ae81-565104351244'),(91,'craft','m180418_205713_widget_cleanup','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b451b3ae-a730-4735-869c-3ef57516434c'),(92,'craft','m180425_203349_searchable_fields','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','33d249ba-70bd-40d1-b8b3-32b80193100f'),(93,'craft','m180516_153000_uids_in_field_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b377b90a-8b48-410e-b38d-d5587ac95104'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3c0dad4f-af62-48f8-a4f1-216a92b9b2d1'),(95,'craft','m180518_173000_permissions_to_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6fc7221f-8ff9-4f94-97d1-e827819fe0c0'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8567fc51-9eeb-4a24-99c2-4ed6442709be'),(97,'craft','m180521_172900_project_config_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','80d8d096-90df-487c-93cc-078ce1b9f6a1'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1219a534-c855-41e5-8287-1e51dcbd62a1'),(99,'craft','m180731_162030_soft_delete_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fdae9dc8-fb87-47f9-96d8-f1dee0f8f67e'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d1f7378e-a76f-481e-b7b0-e769df31e960'),(101,'craft','m180810_214439_soft_delete_elements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','584209f3-1a3f-4535-af40-1e06c939644a'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','10e1fe2e-942f-47a3-890c-682734eed682'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6156441e-3bf8-4edf-a641-74894ab903c3'),(104,'craft','m180904_112109_permission_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3b29939d-9998-4148-8280-19a765ac03ca'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0a2213df-031e-4124-86a1-86404b9c5e82'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b480030e-2c16-49ea-8bf5-6e5f5715397a'),(107,'craft','m181016_183648_set_default_user_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3735f068-e737-4d16-90ec-28e32fe9e7e5'),(108,'craft','m181017_225222_system_config_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','edcbb207-c1d9-4649-b6f8-730547e53ece'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','84d11463-9674-45f2-9bb7-f9c569418039'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','22d73aab-1ad0-4a98-a163-ad7a15dcec48'),(111,'craft','m181112_203955_sequences_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','aaa98284-6a1b-487e-982f-4b7928305955'),(112,'craft','m181121_001712_cleanup_field_configs','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','eba0ea75-453a-4a8a-92a4-cd4f5753b20f'),(113,'craft','m181128_193942_fix_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b8b9d58b-1472-4367-b66d-d1f65b957db9'),(114,'craft','m181130_143040_fix_schema_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bc944fcb-8e06-43b1-95dc-775ad9baf8b9'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','53181e8f-15e0-476a-8cef-9f3e8b475c73'),(116,'craft','m181217_153000_fix_structure_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e7bfef46-78dd-44f3-be77-e3437c219f3a'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a0f0c1c2-d6d3-470b-8e66-a126179f8601'),(118,'craft','m190108_110000_cleanup_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d170415c-bef3-483b-b677-3658e29563ef'),(119,'craft','m190108_113000_asset_field_setting_change','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','abe6f2d4-2725-4b02-9c63-45e889e438ee'),(120,'craft','m190109_172845_fix_colspan','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','800166e5-20f5-4f3e-89b1-d89fcfbc5d5b'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6d39aefb-8ab3-4492-bdb1-6c5af112c07f'),(122,'craft','m190110_214819_soft_delete_volumes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5b78195e-a724-461d-9c1b-48593278afd0'),(123,'craft','m190112_124737_fix_user_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bc18352-6283-40b4-8211-5049b483aca6'),(124,'craft','m190112_131225_fix_field_layouts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','2cced6c7-0afe-4cba-ba5e-60251e050544'),(125,'craft','m190112_201010_more_soft_deletes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','028671cd-bfae-4517-8d43-7caef167abe0'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e2fdf021-f632-4d85-bebf-17423b0f8abc'),(127,'craft','m190121_120000_rich_text_config_setting','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a5e9a3f6-5dd6-46b9-a89a-1141b4878c1f'),(128,'craft','m190125_191628_fix_email_transport_password','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','6ae77b79-6a8f-4901-b50c-17efb839c89f'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5c2bfb83-9183-4750-b749-e98a5960d895'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','40e9afdb-0df8-4231-b8c2-9d6f0e5edd6e'),(131,'craft','m190218_143000_element_index_settings_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b955a807-9de7-45ac-a2f0-1a7421445496'),(132,'craft','m190312_152740_element_revisions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','1c833db5-e870-4e33-89f9-16924e612714'),(133,'craft','m190327_235137_propagation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','57c25265-2170-4d86-9599-675d40f4395d'),(134,'craft','m190401_223843_drop_old_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e70642c9-b200-4453-859c-6283c7bb7d3f'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','77415e77-1375-44a6-9062-afe958cf8e03'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e7b19e96-1113-4f3f-ab18-bc3acc00af30'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8558b530-b90d-4c47-9aef-9c95e67240c7'),(138,'craft','m190504_150349_preview_targets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0031ee4d-a05b-482d-9c98-d0f916d21106'),(139,'craft','m190516_184711_job_progress_label','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5fd5cb91-61f7-4d68-a5f1-4b17a9a294e8'),(140,'craft','m190523_190303_optional_revision_creators','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0268eac2-01d0-4a4a-8740-a0f34c8fd62c'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','143b4dfc-9b03-4f00-8131-dd0989eaa75a'),(142,'craft','m190605_223807_unsaved_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d7d9af05-e2cf-4a92-9dda-12bb8e640ccb'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','976962bd-2c27-4a01-89ec-59bc97ac2aff'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','a37f59cd-a449-4847-8886-95268343a6a2'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e8cc99a5-8d34-4871-94c2-99ac321e4d74'),(146,'craft','m190624_234204_matrix_propagation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f6356394-1b71-447c-9e5c-84f554cd9a89'),(147,'craft','m190711_153020_drop_snapshots','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','39b39412-9066-41ef-986f-3eefa63f7df3'),(148,'craft','m190712_195914_no_draft_revisions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','605533c9-db9c-46c9-8c9b-4465c6de70f9'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','d96fd863-8331-43a4-a60f-dbb6c4edffa0'),(150,'craft','m190820_003519_flush_compiled_templates','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','34c79efc-28e1-4b39-9c55-6d456ab58d06'),(151,'craft','m190823_020339_optional_draft_creators','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','327a78d4-2b0b-4748-8cc5-3db0a2d97dca'),(152,'craft','m190913_152146_update_preview_targets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8efcb05b-bc1a-41c0-bb7d-37b771655d1a'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','460d4ada-d766-46f9-be63-befbacbb9cb4'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','665d2469-2b9e-40ce-90d4-fb7d431a5b62'),(155,'craft','m191206_001148_change_tracking','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7c57ef95-447f-41db-9aec-18ee5d21717f'),(156,'craft','m191216_191635_asset_upload_tracking','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5bab7c33-b93b-4cd6-8554-b78964a1c440'),(157,'craft','m191222_002848_peer_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8d3a0199-d320-43a7-8f62-8524b6440398'),(158,'craft','m200127_172522_queue_channels','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c4c30a96-47cb-4e70-ab83-1032199757f5'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bff8e207-4a21-4499-b0d0-542bd3c7cb48'),(160,'craft','m200213_172522_new_elements_index','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c32b5f6a-0f05-40b1-95d8-773fd2e560dd'),(161,'craft','m200228_195211_long_deprecation_messages','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4aa9886a-19a6-4904-b0e6-73a814c35e38'),(162,'craft','m200306_054652_disabled_sites','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3f2e6f0b-d312-4fdf-836e-89898e164006'),(163,'craft','m200522_191453_clear_template_caches','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fe2d7804-2963-43b6-bd0b-764aeaef7b3d'),(164,'craft','m200606_231117_migration_tracks','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','43354f04-dac5-45e1-82f6-f9252d110bb4'),(165,'craft','m200619_215137_title_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','e75a582e-53c8-4708-8cd5-313f383e2eff'),(166,'craft','m200620_005028_user_group_descriptions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c926c18a-dcc6-4cca-b934-702b6286de06'),(167,'craft','m200620_230205_field_layout_changes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','5a1ade15-39ee-4de9-8bf3-3cb11e1536ca'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','334d741f-09c4-41eb-953f-00bedc0342d9'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','58e70596-065a-4601-879d-3a1034fc2870'),(170,'craft','m200630_183000_drop_configmap','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','da0fa9d6-f658-4ea2-9414-d432c8e69887'),(171,'craft','m200715_113400_transform_index_error_flag','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bdb32a8-cff3-4c9c-9e06-0338e434cd0a'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','17536926-5c29-4e83-9e0f-21faee21ab18'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','814ac8a2-a18c-44d6-b51c-222b5a96a795'),(174,'craft','m200720_175543_drop_unique_constraints','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4108fa6c-7878-4538-8b85-7e30318c6c16'),(175,'craft','m200825_051217_project_config_version','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','ef72169f-4f54-41a0-86ff-06095e575d51'),(176,'craft','m201116_190500_asset_title_translation_method','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','b31d6895-9099-4bd3-9c6b-04d4d552a952'),(177,'craft','m201124_003555_plugin_trials','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3bd1fef9-2fd3-4931-a221-e74374d433f4'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','51c5355d-bbaf-4d71-8309-0ae7c6c115ee'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','cbf918f4-b157-4edc-84bd-ba87b785e1b3'),(180,'craft','m210214_202731_track_saved_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','3e05ee98-f8a6-46ff-9742-0da2f6fcae6d'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','4f3f13e4-ad66-4477-a84f-6c0af1e3bfad'),(182,'craft','m210302_212318_canonical_elements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','fa13d2ec-ebf2-4b1c-b7ba-dcf1370da29c'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','27f88076-66e5-4667-80b1-d283c9bbca97'),(184,'craft','m210329_214847_field_column_suffixes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','f184dd09-f121-4cfe-bc14-fea48fa16211'),(185,'craft','m210331_220322_null_author','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','0e291138-da4f-4f37-b1a2-0620d4f72bb4'),(186,'craft','m210405_231315_provisional_drafts','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','bc8fdc82-ca4b-49d6-954a-c96545e6d058'),(187,'craft','m210602_111300_project_config_names_in_config','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8ebee7a1-767e-4bad-9bd0-08e8ebe1cc82'),(188,'craft','m210611_233510_default_placement_settings','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','8858e4b6-4005-4ff5-89cd-4b437f73e5b1'),(189,'craft','m210613_145522_sortable_global_sets','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','c0700c2a-3e8a-4180-9e0f-dbed7a46af60'),(190,'craft','m210613_184103_announcements','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','ba17cb0f-cda3-4879-9292-f426ed2a6879'),(191,'craft','m210829_000000_element_index_tweak','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','21285b9b-2930-473d-a562-ce63a90bca22'),(192,'craft','m220209_095604_add_indexes','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','da626387-d46b-4d68-b7c6-27f4e9c7aec4'),(193,'craft','m220214_000000_truncate_sessions','2022-04-21 22:20:59','2022-04-21 22:20:59','2022-04-21 22:20:59','7ea32892-0b8f-4a8b-b79f-aabbd48d7ecb'),(194,'plugin:redactor','m180430_204710_remove_old_plugins','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','351dc29e-b6e9-4eae-a9da-ce656db44c75'),(195,'plugin:redactor','Install','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','2f97ff86-aa6f-4dd8-acdc-bf4aec7c1bb8'),(196,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-22 00:42:44','0ee6162b-e989-402e-9acc-8d2652a0412e');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'minify','1.2.11','1.0.0','unknown',NULL,'2022-04-22 00:42:28','2022-04-22 00:42:29','2022-04-23 08:49:00','f8258587-22d0-48fc-b0f7-fa05da5557a4'),(2,'mix','1.5.2','1.0.0','unknown',NULL,'2022-04-22 00:42:36','2022-04-22 00:42:36','2022-04-23 08:49:00','b1b3ac70-921c-4df1-9f25-494868dbecd5'),(3,'redactor','2.10.6','2.3.0','unknown',NULL,'2022-04-22 00:42:44','2022-04-22 00:42:44','2022-04-23 08:49:00','aaf11a5b-0405-47af-a5da-078c005669bb'),(7,'field-manager','2.2.4','1.0.0','unknown',NULL,'2022-04-22 00:45:21','2022-04-22 00:45:21','2022-04-23 08:49:00','0b8436ee-3887-45cb-8940-5eb5644813c9'),(8,'cloner','1.2.2','1.0.0','unknown',NULL,'2022-04-22 00:45:29','2022-04-22 00:45:29','2022-04-23 08:49:00','3bb72f3d-cc19-436e-b312-818d4f278501');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1650704461'),('email.fromEmail','\"anuar@heyblackmagic.com\"'),('email.fromName','\"Foundation Site\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.autocapitalize','true'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.autocomplete','false'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.autocorrect','true'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.class','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.disabled','false'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.id','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.instructions','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.label','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.max','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.min','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.name','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.orientation','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.placeholder','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.readonly','false'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.requirable','false'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.size','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.step','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.tip','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.title','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.warning','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.0.width','100'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.fieldUid','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.instructions','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.label','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.required','false'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.tip','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.warning','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.elements.1.width','100'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.name','\"Content\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.fieldLayouts.e47bb4d8-2403-4db6-abf2-6ae9a2237adf.tabs.0.sortOrder','0'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.handle','\"intro\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.hasTitleField','true'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.name','\"Intro\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.section','\"79036237-60bd-4a7a-b558-05776ab2f208\"'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.sortOrder','2'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.titleFormat','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.titleTranslationKeyFormat','null'),('entryTypes.428f65fe-9958-4654-98a8-5a18cd762f6d.titleTranslationMethod','\"site\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.autocomplete','false'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.autocorrect','true'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.class','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.disabled','false'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.id','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.instructions','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.label','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.max','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.min','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.name','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.orientation','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.placeholder','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.readonly','false'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.requirable','false'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.size','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.step','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.tip','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.title','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.warning','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.0.width','100'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.fieldUid','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.instructions','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.label','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.required','false'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.tip','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.warning','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.elements.1.width','100'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.name','\"Content\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.fieldLayouts.7a4086f4-0a72-4703-838e-c904b642dd2f.tabs.0.sortOrder','1'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.handle','\"default\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.hasTitleField','true'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.name','\"Default\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.section','\"79036237-60bd-4a7a-b558-05776ab2f208\"'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.sortOrder','1'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.titleFormat','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.titleTranslationKeyFormat','null'),('entryTypes.7aceaed4-2bfc-4a10-8283-035b91e2f8c2.titleTranslationMethod','\"site\"'),('fieldGroups.b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd.name','\"Common\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.columnSuffix','null'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.contentColumnType','\"string\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.fieldGroup','\"b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.handle','\"blocks\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.instructions','\"\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.name','\"Blocks\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.searchable','false'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.settings.contentTable','\"{{%matrixcontent_blocks}}\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.settings.maxBlocks','\"\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.settings.minBlocks','\"\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.settings.propagationKeyFormat','null'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.settings.propagationMethod','\"all\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.translationKeyFormat','null'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.translationMethod','\"site\"'),('fields.0c9da4ed-c32a-4005-adb2-8af66b613d8e.type','\"craft\\\\fields\\\\Matrix\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.field','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.fieldUid','\"abf5b55d-598e-462f-b045-82a72d9925be\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.label','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.required','false'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.tip','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.warning','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.elements.0.width','100'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.name','\"Content\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fieldLayouts.46171e49-beee-4231-91d1-fad995dfabe9.tabs.0.sortOrder','1'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.columnSuffix','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.contentColumnType','\"text\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.fieldGroup','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.handle','\"blockquote\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.instructions','\"\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.name','\"Blockquote\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.searchable','false'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.availableTransforms','\"*\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.availableVolumes','\"*\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.columnType','\"text\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.defaultTransform','\"\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.manualConfig','\"\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.purifierConfig','\"\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.purifyHtml','\"1\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.redactorConfig','\"\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.removeNbsp','\"1\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.showHtmlButtonForNonAdmins','\"1\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.showUnpermittedFiles','false'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.showUnpermittedVolumes','true'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.translationKeyFormat','null'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.translationMethod','\"none\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.fields.abf5b55d-598e-462f-b045-82a72d9925be.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.handle','\"blockquote\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.name','\"Blockquote\"'),('matrixBlockTypes.0b797197-2780-406a-a3ac-2651f463ac74.sortOrder','5'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.field','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.fieldUid','\"e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.label','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.required','false'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.tip','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.warning','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.elements.0.width','100'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.name','\"Content\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fieldLayouts.57e6473a-5681-429b-8e25-0f9a6d29fea1.tabs.0.sortOrder','1'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.columnSuffix','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.contentColumnType','\"text\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.fieldGroup','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.handle','\"code\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.instructions','\"\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.name','\"Code\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.searchable','false'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.byteLimit','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.charLimit','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.code','\"1\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.columnType','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.initialRows','\"4\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.multiline','\"1\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.placeholder','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.settings.uiMode','\"normal\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.translationKeyFormat','null'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.translationMethod','\"none\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.fields.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.handle','\"code\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.name','\"Code\"'),('matrixBlockTypes.85bb94ac-ee0b-44f4-881a-a00190595a35.sortOrder','4'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.field','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.fieldUid','\"3b53818e-db5e-40fe-a966-f84478128b5d\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.label','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.required','false'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.tip','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.warning','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.elements.0.width','100'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.name','\"Content\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fieldLayouts.c3db3c8c-6b67-47c5-81b6-fb0b8f58bbaa.tabs.0.sortOrder','1'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.columnSuffix','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.contentColumnType','\"text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.fieldGroup','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.handle','\"text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.instructions','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.name','\"Text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.searchable','false'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.availableTransforms','\"*\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.availableVolumes','\"*\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.columnType','\"text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.defaultTransform','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.manualConfig','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.purifierConfig','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.purifyHtml','\"1\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.redactorConfig','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.removeNbsp','\"1\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.showUnpermittedFiles','false'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.translationKeyFormat','null'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.translationMethod','\"none\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.fields.3b53818e-db5e-40fe-a966-f84478128b5d.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.handle','\"text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.name','\"Text\"'),('matrixBlockTypes.89a9bf71-5d7f-41de-9bda-98b30337a1a6.sortOrder','1'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.field','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.fieldUid','\"5bc99274-d138-4da9-9a81-b4ca97e30012\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.label','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.required','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.tip','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.warning','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.0.width','100'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.fieldUid','\"f67e2256-059c-443f-8808-6e34d72084cb\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.label','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.required','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.tip','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.warning','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.elements.1.width','100'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.name','\"Content\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fieldLayouts.472c178e-14a5-4dee-b772-57d852c37f7e.tabs.0.sortOrder','1'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.columnSuffix','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.contentColumnType','\"string\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.fieldGroup','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.handle','\"video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.instructions','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.name','\"Video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.searchable','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.allowedKinds.0','\"video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.allowSelfRelations','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.allowUploads','true'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.defaultUploadLocationSource','\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.defaultUploadLocationSubpath','\"video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.limit','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.localizeRelations','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.previewMode','\"full\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.restrictFiles','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.selectionLabel','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.showSiteMenu','true'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.showUnpermittedFiles','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.singleUploadLocationSource','\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.source','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.sources','\"*\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.targetSiteId','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.useSingleFolder','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.validateRelatedElements','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.settings.viewMode','\"list\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.translationKeyFormat','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.translationMethod','\"site\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.5bc99274-d138-4da9-9a81-b4ca97e30012.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.columnSuffix','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.contentColumnType','\"text\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.fieldGroup','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.handle','\"caption\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.instructions','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.name','\"Caption\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.searchable','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.availableTransforms','\"*\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.availableVolumes','\"*\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.columnType','\"text\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.defaultTransform','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.manualConfig','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.purifierConfig','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.purifyHtml','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.redactorConfig','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.removeNbsp','\"1\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.showUnpermittedFiles','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.translationKeyFormat','null'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.translationMethod','\"none\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.fields.f67e2256-059c-443f-8808-6e34d72084cb.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.handle','\"video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.name','\"Video\"'),('matrixBlockTypes.b1772479-93cf-472e-844a-9969f822491c.sortOrder','3'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.field','\"0c9da4ed-c32a-4005-adb2-8af66b613d8e\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.fieldUid','\"d8abe207-76dd-4308-95f3-b623080169a6\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.label','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.required','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.tip','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.warning','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.0.width','50'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.fieldUid','\"c932de98-0288-4c4a-8160-b0b80ea4c6a5\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.label','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.required','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.tip','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.warning','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.1.width','50'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.fieldUid','\"a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.label','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.required','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.tip','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.warning','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.elements.2.width','100'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.name','\"Content\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fieldLayouts.2a8ebc31-78d5-4a64-b499-5e1a73f28bca.tabs.0.sortOrder','1'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.columnSuffix','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.contentColumnType','\"text\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.fieldGroup','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.handle','\"caption\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.instructions','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.name','\"Caption\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.searchable','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.byteLimit','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.charLimit','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.code','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.columnType','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.initialRows','\"1\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.multiline','\"1\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.placeholder','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.settings.uiMode','\"normal\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.translationKeyFormat','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.translationMethod','\"none\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.columnSuffix','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.contentColumnType','\"boolean\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.fieldGroup','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.handle','\"imageModal\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.instructions','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.name','\"Open image in a modal?\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.searchable','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.settings.default','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.settings.offLabel','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.settings.onLabel','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.translationKeyFormat','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.translationMethod','\"none\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.c932de98-0288-4c4a-8160-b0b80ea4c6a5.type','\"craft\\\\fields\\\\Lightswitch\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.columnSuffix','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.contentColumnType','\"string\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.fieldGroup','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.handle','\"image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.instructions','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.name','\"Image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.searchable','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.allowSelfRelations','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.allowUploads','true'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.defaultUploadLocationSource','\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.limit','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.localizeRelations','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.previewMode','\"full\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.restrictFiles','\"1\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.selectionLabel','\"\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.showSiteMenu','true'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.showUnpermittedFiles','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.singleUploadLocationSource','\"volume:53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.singleUploadLocationSubpath','\"image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.source','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.sources','\"*\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.targetSiteId','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.useSingleFolder','true'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.validateRelatedElements','false'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.settings.viewMode','\"list\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.translationKeyFormat','null'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.translationMethod','\"site\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.fields.d8abe207-76dd-4308-95f3-b623080169a6.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.handle','\"image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.name','\"Image\"'),('matrixBlockTypes.fba99691-a856-4400-8a12-f504c60b3059.sortOrder','2'),('meta.__names__.0b797197-2780-406a-a3ac-2651f463ac74','\"Blockquote\"'),('meta.__names__.0c9da4ed-c32a-4005-adb2-8af66b613d8e','\"Blocks\"'),('meta.__names__.310cbb9c-a852-47b6-a6a9-ffc29afeab1f','\"Black Magic Docs\"'),('meta.__names__.3b53818e-db5e-40fe-a966-f84478128b5d','\"Text\"'),('meta.__names__.428f65fe-9958-4654-98a8-5a18cd762f6d','\"Intro\"'),('meta.__names__.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e','\"Media\"'),('meta.__names__.5bc99274-d138-4da9-9a81-b4ca97e30012','\"Video\"'),('meta.__names__.79036237-60bd-4a7a-b558-05776ab2f208','\"Docs\"'),('meta.__names__.7aceaed4-2bfc-4a10-8283-035b91e2f8c2','\"Default\"'),('meta.__names__.85bb94ac-ee0b-44f4-881a-a00190595a35','\"Code\"'),('meta.__names__.89a9bf71-5d7f-41de-9bda-98b30337a1a6','\"Text\"'),('meta.__names__.a45d9373-bc4f-4ddd-93ca-d5bfdcd95e9a','\"Caption\"'),('meta.__names__.abf5b55d-598e-462f-b045-82a72d9925be','\"Blockquote\"'),('meta.__names__.b1772479-93cf-472e-844a-9969f822491c','\"Video\"'),('meta.__names__.b88f9c1f-f1ff-4f44-a64f-9db2ab43a9bd','\"Common\"'),('meta.__names__.c3cd35fb-d5dd-487b-84fa-ccc84aecff94','\"Black Magic Docs\"'),('meta.__names__.c932de98-0288-4c4a-8160-b0b80ea4c6a5','\"Open image in a modal?\"'),('meta.__names__.d8abe207-76dd-4308-95f3-b623080169a6','\"Image\"'),('meta.__names__.e9b20bdd-5ca0-48f1-8a6f-08f2cc9fa3ad','\"Code\"'),('meta.__names__.f67e2256-059c-443f-8808-6e34d72084cb','\"Caption\"'),('meta.__names__.fba99691-a856-4400-8a12-f504c60b3059','\"Image\"'),('plugins.cloner.edition','\"standard\"'),('plugins.cloner.enabled','true'),('plugins.cloner.schemaVersion','\"1.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.minify.edition','\"standard\"'),('plugins.minify.enabled','true'),('plugins.minify.schemaVersion','\"1.0.0\"'),('plugins.mix.edition','\"standard\"'),('plugins.mix.enabled','true'),('plugins.mix.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.defaultPlacement','\"end\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.enableVersioning','true'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.handle','\"docs\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.name','\"Docs\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.propagationMethod','\"all\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.siteSettings.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.enabledByDefault','true'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.siteSettings.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.hasUrls','false'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.siteSettings.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.template','null'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.siteSettings.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.uriFormat','null'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.structure.maxLevels','2'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.structure.uid','\"13d52a93-bf4e-464b-9354-12d2ec9a31e2\"'),('sections.79036237-60bd-4a7a-b558-05776ab2f208.type','\"structure\"'),('siteGroups.c3cd35fb-d5dd-487b-84fa-ccc84aecff94.name','\"Black Magic Docs\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.baseUrl','\"@web\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.enabled','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.handle','\"default\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.hasUrls','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.language','\"en-US\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.name','\"Black Magic Docs\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.primary','true'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.siteGroup','\"c3cd35fb-d5dd-487b-84fa-ccc84aecff94\"'),('sites.310cbb9c-a852-47b6-a6a9-ffc29afeab1f.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Black Magic Docs\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Mexico_City\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.autocapitalize','true'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.autocomplete','false'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.autocorrect','true'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.class','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.disabled','false'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.id','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.instructions','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.label','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.max','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.min','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.name','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.orientation','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.placeholder','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.readonly','false'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.requirable','false'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.size','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.step','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.tip','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.title','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.warning','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.elements.0.width','100'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.name','\"Content\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.fieldLayouts.9595a652-e302-4412-ab11-448fac84619d.tabs.0.sortOrder','1'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.handle','\"media\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.hasUrls','true'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.name','\"Media\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.settings.path','\"@mediaBasePath\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.sortOrder','1'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.titleTranslationKeyFormat','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.titleTranslationMethod','null'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.type','\"craft\\\\volumes\\\\Local\"'),('volumes.53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e.url','\"@mediaBaseUrl\"');
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
INSERT INTO `relations` VALUES (1,3,124,NULL,123,1,'2022-04-23 08:58:33','2022-04-23 08:58:33','e9806362-857d-4d08-9cb2-a42470dbf915'),(2,3,125,NULL,123,1,'2022-04-23 08:58:42','2022-04-23 08:58:42','8c97111d-1405-469b-a4c3-d408c5f724b9'),(4,3,129,NULL,123,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','8e8ea829-51a8-4328-b90e-2a32cecf5e40'),(5,3,132,NULL,123,1,'2022-04-23 08:58:48','2022-04-23 08:58:48','02eeeb33-ae43-4eae-9702-23d38553f779'),(6,3,135,NULL,123,1,'2022-04-23 09:00:14','2022-04-23 09:00:14','c8d42219-12b3-4eb5-be3b-c6cff41c782b'),(7,3,138,NULL,123,1,'2022-04-23 09:01:10','2022-04-23 09:01:10','51f54dea-86eb-447c-9a23-979289087a7c'),(9,3,144,NULL,123,1,'2022-04-23 09:04:12','2022-04-23 09:04:12','477e2ee6-4c0e-4297-b41b-c665b0187a19');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,61,1,1,'Revision from Apr 23, 2022, 2:28:58 AM'),(2,61,1,2,'Applied “Draft 1”'),(3,61,1,3,''),(4,68,1,1,'Revision from Apr 23, 2022, 2:28:47 AM'),(5,68,1,2,'Applied “Draft 1”'),(6,68,1,3,''),(7,68,1,4,''),(8,68,1,5,'Applied “Draft 1”'),(9,39,1,1,'Revision from Apr 22, 2022, 8:28:31 PM'),(10,39,1,2,'Applied “Draft 1”'),(11,53,1,1,'Revision from Apr 23, 2022, 2:26:00 AM'),(12,53,1,2,'Applied “Draft 1”'),(13,53,1,3,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin docs '),(1,'lastname',0,1,''),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' anuar heyblackmagic com '),(1,'slug',0,1,''),(2,'slug',0,1,' temp zzsjlwhtdqamllckasabzabbhiztsslipbue '),(3,'slug',0,1,''),(2,'title',0,1,''),(32,'slug',0,1,''),(4,'title',0,1,' getting started '),(33,'slug',0,1,''),(34,'title',0,1,' development good practices common cases '),(34,'slug',0,1,' craft cms '),(36,'slug',0,1,''),(37,'slug',0,1,' temp zescearebocsamykbontgomsouxbccqxmtct '),(37,'title',0,1,''),(38,'title',0,1,' craft cms '),(38,'slug',0,1,' craft cms '),(40,'slug',0,1,''),(39,'slug',0,1,' simple header '),(4,'slug',0,1,' getting started '),(129,'slug',0,1,''),(53,'slug',0,1,' development stage '),(53,'title',0,1,' development stage '),(122,'slug',0,1,''),(75,'slug',0,1,''),(60,'slug',0,1,''),(61,'title',0,1,' development technologies '),(61,'slug',0,1,' development technologies '),(112,'slug',0,1,''),(67,'slug',0,1,''),(68,'slug',0,1,' local development requirements '),(68,'title',0,1,' local development requirements '),(39,'title',0,1,' simple header '),(123,'filename',0,1,' carbon png '),(123,'extension',0,1,' png '),(123,'kind',0,1,' image '),(123,'slug',0,1,''),(123,'title',0,1,' carbon '),(151,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,1,'Docs','docs','structure',1,'all','end',NULL,'2022-04-22 19:43:56','2022-04-23 07:49:35',NULL,'79036237-60bd-4a7a-b558-05776ab2f208');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2022-04-22 19:43:56','2022-04-22 19:43:56','90440ef6-d35c-40f5-abe0-eedada41e9e6');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
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
INSERT INTO `structureelements` VALUES (11,1,NULL,11,1,18,0,'2022-04-23 08:11:11','2022-04-23 08:11:11','b30b1aaf-6adf-49bc-9434-91d1e927d0f7'),(12,1,4,11,2,3,1,'2022-04-23 08:11:11','2022-04-23 08:11:11','b2419d46-7f74-4f56-ac7e-ffd0beabfe01'),(13,1,37,11,4,5,1,'2022-04-23 08:11:11','2022-04-23 08:11:11','b10490d4-8dd5-4edc-b006-71096b8fad63'),(14,1,53,11,6,11,1,'2022-04-23 08:11:11','2022-04-23 08:11:11','61758831-63cc-4116-8508-e0b81da55df0'),(15,1,68,11,7,8,2,'2022-04-23 08:11:11','2022-04-23 08:11:11','72bce01e-cad0-40a0-9130-e35ba1e1bdeb'),(16,1,61,11,9,10,2,'2022-04-23 08:11:11','2022-04-23 08:11:11','040788cd-e970-4abd-9784-cb2464cd547a'),(17,1,34,11,12,17,1,'2022-04-23 08:11:11','2022-04-23 08:11:11','dc9e37d1-60da-48ba-a080-7ba135fbf4da'),(18,1,38,11,13,14,2,'2022-04-23 08:11:11','2022-04-23 08:11:11','d092caf8-0efd-466f-93e7-9be04fd88abe'),(19,1,39,11,15,16,2,'2022-04-23 08:11:11','2022-04-23 08:11:11','7a3a7d63-4531-4053-8f88-f044f08fc5cb');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,2,'2022-04-22 19:43:56','2022-04-23 07:49:28',NULL,'13d52a93-bf4e-464b-9354-12d2ec9a31e2');
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
INSERT INTO `users` VALUES (1,'admin_docs',NULL,'','','anuar@heyblackmagic.com','$2y$13$TrHLLn/YLpGpSSrQufuJsOfndtmfnolqtv3Xm3Njhi0seo2IcNztC',1,0,0,0,'2022-04-23 07:04:09',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-04-22 19:21:01','2022-04-21 22:20:59','2022-04-23 07:04:09','37bc68db-97e3-4c60-8226-fb7a56b65d7e');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Media','','2022-04-22 19:52:15','2022-04-22 19:52:15','502ef8b9-e2f6-4096-85cd-bb2f71f7f4d3'),(2,1,1,'image','image/','2022-04-22 22:07:14','2022-04-22 22:07:14','7a51b4e2-73d7-4c3d-af1c-0b9a21d93948'),(3,NULL,NULL,'Temporary source',NULL,'2022-04-22 22:07:14','2022-04-22 22:07:14','bb170607-9257-436d-ab30-c7720a8e6da4'),(4,3,NULL,'user_1','user_1/','2022-04-22 22:07:14','2022-04-22 22:07:14','e6f28754-6e96-411a-a21d-625e4413383b'),(5,1,1,'video','video/','2022-04-22 22:07:14','2022-04-22 22:07:14','aeaddab3-6d5a-460f-a95d-921cbdc7eb89');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Media','media','craft\\volumes\\Local',1,'@mediaBaseUrl','site',NULL,'{\"path\":\"@mediaBasePath\"}',1,'2022-04-22 19:52:15','2022-04-22 19:52:15',NULL,'53e09cb7-c7ae-472e-bd5c-2cc7d65dee0e');
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

-- Dump completed on 2022-04-23  4:44:15
