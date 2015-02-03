--
-- Table structure for table `oxacceptedterms`
--

DROP TABLE IF EXISTS `oxacceptedterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxacceptedterms` (
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser)',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTERMVERSION` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Terms version',
  `OXACCEPTEDTIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when terms were accepted',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXUSERID`,`OXSHOPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows which users has accepted shop terms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxacceptedterms`
--

LOCK TABLES `oxacceptedterms` WRITE;
/*!40000 ALTER TABLE `oxacceptedterms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxacceptedterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxaccessoire2article`
--

DROP TABLE IF EXISTS `oxaccessoire2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxaccessoire2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Accessory Article id (oxarticles)',
  `OXARTICLENID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXARTICLENID` (`OXARTICLENID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between article and its accessory articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxaccessoire2article`
--

LOCK TABLES `oxaccessoire2article` WRITE;
/*!40000 ALTER TABLE `oxaccessoire2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxaccessoire2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxactions`
--

DROP TABLE IF EXISTS `oxactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxactions` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Action id',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTYPE` tinyint(1) NOT NULL COMMENT 'Action type: 0 or 1 - action, 2 - promotion, 3 - banner',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description, used for promotion (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXPIC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Picture filename, used for banner (multilanguage)',
  `OXPIC_1` varchar(128) NOT NULL DEFAULT '',
  `OXPIC_2` varchar(128) NOT NULL DEFAULT '',
  `OXPIC_3` varchar(128) NOT NULL DEFAULT '',
  `OXLINK` varchar(128) NOT NULL DEFAULT '' COMMENT 'Link, used on banner (multilanguage)',
  `OXLINK_1` varchar(128) NOT NULL DEFAULT '',
  `OXLINK_2` varchar(128) NOT NULL DEFAULT '',
  `OXLINK_3` varchar(128) NOT NULL DEFAULT '',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXTYPE` (`OXTYPE`,`OXACTIVE`,`OXACTIVETO`,`OXACTIVEFROM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about actions, promotions and banners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxactions`
--

LOCK TABLES `oxactions` WRITE;
/*!40000 ALTER TABLE `oxactions` DISABLE KEYS */;
INSERT INTO `oxactions` VALUES ('oxstart','oxbaseshop',0,'Startseite unten','Start page bottom','','','','','','',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxtopstart','oxbaseshop',0,'Topangebot Startseite','Top offer start page','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxbargain','oxbaseshop',0,'Angebot der Woche','Week\'s Special','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxtop5','oxbaseshop',0,'Topseller','Top seller','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxcatoffer','oxbaseshop',0,'Kategorien-Topangebot','Top offer in categories','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxnewest','oxbaseshop',0,'Frisch eingetroffen','Just arrived','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05'),('oxnewsletter','oxbaseshop',0,'Newsletter','Newsletter','','','','','','',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','','','','','','',0,'2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxactions2article`
--

DROP TABLE IF EXISTS `oxactions2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxactions2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIONID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Action id (oxactions)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSORT` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXMAINIDX` (`OXSHOPID`,`OXACTIONID`,`OXSORT`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between actions and articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxactions2article`
--

LOCK TABLES `oxactions2article` WRITE;
/*!40000 ALTER TABLE `oxactions2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxactions2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxaddress`
--

DROP TABLE IF EXISTS `oxaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxaddress` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Address id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXADDRESSUSERID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser)',
  `OXCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Company name',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'House number',
  `OXADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional info',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Country name',
  `OXCOUNTRYID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id (oxstate)',
  `OXZIP` varchar(50) NOT NULL DEFAULT '' COMMENT 'Zip code',
  `OXFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'User title prefix (Mr/Mrs)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user shipping addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxaddress`
--

LOCK TABLES `oxaddress` WRITE;
/*!40000 ALTER TABLE `oxaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxadminlog`
--

DROP TABLE IF EXISTS `oxadminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxadminlog` (
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXSQL` text NOT NULL COMMENT 'Logged sql'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Logs admin actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxadminlog`
--

LOCK TABLES `oxadminlog` WRITE;
/*!40000 ALTER TABLE `oxadminlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxadminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxartextends`
--

DROP TABLE IF EXISTS `oxartextends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxartextends` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (extends oxarticles article with this id)',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXTAGS` varchar(255) NOT NULL COMMENT 'Tags (multilanguage)',
  `OXTAGS_1` varchar(255) NOT NULL,
  `OXTAGS_2` varchar(255) NOT NULL,
  `OXTAGS_3` varchar(255) NOT NULL,
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  FULLTEXT KEY `OXTAGS` (`OXTAGS`),
  FULLTEXT KEY `OXTAGS_1` (`OXTAGS_1`),
  FULLTEXT KEY `OXTAGS_2` (`OXTAGS_2`),
  FULLTEXT KEY `OXTAGS_3` (`OXTAGS_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Additional information for articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxartextends`
--

LOCK TABLES `oxartextends` WRITE;
/*!40000 ALTER TABLE `oxartextends` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxartextends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxarticles`
--

DROP TABLE IF EXISTS `oxarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxarticles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Parent article id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXARTNUM` varchar(255) NOT NULL DEFAULT '' COMMENT 'Article number',
  `OXEAN` varchar(128) NOT NULL DEFAULT '' COMMENT 'International Article Number (EAN)',
  `OXDISTEAN` varchar(128) NOT NULL DEFAULT '' COMMENT 'Manufacture International Article Number (Man. EAN)',
  `OXMPN` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Manufacture Part Number (MPN)',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Article Price',
  `OXBLFIXEDPRICE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'No Promotions (Price Alert) ',
  `OXPRICEA` double NOT NULL DEFAULT '0' COMMENT 'Price A',
  `OXPRICEB` double NOT NULL DEFAULT '0' COMMENT 'Price B',
  `OXPRICEC` double NOT NULL DEFAULT '0' COMMENT 'Price C',
  `OXBPRICE` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price',
  `OXTPRICE` double NOT NULL DEFAULT '0' COMMENT 'Recommended Retail Price (RRP)',
  `OXUNITNAME` varchar(32) NOT NULL DEFAULT '' COMMENT 'Unit name (kg,g,l,cm etc), used in setting price per quantity unit calculation',
  `OXUNITQUANTITY` double NOT NULL DEFAULT '0' COMMENT 'Article quantity, used in setting price per quantity unit calculation',
  `OXEXTURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'External URL to other information about the article',
  `OXURLDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text for external URL (multilanguage)',
  `OXURLIMG` varchar(128) NOT NULL DEFAULT '' COMMENT 'External URL image',
  `OXVAT` float DEFAULT NULL COMMENT 'Value added tax. If specified, used in all calculations instead of global vat',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXPIC1` varchar(128) NOT NULL DEFAULT '' COMMENT '1# Picture filename',
  `OXPIC2` varchar(128) NOT NULL DEFAULT '' COMMENT '2# Picture filename',
  `OXPIC3` varchar(128) NOT NULL DEFAULT '' COMMENT '3# Picture filename',
  `OXPIC4` varchar(128) NOT NULL DEFAULT '' COMMENT '4# Picture filename',
  `OXPIC5` varchar(128) NOT NULL DEFAULT '' COMMENT '5# Picture filename',
  `OXPIC6` varchar(128) NOT NULL DEFAULT '' COMMENT '6# Picture filename',
  `OXPIC7` varchar(128) NOT NULL DEFAULT '' COMMENT '7# Picture filename',
  `OXPIC8` varchar(128) NOT NULL DEFAULT '' COMMENT '8# Picture filename',
  `OXPIC9` varchar(128) NOT NULL DEFAULT '' COMMENT '9# Picture filename',
  `OXPIC10` varchar(128) NOT NULL DEFAULT '' COMMENT '10# Picture filename',
  `OXPIC11` varchar(128) NOT NULL DEFAULT '' COMMENT '11# Picture filename',
  `OXPIC12` varchar(128) NOT NULL DEFAULT '' COMMENT '12# Picture filename',
  `OXWEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Weight (kg)',
  `OXSTOCK` double NOT NULL DEFAULT '0' COMMENT 'Article quantity in stock',
  `OXSTOCKFLAG` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Delivery Status: 1 - Standard, 2 - If out of Stock, offline, 3 - If out of Stock, not orderable, 4 - External Storehouse',
  `OXSTOCKTEXT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message, which is shown if the article is in stock (multilanguage)',
  `OXNOSTOCKTEXT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message, which is shown if the article is off stock (multilanguage)',
  `OXDELIVERY` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date, when the product will be available again if it is sold out',
  `OXINSERT` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXLENGTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Length',
  `OXWIDTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Width',
  `OXHEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Height',
  `OXFILE` varchar(128) NOT NULL DEFAULT '' COMMENT 'File, shown in article media list',
  `OXSEARCHKEYS` varchar(255) NOT NULL DEFAULT '' COMMENT 'Search terms (multilanguage)',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (if empty, default is used)',
  `OXQUESTIONEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'E-mail for question',
  `OXISSEARCH` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Should article be shown in search',
  `OXISCONFIGURABLE` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Can article be customized',
  `OXVARNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of variants selection lists (different lists are separated by | ) (multilanguage)',
  `OXVARSTOCK` int(5) NOT NULL DEFAULT '0' COMMENT 'Sum of active article variants stock quantity',
  `OXVARCOUNT` int(1) NOT NULL DEFAULT '0' COMMENT 'Total number of variants that article has (active and inactive)',
  `OXVARSELECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Variant article selections (separated by | ) (multilanguage)',
  `OXVARMINPRICE` double NOT NULL DEFAULT '0' COMMENT 'Lowest price in active article variants',
  `OXVARMAXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Highest price in active article variants',
  `OXVARNAME_1` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXVARNAME_2` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXVARNAME_3` varchar(255) NOT NULL DEFAULT '',
  `OXVARSELECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXURLDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSEARCHKEYS_3` varchar(255) NOT NULL DEFAULT '',
  `OXBUNDLEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Bundled article id',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder',
  `OXSUBCLASS` varchar(32) NOT NULL DEFAULT '' COMMENT 'Subclass',
  `OXSTOCKTEXT_1` varchar(255) NOT NULL DEFAULT '',
  `OXSTOCKTEXT_2` varchar(255) NOT NULL DEFAULT '',
  `OXSTOCKTEXT_3` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_1` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_2` varchar(255) NOT NULL DEFAULT '',
  `OXNOSTOCKTEXT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXSOLDAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Amount of sold articles including variants (used only for parent articles)',
  `OXNONMATERIAL` int(1) NOT NULL DEFAULT '0' COMMENT 'Intangible article, free shipping is used (variants inherits parent setting)',
  `OXFREESHIPPING` int(1) NOT NULL DEFAULT '0' COMMENT 'Free shipping (variants inherits parent setting)',
  `OXREMINDACTIVE` int(1) NOT NULL DEFAULT '0' COMMENT 'Enables sending of notification email when oxstock field value falls below oxremindamount value',
  `OXREMINDAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Defines the amount, below which notification email will be sent if oxremindactive is set to 1',
  `OXAMITEMID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `OXAMTASKID` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `OXVENDORID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Vendor id (oxvendor)',
  `OXMANUFACTURERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Manufacturer id (oxmanufacturers)',
  `OXSKIPDISCOUNTS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Skips all negative Discounts (Discounts, Vouchers, Delivery ...)',
  `OXRATING` double NOT NULL DEFAULT '0' COMMENT 'Article rating',
  `OXRATINGCNT` int(11) NOT NULL DEFAULT '0' COMMENT 'Rating votes count',
  `OXMINDELTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimal delivery time (unit is set in oxdeltimeunit)',
  `OXMAXDELTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Maximum delivery time (unit is set in oxdeltimeunit)',
  `OXDELTIMEUNIT` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery time unit: DAY, WEEK, MONTH',
  `OXUPDATEPRICE` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxprice will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEA` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricea will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEB` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpriceb will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICEC` double NOT NULL DEFAULT '0' COMMENT 'If not 0, oxpricec will be updated to this value on oxupdatepricetime date',
  `OXUPDATEPRICETIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date, when oxprice[a,b,c] should be updated to oxupdateprice[a,b,c] values',
  `OXISDOWNLOADABLE` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable download of files for this product',
  `OXSHOWCUSTOMAGREEMENT` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Show custom agreement check in checkout',
  PRIMARY KEY (`OXID`),
  KEY `OXCOUNT` (`OXPARENTID`,`OXSHOPID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXISSEARCH` (`OXISSEARCH`),
  KEY `OXARTNUM` (`OXARTNUM`),
  KEY `OXSTOCK` (`OXSTOCK`),
  KEY `OXSTOCKFLAG` (`OXSTOCKFLAG`),
  KEY `OXINSERT` (`OXINSERT`),
  KEY `OXVARNAME` (`OXVARNAME`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXACTIVEFROM` (`OXACTIVEFROM`),
  KEY `OXACTIVETO` (`OXACTIVETO`),
  KEY `OXVENDORID` (`OXVENDORID`),
  KEY `OXMANUFACTURERID` (`OXMANUFACTURERID`),
  KEY `OXSOLDAMOUNT` (`OXSOLDAMOUNT`),
  KEY `parentsort` (`OXPARENTID`,`OXSORT`),
  KEY `OXUPDATEPRICETIME` (`OXUPDATEPRICETIME`),
  KEY `OXISDOWNLOADABLE` (`OXISDOWNLOADABLE`),
  KEY `OXPRICE` (`OXPRICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Articles information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxarticles`
--

LOCK TABLES `oxarticles` WRITE;
/*!40000 ALTER TABLE `oxarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxattribute`
--

DROP TABLE IF EXISTS `oxattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxattribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Attribute id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXPOS` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXDISPLAYINBASKET` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Display attribute`s value for articles in checkout',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Article attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxattribute`
--

LOCK TABLES `oxattribute` WRITE;
/*!40000 ALTER TABLE `oxattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcaptcha`
--

DROP TABLE IF EXISTS `oxcaptcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcaptcha` (
  `OXID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Captcha id',
  `OXHASH` char(32) NOT NULL DEFAULT '' COMMENT 'Hash',
  `OXTIME` int(11) NOT NULL COMMENT 'Validation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXID` (`OXID`,`OXHASH`),
  KEY `OXTIME` (`OXTIME`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='If session is not available, this is where captcha information is stored';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcaptcha`
--

LOCK TABLES `oxcaptcha` WRITE;
/*!40000 ALTER TABLE `oxcaptcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcaptcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcategories`
--

DROP TABLE IF EXISTS `oxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcategories` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Category id',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'oxrootid' COMMENT 'Parent category id',
  `OXLEFT` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for building category tree',
  `OXRIGHT` int(11) NOT NULL DEFAULT '0' COMMENT 'Used for building category tree',
  `OXROOTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Root category id',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active (multilanguage)',
  `OXHIDDEN` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hidden (Can be accessed by direct link, but is not visible in lists and menu)',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(254) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description (multilanguage)',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename (multilanguage)',
  `OXTHUMB_1` varchar(128) NOT NULL DEFAULT '',
  `OXTHUMB_2` varchar(128) NOT NULL DEFAULT '',
  `OXTHUMB_3` varchar(128) NOT NULL DEFAULT '',
  `OXEXTLINK` varchar(255) NOT NULL DEFAULT '' COMMENT 'External link, that if specified is opened instead of category content',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (if empty, default is used)',
  `OXDEFSORT` varchar(64) NOT NULL DEFAULT '' COMMENT 'Default field for sorting of articles in this category (most of oxarticles fields)',
  `OXDEFSORTMODE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Default mode of sorting of articles in this category (0 - asc, 1 - desc)',
  `OXPRICEFROM` double NOT NULL DEFAULT '0' COMMENT 'If specified, all articles, with price higher than specified, will be shown in this category',
  `OXPRICETO` double NOT NULL DEFAULT '0' COMMENT 'If specified, all articles, with price lower than specified, will be shown in this category',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_1` text NOT NULL,
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_2` text NOT NULL,
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_3` text NOT NULL,
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXPROMOICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Promotion icon filename',
  `OXVAT` float DEFAULT NULL COMMENT 'VAT, used for articles in this category (only if oxarticles.oxvat is not set)',
  `OXSKIPDISCOUNTS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Skip all negative Discounts for articles in this category (Discounts, Vouchers, Delivery ...) ',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXROOTID` (`OXROOTID`),
  KEY `OXPARENTID` (`OXPARENTID`),
  KEY `OXPRICEFROM` (`OXPRICEFROM`),
  KEY `OXPRICETO` (`OXPRICETO`),
  KEY `OXHIDDEN` (`OXHIDDEN`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXSORT` (`OXSORT`),
  KEY `OXVAT` (`OXVAT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Article categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcategories`
--

LOCK TABLES `oxcategories` WRITE;
/*!40000 ALTER TABLE `oxcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcategory2attribute`
--

DROP TABLE IF EXISTS `oxcategory2attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcategory2attribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Category id (oxcategories)',
  `OXATTRID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Attribute id (oxattributes)',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between categories and attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcategory2attribute`
--

LOCK TABLES `oxcategory2attribute` WRITE;
/*!40000 ALTER TABLE `oxcategory2attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcategory2attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxconfig`
--

DROP TABLE IF EXISTS `oxconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxconfig` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Config id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXMODULE` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Module or theme specific config (theme:themename, module:modulename)',
  `OXVARNAME` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable name',
  `OXVARTYPE` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable type',
  `OXVARVALUE` blob NOT NULL COMMENT 'Variable value',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXVARNAME` (`OXVARNAME`),
  KEY `listall` (`OXSHOPID`,`OXMODULE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shop configuration values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxconfig`
--

LOCK TABLES `oxconfig` WRITE;
/*!40000 ALTER TABLE `oxconfig` DISABLE KEYS */;
INSERT INTO `oxconfig` VALUES ('8563fba1965a11df3.34244997','oxbaseshop','','blEnterNetPrice','bool','','2015-02-03 19:39:05'),('8563fba1965a11df3.12345678','oxbaseshop','','blWrappingVatOnTop','bool','','2015-02-03 19:39:05'),('8563fba1965a1cc34.52696792','oxbaseshop','','blCalculateDelCostIfNotLoggedIn','bool','','2015-02-03 19:39:05'),('8563fba1965a1f266.82484369','oxbaseshop','','blAllowUnevenAmounts','bool','','2015-02-03 19:39:05'),('8563fba1965a219c9.51133344','oxbaseshop','','blUseStock','bool','','2015-02-03 19:39:05'),('8563fba1965a23786.00479842','oxbaseshop','','blStoreCreditCardInfo','bool','','2015-02-03 19:39:05'),('8563fba1965a25500.87856483','oxbaseshop','','dDefaultVAT','num','¡','2015-02-03 19:39:05'),('8563fba1965a27185.06428911','oxbaseshop','','sDefaultLang','str','Þ','2015-02-03 19:39:05'),('8563fba1965a2b330.65668120','oxbaseshop','','sMerchantID','str','','2015-02-03 19:39:05'),('8563fba1965a2d181.97927980','oxbaseshop','','sHost','str','\0Ðá®ë×xúÂf5pÑfAÜa8]¼ÕÕÖö','2015-02-03 19:39:05'),('7fc4007ffb2639208.44268873','oxbaseshop','','sGZSLogFile','str','','2015-02-03 19:39:05'),('8563fba1965a2eee6.68137602','oxbaseshop','','sPaymentUser','str','','2015-02-03 19:39:05'),('8563fba1965a30cf7.41846088','oxbaseshop','','sPaymentPwd','str','','2015-02-03 19:39:05'),('mlae44cdad808d9b994c58540db39e7a','oxbaseshop','','aLanguages','aarr','Mº/tLW£qÙß3wêðâw=ºöI>$4[bd\n\rê`GìRé','2015-02-03 19:39:05'),('39893a0ef6a6e11645d4beee4fd0cd51','oxbaseshop','','aLanguageParams','aarr','Mº/tLW£qÙß3w%ô¶ï¼Þ|<Zã9lªoûhd¯¨3´5ÊÑûpÈé	sà¿G6û¥\0+å[Ü\Z+ÂÛT9aY­öéÀ·iZ´2ÛÈZæ®|5:;¯®Lb~Y5frFlg|â0ÿAÐdÕ¸®rtàÙÜJøÔ_²g@!','2015-02-03 19:39:05'),('mlabefd7ebdb5946e8f3f7e7a953b323','oxbaseshop','','aLanguageSSLURLs','arr','Mº/tçMôÍÕ¯Ê?â®©¯¸','2015-02-03 19:39:05'),('mla50c74dd79703312ffb8cfd82c3741','oxbaseshop','','aLanguageURLs','arr','Mº/tçMôÍÕ¯Ê?â®©¯¸','2015-02-03 19:39:05'),('3c4f033dfb8fd4fe692715dda19ecd28','oxbaseshop','','aCurrencies','arr','MºÎ)ráKòËÓ©¤QW\0D\"é(r²Þ½ºþ$D±_,{ü¾nYØt4Ã±)ÚÍw(wkT×ÊêÎh´°\\mÞÿ-ùÿ´g±MôÜÉfÅGz®­Õ½úQ©Fv¢6ÖX7æÓq¿Õ:ÍÞ¡ýê±y±óã%µxõcmâú±Tü\nQ¢ìÃ¤}°pøXR!~^¦','2015-02-03 19:39:05'),('8563fba1965a43873.40898997','oxbaseshop','','aLexwareVAT','aarr','Mºh(sàJ*ËÓ©¤;.~uûw\r¥(ÔéÐBkÊ¤¶y[|oCú®n÷]>oã 8IÀ·úèF®Ê!»µ','2015-02-03 19:39:05'),('8563fba1baec4d3b7.61553539','oxbaseshop','','iNrofSimilarArticles','str',']','2015-02-03 19:39:05'),('8563fba1baec4f6d3.38812651','oxbaseshop','','iNrofCustomerWhoArticles','str',']','2015-02-03 19:39:05'),('8563fba1baec515d0.57265727','oxbaseshop','','iNrofCrossellArticles','str',']','2015-02-03 19:39:05'),('8563fba1baec55dc8.04115259','oxbaseshop','','iUseGDVersion','str','¶','2015-02-03 19:39:05'),('8563fba1baec5b7d3.75515041','oxbaseshop','','sCSVSign','str','','2015-02-03 19:39:05'),('8563fba1baec5d615.45874801','oxbaseshop','','iExportNrofLines','str','¶D·','2015-02-03 19:39:05'),('8563fba1baec678e2.44233324','oxbaseshop','','iExportTickerRefresh','str','','2015-02-03 19:39:05'),('8563fba1baec6acc3.69139343','oxbaseshop','','iImportNrofLines','str','Ä±','2015-02-03 19:39:05'),('8563fba1baec6cce8.28843189','oxbaseshop','','iImportTickerRefresh','str','','2015-02-03 19:39:05'),('8563fba1baec6eaf2.01241384','oxbaseshop','','iCntofMails','str','¶Ç','2015-02-03 19:39:05'),('8563fba1baec73b00.28734905','oxbaseshop','','aOrderfolder','aarr','Mº.uMV6?×ç48ÞÐV^\Z^ÚÝ|(FÚDTo¢;õ0h¼Þ8{1²wÃº¹þ½æx$/6EË2¯XêU´|µEÐ>×ËK,,Ðüè°	¢×õÓú§ðÝ¶´]ET¶§RuP<×[','2015-02-03 19:39:05'),('8563fba1c39367724.92308656','oxbaseshop','','blCheckTemplates','bool','','2015-02-03 19:39:05'),('8563fba1c39370d88.58444180','oxbaseshop','','blLogChangesInAdmin','bool','','2015-02-03 19:39:05'),('8563fba1c393750a0.46170041','oxbaseshop','','sUtilModule','str','','2015-02-03 19:39:05'),('8563fba1c3937ee60.91079898','oxbaseshop','','iMallMode','str','','2015-02-03 19:39:05'),('8563fba1c39381962.39392958','oxbaseshop','','aCacheViews','arr','Mº.uæLõÌÔ®H;¬¢ÂùgÇwL¼ÚrùJêC\Zuç»M6ò\\õ½^Ùü¯=1\n´','2015-02-03 19:39:05'),('8563fba1c39386cf4.18302736','oxbaseshop','','aSkipTags','arr','MºÉuÔ`×w3éRT¼®6ÚNlß\nÏYJ¼æ_!­~\'N°ìòü\n=Íå2[+°C»Cì,)ÔÇ¾§ó«ñon½kÅ»Sðò?YVéÚE,ú²d¸ªº/ÆÍïG·ôä}Íñ,ã]}{M`º	 bÒ×~ò\\àh©IH³Ô/l]a,-Ínòð\rÔ5õä¤D1Vàämé½êQ]åW\"¿À÷ÉÉE.v@âý§×óoñ![\"êK5iËGv=è\n-Ï¥ÌÝ	?úW<P[©ðØ9T;4\nDÿnÇÐw¼¹cmÖ¬|1_g\Z\\sDï¾ tsRã-GO\nÐ}d=ò\nö#´Ûû\'Â¼$Iö½ªÜnc ûµûP÷Ü¢on¨ü6óê\'Mçcu¶Ü³Jn§Aè2[(\n3ÉÐDúçP­F¸\rÌýàÈGòB6ìÄó\"\0÷1QèÄ\'*Fõ{ì q©tNR¡T\rKlàâ\n°9# À¾¿ùy£l3ÂÆléµrÈÄ§ñ	Mg¥ pÝ^Bû;RXï¶¹@FjyAºl+ò¾0µw?¨/ÆMÐ²vø°{5â<2à<pìIçW¡(­øÿÓD&ó,;Hµk(R9·âêÈa¨HGÝx','2015-02-03 19:39:05'),('8563fba1c3938c994.40718405','oxbaseshop','','aModules','aarr','Mº/tLWG¦tr&Õ\Zªmfâ»O£è÷\ZªøT#®ùAí}Eñh©7Há»ý©¯Zap8Ðþxá£\'@l¢÷£/tymÈ&«èhÿßù^¦»¢3½n£`ÔèÔùñE´ú£©$gWSRÅY`Ä\0d$Zcwm-ë´ìñc?wVèF<','2015-02-03 19:39:05'),('7b288c3b174f7e60191c848a6d489799','oxbaseshop','','aModuleFiles','aarr','Mº2,wOT4Õqû±ýPqu«XÄ!)ÁõFGBXTÄCG]O®ÿáÐjbóëe&8Üe¤Îz!ï×¿LB?!wøRHXJ\n@wµVäÙ¥¹Úö±©ëÄn05ûÍª-×\0ÚaT,SÖ«SÅ»MïïiEÿyO¡>¯9ØæÔw©yþ{u[/9¬øæ4j#Z¶¤t|$#>!ñ*G§!Ã#Ø','2015-02-03 19:39:05'),('e1d66e8a37a86bd8e7c7159f55f5bbac','oxbaseshop','','aModuleEvents','aarr','Mº2,wOT4Õqû±ýPqu«ýñ','2015-02-03 19:39:05'),('b7a97d591035760030b82185cebfee33','oxbaseshop','','aModuleVersions','aarr','Mº2,wOT4Õqû±ýPqu«=ÖçDØW½','2015-02-03 19:39:05'),('d319165cbf49e360b4f84c684c315245','oxbaseshop','','aModulePaths','aarr','Mº2,wOT4Õqû±ýPqu«=Ö!ÅÅ±¡¯¦»iC×IYÒEóë','2015-02-03 19:39:05'),('8563fba1c3938ebe7.95075058','oxbaseshop','','aLogSkipTags','arr','Mºë-v','2015-02-03 19:39:05'),('79c3fbc9897c0d159.27469500','oxbaseshop','','blLoadVariants','bool','','2015-02-03 19:39:05'),('b2b400dd011bf6273.08965005','oxbaseshop','','blVariantsSelection','bool','','2015-02-03 19:39:05'),('43040112c71dfb0f2.40367454','oxbaseshop','','sDefaultImageQuality','str','wA','2015-02-03 19:39:05'),('51240739e4bc61362.43751239','oxbaseshop','','iMaxGBEntriesPerDay','str','°','2015-02-03 19:39:05'),('4994145b9e87481c5.69580772','oxbaseshop','','aSortCols','arr','Mº/tçMôÍÕ¯c8çÉzÏl²Õ\"ðZâótðLî·½n±\nÃk¨`C¾°.','2015-02-03 19:39:05'),('4994145b9e8736eb6.03785000','oxbaseshop','','iTop5Mode','str','','2015-02-03 19:39:05'),('4994145b9e8678993.26056670','oxbaseshop','','blShowSorting','bool','','2015-02-03 19:39:05'),('a104164f96fa51c41.58873414','oxbaseshop','','aSearchCols','arr','Mºh(sàJóÊÒ¨d?àÎ}ÈkµÒ%÷]åCqõIëõðT¨ª]rÿO[µ$_!/gÇ½)A~a[ÍøÙuÌ\'îKP[ßê¯2ÅÝÖe[ ×Máè#n½î','2015-02-03 19:39:05'),('d144175015dcd2a39.15131643','oxbaseshop','','aHomeCountry','arr','Mº2,wäN÷ÎÖ¬¡óW\0<­#xþAÕ×ì¨YÔËã·*(Õ','2015-02-03 19:39:05'),('ce143201f7e03e110.09792514','oxbaseshop','','aMustFillFields','arr','Mº2\'uÔ`×w3éåûkòïh¼ÈK®ò@_¹îÀó¦;|E¨3FT?æ¨mJ@\'#^\Z?r¿àãñðïî.üÉÇY×}pÉþñÇÍõ¼\Z)7¹nÐ2Å_ódÚðç£~Å6,ýû`âÞ\">`É\"kú*ºåõØbû\n~5²Î¯ «4·YaÄ6Òh,óD.O¹6±ÍÀí\r½¤¹¢¥sÀªGÓûs«Ô;M2È{ùN_A.òS]]=óYÊ+%Òf@¾tÞ.ô´Äè¯ÄØÚ8Æ;ñÁ<W¥ÈÓöjáUäÃìmÂyi;å°@ÊYË0\'ÃJ0siº}!úñ¹ÇÁpÿ¡¢»ôtauÀàKÿh®O(u5¹±«ÆO\rB>Ôìn([%tØ\'\'úæó>ôÝqÅ-æ¿F7v`©þbW¢÷^ý!¾~·çÐâçÑ0ImÚ)ca¨­ÌÛfÇÚvë·oï	ð','2015-02-03 19:39:05'),('79e417a3916b910c8.31517473','oxbaseshop','','bl_perfLoadAktion','bool','','2015-02-03 19:39:05'),('79e417a4201010a12.85717286','oxbaseshop','','bl_perfLoadReviews','bool','','2015-02-03 19:39:05'),('79e417a420101f3e6.18536996','oxbaseshop','','bl_perfLoadCrossselling','bool','','2015-02-03 19:39:05'),('79e417a4201028c21.24163259','oxbaseshop','','bl_perfLoadAccessoires','bool','','2015-02-03 19:39:05'),('79e417a420103a598.95673089','oxbaseshop','','bl_perfLoadCustomerWhoBoughtThis','bool','','2015-02-03 19:39:05'),('79e417a4201044603.06076651','oxbaseshop','','bl_perfLoadSimilar','bool','','2015-02-03 19:39:05'),('79e417a420104dbd8.25267555','oxbaseshop','','bl_perfLoadSelectLists','bool','','2015-02-03 19:39:05'),('79e417a4201062a60.33852458','oxbaseshop','','bl_perfLoadDiscounts','bool','','2015-02-03 19:39:05'),('79e417a420106baa7.25594072','oxbaseshop','','bl_perfLoadDelivery','bool','','2015-02-03 19:39:05'),('79e417a420107ab46.59697382','oxbaseshop','','bl_perfLoadPrice','bool','','2015-02-03 19:39:05'),('79e417a442934fcb9.11733184','oxbaseshop','','bl_perfLoadCatTree','bool','','2015-02-03 19:39:05'),('79e417a45558d97f6.76133435','oxbaseshop','','bl_perfLoadCurrency','bool','','2015-02-03 19:39:05'),('79e417a45558e7851.36128674','oxbaseshop','','bl_perfLoadLanguages','bool','','2015-02-03 19:39:05'),('79e417a45558f1b86.05956285','oxbaseshop','','bl_perfLoadNews','bool','','2015-02-03 19:39:05'),('79e417a466086f390.29565974','oxbaseshop','','bl_perfLoadNewsOnlyStart','bool','','2015-02-03 19:39:05'),('c20424bf2f8e71271.42955545','oxbaseshop','','bl_perfLoadTreeForSearch','bool','','2015-02-03 19:39:05'),('36d42513de8cab671.54909813','oxbaseshop','','bl_perfShowActionCatArticleCnt','bool','','2015-02-03 19:39:05'),('7044252b61dcb8ac9.31672388','oxbaseshop','','bl_perfLoadPriceForAddList','bool','','2015-02-03 19:39:05'),('7044252b61dd44324.24181665','oxbaseshop','','bl_perfParseLongDescinSmarty','bool','','2015-02-03 19:39:05'),('77c425a29db68f0d9.00182375','oxbaseshop','','bl_perfLoadManufacturerTree','bool','','2015-02-03 19:39:05'),('79e417a4eaad1a593.54850808','oxbaseshop','','blStoreIPs','bool','','2015-02-03 19:39:05'),('33341949f476b65e8.17282442','oxbaseshop','','iAttributesPercent','str','wÂ','2015-02-03 19:39:05'),('43141b9b252874600.34636487','oxbaseshop','','sDecimalSeparator','str','É','2015-02-03 19:39:05'),('bf041bd98dacd9021.61732877','oxbaseshop','','aInterfaceProfiles','aarr','MºÎ)rJQ¶¯}	ªÁ0Bé<[~íÁãÕ9ª©%#ðS ©P`Ö\rWû°\'ºØýª¼ÖªÏXM1ÝnÕç¸3ñ8ÒòI)UÈ,ê4§XÆÌÞV¬íä','2015-02-03 19:39:05'),('e8e41bda6fa7631d8.13775806','oxbaseshop','','iSessionTimeout','str','Ã','2015-02-03 19:39:05'),('6ec4235c5182c3620.11050422','oxbaseshop','','iNrofNewcomerArticles','str','û','2015-02-03 19:39:05'),('6ec4235c2aaa8eec5.99966057','oxbaseshop','','sMidlleCustPrice','str','ûÁ','2015-02-03 19:39:05'),('6ec4235c2aaa97585.69723730','oxbaseshop','','sLargeCustPrice','str','Ä±','2015-02-03 19:39:05'),('6ec4235c2aa997942.70260123','oxbaseshop','','blWarnOnSameArtNums','bool','','2015-02-03 19:39:05'),('a7a425c02819f7253.64374401','oxbaseshop','','blAutoIcons','bool','','2015-02-03 19:39:05'),('7e9426025ff199d75.57820200','oxbaseshop','','sStockWarningLimit','str','Ä','2015-02-03 19:39:05'),('9a8426df9d36443e7.48701626','oxbaseshop','','blSearchUseAND','bool','','2015-02-03 19:39:05'),('a99427345bf85a602.27736147','oxbaseshop','','blDontShowEmptyCategories','bool','','2015-02-03 19:39:05'),('a99427345bf8fcff2.83464949','oxbaseshop','','bl_perfUseSelectlistPrice','bool','','2015-02-03 19:39:05'),('a99427345bf9a27a1.04791092','oxbaseshop','','bl_perfCalcVatOnlyForBasketOrder','bool','','2015-02-03 19:39:05'),('2ca4277aa49a5bd27.44511187','oxbaseshop','','blStockOnDefaultMessage','bool','','2015-02-03 19:39:05'),('2ca4277aa49a634f8.76432326','oxbaseshop','','blStockOffDefaultMessage','bool','','2015-02-03 19:39:05'),('6da42abf915b5f290.70877375','oxbaseshop','','sCntOfNewsLoaded','str','','2015-02-03 19:39:05'),('89e42b02704ce5589.91950338','oxbaseshop','','iNewestArticlesMode','str','','2015-02-03 19:39:05'),('e1142ca231becd5c4.00590616','oxbaseshop','','blConfirmAGB','bool','','2015-02-03 19:39:05'),('a1544b76735df7bd7.33980003','oxbaseshop','','blEnableIntangibleProdAgreement','bool','','2015-02-03 19:39:05'),('2e4452b5763e03c74.88240349','oxbaseshop','','blDisableDublArtOnCopy','bool','','2015-02-03 19:39:05'),('fde4559837789b3c7.26965372','oxbaseshop','','aCMSfolder','aarr','MºÎ)rJQ1AÒýîp³äeèÁ`£^µ¡óºÑåå%pÉÊHkGU°ê\n+v(¡R¯\n¸BÇÃTp÷Å:ÐÖ `ÊÇ_+ö*oÐÀA+zmïØàÒõ±Èl]\nrñÜ·µ\\DU· Îst?>ÕYÍ¨b\ZR:¡Ðwüzµ!ªU£h¿ë(®x,4V6*î','2015-02-03 19:39:05'),('6f8453f77d174e0a0.31854175','oxbaseshop','','blOtherCountryOrder','bool','','2015-02-03 19:39:05'),('0a5455450f97fdec9.37454802','oxbaseshop','','blAllowNegativeStock','bool','','2015-02-03 19:39:05'),('b0b4d221756c80afdad8904c0b91b877','oxbaseshop','','iRssItemsCount','str','¶Ç','2015-02-03 19:39:05'),('8b831f739c5d16cf4571b14a76006568','oxbaseshop','','aSEOReservedWords','arr','MºB*qâHñÈÐªL?ÍéîÅjÌ|G·Ñßó-¶×¦Y9µáªYÏÞE\Z²%û¤×+;©Â:K\nÛu1Kz-ézÞä-|HÔb@1?ñ­cö·Äz 1í	<ë§]çiíäõx#¥levo·','2015-02-03 19:39:05'),('2b72d8716ab1c8a67e1f8eae931ce56f','oxbaseshop','','bl_rssSearch','bool','','2015-02-03 19:39:05'),('2b7aa4c6e33301b5855cc538fea4bccd','oxbaseshop','','bl_rssTopShop','bool','','2015-02-03 19:39:05'),('2b7f0b7ba625f0fe61993c66f21b13f3','oxbaseshop','','bl_rssNewest','bool','','2015-02-03 19:39:05'),('2b7eccdd7027feb7367a6edc668164c5','oxbaseshop','','bl_rssCategories','bool','','2015-02-03 19:39:05'),('33e32ef1509b9229152fad3fba5d713f','oxbaseshop','','sShopCountry','str','Î','2015-02-03 19:39:05'),('def2451b2dd32e81048713854cd52c59','oxbaseshop','','blLoadDynContents','bool','y\0ýõ','2015-02-03 19:39:05'),('44bcd90bd1d059.053753111','oxbaseshop','','sTagList','str','33kÎ¾','2015-02-03 19:39:05'),('603a1a28ff2a421b64c631ffaf97f324','oxbaseshop','','sGiCsvFieldEncloser','str','','2015-02-03 19:39:05'),('591e3b6358fc5c87a6cb81c3f79787bc','oxbaseshop','','sTagSeparator','str','É','2015-02-03 19:39:05'),('9135a582a6971656110b9a98ca5be6d2','oxbaseshop','','blShippingCountryVat','bool','','2015-02-03 19:39:05'),('7a59f9000f39e5d9549a5d1e29c076a0','oxbaseshop','','blUseMultidimensionVariants','bool','','2015-02-03 19:39:05'),('7a59f9000f39e5d9549a5d1e29c076a2','oxbaseshop','','blOrderOptInEmail','bool','','2015-02-03 19:39:05'),('bd3e73e699331eb92c557113bac02fc4','oxbaseshop','','dPointsForInvitation','str','Ä','2015-02-03 19:39:05'),('bd320d322fa2f638086787c512329eec','oxbaseshop','','dPointsForRegistration','str','Ä','2015-02-03 19:39:05'),('99065ff58e9d2c1b2e362e54c0bb54f3','oxbaseshop','','blNewArtByInsert','bool','','2015-02-03 19:39:05'),('rgk2a8c9cf8c9d23b3a7c8e9c090baf1','oxbaseshop','','sTheme','str','M·m\Z','2015-02-03 19:39:05'),('8563fba1c39367724.92308656123456','oxbaseshop','','blShowTags','bool','','2015-02-03 19:39:05'),('8563fba1c39367724.92308656123457','oxbaseshop','','blFacebookConfirmEnabled','bool','','2015-02-03 19:39:05'),('8563fba1c39367724.92308656123111','oxbaseshop','','sDownloadsDir','str','`>ç\rT	®ãÇÒAÒ','2015-02-03 19:39:05'),('5i1c49faf83b3fe3d6bdbfa301e2704d','oxbaseshop','','iLinkExpirationTime','str','\ré','2015-02-03 19:39:05'),('5i1d215fe1d6f0e1061ba1134e0ee4f2','oxbaseshop','','iDownloadExpirationTime','str','¶â','2015-02-03 19:39:05'),('l8g3e140a4bc7993d7d715df951dfe25','oxbaseshop','','iMaxDownloadsCountUnregistered','str','','2015-02-03 19:39:05'),('l8g957be9e7b13412960c7670f71ba3b','oxbaseshop','','iMaxDownloadsCount','str','Þ','2015-02-03 19:39:05'),('mhjf24905a5b49c8d60aa31087b9797f','oxbaseshop','','blShowRememberMe','bool','','2015-02-03 19:39:05'),('omc4555952125c3c2.98253113','oxbaseshop','','blDisableNavBars','bool','','2015-02-03 19:39:05'),('mhjf24905a5b49c8d60aa31087b97971','oxbaseshop','','blEnableSeoCache','bool','','2015-02-03 19:39:05'),('l8g957be9e7b13412960c7670f71ba31','oxbaseshop','','sAdditionalServVATCalcMethod','str','UÊ@ÿ\r\nrõ¹ò','2015-02-03 19:39:05'),('fecfcd8dbd01a491a94557448425acc8','oxbaseshop','','blShowTSInternationalFeesMessage','bool','','2015-02-03 19:39:05'),('32ddeaf2694e06b47b6ff74eafc69b65','oxbaseshop','','sParcelService','str','\0Ðá®3»$kM·Ö8E¼Î©iÞûõ£ëÔ7c¤FQú²<¸Gzñ§±ÌBÒgVsd8	á}½ÊÿÆ','2015-02-03 19:39:05'),('1eada690d18be312ef5e49b8451440e7','oxbaseshop','','blShowTSCODMessage','bool','','2015-02-03 19:39:05'),('8563fba1baec57c19.08644217','oxbaseshop','','sThumbnailsize','str',':IÊ60','2015-02-03 19:39:05'),('8563fba1baec599d5.89404456','oxbaseshop','','sCatThumbnailsize','str','wçíNÍ17','2015-02-03 19:39:05'),('6ec4235c2aaa45d77.87437919','oxbaseshop','','sIconsize','str','d¢±','2015-02-03 19:39:05'),('62642dfaa1d88b1b2.94593071','oxbaseshop','','sZoomImageSize','str','\n3@Ór¾','2015-02-03 19:39:05'),('62642dfaa1d87d064.50653921','oxbaseshop','','aDetailImageSizes','aarr','Mº2jsÒÍËG3×Ks÷®ÂÙàäö¼g\0ê8ýlã8£ÂGÓ¦;îÄ!·¡Ý|±EV\\?ÖyÍ,«O®lE£Aé¥¼YÎîýhâ®òå]\0û~é«·cÇL·º?§feö©)Móe¿}=\rVúò5]ñE°$±D¼k\n¹ütÒáÝ\nÇ¤õ~,X@´¹,hóØÊqpÍçÖÁ( nQ\0Pá¨Y*UIxöOÿÎL½ô¯Ó)C¶8w\"£e.«á©?MÓcòó<)qk¸T/yìz\ZF\'\nµó&\" fU¸Z1×î/RÛùcýD&¦{+ÄaCn¼}Ø§D¢¥#>ÈÑf¶ÂD UÄ¦ôîÂS6Ô÷ð¬1Ce£!Ñ×t½¹','2015-02-03 19:39:05'),('1ec4235c2aee774aa45d772875437919','oxbaseshop','theme:azure','sIconsize','str','d¢±','2015-02-03 19:39:05'),('1563fba1bee774aec57c192086494217','oxbaseshop','theme:azure','sThumbnailsize','str',':IÊ60','2015-02-03 19:39:05'),('12642dfaa1dee77487d0644506753921','oxbaseshop','theme:azure','aDetailImageSizes','aarr','Mº2jsÒÍËG3×Ks÷®ÂÙàäö¼g\0ê8ýlã8£ÂGÓ¦;îÄ!·¡Ý|±EV\\?ÖyÍ,«O®lE£Aé¥¼YÎîýhâ®òå]\0û~é«·cÇL·º?§feö©)Móe¿}=\rVúò5]ñE°$±D¼k\n¹ütÒáÝ\nÇ¤õ~,X@´¹,hóØÊqpÍçÖÁ( nQ\0Pá¨Y*UIxöOÿÎL½ô¯Ó)C¶8w\"£e.«á©?MÓcòó<)qk¸T/yìz\ZF\'\nµó&\" fU¸Z1×î/RÛùcýD&¦{+ÄaCn¼}Ø§D¢¥#>ÈÑf¶ÂD UÄ¦ôîÂS6Ô÷ð¬1Ce£!Ñ×t½¹','2015-02-03 19:39:05'),('12642dfaa1dee77488b1b22948593071','oxbaseshop','theme:azure','sZoomImageSize','str','\n3@Ór¾','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848798','oxbaseshop','theme:azure','sCatIconsize','str','\réJÉ¶6','2015-02-03 19:39:05'),('1563fba1bee774aec599d56894094456','oxbaseshop','theme:azure','sCatThumbnailsize','str','wçíNÍ17','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848987','oxbaseshop','theme:azure','sCatPromotionsize','str','°o´AÂ½','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848789','oxbaseshop','theme:azure','sManufacturerIconsize','str','Ä±DÇ¸8','2015-02-03 19:39:05'),('18a9473894d473f6ed28f04e80d929fc','oxbaseshop','theme:azure','bl_showCompareList','bool','','2015-02-03 19:39:05'),('18acb2f595da54b5f865e54aa5cdb967','oxbaseshop','theme:azure','bl_showListmania','bool','','2015-02-03 19:39:05'),('18a12329124850cd8f63cda6e8e7b4e1','oxbaseshop','theme:azure','bl_showWishlist','bool','','2015-02-03 19:39:05'),('18a23429124850cd8f63cda6e8e7b4e1','oxbaseshop','theme:azure','bl_showVouchers','bool','','2015-02-03 19:39:05'),('18a34529124850cd8f63cda6e8e7b4e1','oxbaseshop','theme:azure','bl_showGiftWrapping','bool','','2015-02-03 19:39:05'),('15342e4cab0ee774acb3905838384984','oxbaseshop','theme:azure','blShowBirthdayFields','bool','','2015-02-03 19:39:05'),('11296159b7641d31b93423972af6150b','oxbaseshop','theme:azure','iTopNaviCatCount','str','û','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848989','oxbaseshop','theme:azure','sDefaultListDisplayType','select','Í·ðdí','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848992','oxbaseshop','theme:azure','sStartPageListDisplayType','select','Í·ðdí','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848990','oxbaseshop','theme:azure','blShowListDisplayType','bool','','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848474','oxbaseshop','theme:azure','iNewBasketItemMessage','select','','2015-02-03 19:39:05'),('1545423fe8ce213a0435345552230295','oxbaseshop','theme:azure','aNrofCatArticles','arr','MºÎ)ráKòËÓ©¤;­{pOq£ÑìÒCAãÆôýÉ\'A÷lÆü¡\'×æÜÉ','2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848991','oxbaseshop','theme:azure','aNrofCatArticlesInGrid','arr','MºÎ)ráKòËÓ©¤;ÅyrMs	¡ÓîaSDFäÁóú%EóhÂø¥#ÕTkÍö','2015-02-03 19:39:05'),('801af4657752f1ae506deee5e6768508','oxbaseshop','','blCheckForUpdates','bool','y\0ýõ','2015-02-03 19:39:05'),('66e09bcbb5d8cff794b05de47338fac2','oxbaseshop','','blSendShopDataToOxid','bool','','2015-02-03 19:39:05'),('2befb3c0cd7441d9bc2db010e3f73655','oxbaseshop','','aLanguageParams','aarr','Mº/tLW£qÙß3w%ô¶ï¼Þ|<Zã9lªoûhd¯¨3´5ÊÑûpÈé	sà¿G6û¥\0+å[Ü\Z+ÂÛT9aY­öéÀ·iZ´2ÛÈZæ®|5:;¯®Lb~Y5frFlg|â0ÿAÐdÕ¸®rtàÙÜJøÔ_²g@!','2015-02-03 19:39:05'),('558f821d7300f267435377d781a309cc','oxbaseshop','','aServersData','arr','Mº2,wOTç÷Ù\0:_á]6³ÀÏ©{-ù$ÕÿcÍ«+ÏülunKÍóEÌÔ?V¶ÒG¶Þê¼ÜÅ2Í¡Á7(¬E­ááj°8!uÏÓàü¾ôµÊh!8\"\\ØäC\0Ø	l@(Ç²ünp{8ÌOFj¾z5ÇSøPH	\"|[j²jÓ~UBÀ5g7°êoGINÕs0Û{ÂÒ+Ä÷\ZÄ¼ÿúÏx`MDmyüô[åÉÝO°è È(5â6ìt\\ä\0U×Ò?w±(¡ZÏ','2015-02-03 19:40:11'),('78be09d3d9c2d568cfbcdc723e54b759','oxbaseshop','','iTimeToUpdatePrices','int','áÝ1ê¸','2015-02-03 19:40:11');
/*!40000 ALTER TABLE `oxconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxconfigdisplay`
--

DROP TABLE IF EXISTS `oxconfigdisplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxconfigdisplay` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Config id (extends oxconfig record with this id)',
  `OXCFGMODULE` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Module or theme specific config (theme:themename, module:modulename)',
  `OXCFGVARNAME` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Variable name',
  `OXGROUPING` varchar(255) NOT NULL DEFAULT '' COMMENT 'Grouping (groups config fields to array with specified value as key)',
  `OXVARCONSTRAINT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Serialized constraints',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `list` (`OXCFGMODULE`,`OXCFGVARNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Additional configuraion fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxconfigdisplay`
--

LOCK TABLES `oxconfigdisplay` WRITE;
/*!40000 ALTER TABLE `oxconfigdisplay` DISABLE KEYS */;
INSERT INTO `oxconfigdisplay` VALUES ('1ec4235c2aee774aa45d772875437919','theme:azure','sIconsize','images','',1,'2015-02-03 19:39:05'),('1563fba1bee774aec57c192086494217','theme:azure','sThumbnailsize','images','',2,'2015-02-03 19:39:05'),('1563fba1bee774aec599d56894094456','theme:azure','sCatThumbnailsize','images','',3,'2015-02-03 19:39:05'),('12642dfaa1dee77488b1b22948593071','theme:azure','sZoomImageSize','images','',4,'2015-02-03 19:39:05'),('12642dfaa1dee77487d0644506753921','theme:azure','aDetailImageSizes','images','',5,'2015-02-03 19:39:05'),('18a9473894d473f6ed28f04e80d929fc','theme:azure','bl_showCompareList','features','',6,'2015-02-03 19:39:05'),('18acb2f595da54b5f865e54aa5cdb967','theme:azure','bl_showListmania','features','',7,'2015-02-03 19:39:05'),('18a12329124850cd8f63cda6e8e7b4e1','theme:azure','bl_showWishlist','features','',8,'2015-02-03 19:39:05'),('18a23429124850cd8f63cda6e8e7b4e1','theme:azure','bl_showVouchers','features','',9,'2015-02-03 19:39:05'),('18a34529124850cd8f63cda6e8e7b4e1','theme:azure','bl_showGiftWrapping','features','',10,'2015-02-03 19:39:05'),('15342e4cab0ee774acb3905838384984','theme:azure','blShowBirthdayFields','display','',14,'2015-02-03 19:39:05'),('11296159b7641d31b93423972af6150b','theme:azure','iTopNaviCatCount','display','',15,'2015-02-03 19:39:05'),('6ec4235c2aee774aa45d772875437789','theme:azure','sManufacturerIconsize','images','',6,'2015-02-03 19:39:05'),('8563fba1bee774aec57c192086494897','theme:azure','sCatIconsize','images','',7,'2015-02-03 19:39:05'),('8563fba1bee774aec599d56894094987','theme:azure','sCatPromotionsize','images','',8,'2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848989','theme:azure','sDefaultListDisplayType','display','infogrid|line|grid',21,'2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848992','theme:azure','sStartPageListDisplayType','display','infogrid|line|grid',22,'2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848990','theme:azure','blShowListDisplayType','display','',20,'2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848474','theme:azure','iNewBasketItemMessage','display','0|1|2|3',17,'2015-02-03 19:39:05'),('1545423fe8ce213a06.20230295','theme:azure','aNrofCatArticles','display','',23,'2015-02-03 19:39:05'),('1ec42a395d0595ee7741091898848991','theme:azure','aNrofCatArticlesInGrid','display','',24,'2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxconfigdisplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcontents`
--

DROP TABLE IF EXISTS `oxcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcontents` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Content id',
  `OXLOADID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Id, specified by admin and can be used instead of oxid',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXSNIPPET` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Snippet (can be included to other oxcontents records)',
  `OXTYPE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Type: 0 - Snippet, 1 - Upper Menu, 2 - Category, 3 - Manual',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active (multilanguage)',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '0',
  `OXPOSITION` varchar(32) NOT NULL DEFAULT '' COMMENT 'Position',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXCONTENT` text NOT NULL COMMENT 'Content (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_1` text NOT NULL,
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_2` text NOT NULL,
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '0',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXCONTENT_3` text NOT NULL,
  `OXCATID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Category id (oxcategories), used only when type = 2',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Content Folder (available options at oxconfig.OXVARNAME = aCMSfolder)',
  `OXTERMVERSION` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Term and Conditions version (used only when OXLOADID = oxagb)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXLOADID` (`OXLOADID`),
  KEY `cat_search` (`OXTYPE`,`OXSHOPID`,`OXSNIPPET`,`OXCATID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Content pages (Snippets, Menu, Categories, Manual)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcontents`
--

LOCK TABLES `oxcontents` WRITE;
/*!40000 ALTER TABLE `oxcontents` DISABLE KEYS */;
INSERT INTO `oxcontents` VALUES ('8709e45f31a86909e9f999222e80b1d0','oxstdfooter','oxbaseshop',1,0,1,1,'','Standard Footer','<div>OXID Online Shop - Alles rund um das Thema Wassersport, Sportbekleidung und Mode </div>','standard footer','<div>OXID Online Shop - All about watersports, sportswear and fashion </div>',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('ad542e49bff479009.64538090','oxadminorderemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung Admin','Folgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->value }] bestellt:<br>\r\n<br>','your order admin','The following products have been ordered in [{ $shop->oxshops__oxname->value }] right now:<br>\r\n<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('c8d45408c4998f421.15746968','oxadminordernpemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung Admin (FremdlÃ¤nder)','<div>\r\n<p> <span style=\"color: #ff0000;\"><strong>Hinweis:</strong></span> Derzeit ist keine Liefermethode fÃ¼r dieses Land bekannt. Bitte LiefermÃ¶glichkeiten suchen und den Besteller unter Angabe der <strong>Lieferkosten</strong> informieren!\r\n&nbsp;</p> </div>\r\n<div>Folgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->value }] bestellt:<br>\r\n<br>\r\n</div>','your order admin (other country)','<p> <span style=\"color: #ff0000\"><strong>Information:</strong></span> Currently, there is no shipping method defined for this country. Please find a delivery option and inform the customer about the <strong>shipping costs</strong>.</p>\r\n<p>The following products have been ordered on [{ $shop->oxshops__oxname->value }]:<br />\r\n<br /></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('c8d45408c718782f3.21298666','oxadminordernpplainemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung Admin (FremdlÃ¤nder) Plain','Hinweis: Derzeit ist keine Liefermethode fÃ¼r dieses Land bekannt. Bitte LiefermÃ¶glichkeiten suchen und den Besteller informieren!\r\n\r\nFolgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->getRawValue() }] bestellt:','your order admin plain (other country)','<p>Information: Currently, there is no shipping method defined for this country. Please find a delivery option and inform the customer about the shipping costs.\r\n\r\nThe following products have been ordered on [{ $shop->oxshops__oxname->getRawValue() }]:</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49c19109ad6.04198712','oxadminorderplainemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung Admin Plain','<p>Folgende Artikel wurden soeben unter [{ $shop->oxshops__oxname->getRawValue() }] bestellt:</p>','your order admin plain','The following products have been ordered in [{ $shop->oxshops__oxname->getRawValue() }] right now:',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('2eb4676806a3d2e87.06076523','oxagb','oxbaseshop',1,0,1,1,'','AGB','<div><strong>AGB</strong></div>\r\n<div><strong>&nbsp;</strong></div>\r\n<div>FÃ¼gen Sie hier Ihre allgemeinen GeschÃ¤ftsbedingungen ein:</div>\r\n<div>&nbsp;</div>\r\n<div><span style=\"font-weight: bold\">Strukturvorschlag:</span><br>\r\n<br>\r\n<ol>\r\n<li>Geltungsbereich </li>\r\n<li>Vertragspartner </li>\r\n<li>Angebot und Vertragsschluss </li>\r\n<li>Widerrufsrecht, Widerrufsbelehrung, Widerrufsfolgen </li>\r\n<li>Preise und Versandkosten </li>\r\n<li>Lieferung </li>\r\n<li>Zahlung </li>\r\n<li>Eigentumsvorbehalt </li>\r\n<li>GewÃ¤hrleistung </li>\r\n<li>Weitere Informationen</li></ol></div>','Terms and Conditions','Insert your terms and conditions here.',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','1','2015-02-03 19:39:05'),('c4241316c6e7b9503.93160420','oxbargain','oxbaseshop',1,0,1,1,'','Angebot der Woche','<table>[{foreach from=$oView->getBargainArticleList() item=articlebargain_item}] <tbody><tr><td>\r\n<div class=\"product_image_s_container\"><a href=\"[{$articlebargain_item->getLink()}]\"><img border=\"0\" alt=\"[{ $articlebargain_item->oxarticles__oxtitle->value }][{if $articlebargain_item->oxarticles__oxvarselect->value }] [{ $articlebargain_item->oxarticles__oxvarselect->value }][{/if}] [{$oxcmp_shop->oxshops__oxtitlesuffix->value}]\" src=\"[{ $articlebargain_item->getDynImageDir()}]/[{$articlebargain_item->oxarticles__oxicon->value}]\"></a></div> </td><td class=\"boxrightproduct-td\"> <a href=\"[{$articlebargain_item->getLink()}]\" class=\"boxrightproduct-td\"><strong>[{ $articlebargain_item->oxarticles__oxtitle->value|cat:\"\r\n\"|cat:$articlebargain_item->oxarticles__oxvarselect->value|strip_tags|smartwordwrap:15:\"<br>\r\n\":2:1:\"...\" }]</strong></a><br>\r\n [{ if $articlebargain_item->isBuyable() }] <a href=\"[{$articlebargain_item->getToBasketLink()}]&amp;am=1\" class=\"details\" onclick=\"showBasketWnd();\" rel=\"nofollow\"><img border=\"0\" src=\"[{$oViewConf->getImageUrl(\'arrow_details.gif\')}]\" alt=\"\"> Jetzt bestellen! </a> [{/if}] </td></tr>[{/foreach}]\r\n</tbody></table>','Week\'s Special','<table>[{foreach from=$oView->getBargainArticleList() item=articlebargain_item}] <tbody><tr><td>\r\n<div class=\"product_image_s_container\"><a href=\"[{$articlebargain_item->getLink()}]\"><img border=\"0\" src=\"[{ $articlebargain_item->getDynImageDir()}]/[{$articlebargain_item->oxarticles__oxicon->value}]\" alt=\"[{ $articlebargain_item->oxarticles__oxtitle->value }][{if $articlebargain_item->oxarticles__oxvarselect->value }] [{ $articlebargain_item->oxarticles__oxvarselect->value }][{/if}] [{$oxcmp_shop->oxshops__oxtitlesuffix->value}]\"></a></div> </td><td class=\"boxrightproduct-td\"> <a class=\"boxrightproduct-td\" href=\"[{$articlebargain_item->getLink()}]\"><strong>[{ $articlebargain_item->oxarticles__oxtitle->value|cat:\"\r\n\"|cat:$articlebargain_item->oxarticles__oxvarselect->value|strip_tags|smartwordwrap:15:\"<br>\r\n \":2:1:\"...\" }]</strong></a><br>\r\n [{ if $articlebargain_item->isBuyable()}] <a onclick=\"showBasketWnd();\" class=\"details\" href=\"[{$articlebargain_item->getToBasketLink()}]&amp;am=1\" rel=\"nofollow\"><img border=\"0\" alt=\"\" src=\"[{$oViewConf->getImageUrl(\'arrow_details.gif\')}]\"> Order now! </a> [{/if}] </td></tr>[{/foreach}] </tbody></table>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('1544167b4666ccdc1.28484600','oxblocked','oxbaseshop',1,0,1,1,'','Benutzer geblockt','<div><span style=\"color: #ff0000;\"><strong>\r\n<img title=\"\" height=\"200\" alt=\"\" src=\"[{$oViewConf->getPictureDir()}]wysiwigpro/stopsign.jpg\" width=\"200\"></strong></span></div>\r\n<div><span style=\"color: #ff0000;\"><strong>Der Zugang wurde Ihnen verweigert!</strong></span></div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>','user blocked','<div>\r\n   <img title=\"\" height=\"200\" alt=\"\" src=\"[{$oViewConf->getPictureDir()}]wysiwigpro/stopsign.jpg\" width=\"200\">\r\n</div>\r\n\r\n<div>\r\n   <span style=\"color: #ff0000;\"><strong>Permission denied!</strong></span>\r\n</div>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('f41427a07519469f1.34718981','oxdeliveryinfo','oxbaseshop',1,0,1,1,'','Zahlung und Lieferung','<p>FÃ¼gen Sie hier Ihre Versandinformationen- und kosten ein.</p>','Shipping and Charges','<p>Add your shipping information and costs here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('42e4667ffcf844be0.22563656','oxemailfooter','oxbaseshop',1,0,1,1,'','E-Mail FuÃtext','<p align=\"left\">--</p>\r\n<p>Bitte fÃ¼gen Sie hier Ihre vollstÃ¤ndige Anbieterkennzeichnung ein.</p>','E-mail footer','<p align=\"left\">--</p>\r\n<p>Please insert your imprint here</p>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('3194668fde854d711.73798992','oxemailfooterplain','oxbaseshop',1,0,1,1,'','E-Mail FuÃtext Plain','-- Bitte fÃ¼gen Sie hier Ihre vollstÃ¤ndige Anbieterkennzeichnung ein.','E-mail footer plain','-- Please insert your imprint here.',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('29142e76dd32dd477.41262508','oxforgotpwd','oxbaseshop',1,0,1,1,'','Passwort vergessen','Sollten Sie innerhalb der nÃ¤chsten Minuten KEINE E-Mail mit Ihren Zugangsdaten erhalten, so Ã¼berprÃ¼fen Sie bitte: Haben Sie sich in unserem Shop bereits registriert? Wenn nicht, so tun Sie dies bitte einmalig im Rahmen des Bestellprozesses. Sie kÃ¶nnen dann selbst ein Passwort festlegen. Sobald Sie registriert sind, kÃ¶nnen Sie sich in Zukunft mit Ihrer E-Mail-Adresse und Ihrem Passwort einloggen.\r\n<ul>\r\n<li class=\"font11\">Wenn Sie sich sicher sind, dass Sie sich in unserem Shop bereits registriert haben, dann Ã¼berprÃ¼fen Sie bitte, ob Sie sich bei der Eingabe Ihrer E-Mail-Adresse evtl. vertippt haben.</li></ul>\r\n<p>Sollten Sie trotz korrekter E-Mail-Adresse und bereits bestehender Registrierung weiterhin Probleme mit dem Login haben und auch keine \"Passwort vergessen\"-E-Mail erhalten, so wenden Sie sich bitte per E-Mail an: <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxinfoemail->value }]?subject=Passwort\"><strong>[{ $oxcmp_shop->oxshops__oxinfoemail->value }]</strong></a></p>','Forgot password','<p>If you don\'t get an e-mail with your access data, please make sure that you have already registered with us. As soon as you are registered, you can login with your e-mail address and your password.</p>\r\n<ul>\r\n<li>\r\nIf you are sure you are already registered, please check the e-mail address you entered as user name.</li></ul>\r\n<p>\r\nIn case you still have problems logging in, please turn to us by e-mail: <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxinfoemail->value }]?subject=Password\"><strong>[{ $oxcmp_shop->oxshops__oxinfoemail->value }]</strong></a></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('2eb46767947d21851.22681675','oximpressum','oxbaseshop',1,0,1,1,'','Impressum','<p>FÃ¼gen Sie hier Ihre Anbieterkennzeichnung ein.</p>','About Us','<p>Add provider identification here.</p>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('ad542e49975709a72.52261121','oxnewsletteremail','oxbaseshop',1,0,1,1,'','Newsletter eShop','Hallo, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],<br>\r\nvielen Dank fÃ¼r Ihre Anmeldung zu unserem Newsletter.<br>\r\n<br>\r\nUm den Newsletter freizuschalten klicken Sie bitte auf folgenden Link:<br>\r\n<br>\r\n<a href=\"[{$subscribeLink}]\">[{$subscribeLink}]</a><br>\r\n<br>\r\nIhr [{ $shop->oxshops__oxname->value }] Team<br>','newsletter confirmation','Hello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],<br>\r\nthank you for your newsletter subscription.<br>\r\n<br>\r\nFor final registration, please click on this link:<br>\r\n<br>\r\n<a href=\"[{$subscribeLink}]\">[{$subscribeLink}]</a><br>\r\n<br>\r\nYour [{ $shop->oxshops__oxname->value }] Team<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e4999ec01dd3.07214049','oxnewsletterplainemail','oxbaseshop',1,0,1,1,'','Newsletter eShop Plain','[{ $shop->oxshops__oxname->getRawValue() }] Newsletter Hallo, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }], vielen Dank fÃ¼r Ihre Anmeldung zu unserem Newsletter. Um den Newsletter freizuschalten klicken Sie bitte auf folgenden Link: [{$subscribeLink}] Ihr [{ $shop->oxshops__oxname->getRawValue() }] Team','newsletter confirmation plain','[{ $shop->oxshops__oxname->getRawValue() }] Newsletter \r\n\r\nHello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }], \r\n\r\nthank you for your newsletter subscription. For final registration, please click on this link: \r\n[{$subscribeLink}] \r\n\r\nYour [{ $shop->oxshops__oxname->getRawValue() }] Team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('f41427a10afab8641.52768563','oxnewstlerinfo','oxbaseshop',1,0,1,1,'','Neuigkeiten bei uns','<div>Mit dem [{ $oxcmp_shop->oxshops__oxname->value }]-Newsletter alle paar Wochen. <br>\r\nMit Tipps, Infos, Aktionen ... <br>\r\n<br>\r\nDas Abo kann jederzeit durch Austragen der E-Mail-Adresse beendet werden. <br>\r\nEine <span class=\"newsletter_title\">Weitergabe Ihrer Daten an Dritte lehnen wir ab</span>. <br>\r\n<br>\r\nSie bekommen zur BestÃ¤tigung nach dem Abonnement eine E-Mail - so stellen wir sicher, dass kein Unbefugter Sie in unseren Newsletter eintragen kann (sog. \"Double Opt-In\").<br>\r\n<br>\r\n</div>','newsletter info','<p>Stay in touch with the periodic [{ $oxcmp_shop->oxshops__oxname->value }]-newsletter every couple of weeks. We gladly inform you about recent tips, promotions and new products.</p>\r\n<p>You can unsubscribe any time from the newsletter.</p>\r\n<p>We strictly refuse <span class=\"newsletter_title\">transferring your data to 3rd parties</span>.</p>\r\n<p>For subscription we use the so called &quot;double opt-in&quot; procedure to guarantee that no unauthorized person will register with your e-mail address.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('1074279e67a85f5b1.96907412','oxorderinfo','oxbaseshop',1,0,1,1,'','Wie bestellen?','<div>Beispieltext:</div>\r\n<div>Â </div>\r\n<div>[{ $oxcmp_shop->oxshops__oxname->value }], Ihr Online-Shop fÃ¼r ... <br />\r\n<br />\r\nBei uns haben Sie die Wahl aus mehr als ... Artikeln von bester QualitÃ¤t und namhaften Herstellern. Schauen Sie sich um, stÃ¶bern Sie in unseren Angeboten! <br />\r\n[{ $oxcmp_shop->oxshops__oxname->value }] steht Ihnen im Internet rund um die Uhr und 7 Tage die Woche offen.<br />\r\n<br />\r\nWenn Sie eine Bestellung aufgeben mÃ¶chten, kÃ¶nnen Sie das:\r\n<ul>\r\n<li class=\"font11\">direkt im Internet Ã¼ber unseren Shop </li>\r\n<li class=\"font11\">per Fax unterÂ [{ $oxcmp_shop->oxshops__oxtelefax->value }] </li>\r\n<li class=\"font11\">per Telefon unter [{ $oxcmp_shop->oxshops__oxtelefon->value }] </li>\r\n<li class=\"font11\">oder per E-Mail unter <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxowneremail->value }]?subject=Bestellung\"><strong>[{ $oxcmp_shop->oxshops__oxowneremail->value }]</strong></a> </li></ul>Telefonisch sind wir fÃ¼r Sie <br />\r\nMontag bis Freitag von 10 bis 18 Uhr erreichbar. <br />\r\nWenn Sie auf der Suche nach einem Artikel sind, der zum Sortiment von [{ $oxcmp_shop->oxshops__oxname->value }] passen kÃ¶nnte, ihn aber nirgends finden, lassen Sie es uns wissen. Gern bemÃ¼hen wir uns um eine LÃ¶sung fÃ¼r Sie. <br />\r\n<br />\r\nSchreiben Sie an <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxowneremail->value }]?subject=Produktidee\"><strong>[{ $oxcmp_shop->oxshops__oxowneremail->value }]</strong></a>.</div>','How to order?','<h1>Text Example</h1>\r\n<h2>[{ $oxcmp_shop->oxshops__oxname->value }], your online store for ...</h2>\r\n<p>With us, you can choose from more than ... products of high quality and reputable manufacturers. Take a look around and browse through our offers!<br />\r\nOn the internet [{ $oxcmp_shop->oxshops__oxname->value }] is open 24/7.</p>\r\n<p>If you want to place an order you can purchase</p>\r\n<ul>\r\n<li class=\"font11\">via our online store</li>\r\n<li class=\"font11\">via fax [{ $oxcmp_shop->oxshops__oxtelefax->value }] </li>\r\n<li class=\"font11\">via telephone [{ $oxcmp_shop->oxshops__oxtelefon->value }] </li>\r\n<li class=\"font11\">or via e-mail <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxowneremail->value }]?subject=Order\"><strong>[{ $oxcmp_shop->oxshops__oxowneremail->value }]</strong></a></li></ul>\r\n<p>By telephone, we are available<br />\r\nMonday to Friday 10 AM thru 6 PM. </p>\r\n<p>If you are looking for an item that did not match the range of [{ $oxcmp_shop->oxshops__oxname->value }], let\'s us know. We are happy to find a solution for you.</p>\r\n<p>Write to <a href=\"mailto:[{ $oxcmp_shop->oxshops__oxowneremail->value }]?subject=Product idea\"><strong>[{ $oxcmp_shop->oxshops__oxowneremail->value }]</strong></a></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('67c5bcf75ee346bd9566bce6c8','oxcredits','oxbaseshop',0,3,0,1,'','Credits','','Credits','<h3>What is OXID eShop?</h3>\r\n<p>OXID eShop is a proven and flexible shopping cart software. Thousands of online businesses worldwide use its extensive functionality to create optimal eCommerce solutions. With its modular, state-of-the-art and standards-based architecture, customization is very easy. OXID eShop is being developed by <a href=\"http://www.oxid-esales.com\">OXID eSales AG</a>, the trusted Open Source eCommerce company.</p>\r\n<h3>OXID eShop Community Edition</h3>\r\n<p>The Community Edition of OXID eShop is distributed under the terms and conditions of the GNU General Public License version 3 (GPLv3). Briefly summarized, the GPL gives you the right to use, modify and share this copy of OXID eShop. If you choose to share OXID eShop, you may only share it under the terms and conditions of the GPL. If you share a modified version of OXID eShop, these modifications must also be placed under the GPL. Read the complete <a href=\"http://www.gnu.org/licenses/gpl.txt\">legal terms and conditions of the GPL</a> or see <a href=\"http://www.oxid-esales.com/en/products/community-edition/gpl-v3-faq\">OXID\'s GPLv3 FAQ</a>.</p>\r\n<h3>OXID eShop Professional and Enterprise Edition</h3>\r\n<p>These OXID eShop editions are distributed under OXID Commercial Licenses. For more information, please <a href=\"http://www.oxid-esales.com/en/company/about-oxid-esales/contact\">contact OXID eSales</a>.</p>\r\n<h3>Third-party Software</h3>\r\n<p>This product includes certain free/open source software. A <a href=\"http://www.oxid-esales.com/en/company/about-oxid-esales/third-party-licenses\">complete list of third-party software included in OXID eShop</a> is publicly available.</p>\r\n<h3>Copyright Notice</h3>\r\n<p>Copyright Â© 2003-2013 <a href=\"http://www.oxid-esales.com\">OXID eSales AG</a>, with portions copyright by other parties.</p>\r\n\r\n\r\n<!-- added by Marco //-->\r\n\r\n\r\n<h3>List of Contributions</h3>\r\n<ul>\r\n   <li><b>Downloadable Products</b>\r\n   <br>Some business models are based on downloadable virtual products like software, PDF or MP3 files instead of the classic shipment of products purchased in an online store. Please find more information on <a href=\"http://wiki.oxidforge.org/Features/Downloadable_products\" target=\"_blank\">OXIDforge</a>.\r\n   <br>contributed by <a href=\"http://www.marmalade.de\" target=\"_blank\">marmalade.de</a>\r\n   </li>\r\n\r\n\r\n   <li><b>Rich Snippets: RDFa + GoodRelations</b>\r\n   <br>We are convinced that the RDFa + GoodRelations vocabulary will be the future of rich snippets, especially for eCommerce. Please find more information on <a href=\"\" target=\"_blank\">OXIDforge</a>.\r\n   <br>contributed by Daniel Bingel and Prof. Dr. Hepp <a href=\"http://www.heppnetz.de/projects/goodrelations/\" target=\"_blank\">(GoodRelations)</a>.\r\n   </li>\r\n\r\n\r\n <li><b>GitHub contributions</b><br>\r\n Since May 2013 we switched our infrastructure in order to receive pull requests on <a href=\"https://github.com/OXID-eSales/oxideshop_ce/\" target=\"_blank\">GitHub</a>. Please see the <a href=\"https://www.ohloh.net/p/oxideshop/contributors/summary\" target=\"_blank\">list of contributors</a> for more information on who gratefully helped us to make OXID eShop even better.\r\n</li>  \r\n\r\n\r\n</ul>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('ad542e49d6de4a4f4.88594616','oxordersendemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung wurde versandt','Guten Tag, [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],<br>\r\n<br>\r\nunser Vertriebszentrum hat soeben folgende Artikel versandt.<br>\r\n<br>','your order has been shipped','Hello [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->value }] [{ $order->oxorder__oxbilllname->value }],<br />\r\n<br />\r\n<p>\r\nour distribution center just shipped this product:</p><br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49d856b5b68.98220446','oxordersendplainemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung wurde versandt Plain','Guten Tag [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->getRawValue() }] [{ $order->oxorder__oxbilllname->getRawValue() }],\r\n\r\nunser Vertriebszentrum hat soeben folgende Artikel versandt.','your order has been shipped plain','<p>Hello [{ $order->oxorder__oxbillsal->value|oxmultilangsal }] [{ $order->oxorder__oxbillfname->getRawValue() }] [{ $order->oxorder__oxbilllname->getRawValue() }],\r\n\r\nour distribution center just shipped this product:</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49c585394e4.36951640','oxpricealarmemail','oxbaseshop',1,0,1,1,'','Preisalarm','Preisalarm im [{ $shop->oxshops__oxname->value }]!<br>\r\n<br>\r\n[{ $email }] bietet fÃ¼r Artikel [{ $product->oxarticles__oxtitle->value }], Artnum. [{ $product->oxarticles__oxartnum->value }]<br>\r\n<br>\r\nOriginalpreis: [{ $product->getFPrice() }] [{ $currency->name}]<br>\r\nGEBOTEN: [{ $bidprice }] [{ $currency->name}]<br>\r\n<br>\r\n<br>\r\nIhr Shop.<br>','price alert','Price alert at [{ $shop->oxshops__oxname->value }]!<br>\r\n<br>\r\n[{ $email }] bids for product [{ $product->oxarticles__oxtitle->value }], product # [{ $product->oxarticles__oxartnum->value }]<br>\r\n<br>\r\nOriginal price: [{ $currency->name}][{ $product->getFPrice() }]<br>\r\nBid: [{ $currency->name}][{ $bidprice }]<br>\r\n<br>\r\n<br>\r\nYour store<br>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49c8ec04201.39247735','oxregisteremail','oxbaseshop',1,0,1,1,'','Vielen Dank fÃ¼r Ihre Registrierung','Hallo, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }], vielen Dank fÃ¼r Ihre Registrierung bei [{ $shop->oxshops__oxname->value }]!<br>\r\n<br>\r\nSie kÃ¶nnen sich ab sofort auch mit Ihrer E-Mail-Adresse <strong>[{ $user->oxuser__oxusername->value }]</strong> einloggen.<br>\r\n<br>\r\nIhr [{ $shop->oxshops__oxname->value }] Team<br>','thanks for your registration','Hello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }], <br />\r\n<br />\r\n<p>\r\nthank you for your registration at [{ $shop->oxshops__oxname->value }]!</p>\r\nFrom now on, you can log in with your email <strong>[{ $user->oxuser__oxusername->value }]</strong>.<br />\r\n<br />\r\nYour [{ $shop->oxshops__oxname->value }] team<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49ca4750015.09588134','oxregisterplainemail','oxbaseshop',1,0,1,1,'','Vielen Dank fÃ¼r Ihre Registrierung Plain','<p>[{ $shop->oxshops__oxregistersubject->getRawValue() }] Hallo, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }], vielen Dank fÃ¼r Ihre Registrierung bei [{ $shop->oxshops__oxname->getRawValue() }]! Sie kÃ¶nnen sich ab sofort auch mit Ihrer E-Mail-Adresse ([{ $user->oxuser__oxusername->value }]) einloggen. Ihr [{ $shop->oxshops__oxname->getRawValue() }] Team</p>','thanks for your registration plain','<p>Hello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }],\r\n\r\nthank you for your registration at [{ $shop->oxshops__oxname->getRawValue() }]!\r\nFrom now on, you can log in with your email [{ $user->oxuser__oxusername->value }].\r\n\r\nYour [{ $shop->oxshops__oxname->getRawValue() }] team</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('1ea45574543b21636.29288751','oxrightofwithdrawal','oxbaseshop',1,0,1,1,'','Widerrufsrecht','<div>FÃ¼gen Sie hier Ihre Widerrufsbelehrung ein.</div><div><a title=\"\" href=\"[{$oViewConf->getBaseDir()}]out/pictures/wysiwigpro/Model_form_for_withdrawal_de.pdf\"><strong>Muster fÃ¼r das Widerrufsformular</strong></a></div>','Right of Withdrawal','<div>Insert here the Right of Withdrawal policy.</div><div><strong><a title=\"\" href=\"[{$oViewConf->getBaseDir()}]out/pictures/wysiwigpro/Model_form_for_withdrawal_en.pdf\">Model form for withdrawal</a></strong></div>',1,'','',0,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('f41427a099a603773.44301043','oxsecurityinfo','oxbaseshop',1,0,1,1,'','Datenschutz','FÃ¼gen Sie hier Ihre Datenschutzbestimmungen ein.','Privacy Policy','Enter your privacy policy here.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('ce79015b6f6f07612270975889','oxstartmetadescription','oxbaseshop',1,0,1,1,'','META Description Startseite','Alles zum Thema Wassersport, Sportbekleidung und Mode. Umfangreiches Produktsortiment mit den neusten Trendprodukten. Blitzschneller Versand.<br />','META description start page','<p>All about watersports, sportswear and fashion. Extensive product range including several trendy products. Fast shipping.</p>\r\n<p>&nbsp;</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('ce77743c334edf92b0cab924a7','oxstartmetakeywords','oxbaseshop',1,0,1,1,'','META Keywords Startseite','kite, kites, kiteboarding, kiteboards, wakeboarding, wakeboards, boards, strand, sommer, wassersport, mode, fashion, style, shirts, jeans, accessoires, angebote','META keywords start page','kite, kites, kiteboarding, kiteboards, wakeboarding, wakeboards, boards, beach, summer, watersports, funsports, fashion, style, shirts, jeans, accessories, special offers',1,'','',1,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('c4241316b2e5c1966.96997015','oxstartwelcome','oxbaseshop',1,0,1,1,'','start.tpl BegrÃ¼Ãungstext','<h1><strong>Willkommen</strong> [{ if $oxcmp_user }]<strong>[{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }] </strong>[{else}] [{/if}][{ if !$oxcmp_user }]<strong>im OXID <span style=\"color: #ff3301\">e</span>Shop 4</strong>[{/if}]</h1>\r\nDies ist eine Demo-Installation des <strong>OXID eShop 4</strong>. Also keine Sorge, wenn Sie bestellen: Die Ware wird weder ausgeliefert, noch in Rechnung gestellt. Die gezeigten Produkte (und Preise) dienen nur zur Veranschaulichung der umfangreichen FunktionalitÃ¤t des Systems.\r\n<div><strong>&nbsp;</strong></div>\r\n<div><strong>Wir wÃ¼nschen viel SpaÃ beim Testen!</strong></div>\r\n<div><strong>Ihr OXID eSales Team</strong></div>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Hinweis fÃ¼r den Shop Administrator:</strong></p>\r\n<p>Dieser Text kann im Admin-Bereich unter dem MenÃ¼punkt <em>Kundeninformation -&gt; CMS-Seiten -&gt; start.tpl BegrÃ¼Ãungstext</em><strong> </strong>bearbeitet werden.<strong><br />\r\n</strong></p>\r\n<p><strong>&nbsp;</strong></p>','start.tpl welcome text','<h1><strong>Welcome</strong> [{ if $oxcmp_user }]<strong>[{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }] </strong>[{else}] [{/if}][{ if !$oxcmp_user }]<strong>to OXID <span style=\"color: #fc6634\">e</span>Shop 4</strong>[{/if}]</h1>\r\n<p>This is a demo installation of <strong>OXID eShop 4</strong>. Don\'t worry when ordering: The goods will not be delivered nor charged. The displayed products and prices are solely tended to show the comprehensive functionality of the shopping cart system.</p>\r\n<div><strong>Have fun testing!</strong></div>\r\n<div><strong>Your OXID eSales team</strong></div>\r\n<p>&nbsp; </p>\r\n<p><strong>Notice for the shop administrator:</strong></p>\r\n<p>Update this text in the admin area. Choose from admin menu: <em>Customer Info -&gt; CMS Pages -&gt; start.tpl welcome text</em></p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('ad542e49ae50c60f0.64307543','oxuserorderemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung','Vielen Dank fÃ¼r Ihre Bestellung!<br>\r\n<br>\r\nNachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.<br>\r\nBei Fragen sind wir jederzeit fÃ¼r Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }]!<br>\r\n<br>','your order','Thank you for your order!<br />\r\n<br />\r\nBelow, we have listed your order.<br />\r\nIf you have any questions, don\'t hesitate to drop us an e-mail [{ $shop->oxshops__oxorderemail->value }]!<br />\r\n<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('84a42e66105998a86.14045828','oxuserorderemailend','oxbaseshop',1,0,1,1,'','Ihre Bestellung Abschluss','<div align=\"left\">FÃ¼gen Sie hier Ihre Widerrufsbelehrung ein.</div>','your order terms','<p>Right to Withdrawal can be inserted here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('84a42e66123887821.29772527','oxuserorderemailendplain','oxbaseshop',1,0,1,1,'','Ihre Bestellung Abschluss Plain','FÃ¼gen Sie hier Ihre Widerrufsbelehrung ein.','your order terms plain','<p>Right to Withdrawal can be inserted here.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('c8d45408c08bbaf79.09887022','oxuserordernpemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung (FremdlÃ¤nder)','<div>Vielen Dank fÃ¼r Ihre Bestellung!</div>\r\n<p><strong><span style=\"color: #ff0000\">Hinweis:</span></strong> Derzeit ist uns keine Versandmethode fÃ¼r dieses Land bekannt. Wir werden versuchen, Versandmethoden zu finden und Sie Ã¼ber das Ergebnis unter Angabe der Versandkosten informieren. </p>Bei Fragen sind wir jederzeit fÃ¼r Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }]! <br />\r\n<br />','your order (other country)','<p>Thank you for your order!</p>\r\n<p><strong><span style=\"color: #ff0000\">Information:</span></strong> Currently, there is no shipping method defined for your country. We will find a method to deliver the goods you purchased and will inform you as soon as possible.</p>\r\n<p>If you have any requests, don\'t hesitate to contact us! [{ $shop->oxshops__oxorderemail->value }]</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('c8d45408c5c39ea22.75925645','oxuserordernpplainemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung (FremdlÃ¤nder) Plain','Vielen Dank fÃ¼r Ihre Bestellung!\r\n\r\nHinweis: Derzeit ist uns keine Versandmethode fÃ¼r dieses Land bekannt. Wir werden versuchen, Versandmethoden zu finden und Sie Ã¼ber das Ergebnis unter Angabe der Versandkosten informieren.\r\n\r\nBei Fragen sind wir jederzeit fÃ¼r Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }]!','your order plain (other country)','Thank you for your order!\r\nInformation: Currently, there is no shipping method defined for your country. We will find a method to deliver the goods you purchased and will inform you as soon as possible.\r\n\r\nIf you have any requests don\'t hesitate to contact us! [{ $shop->oxshops__oxorderemail->value }]',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49b08c65017.19848749','oxuserorderplainemail','oxbaseshop',1,0,1,1,'','Ihre Bestellung Plain','Vielen Dank fÃ¼r Ihre Bestellung!\r\n\r\nNachfolgend haben wir zur Kontrolle Ihre Bestellung noch einmal aufgelistet.\r\nBei Fragen sind wir jederzeit fÃ¼r Sie da: Schreiben Sie einfach an [{ $shop->oxshops__oxorderemail->value }]!','your order plain','Thank you for your order!\r\n\r\nBelow we have listed your order.\r\nIf you have any questions, don\'t hesitate to drop us an e-mail [{ $shop->oxshops__oxorderemail->value }]!',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e49541c1add','oxupdatepassinfoemail','oxbaseshop',1,0,1,1,'','Ihr Passwort im eShop','Hallo [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],\r\n<br /><br />\r\nÃ¶ffnen Sie den folgenden Link, um ein neues Passwort fÃ¼r [{ $shop->oxshops__oxname->value }] einzurichten:\r\n<br /><br />\r\n<a href=\"[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]\">[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]</a>\r\n<br /><br />\r\nDiesen Link kÃ¶nnen Sie innerhalb der nÃ¤chsten [{ $user->getUpdateLinkTerm()/3600 }] Stunden aufrufen.\r\n<br /><br />\r\nIhr [{ $shop->oxshops__oxname->value }] Team\r\n<br />','password update info','Hello [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }],<br />\r\n<br />\r\nfollow this link to generate a new password for [{ $shop->oxshops__oxname->value }]:<br />\r\n<br /><a href=\"[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]\">[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]</a><br />\r\n<br />\r\nYou can use this link within the next [{ $user->getUpdateLinkTerm()/3600 }] hours.<br />\r\n<br />\r\nYour [{ $shop->oxshops__oxname->value }] team<br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('ad542e495c392c6e','oxupdatepassinfoplainemail','oxbaseshop',1,0,1,1,'','Ihr Passwort im eShop Plain','Hallo [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }],\r\n\r\nÃ¶ffnen Sie den folgenden Link, um ein neues Passwort fÃ¼r [{ $shop->oxshops__oxname->getRawValue() }] einzurichten:\r\n\r\n[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]\r\n\r\nDiesen Link kÃ¶nnen Sie innerhalb der nÃ¤chsten [{ $user->getUpdateLinkTerm()/3600 }] Stunden aufrufen.\r\n\r\nIhr [{ $shop->oxshops__oxname->getRawValue() }] Team','password update info plain','Hello [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }],\r\n\r\nfollow this link to generate a new password for [{ $shop->oxshops__oxname->getRawValue() }]:\r\n\r\n[{ $oViewConf->getBaseDir() }]index.php?cl=forgotpwd&amp;uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&amp;shp=[{ $shop->oxshops__oxid->value }]\r\n\r\nYou can use this link within the next [{ $user->getUpdateLinkTerm()/3600 }] hours.\r\n\r\nYour [{ $shop->oxshops__oxname->getRawValue() }] team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('460f3d25a752eeca8f8dbd66d04277c1','oxregisteraltemail','oxbaseshop',1,0,1,1,'','Alternative E-Mail zur Registrierung HTML','Hallo [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }], <br />\r\n<br />\r\n<p>\r\ndanke fÃ¼r die Registrierung im [{ $shop->oxshops__oxname->value }]!</p>\r\nVon jetzt an kÃ¶nnen Sie sich mit Ihrer E-Mail-Adresse <strong>[{ $user->oxuser__oxusername->value }]</strong>.<br />\r\n<br />\r\nFolgen Sie diesem Link, um die Registrierung zu bestÃ¤tigen:<br />\r\n<br /><a href=\"[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]\">[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]</a><br />\r\n<br />\r\nSie kÃ¶nnen diesen Link in den nÃ¤chsten [{ $user->getUpdateLinkTerm()/3600 }] Stunden verwenden.<br />\r\n<br /><br />\r\nIhr Team vom [{ $shop->oxshops__oxname->value }]','Alternative Registration Email HTML','Hello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->value }] [{ $user->oxuser__oxlname->value }], <br />\r\n<br />\r\nthanks for your registration at [{ $shop->oxshops__oxname->value }]!<br />\r\nFrom now on, you can log in with your email <strong>[{ $user->oxuser__oxusername->value }]</strong>.<br />\r\n<br />\r\nFollow this link to confirm your registration:<br />\r\n<br /><a href=\"[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]\">[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId()}]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]</a><br />\r\n<br />\r\nYou can use this link within the next [{ $user->getUpdateLinkTerm()/3600 }] hours.<br />\r\n<br />\r\n<br />\r\nYour [{ $shop->oxshops__oxname->value }] team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('460273f2ae78b9c40c536a1c331317ee','oxregisterplainaltemail','oxbaseshop',1,0,1,1,'','Alternative E-Mail zur Registrierung PLAIN','Hallo [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }],\r\n\r\ndanke fÃ¼r die Registrierung im [{ $shop->oxshops__oxname->getRawValue() }]!\r\nVon jetzt an kÃ¶nnen Sie sich mit Ihrer E-Mail-Adresse [{ $user->oxuser__oxusername->value }].\r\n\r\nFolgen Sie diesem Link, um die Registrierung zu bestÃ¤tigen:\r\n[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]\r\n\r\nSie kÃ¶nnen diesen Link in den nÃ¤chsten [{ $user->getUpdateLinkTerm()/3600 }] Stunden verwenden.</p>\r\n\r\n\r\nIhr Team vom [{ $shop->oxshops__oxname->getRawValue() }]','Alternative Registration Email PLAIN','Hello, [{ $user->oxuser__oxsal->value|oxmultilangsal }] [{ $user->oxuser__oxfname->getRawValue() }] [{ $user->oxuser__oxlname->getRawValue() }],\r\n\r\nthanks for your registration at [{ $shop->oxshops__oxname->getRawValue() }]!\r\nFrom now on, you can log in with your email [{ $user->oxuser__oxusername->value }].\r\n\r\nFollow this link to confirm your registration:\r\n[{ $oViewConf->getBaseDir() }]index.php?cl=register&fnc=confirmRegistration&uid=[{ $user->getUpdateId() }]&amp;lang=[{ $oViewConf->getActLanguageId() }]&shp=[{ $shop->oxshops__oxid->value }]\r\n\r\nYou can use this link within the next [{ $user->getUpdateLinkTerm()/3600 }] hours.<br />\r\n\r\n\r\nYour [{ $shop->oxshops__oxname->getRawValue() }] team',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_EMAILS','','2015-02-03 19:39:05'),('220404cee0caf470e227c1c9f1ec4ae2','oxrighttocancellegend','oxbaseshop',1,0,1,1,'','AGB und Widerrufsrecht','[{oxifcontent ident=\"oxagb\" object=\"oCont\"}]\r\n    Ich habe die <a id=\"test_OrderOpenAGBBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">AGB</a> gelesen und erklÃ¤re mich mit ihnen einverstanden.&nbsp;\r\n[{/oxifcontent}]\r\n[{oxifcontent ident=\"oxrightofwithdrawal\" object=\"oCont\"}]\r\n    Ich wurde Ã¼ber mein <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">[{ $oCont->oxcontents__oxtitle->value }]</a> informiert.\r\n[{/oxifcontent}]','Terms and Conditions and Right to Withdrawal','[{oxifcontent ident=\"oxagb\" object=\"oCont\"}] I agree to the <a id=\"test_OrderOpenAGBBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">Terms and Conditions</a>.&nbsp;\r\n[{/oxifcontent}]\r\n[{oxifcontent ident=\"oxrightofwithdrawal\" object=\"oCont\"}]\r\n    I have been informed about my <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">[{ $oCont->oxcontents__oxtitle->value }]</a>.\r\n[{/oxifcontent}]',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('c4241316b2e5c1966.96997011','oxhelpalist','oxbaseshop',1,0,1,1,'','Hilfe - Die Produktliste','<p>Hier kÃ¶nnen zusÃ¤tzliche Informationen, weiterfÃ¼hrende Links, Bedienungshinweise etc. fÃ¼r die Hilfe-Funktion in den <em>Produktlisten</em> eingefÃ¼gt werden. </p>','Help - Product List','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on <em>product pages</em>.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('c4241316b2e5c1966.96997012','oxhelpdefault','oxbaseshop',1,0,1,1,'','Hilfe - Main','<p>Hier kÃ¶nnen zusÃ¤tzliche Informationen, weiterfÃ¼hrende Links, Bedienungshinweise etc. fÃ¼r die Hilfe-Funktion in der <em>Kategorieansicht</em> eingefÃ¼gt werden. </p>','Help - Main','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on <em>category pages</em>.</p>',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('c4241316b2e5c1966.96997013','oxhelpstart','oxbaseshop',1,0,1,1,'','Hilfe - Die Startseite','<p>Hier kÃ¶nnen zusÃ¤tzliche Informationen, weiterfÃ¼hrende Links, Bedienungshinweise etc. fÃ¼r die Hilfe-Funktion auf der <em>Startseite</em> eingefÃ¼gt werden. </p>\r\n<p>&nbsp;</p>','Help - Start page','<p>Here, you can insert additional information, further links, user manual etc. for the &quot;Help&quot;-function on the <em>start page</em>.</p><br />',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('220404cee0caf470e227c1c9f1ec4ae3','oxrighttocancellegend2','oxbaseshop',1,0,1,1,'','AGB und Widerrufsrecht','[{oxifcontent ident=\"oxagb\" object=\"oCont\"}]\r\n    Es gelten unsere <a rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">Allgemeinen GeschÃ¤ftsbedingungen</a>.&nbsp;\r\n[{/oxifcontent}]\r\n[{oxifcontent ident=\"oxrightofwithdrawal\" object=\"oCont\"}]\r\n    Hier finden Sie <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">Einzelheiten zum Widerrufsrecht</a>.\r\n[{/oxifcontent}]','Terms and Conditions and Right to Withdrawal','[{oxifcontent ident=\"oxagb\" object=\"oCont\"}] Our general <a rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'agb_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\" class=\"fontunderline\">terms and conditions</a> apply.&nbsp;\r\n[{/oxifcontent}]\r\n[{oxifcontent ident=\"oxrightofwithdrawal\" object=\"oCont\"}]\r\n    Read details about  <a id=\"test_OrderOpenWithdrawalBottom\" rel=\"nofollow\" href=\"[{ $oCont->getLink() }]\" onclick=\"window.open(\'[{ $oCont->getLink()|oxaddparams:\"plain=1\"}]\', \'rightofwithdrawal_popup\', \'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400\');return false;\">right of withdrawal</a>.\r\n[{/oxifcontent}]',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('d74fdc1ed22a0d469bdcc5f003ca6575','oxregistrationdescription','oxbaseshop',1,0,1,1,'','Registration Description','<p>Mit einem persÃ¶nlichen Kundenkonto haben Sie folgende Vorteile:<br />\r\n - Verwaltung der Lieferadressen<br />\r\n - PrÃ¼fung des Bestellstatus<br />\r\n - Bestellhistorie<br />\r\n - persÃ¶nlicher Merkzettel<br />\r\n - persÃ¶nliche Wunschliste<br />\r\n - Newsletter-Verwaltung<br />\r\n - Sonder- und Rabattaktionen</p>','Registration Description','<p>A customer with an account has advantages like:<br />\r\n - Administration of shipping addresses<br />\r\n - Check order status<br />\r\n - Order History<br />\r\n - Personal Wish List<br />\r\n - Personal Gift Registry<br />\r\n - Newsletter subscription<br />\r\n - Special offers and discounts</p>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('5a8956e3105302bcc65c82044d863b81','oxfacebookenableinfotext','oxbaseshop',1,0,1,1,'','Facebook enable infotext','Hier kÃ¶nnen Informationen zur Ãbermittlung personenbezogener Daten an Facebook hinterlegt werden.<br />\r\n<br />Bei der Nutzung der Facebook Plugins wird eine Verbindung zu Facebook hergestellt, damit Sie Inhalte mit anderen Usern teilen kÃ¶nnen. Sollten Sie beim Besuch des Online-Shops die Plugins nutzen und gleichzeitig bei Facebook eingeloggt sein, werden personenbezogene Daten automatisch an Facebook Ã¼bermittelt. Der Umfang der Datenerhebung sowie die weitere Verarbeitung und Nutzung der Daten kann in den <a href=\"http://www.facebook.com/policy.php\" target=\"_blank\">Datenschutzhinweisen von Facebook</a> nachgelesen und individuell konfiguriert werden.','Facebook enable infotext','Here you can leave information about the transmission of personal data to Facebook.<br />\r\n<br />While using Facebook plug-ins, a connection is established enabling the share of content with other users. Using plug-ins while browsing through the online shop being logged in on Facebook at the same time, your personal data is automatically transmitted to Facebook. You can find more information about collecting, using and processing of your personal data on <a href=\"http://www.facebook.com/policy.php\" target=\"_blank\">Facebook\'s Privacy Policy</a>.',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('d0f7ac8b29909908dc20d854224944fe','oxnopaymentmethod','oxbaseshop',1,0,1,1,'','No payment method text','<p>Derzeit ist keine Versandart fÃ¼r dieses Land\r\ndefiniert.</p>\r\n<p>Wir werden versuchen, LiefermÃ¶glichkeiten zu\r\nfinden und Sie Ã¼ber die Versandkosten informieren.</p>','No payment method text','<p>Currently we have no shipping method set up\r\nfor this country.</p>\r\n<p>We are aiming to find a possible delivery\r\nmethod and we will inform you as soon as possible via e-mail about the result,\r\nincluding further information about delivery costs.</p>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('4a63033aa27409f15484340011e74e55','oxcookiesexplanation','oxbaseshop',1,0,1,1,'','Cookies Explanation','Sie haben sich entschieden, keine Cookies von unserem Online-Shop zu akzeptieren. Die Cookies wurden gelÃ¶scht. Sie kÃ¶nnen in den Einstellungen Ihres Browsers die Verwendung von Cookies deaktivieren und den Online-Shop mit einigen funktionellen EinschrÃ¤nkungen nutzen. Sie kÃ¶nnen auch zurÃ¼ck zum Shop gehen, ohne die Einstellungen zu Ã¤ndern, und den vollen Funktionsumfang des Online-Shops genieÃen.<br />\r\n<br />Informationen zu Cookies auf Wikipedia: <a href=\"http://de.wikipedia.org/wiki/HTTP-Cookie\"><strong>http://de.wikipedia.org/wiki/HTTP-Cookie</strong></a>','Cookies Explanation','You have decided to not accept cookies from our online shop. The cookies have been removed. You can deactivate the usage of cookies in the settings of your browser and visit the online shop with some functional limitations. You can also return to the shop without changing the browser settings and enjoy the full functionality.<br />\r\n<br />Information about cookies at Wikipedia: <a href=\"http://en.wikipedia.org/wiki/HTTP_cookie\"><strong>http://en.wikipedia.org/wiki/HTTP_cookie</strong></a>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('c402842cf0e2760c0875c1a74c4177f3','oxtsprotectiontext','oxbaseshop',1,0,1,1,'','Trusted shops protection text','<p>Der Trusted Shops KÃ¤uferschutz sichert Ihren Online-Kauf ab. Mit der Ãbermittlung und <a href=\"http://www.trustedshops.com/shop/data_privacy.php?shop_id=[{$oView->getTSExcellenceId()}]\" target=\"_blank\">Speicherung</a>\r\nmeiner E-Mail-Adresse zur Abwicklung des KÃ¤uferschutzes durch Trusted Shops bin ich einverstanden. <a href=\"http://www.trustedshops.com/shop/protection_conditions.php?shop_id=[{$oView->getTSExcellenceId()}]\" target=\"_blank\">Bedingungen</a> fÃ¼r den KÃ¤uferschutz.</p>','Trusted shops protection text','<p>The Trusted Shops buyer protection secures your online purchase. I agree with the transfer and <a href=\"http://www.trustedshops.com/shop/data_privacy.php?shop_id=[{$oView->getTSExcellenceId()}]\" target=\"_blank\">saving</a>\r\nof my e-mail address for the buyer protection handling by Trusted Shops. <a href=\"http://www.trustedshops.com/shop/protection_conditions.php?shop_id=[{$oView->getTSExcellenceId()}]\" target=\"_blank\">Conditions</a> for the buyer protection.</p>',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('2ed0ea12d74ab5bb3b128793bc5dbab5','oxtsinternationalfees','oxbaseshop',1,0,1,1,'','Trusted shops international fees text','Bei Lieferung ins Nicht-EU-Ausland kÃ¶nnen zusÃ¤tzlich ZÃ¶lle, Steuern und GebÃ¼hren anfallen','Trusted shops international fees text','Delivery to non-EU countries may cause additional custom, taxes and fees',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('f240baaafdf6930a88771197df2116c3','oxtscodmessage','oxbaseshop',1,0,1,1,'','Trusted shops cash on delivery message','Zzgl. 2,- EUR fÃ¼r die GeldÃ¼bermittlung, die der Zusteller vor Ort erhebt','Trusted shops cash on delivery message','Plus 2,- EUR for money transfer that will be collected on site by messenger',0,'','',0,'','','30e44ab83fdee7564.23264141','','','2015-02-03 19:39:05'),('220404cee0caf470e227c1c9f1ec4aL3','oxdownloadableproductsagreement','oxbaseshop',1,0,1,1,'','FÃ¼r digitale Inhalte','Ja, ich mÃ¶chte sofort Zugang zu dem digitalen Inhalt und weiÃ, dass mein Widerrufsrecht mit dem Zugang erlischt.','For the supply of digital content','I want immediate access to the digital content and I acknowledge that thereby I lose my right to cancel once the service has begun.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05'),('220404cee0caf470e227c1c9f1ec4aL4','oxserviceproductsagreement','oxbaseshop',1,0,1,1,'','FÃ¼r Dienstleistungen','Ja, bitte beginnen Sie sofort mit der Dienstleistung. Mein Widerrufsrecht erlischt mit vollstÃ¤ndiger AusfÃ¼hrung.','For service contracts','I agree to the starting of the service and I acknowledge that I lose my right to cancel once the service has been fully performed.',1,'','',1,'','','30e44ab83fdee7564.23264141','CMSFOLDER_USERINFO','','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcounters`
--

DROP TABLE IF EXISTS `oxcounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcounters` (
  `OXIDENT` char(32) NOT NULL COMMENT 'Counter id',
  `OXCOUNT` int(11) NOT NULL COMMENT 'Counted number',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop counters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcounters`
--

LOCK TABLES `oxcounters` WRITE;
/*!40000 ALTER TABLE `oxcounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxcounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxcountry`
--

DROP TABLE IF EXISTS `oxcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxcountry` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Country id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXISOALPHA2` char(2) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 alpha-2',
  `OXISOALPHA3` char(3) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 alpha-3',
  `OXUNNUM3` char(3) NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 numeric',
  `OXVATINPREFIX` char(2) NOT NULL DEFAULT '' COMMENT 'VAT identification number prefix',
  `OXORDER` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXSHORTDESC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXLONGDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Long description (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(128) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(128) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(128) NOT NULL DEFAULT '',
  `OXLONGDESC_1` varchar(255) NOT NULL,
  `OXLONGDESC_2` varchar(255) NOT NULL,
  `OXLONGDESC_3` varchar(255) NOT NULL,
  `OXVATSTATUS` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Vat status: 0 - Do not bill VAT, 1 - Do not bill VAT only if provided valid VAT ID',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Countries list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxcountry`
--

LOCK TABLES `oxcountry` WRITE;
/*!40000 ALTER TABLE `oxcountry` DISABLE KEYS */;
INSERT INTO `oxcountry` VALUES ('2db455824e4a19cc7.14731328',0,'Anderes Land','','','','',10000,'','Select this if you can not find your country.','Other country','','','','','','Select this if you can not find your country.','','',0,'2015-02-03 19:39:05'),('a7c40f631fc920687.20179984',1,'Deutschland','DE','DEU','276','DE',9999,'EU1','','Germany','','','EU1','','','','','',1,'2015-02-03 19:39:05'),('a7c40f6320aeb2ec2.72885259',0,'Ãsterreich','AT','AUT','40','AT',9999,'EU1','','Austria','','','EU1','','','','','',1,'2015-02-03 19:39:05'),('a7c40f6321c6f6109.43859248',0,'Schweiz','CH','CHE','756','CH',9999,'EU1','','Switzerland','','','EU1','','','','','',0,'2015-02-03 19:39:05'),('a7c40f6322d842ae3.83331920',0,'Liechtenstein','LI','LIE','438','LI',9999,'EU1','','Liechtenstein','','','EU1','','','','','',0,'2015-02-03 19:39:05'),('a7c40f6323c4bfb36.59919433',0,'Italien','IT','ITA','380','IT',9999,'EU1','','Italy','','','EU1','','','','','',1,'2015-02-03 19:39:05'),('a7c40f63264309e05.58576680',0,'Luxemburg','LU','LUX','442','LU',9999,'EU1','','Luxembourg','','','EU1','','','','','',1,'2015-02-03 19:39:05'),('a7c40f63272a57296.32117580',0,'Frankreich','FR','FRA','250','FR',9999,'EU1','','France','','','EU1','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632848c5217.53322339',0,'Schweden','SE','SWE','752','SE',9999,'EU2','','Sweden','','','EU2','','','','','',1,'2015-02-03 19:39:05'),('a7c40f63293c19d65.37472814',0,'Finnland','FI','FIN','246','FI',9999,'EU2','','Finland','','','EU2','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632a0804ab5.18804076',0,'Vereinigtes KÃ¶nigreich','GB','GBR','826','GB',9999,'EU2','','United Kingdom','','','EU2','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632be4237c2.48517912',0,'Irland','IE','IRL','372','IE',9999,'EU2','','Ireland','','','EU2','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632cdd63c52.64272623',0,'Niederlande','NL','NLD','528','NL',9999,'EU2','','Netherlands','','','EU2','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632e04633c9.47194042',0,'Belgien','BE','BEL','56','BE',9999,'Rest EuropÃ¤ische Union','','Belgium','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('a7c40f632f65bd8e2.84963272',0,'Portugal','PT','PRT','620','PT',9999,'Rest EuropÃ¤ische Union','','Portugal','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('a7c40f633038cd578.22975442',0,'Spanien','ES','ESP','724','ES',9999,'Rest EuropÃ¤ische Union','','Spain','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('a7c40f633114e8fc6.25257477',0,'Griechenland','GR','GRC','300','EL',9999,'Rest EuropÃ¤ische Union','','Greece','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('8f241f11095306451.36998225',0,'Afghanistan','AF','AFG','4','AF',9999,'Rest Welt','','Afghanistan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953265a5.25286134',0,'Albanien','AL','ALB','8','AL',9999,'Rest Europa','','Albania','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109533b943.50287900',0,'Algerien','DZ','DZA','12','DZ',9999,'Rest Welt','','Algeria','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109534f8c7.80349931',0,'Amerikanisch Samoa','AS','ASM','16','AS',9999,'Rest Welt','','American Samoa','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095363464.89657222',0,'Andorra','AD','AND','20','AD',9999,'Europa','','Andorra','','','Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095377d33.28678901',0,'Angola','AO','AGO','24','AO',9999,'Rest Welt','','Angola','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095392e41.74397491',0,'Anguilla','AI','AIA','660','AI',9999,'Rest Welt','','Anguilla','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953a8d10.29474848',0,'Antarktis','AQ','ATA','10','AQ',9999,'Rest Welt','','Antarctica','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953be8f2.56248134',0,'Antigua und Barbuda','AG','ATG','28','AG',9999,'Rest Welt','','Antigua and Barbuda','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953d2fb0.54260547',0,'Argentinien','AR','ARG','32','AR',9999,'Rest Welt','','Argentina','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953e7993.88180360',0,'Armenien','AM','ARM','51','AM',9999,'Rest Europa','','Armenia','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f110953facc6.31621036',0,'Aruba','AW','ABW','533','AW',9999,'Rest Welt','','Aruba','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095410f38.37165361',0,'Australien','AU','AUS','36','AU',9999,'Rest Welt','','Australia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109543cf47.17877015',0,'Aserbaidschan','AZ','AZE','31','AZ',9999,'Rest Welt','','Azerbaijan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095451379.72078871',0,'Bahamas','BS','BHS','44','BS',9999,'Rest Welt','','Bahamas','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110954662e3.27051654',0,'Bahrain','BH','BHR','48','BH',9999,'Welt','','Bahrain','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109547ae49.60154431',0,'Bangladesch','BD','BGD','50','BD',9999,'Rest Welt','','Bangladesh','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095497083.21181725',0,'Barbados','BB','BRB','52','BB',9999,'Rest Welt','','Barbados','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110954ac5b9.63105203',0,'WeiÃrussland','BY','BLR','112','BY',9999,'Rest Europa','','Belarus','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f110954d3621.45362515',0,'Belize','BZ','BLZ','84','BZ',9999,'Rest Welt','','Belize','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110954ea065.41455848',0,'Benin','BJ','BEN','204','BJ',9999,'Rest Welt','','Benin','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110954fee13.50011948',0,'Bermuda','BM','BMU','60','BM',9999,'Rest Welt','','Bermuda','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095513ca0.75349731',0,'Bhutan','BT','BTN','64','BT',9999,'Rest Welt','','Bhutan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109552aee2.91004965',0,'Bolivien','BO','BOL','68','BO',9999,'Rest Welt','','Bolivia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109553f902.06960438',0,'Bosnien und Herzegowina','BA','BIH','70','BA',9999,'Rest Europa','','Bosnia and Herzegovina','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095554834.54199483',0,'Botsuana','BW','BWA','72','BW',9999,'Rest Welt','','Botswana','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109556dd57.84292282',0,'Bouvetinsel','BV','BVT','74','BV',9999,'Rest Welt','','Bouvet Island','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095592407.89986143',0,'Brasilien','BR','BRA','76','BR',9999,'Rest Welt','','Brazil','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110955a7644.68859180',0,'Britisches Territorium im Indischen Ozean','IO','IOT','86','IO',9999,'Rest Welt','','British Indian Ocean Territory','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110955bde61.63256042',0,'Brunei Darussalam','BN','BRN','96','BN',9999,'Rest Welt','','Brunei Darussalam','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110955d3260.55487539',0,'Bulgarien','BG','BGR','100','BG',9999,'Rest Europa','','Bulgaria','','','Rest Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110955ea7c8.36762654',0,'Burkina Faso','BF','BFA','854','BF',9999,'Rest Welt','','Burkina Faso','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956004d5.11534182',0,'Burundi','BI','BDI','108','BI',9999,'Rest Welt','','Burundi','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956175f9.81682035',0,'Kambodscha','KH','KHM','116','KH',9999,'Rest Welt','','Cambodia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095632828.20263574',0,'Kamerun','CM','CMR','120','CM',9999,'Rest Welt','','Cameroon','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095649d18.02676059',0,'Kanada','CA','CAN','124','CA',9999,'Welt','','Canada','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109565e671.48876354',0,'Kap Verde','CV','CPV','132','CV',9999,'Rest Welt','','Cape Verde','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095673248.50405852',0,'Kaimaninseln','KY','CYM','136','KY',9999,'Rest Welt','','Cayman Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109568a509.03566030',0,'Zentralafrikanische Republik','CF','CAF','140','CF',9999,'Rest Welt','','Central African Republic','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109569d4c2.42800039',0,'Tschad','TD','TCD','148','TD',9999,'Rest Welt','','Chad','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956b3ea7.11168270',0,'Chile','CL','CHL','152','CL',9999,'Rest Welt','','Chile','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956c8860.37981845',0,'China','CN','CHN','156','CN',9999,'Rest Welt','','China','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956df6b2.52283428',0,'Weihnachtsinsel','CX','CXR','162','CX',9999,'Rest Welt','','Christmas Island','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110956f54b4.26327849',0,'Kokosinseln (Keelinginseln)','CC','CCK','166','CC',9999,'Rest Welt','','Cocos (Keeling) Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109570a1e3.69772638',0,'Kolumbien','CO','COL','170','CO',9999,'Rest Welt','','Colombia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109571f018.46251535',0,'Komoren','KM','COM','174','KM',9999,'Rest Welt','','Comoros','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095732184.72771986',0,'Kongo','CG','COG','178','CG',9999,'Rest Welt','','Congo','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095746a92.94878441',0,'Cookinseln','CK','COK','184','CK',9999,'Rest Welt','','Cook Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109575d708.20084150',0,'Costa Rica','CR','CRI','188','CR',9999,'Rest Welt','','Costa Rica','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095771f76.87904122',0,'Cote dÂ´Ivoire','CI','CIV','384','CI',9999,'Rest Welt','','Cote d\'Ivoire','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095789a04.65154246',0,'Kroatien','HR','HRV','191','HR',9999,'Rest EuropÃ¤ische Union','','Croatia','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('8f241f1109579ef49.91803242',0,'Kuba','CU','CUB','192','CU',9999,'Rest Welt','','Cuba','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110957b6896.52725150',0,'Zypern','CY','CYP','196','CY',9999,'Rest Europa','','Cyprus','','','Rest Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110957cb457.97820918',0,'Tschechische Republik','CZ','CZE','203','CZ',9999,'Europa','','Czech Republic','','','Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110957e6ef8.56458418',0,'DÃ¤nemark','DK','DNK','208','DK',9999,'Europa','','Denmark','','','Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110957fd356.02918645',0,'Dschibuti','DJ','DJI','262','DJ',9999,'Rest Welt','','Djibouti','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095811ea5.84717844',0,'Dominica','DM','DMA','212','DM',9999,'Rest Welt','','Dominica','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095825bf2.61063355',0,'Dominikanische Republik','DO','DOM','214','DO',9999,'Rest Welt','','Dominican Republic','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095839323.86755169',0,'Timor-Leste','TL','TLS','626','TL',9999,'Rest Welt','','Timor-Leste','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109584d512.06663789',0,'Ecuador','EC','ECU','218','EC',9999,'Rest Welt','','Ecuador','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095861fb7.55278256',0,'Ãgypten','EG','EGY','818','EG',9999,'Welt','','Egypt','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110958736a9.06061237',0,'El Salvador','SV','SLV','222','SV',9999,'Rest Welt','','El Salvador','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109588d077.74284490',0,'Ãquatorialguinea','GQ','GNQ','226','GQ',9999,'Rest Welt','','Equatorial Guinea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110958a2216.38324531',0,'Eritrea','ER','ERI','232','ER',9999,'Rest Welt','','Eritrea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110958b69e4.93886171',0,'Estland','EE','EST','233','EE',9999,'Rest EuropÃ¤ische Union','','Estonia','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('8f241f110958caf67.08982313',0,'Ãthiopien','ET','ETH','210','ET',9999,'Rest Welt','','Ethiopia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110958e2cc3.90770249',0,'Falklandinseln (Malwinen)','FK','FLK','238','FK',9999,'Rest Welt','','Falkland Islands (Malvinas)','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110958f7ba4.96908065',0,'FÃ¤rÃ¶er','FO','FRO','234','FO',9999,'Rest Welt','','Faroe Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109590d226.07938729',0,'Fidschi','FJ','FJI','242','FJ',9999,'Rest Welt','','Fiji','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109594fcb1.79441780',0,'FranzÃ¶sisch Guiana','GF','GUF','254','GF',9999,'Rest Welt','','French Guiana','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959636f5.71476354',0,'FranzÃ¶sisch-Polynesien','PF','PYF','258','PF',9999,'Rest Welt','','French Polynesia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959784a3.34264829',0,'FranzÃ¶sische SÃ¼dgebiete','TF','ATF','260','TF',9999,'Rest Welt','','French Southern Territories','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095994cb6.59353392',0,'Gabun','GA','GAB','266','GA',9999,'Rest Welt','','Gabon','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959ace77.17379319',0,'Gambia','GM','GMB','270','GM',9999,'Rest Welt','','Gambia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959c2341.01830199',0,'Georgien','GE','GEO','268','GE',9999,'Rest Europa','','Georgia','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959e96b3.05752152',0,'Ghana','GH','GHA','288','GH',9999,'Rest Welt','','Ghana','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110959fdde0.68919405',0,'Gibraltar','GI','GIB','292','GI',9999,'Rest Welt','','Gibraltar','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a29f47.04102343',0,'GrÃ¶nland','GL','GRL','304','GL',9999,'Europa','','Greenland','','','Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a3f195.88886789',0,'Grenada','GD','GRD','308','GD',9999,'Rest Welt','','Grenada','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a52578.45413493',0,'Guadeloupe','GP','GLP','312','GP',9999,'Rest Welt','','Guadeloupe','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a717b3.68126681',0,'Guam','GU','GUM','316','GU',9999,'Rest Welt','','Guam','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a870a5.42235635',0,'Guatemala','GT','GTM','320','GT',9999,'Rest Welt','','Guatemala','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095a9bf82.19989557',0,'Guinea','GN','GIN','324','GN',9999,'Rest Welt','','Guinea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ab2b56.83049280',0,'Guinea-Bissau','GW','GNB','624','GW',9999,'Rest Welt','','Guinea-Bissau','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ac9d30.56640429',0,'Guyana','GY','GUY','328','GY',9999,'Rest Welt','','Guyana','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095aebb06.34405179',0,'Haiti','HT','HTI','332','HT',9999,'Rest Welt','','Haiti','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095aff2c3.98054755',0,'Heard Insel und McDonald Inseln','HM','HMD','334','HM',9999,'Rest Welt','','Heard Island And Mcdonald Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b13f57.56022305',0,'Honduras','HN','HND','340','HN',9999,'Rest Welt','','Honduras','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b29021.49657118',0,'Hong Kong','HK','HKG','344','HK',9999,'Rest Welt','','Hong Kong','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b3e016.98213173',0,'Ungarn','HU','HUN','348','HU',9999,'Rest Europa','','Hungary','','','Rest Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f11095b55846.26192602',0,'Island','IS','ISL','352','IS',9999,'Rest Europa','','Iceland','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b6bb86.01364904',0,'Indien','IN','IND','356','IN',9999,'Rest Welt','','India','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b80526.59927631',0,'Indonesien','ID','IDN','360','ID',9999,'Rest Welt','','Indonesia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095b94476.05195832',0,'Iran','IR','IRN','364','IR',9999,'Welt','','Iran','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095bad5b2.42645724',0,'Irak','IQ','IRQ','368','IQ',9999,'Welt','','Iraq','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095bd65e1.59459683',0,'Israel','IL','ISR','376','IL',9999,'Rest Europa','','Israel','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095bfe834.63390185',0,'Jamaika','JM','JAM','388','JM',9999,'Rest Welt','','Jamaica','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c11d43.73419747',0,'Japan','JP','JPN','392','JP',9999,'Rest Welt','','Japan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c2b304.75906962',0,'Jordanien','JO','JOR','400','JO',9999,'Rest Welt','','Jordan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c3e2d1.36714463',0,'Kasachstan','KZ','KAZ','398','KZ',9999,'Rest Europa','','Kazakhstan','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c5b8e8.66333679',0,'Kenia','KE','KEN','404','KE',9999,'Rest Welt','','Kenya','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c6e184.21450618',0,'Kiribati','KI','KIR','296','KI',9999,'Rest Welt','','Kiribati','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c87284.37982544',0,'Nordkorea','KP','PRK','408','KP',9999,'Rest Welt','','North Korea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095c9de64.01275726',0,'SÃ¼dkorea','KR','KOR','410','KR',9999,'Rest Welt','','South Korea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095cb1546.46652174',0,'Kuwait','KW','KWT','414','KW',9999,'Welt','','Kuwait','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095cc7ef5.28043767',0,'Kirgisistan','KG','KGZ','417','KG',9999,'Rest Welt','','Kyrgyzstan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095cdccd5.96388808',0,'Laos','LA','LAO','418','LA',9999,'Rest Welt','','Laos','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095cf2ea6.73925511',0,'Lettland','LV','LVA','428','LV',9999,'Rest EuropÃ¤ische Union','','Latvia','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('8f241f11095d07d87.58986129',0,'Libanon','LB','LBN','422','LB',9999,'Welt','','Lebanon','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095d1c9b2.21548132',0,'Lesotho','LS','LSO','426','LS',9999,'Rest Welt','','Lesotho','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095d2fd28.91858908',0,'Liberia','LR','LBR','430','LR',9999,'Welt','','Liberia','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095d46188.64679605',0,'Libyen','LY','LBY','434','LY',9999,'Rest Welt','','Libya','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095d6ffa8.86593236',0,'Litauen','LT','LTU','440','LT',9999,'Rest EuropÃ¤ische Union','','Lithuania','','','Rest of EU','','','','','',1,'2015-02-03 19:39:05'),('8f241f11095d9c1b2.13577033',0,'Macao','MO','MAC','446','MO',9999,'Rest Welt','','Macao','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095db2291.58912887',0,'Mazedonien','MK','MKD','807','MK',9999,'Rest Europa','','Macedonia','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095dccf17.06266806',0,'Madagaskar','MG','MDG','450','MG',9999,'Rest Welt','','Madagascar','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095de2119.60795833',0,'Malawi','MW','MWI','454','MW',9999,'Rest Welt','','Malawi','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095df78a8.44559506',0,'Malaysia','MY','MYS','458','MY',9999,'Rest Welt','','Malaysia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e0c6c9.43746477',0,'Malediven','MV','MDV','462','MV',9999,'Rest Welt','','Maldives','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e24006.17141715',0,'Mali','ML','MLI','466','ML',9999,'Rest Welt','','Mali','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e36eb3.69050509',0,'Malta','MT','MLT','470','MT',9999,'Rest Welt','','Malta','','','Rest World','','','','','',1,'2015-02-03 19:39:05'),('8f241f11095e4e338.26817244',0,'Marshallinseln','MH','MHL','584','MH',9999,'Rest Welt','','Marshall Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e631e1.29476484',0,'Martinique','MQ','MTQ','474','MQ',9999,'Rest Welt','','Martinique','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e7bff9.09518271',0,'Mauretanien','MR','MRT','478','MR',9999,'Rest Welt','','Mauritania','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095e90a81.01156393',0,'Mauritius','MU','MUS','480','MU',9999,'Rest Welt','','Mauritius','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ea6249.81474246',0,'Mayotte','YT','MYT','175','YT',9999,'Rest Welt','','Mayotte','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ebf3a6.86388577',0,'Mexiko','MX','MEX','484','MX',9999,'Rest Welt','','Mexico','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ed4902.49276197',0,'Mikronesien, FÃ¶derierte Staaten von','FM','FSM','583','FM',9999,'Rest Welt','','Micronesia, Federated States Of','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095ee9923.85175653',0,'Moldau','MD','MDA','498','MD',9999,'Rest Europa','','Moldova','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095f00d65.30318330',0,'Monaco','MC','MCO','492','MC',9999,'Europa','','Monaco','','','Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095f160c9.41059441',0,'Mongolei','MN','MNG','496','MN',9999,'Rest Welt','','Mongolia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11095f314f5.05830324',0,'Montserrat','MS','MSR','500','MS',9999,'Rest Welt','','Montserrat','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096006828.49285591',0,'Marokko','MA','MAR','504','MA',9999,'Welt','','Morocco','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109601b419.55269691',0,'Mosambik','MZ','MOZ','508','MZ',9999,'Rest Welt','','Mozambique','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096030af5.65449043',0,'Myanmar','MM','MMR','104','MM',9999,'Rest Welt','','Myanmar','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096046575.31382060',0,'Namibia','NA','NAM','516','NA',9999,'Rest Welt','','Namibia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109605b1f4.20574895',0,'Nauru','NR','NRU','520','NR',9999,'Rest Welt','','Nauru','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109607a9e7.03486450',0,'Nepal','NP','NPL','524','NP',9999,'Rest Welt','','Nepal','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110960aeb64.09757010',0,'NiederlÃ¤ndische Antillen','AN','ANT','530','AN',9999,'Rest Welt','','Netherlands Antilles','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110960c3e97.21901471',0,'Neukaledonien','NC','NCL','540','NC',9999,'Rest Welt','','New Caledonia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110960d8e58.96466103',0,'Neuseeland','NZ','NZL','554','NZ',9999,'Rest Welt','','New Zealand','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110960ec345.71805056',0,'Nicaragua','NI','NIC','558','NI',9999,'Rest Welt','','Nicaragua','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096101a79.70513227',0,'Niger','NE','NER','562','NE',9999,'Rest Welt','','Niger','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096116744.92008092',0,'Nigeria','NG','NGA','566','NG',9999,'Rest Welt','','Nigeria','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109612dc68.63806992',0,'Niue','NU','NIU','570','NU',9999,'Rest Welt','','Niue','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961442c2.82573898',0,'Norfolkinsel','NF','NFK','574','NF',9999,'Rest Welt','','Norfolk Island','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096162678.71164081',0,'NÃ¶rdliche Marianen','MP','MNP','580','MP',9999,'Rest Welt','','Northern Mariana Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096176795.61257067',0,'Norwegen','NO','NOR','578','NO',9999,'Rest Europa','','Norway','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109618d825.87661926',0,'Oman','OM','OMN','512','OM',9999,'Rest Welt','','Oman','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961a2401.59039740',0,'Pakistan','PK','PAK','586','PK',9999,'Rest Welt','','Pakistan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961b7729.14290490',0,'Palau','PW','PLW','585','PW',9999,'Rest Welt','','Palau','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961cc384.18166560',0,'Panama','PA','PAN','591','PA',9999,'Rest Welt','','Panama','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961e3538.78435307',0,'Papua-Neuguinea','PG','PNG','598','PG',9999,'Rest Welt','','Papua New Guinea','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110961f9d61.52794273',0,'Paraguay','PY','PRY','600','PY',9999,'Rest Welt','','Paraguay','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109620b245.16261506',0,'Peru','PE','PER','604','PE',9999,'Rest Welt','','Peru','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109621faf8.40135556',0,'Philippinen','PH','PHL','608','PH',9999,'Rest Welt','','Philippines','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096234d62.44125992',0,'Pitcairn','PN','PCN','612','PN',9999,'Rest Welt','','Pitcairn','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109624d3f8.50953605',0,'Polen','PL','POL','616','PL',9999,'Europa','','Poland','','','Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f11096279a22.50582479',0,'Puerto Rico','PR','PRI','630','PR',9999,'Rest Welt','','Puerto Rico','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109628f903.51478291',0,'Katar','QA','QAT','634','QA',9999,'Rest Welt','','Qatar','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110962a3ec5.65857240',0,'RÃ©union','RE','REU','638','RE',9999,'Rest Welt','','RÃ©union','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110962c3007.60363573',0,'RumÃ¤nien','RO','ROU','642','RO',9999,'Rest Europa','','Romania','','','Rest Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110962e40e6.75062153',0,'Russische FÃ¶deration','RU','RUS','643','RU',9999,'Rest Europa','','Russian Federation','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f110962f8615.93666560',0,'Ruanda','RW','RWA','646','RW',9999,'Rest Welt','','Rwanda','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110963177a7.49289900',0,'St. Kitts und Nevis','KN','KNA','659','KN',9999,'Rest Welt','','Saint Kitts and Nevis','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109632fab4.68646740',0,'St. Lucia','LC','LCA','662','LC',9999,'Rest Welt','','Saint Lucia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110963443c3.29598809',0,'St. Vincent und die Grenadinen','VC','VCT','670','VC',9999,'Rest Welt','','Saint Vincent and The Grenadines','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096359986.06476221',0,'Samoa','WS','WSM','882','WS',9999,'Rest Welt','','Samoa','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096375757.44126946',0,'San Marino','SM','SMR','674','SM',9999,'Europa','','San Marino','','','Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109639b8c4.57484984',0,'Sao Tome und Principe','ST','STP','678','ST',9999,'Rest Welt','','Sao Tome and Principe','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110963b9b20.41500709',0,'Saudi-Arabien','SA','SAU','682','SA',9999,'Welt','','Saudi Arabia','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110963d9962.36307144',0,'Senegal','SN','SEN','686','SN',9999,'Rest Welt','','Senegal','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110963f98d8.68428379',0,'Serbien','RS','SRB','688','RS',9999,'Rest Europa','','Serbia','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096418496.77253079',0,'Seychellen','SC','SYC','690','SC',9999,'Rest Welt','','Seychelles','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096436968.69551351',0,'Sierra Leone','SL','SLE','694','SL',9999,'Rest Welt','','Sierra Leone','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096456a48.79608805',0,'Singapur','SG','SGP','702','SG',9999,'Rest Welt','','Singapore','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109647a265.29938154',0,'Slowakei','SK','SVK','703','SK',9999,'Europa','','Slovakia','','','Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f11096497149.85116254',0,'Slowenien','SI','SVN','705','SI',9999,'Rest Europa','','Slovenia','','','Rest Europe','','','','','',1,'2015-02-03 19:39:05'),('8f241f110964b7bf9.49501835',0,'Salomonen','SB','SLB','90','SB',9999,'Rest Welt','','Solomon Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110964d5f29.11398308',0,'Somalia','SO','SOM','706','SO',9999,'Rest Welt','','Somalia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110964f2623.74976876',0,'SÃ¼dafrika','ZA','ZAF','710','ZA',9999,'Rest Welt','','South Africa','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096531330.03198083',0,'Sri Lanka','LK','LKA','144','LK',9999,'Rest Welt','','Sri Lanka','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109654dca4.99466434',0,'Saint Helena','SH','SHN','654','SH',9999,'Rest Welt','','Saint Helena','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109656cde9.10816078',0,'Saint Pierre und Miquelon','PM','SPM','666','PM',9999,'Rest Welt','','Saint Pierre and Miquelon','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109658cbe5.08293991',0,'Sudan','SD','SDN','736','SD',9999,'Rest Welt','','Sudan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110965c7347.75108681',0,'Suriname','SR','SUR','740','SR',9999,'Rest Welt','','Suriname','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110965eb7b7.26149742',0,'Svalbard und Jan Mayen','SJ','SJM','744','SJ',9999,'Rest Welt','','Svalbard and Jan Mayen','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109660c113.62780718',0,'Swasiland','SZ','SWZ','748','SZ',9999,'Rest Welt','','Swaziland','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109666b7f3.81435898',0,'Syrien','SY','SYR','760','SY',9999,'Rest Welt','','Syria','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096687ec7.58824735',0,'Republik China (Taiwan)','TW','TWN','158','TW',9999,'Rest Welt','','Taiwan, Province of China','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110966a54d1.43798997',0,'Tadschikistan','TJ','TJK','762','TJ',9999,'Rest Welt','','Tajikistan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110966c3a75.68297960',0,'Tansania','TZ','TZA','834','TZ',9999,'Rest Welt','','Tanzania','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096707e08.60512709',0,'Thailand','TH','THA','764','TH',9999,'Rest Welt','','Thailand','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110967241e1.34925220',0,'Togo','TG','TGO','768','TG',9999,'Rest Welt','','Togo','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096742565.72138875',0,'Tokelau','TK','TKL','772','TK',9999,'Rest Welt','','Tokelau','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096762b31.03069244',0,'Tonga','TO','TON','776','TO',9999,'Rest Welt','','Tonga','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109677ed23.84886671',0,'Trinidad und Tobago','TT','TTO','780','TT',9999,'Rest Welt','','Trinidad and Tobago','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109679d988.46004322',0,'Tunesien','TN','TUN','788','TN',9999,'Welt','','Tunisia','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110967bba40.88233204',0,'TÃ¼rkei','TR','TUR','792','TR',9999,'Rest Europa','','Turkey','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f110967d8f65.52699796',0,'Turkmenistan','TM','TKM','795','TM',9999,'Rest Welt','','Turkmenistan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110967f73f8.13141492',0,'Turks- und Caicosinseln','TC','TCA','796','TC',9999,'Rest Welt','','Turks and Caicos Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109680ec30.97426963',0,'Tuvalu','TV','TUV','798','TV',9999,'Rest Welt','','Tuvalu','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096823019.47846368',0,'Uganda','UG','UGA','800','UG',9999,'Rest Welt','','Uganda','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968391d2.37199812',0,'Ukraine','UA','UKR','804','UA',9999,'Rest Europa','','Ukraine','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109684bf15.63071279',0,'Vereinigte Arabische Emirate','AE','ARE','784','AE',9999,'Rest Welt','','United Arab Emirates','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096877ac0.98748826',0,'Vereinigte Staaten von Amerika','US','USA','840','US',9999,'Welt','','United States','','','World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096894977.41239553',0,'United States Minor Outlying Islands','UM','UMI','581','UM',9999,'Rest Welt','','United States Minor Outlying Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968a7cc9.56710143',0,'Uruguay','UY','URY','858','UY',9999,'Rest Welt','','Uruguay','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968bec45.44161857',0,'Usbekistan','UZ','UZB','860','UZ',9999,'Rest Welt','','Uzbekistan','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968d3f03.13630334',0,'Vanuatu','VU','VUT','548','VU',9999,'Rest Welt','','Vanuatu','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968ebc30.63792746',0,'Heiliger Stuhl (Vatikanstadt)','VA','VAT','336','VA',9999,'Europa','','Holy See (Vatican City State)','','','Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096902d92.14742486',0,'Venezuela','VE','VEN','862','VE',9999,'Rest Welt','','Venezuela','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096919d00.92534927',0,'Vietnam','VN','VNM','704','VN',9999,'Rest Welt','','Viet Nam','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109692fc04.15216034',0,'Britische Jungferninseln','VG','VGB','92','VG',9999,'Rest Welt','','Virgin Islands, British','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096944468.61956573',0,'Amerikanische Jungferninseln','VI','VIR','850','VI',9999,'Rest Welt','','Virgin Islands, U.S.','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110969598c8.76966113',0,'Wallis und Futuna','WF','WLF','876','WF',9999,'Rest Welt','','Wallis and Futuna','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109696e4e9.33006292',0,'Westsahara','EH','ESH','732','EH',9999,'Rest Welt','','Western Sahara','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096982354.73448958',0,'Jemen','YE','YEM','887','YE',9999,'Rest Welt','','Yemen','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('a7c40f632a0804ab5.18804099',0,'Ãland Inseln','AX','ALA','248','AX',9999,'Rest Welt','','Ãland Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110969c34a2.42564730',0,'Sambia','ZM','ZMB','894','ZM',9999,'Rest Welt','','Zambia','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110969da699.04185888',0,'Simbabwe','ZW','ZWE','716','ZW',9999,'Rest Welt','','Zimbabwe','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('56d308a822c18e106.3ba59048',0,'Montenegro','ME','MNE','499','ME',9999,'Rest Europa','','Montenegro','','','Rest Europe','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109575d708.20084199',0,'Kongo, Dem. Rep.','CD','COD','180','CD',9999,'Rest Welt','','Congo, The Democratic Republic Of The','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('56d308a822c18e106.3ba59099',0,'Guernsey','GG','GGY','831','GG',9999,'Rest Welt','','Guernsey','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096982354.73448999',0,'Isle of Man','IM','IMN','833','IM',9999,'Rest Welt','','Isle Of Man','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f11096944468.61956599',0,'Jersey','JE','JEY','832','JE',9999,'Rest Welt','','Jersey','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968ebc30.63792799',0,'PalÃ¤stinische Gebiete','PS','PSE','275','PS',9999,'Rest Welt','','Palestinian Territory, Occupied','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f110968a7cc9.56710199',0,'Saint-BarthÃ©lemy','BL','BLM','652','BL',9999,'Rest Welt','','Saint BarthÃ©lemy','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('a7c40f632f65bd8e2.84963299',0,'Saint-Martin','MF','MAF','663','MF',9999,'Rest Welt','','Saint Martin','','','Rest World','','','','','',0,'2015-02-03 19:39:05'),('8f241f1109533b943.50287999',0,'SÃ¼dgeorgien und die SÃ¼dlichen Sandwichinseln','GS','SGS','239','GS',9999,'Rest Welt','','South Georgia and The South Sandwich Islands','','','Rest World','','','','','',0,'2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxcountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdel2delset`
--

DROP TABLE IF EXISTS `oxdel2delset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdel2delset` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDELID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping cost rule id (oxdelivery)',
  `OXDELSETID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery method id (oxdeliveryset)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXDELID` (`OXDELID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between Shipping cost rules (oxdelivery) and delivery methods (oxdeliveryset)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdel2delset`
--

LOCK TABLES `oxdel2delset` WRITE;
/*!40000 ALTER TABLE `oxdel2delset` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdel2delset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdelivery`
--

DROP TABLE IF EXISTS `oxdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdelivery` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Delivery shipping cost rule id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXADDSUMTYPE` enum('%','abs') NOT NULL DEFAULT 'abs' COMMENT 'Price Surcharge/Reduction type (abs|%)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Price Surcharge/Reduction amount',
  `OXDELTYPE` enum('a','s','w','p') NOT NULL DEFAULT 'a' COMMENT 'Condition type: a - Amount, s - Size, w - Weight, p - Price',
  `OXPARAM` double NOT NULL DEFAULT '0' COMMENT 'Condition param from (e.g. amount from 1)',
  `OXPARAMEND` double NOT NULL DEFAULT '0' COMMENT 'Condition param to (e.g. amount to 10)',
  `OXFIXED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Calculation Rules: 0 - Once per Cart, 1 - Once for each different product, 2 - For each product',
  `OXSORT` int(11) NOT NULL DEFAULT '9999' COMMENT 'Order of Rules Processing',
  `OXFINALIZE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Do not run further rules if this rule is valid and is being run',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Delivery shipping cost rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdelivery`
--

LOCK TABLES `oxdelivery` WRITE;
/*!40000 ALTER TABLE `oxdelivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdeliveryset`
--

DROP TABLE IF EXISTS `oxdeliveryset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdeliveryset` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Delivery method id',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Delivery (shipping) methods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdeliveryset`
--

LOCK TABLES `oxdeliveryset` WRITE;
/*!40000 ALTER TABLE `oxdeliveryset` DISABLE KEYS */;
INSERT INTO `oxdeliveryset` VALUES ('oxidstandard','oxbaseshop',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Standard','Standard','','',10,'2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxdeliveryset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdiscount`
--

DROP TABLE IF EXISTS `oxdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxdiscount` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Discount id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL,
  `OXTITLE_2` varchar(128) NOT NULL,
  `OXTITLE_3` varchar(128) NOT NULL,
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Valid from specified amount of articles',
  `OXAMOUNTTO` double NOT NULL DEFAULT '999999' COMMENT 'Valid to specified amount of articles',
  `OXPRICETO` double NOT NULL DEFAULT '999999' COMMENT 'Valid to specified purchase price',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Valid from specified purchase price',
  `OXADDSUMTYPE` enum('%','abs','itm') NOT NULL DEFAULT '%' COMMENT 'Discount type (%,abs,itm)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Magnitude of the discount',
  `OXITMARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Free article id, that will be added as a discount',
  `OXITMAMOUNT` double NOT NULL DEFAULT '1' COMMENT 'The quantity of free article that will be added to basket with discounted article',
  `OXITMMULTIPLE` int(1) NOT NULL DEFAULT '0' COMMENT 'Should free article amount be multiplied by discounted item quantity in basket',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXACTIVEFROM` (`OXACTIVEFROM`),
  KEY `OXACTIVETO` (`OXACTIVETO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Article discounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdiscount`
--

LOCK TABLES `oxdiscount` WRITE;
/*!40000 ALTER TABLE `oxdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxfiles`
--

DROP TABLE IF EXISTS `oxfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxfiles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'File id',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (oxarticles)',
  `OXFILENAME` varchar(128) NOT NULL COMMENT 'Filename',
  `OXSTOREHASH` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed filename, used for file directory path creation',
  `OXPURCHASEDONLY` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Download is available only after purchase',
  `OXMAXDOWNLOADS` int(11) NOT NULL DEFAULT '-1' COMMENT 'Maximum count of downloads after order',
  `OXMAXUNREGDOWNLOADS` int(11) NOT NULL DEFAULT '-1' COMMENT 'Maximum count of downloads for not registered users after order',
  `OXLINKEXPTIME` int(11) NOT NULL DEFAULT '-1' COMMENT 'Expiration time of download link in hours',
  `OXDOWNLOADEXPTIME` int(11) NOT NULL DEFAULT '-1' COMMENT 'Expiration time of download link after the first download in hours',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`OXID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Files available for users to download';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxfiles`
--

LOCK TABLES `oxfiles` WRITE;
/*!40000 ALTER TABLE `oxfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxgbentries`
--

DROP TABLE IF EXISTS `oxgbentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxgbentries` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Entry id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXCONTENT` text NOT NULL COMMENT 'Content',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is active',
  `OXVIEWED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the entry was checked by admin',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Guestbook`s entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxgbentries`
--

LOCK TABLES `oxgbentries` WRITE;
/*!40000 ALTER TABLE `oxgbentries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxgbentries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxgroups`
--

DROP TABLE IF EXISTS `oxgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxgroups` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Group id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXTITLE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXTITLE_1` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(128) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(128) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxgroups`
--

LOCK TABLES `oxgroups` WRITE;
/*!40000 ALTER TABLE `oxgroups` DISABLE KEYS */;
INSERT INTO `oxgroups` VALUES ('oxidblacklist',1,'Blacklist','Blacklist','','','2015-02-03 19:39:05'),('oxidsmallcust',1,'Geringer Umsatz','Less Turnover','','','2015-02-03 19:39:05'),('oxidmiddlecust',1,'Mittlerer Umsatz','Medium Turnover','','','2015-02-03 19:39:05'),('oxidgoodcust',1,'Grosser Umsatz','Huge Turnover','','','2015-02-03 19:39:05'),('oxidforeigncustomer',1,'Auslandskunde','Foreign Customer','','','2015-02-03 19:39:05'),('oxidnewcustomer',1,'Inlandskunde','Domestic Customer','','','2015-02-03 19:39:05'),('oxidpowershopper',1,'Powershopper','Powershopper','','','2015-02-03 19:39:05'),('oxiddealer',1,'HÃ¤ndler','Retailer','','','2015-02-03 19:39:05'),('oxidnewsletter',1,'Newsletter-Abonnenten','Newsletter Recipients','','','2015-02-03 19:39:05'),('oxidadmin',1,'Shop-Admin','Store Administrator','','','2015-02-03 19:39:05'),('oxidpriceb',1,'Preis B','Price B','','','2015-02-03 19:39:05'),('oxidpricea',1,'Preis A','Price A','','','2015-02-03 19:39:05'),('oxidpricec',1,'Preis C','Price C','','','2015-02-03 19:39:05'),('oxidblocked',1,'BLOCKED','BLOCKED','','','2015-02-03 19:39:05'),('oxidcustomer',1,'Kunde','Customer','','','2015-02-03 19:39:05'),('oxidnotyetordered',1,'Noch nicht gekauft','Not Yet Purchased','','','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxinvitations`
--

DROP TABLE IF EXISTS `oxinvitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxinvitations` (
  `OXUSERID` char(32) COLLATE latin1_general_ci NOT NULL COMMENT 'User id (oxuser), who sent invitation',
  `OXDATE` date NOT NULL COMMENT 'Creation time',
  `OXEMAIL` varchar(255) COLLATE latin1_general_ci NOT NULL COMMENT 'Recipient email',
  `OXPENDING` mediumint(9) NOT NULL COMMENT 'Has recipient user registered',
  `OXACCEPTED` mediumint(9) NOT NULL COMMENT 'Is recipient user accepted',
  `OXTYPE` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Invitation type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXDATE` (`OXDATE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='User sent invitations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxinvitations`
--

LOCK TABLES `oxinvitations` WRITE;
/*!40000 ALTER TABLE `oxinvitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxinvitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxlinks`
--

DROP TABLE IF EXISTS `oxlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxlinks` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Link id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link url',
  `OXURLDESC` text NOT NULL COMMENT 'Description (multilanguage)',
  `OXURLDESC_1` text NOT NULL,
  `OXURLDESC_2` text NOT NULL,
  `OXURLDESC_3` text NOT NULL,
  `OXINSERT` datetime DEFAULT NULL COMMENT 'Creation time (set by user)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXINSERT` (`OXINSERT`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxlinks`
--

LOCK TABLES `oxlinks` WRITE;
/*!40000 ALTER TABLE `oxlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxlogs`
--

DROP TABLE IF EXISTS `oxlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxlogs` (
  `OXTIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXSESSID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Session id',
  `OXCLASS` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Logged class name',
  `OXFNC` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Logged function name',
  `OXCNID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Active category id (oxcategories)',
  `OXANID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Active article id (oxarticles)',
  `OXPARAMETER` varchar(64) NOT NULL DEFAULT '' COMMENT 'Template name or search param',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores logs from actions processing';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxlogs`
--

LOCK TABLES `oxlogs` WRITE;
/*!40000 ALTER TABLE `oxlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmanufacturers`
--

DROP TABLE IF EXISTS `oxmanufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmanufacturers` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Manufacturer id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shop manufacturers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmanufacturers`
--

LOCK TABLES `oxmanufacturers` WRITE;
/*!40000 ALTER TABLE `oxmanufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxmanufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxmediaurls`
--

DROP TABLE IF EXISTS `oxmediaurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxmediaurls` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Media id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article id (oxarticles)',
  `OXURL` varchar(255) NOT NULL COMMENT 'Media url or filename',
  `OXDESC` varchar(255) NOT NULL COMMENT 'Description (multilanguage)',
  `OXDESC_1` varchar(255) NOT NULL,
  `OXDESC_2` varchar(255) NOT NULL,
  `OXDESC_3` varchar(255) NOT NULL,
  `OXISUPLOADED` int(1) NOT NULL DEFAULT '0' COMMENT 'Is oxurl field used for filename or url',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores objects media';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxmediaurls`
--

LOCK TABLES `oxmediaurls` WRITE;
/*!40000 ALTER TABLE `oxmediaurls` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxmediaurls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxnews`
--

DROP TABLE IF EXISTS `oxnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxnews` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'News id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXACTIVEFROM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active from specified date',
  `OXACTIVETO` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Active to specified date',
  `OXDATE` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Creation date (entered by user)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '0',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_1` text NOT NULL,
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '0',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_2` text NOT NULL,
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '0',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXLONGDESC_3` text NOT NULL,
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXACTIVEFROM` (`OXACTIVEFROM`),
  KEY `OXACTIVETO` (`OXACTIVETO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shop news';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxnews`
--

LOCK TABLES `oxnews` WRITE;
/*!40000 ALTER TABLE `oxnews` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxnews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxnewsletter`
--

DROP TABLE IF EXISTS `oxnewsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxnewsletter` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Newsletter id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXTEMPLATE` mediumtext NOT NULL COMMENT 'HTML template',
  `OXPLAINTEMPLATE` mediumtext NOT NULL COMMENT 'Plain template',
  `OXSUBJECT` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Subject',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Templates for sending newsletters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxnewsletter`
--

LOCK TABLES `oxnewsletter` WRITE;
/*!40000 ALTER TABLE `oxnewsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxnewsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxnewssubscribed`
--

DROP TABLE IF EXISTS `oxnewssubscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxnewssubscribed` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Subscription id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXSAL` varchar(64) NOT NULL DEFAULT '' COMMENT 'User title prefix (Mr/Mrs)',
  `OXFNAME` char(128) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` char(128) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXEMAIL` char(128) NOT NULL DEFAULT '' COMMENT 'Email',
  `OXDBOPTIN` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Subscription status: 0 - not subscribed, 1 - subscribed, 2 - not confirmed',
  `OXEMAILFAILED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Subscription email sending status',
  `OXSUBSCRIBED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Subscription date',
  `OXUNSUBSCRIBED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Unsubscription date',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXEMAIL` (`OXEMAIL`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxnewssubscribed`
--

LOCK TABLES `oxnewssubscribed` WRITE;
/*!40000 ALTER TABLE `oxnewssubscribed` DISABLE KEYS */;
INSERT INTO `oxnewssubscribed` VALUES ('0b742e66fd94c88b8.61001136','oxdefaultadmin','MR','John','Doe','admin@admin.com',1,0,'2005-07-26 19:16:09','0000-00-00 00:00:00','2015-02-03 19:39:35','oxbaseshop');
/*!40000 ALTER TABLE `oxnewssubscribed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2action`
--

DROP TABLE IF EXISTS `oxobject2action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2action` (
  `OXID` char(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXACTIONID` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Action id (oxactions)',
  `OXOBJECTID` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table set by oxclass)',
  `OXCLASS` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object table name',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXACTIONID` (`OXACTIONID`,`OXCLASS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Shows many-to-many relationship between actions (oxactions) and objects (table set by oxclass)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2action`
--

LOCK TABLES `oxobject2action` WRITE;
/*!40000 ALTER TABLE `oxobject2action` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2article`
--

DROP TABLE IF EXISTS `oxobject2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Cross-selling Article id (oxarticles)',
  `OXARTICLENID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Main Article id (oxarticles)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXARTICLENID` (`OXARTICLENID`),
  KEY `OXOBJECTID` (`OXOBJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between cross-selling articles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2article`
--

LOCK TABLES `oxobject2article` WRITE;
/*!40000 ALTER TABLE `oxobject2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2attribute`
--

DROP TABLE IF EXISTS `oxobject2attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2attribute` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXATTRID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Attribute id (oxattributes)',
  `OXVALUE` char(255) NOT NULL DEFAULT '' COMMENT 'Attribute value (multilanguage)',
  `OXPOS` int(11) NOT NULL DEFAULT '9999' COMMENT 'Sorting',
  `OXVALUE_1` varchar(255) NOT NULL DEFAULT '',
  `OXVALUE_2` varchar(255) NOT NULL DEFAULT '',
  `OXVALUE_3` varchar(255) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXATTRID` (`OXATTRID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2attribute`
--

LOCK TABLES `oxobject2attribute` WRITE;
/*!40000 ALTER TABLE `oxobject2attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2category`
--

DROP TABLE IF EXISTS `oxobject2category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2category` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXCATNID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Category id (oxcategory)',
  `OXPOS` int(11) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIME` int(11) NOT NULL DEFAULT '0' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXMAINIDX` (`OXCATNID`,`OXOBJECTID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXPOS` (`OXPOS`),
  KEY `OXTIME` (`OXTIME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2category`
--

LOCK TABLES `oxobject2category` WRITE;
/*!40000 ALTER TABLE `oxobject2category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2delivery`
--

DROP TABLE IF EXISTS `oxobject2delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2delivery` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDELIVERYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery id (oxdelivery)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXDELIVERYID` (`OXDELIVERYID`,`OXTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between delivery cost rules and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2delivery`
--

LOCK TABLES `oxobject2delivery` WRITE;
/*!40000 ALTER TABLE `oxobject2delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2discount`
--

DROP TABLE IF EXISTS `oxobject2discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2discount` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXDISCOUNTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Discount id (oxdiscount)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxobjectid` (`OXOBJECTID`),
  KEY `oxdiscidx` (`OXDISCOUNTID`,`OXTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between discounts and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2discount`
--

LOCK TABLES `oxobject2discount` WRITE;
/*!40000 ALTER TABLE `oxobject2discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2group`
--

DROP TABLE IF EXISTS `oxobject2group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2group` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id',
  `OXGROUPSID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Group id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXGROUPSID` (`OXGROUPSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between users and groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2group`
--

LOCK TABLES `oxobject2group` WRITE;
/*!40000 ALTER TABLE `oxobject2group` DISABLE KEYS */;
INSERT INTO `oxobject2group` VALUES ('e913fdd8443ed43e1.51222316','oxbaseshop','oxdefaultadmin','oxidadmin','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxobject2group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2list`
--

DROP TABLE IF EXISTS `oxobject2list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2list` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXLISTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Listmania id (oxrecommlists)',
  `OXDESC` text NOT NULL COMMENT 'Description',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXLISTID` (`OXLISTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and listmania lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2list`
--

LOCK TABLES `oxobject2list` WRITE;
/*!40000 ALTER TABLE `oxobject2list` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2payment`
--

DROP TABLE IF EXISTS `oxobject2payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2payment` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXPAYMENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id (table determined by oxtype)',
  `OXTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Record type',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXPAYMENTID` (`OXPAYMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between payments and objects (table determined by oxtype)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2payment`
--

LOCK TABLES `oxobject2payment` WRITE;
/*!40000 ALTER TABLE `oxobject2payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2selectlist`
--

DROP TABLE IF EXISTS `oxobject2selectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2selectlist` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXSELNID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Selection list id (oxselectlist)',
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXOBJECTID` (`OXOBJECTID`),
  KEY `OXSELNID` (`OXSELNID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shows many-to-many relationship between articles and selection lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2selectlist`
--

LOCK TABLES `oxobject2selectlist` WRITE;
/*!40000 ALTER TABLE `oxobject2selectlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2selectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxobject2seodata`
--

DROP TABLE IF EXISTS `oxobject2seodata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxobject2seodata` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Objects id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXKEYWORDS` text NOT NULL COMMENT 'Keywords',
  `OXDESCRIPTION` text NOT NULL COMMENT 'Description',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXOBJECTID`,`OXSHOPID`,`OXLANG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Seo entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxobject2seodata`
--

LOCK TABLES `oxobject2seodata` WRITE;
/*!40000 ALTER TABLE `oxobject2seodata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxobject2seodata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorder`
--

DROP TABLE IF EXISTS `oxorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorder` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXORDERDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Order date',
  `OXORDERNR` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Order number',
  `OXBILLCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Company name',
  `OXBILLEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Email',
  `OXBILLFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: First name',
  `OXBILLLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Last name',
  `OXBILLSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Street name',
  `OXBILLSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'Billing info: House number',
  `OXBILLADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: Additional info',
  `OXBILLUSTID` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: VAT ID No.',
  `OXBILLCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Billing info: City',
  `OXBILLCOUNTRYID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Billing info: Country id (oxcountry)',
  `OXBILLSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Billing info: US State id (oxstates)',
  `OXBILLZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'Billing info: Zip code',
  `OXBILLFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: Phone number',
  `OXBILLFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: Fax number',
  `OXBILLSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Billing info: User title prefix (Mr/Mrs)',
  `OXDELCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Company name',
  `OXDELFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: First name',
  `OXDELLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Last name',
  `OXDELSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Street name',
  `OXDELSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'Shipping info: House number',
  `OXDELADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: Additional info',
  `OXDELCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shipping info: City',
  `OXDELCOUNTRYID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping info: Country id (oxcountry)',
  `OXDELSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shipping info: US State id (oxstates)',
  `OXDELZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'Shipping info: Zip code',
  `OXDELFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: Phone number',
  `OXDELFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: Fax number',
  `OXDELSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Shipping info: User title prefix (Mr/Mrs)',
  `OXPAYMENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User payment id (oxuserpayments)',
  `OXPAYMENTTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXTOTALNETSUM` double NOT NULL DEFAULT '0' COMMENT 'Total net sum',
  `OXTOTALBRUTSUM` double NOT NULL DEFAULT '0' COMMENT 'Total brut sum',
  `OXTOTALORDERSUM` double NOT NULL DEFAULT '0' COMMENT 'Total order sum',
  `OXARTVAT1` double NOT NULL DEFAULT '0' COMMENT 'First VAT',
  `OXARTVATPRICE1` double NOT NULL DEFAULT '0' COMMENT 'First calculated VAT price',
  `OXARTVAT2` double NOT NULL DEFAULT '0' COMMENT 'Second VAT',
  `OXARTVATPRICE2` double NOT NULL DEFAULT '0' COMMENT 'Second calculated VAT price',
  `OXDELCOST` double NOT NULL DEFAULT '0' COMMENT 'Delivery price',
  `OXDELVAT` double NOT NULL DEFAULT '0' COMMENT 'Delivery VAT',
  `OXPAYCOST` double NOT NULL DEFAULT '0' COMMENT 'Payment cost',
  `OXPAYVAT` double NOT NULL DEFAULT '0' COMMENT 'Payment VAT',
  `OXWRAPCOST` double NOT NULL DEFAULT '0' COMMENT 'Wrapping cost',
  `OXWRAPVAT` double NOT NULL DEFAULT '0' COMMENT 'Wrapping VAT',
  `OXGIFTCARDCOST` double NOT NULL DEFAULT '0' COMMENT 'Giftcard cost',
  `OXGIFTCARDVAT` double NOT NULL DEFAULT '0' COMMENT 'Giftcard VAT',
  `OXCARDID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Gift card id (oxwrapping)',
  `OXCARDTEXT` text NOT NULL COMMENT 'Gift card text',
  `OXDISCOUNT` double NOT NULL DEFAULT '0' COMMENT 'Additional discount for order (abs)',
  `OXEXPORT` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is exported',
  `OXBILLNR` varchar(128) NOT NULL DEFAULT '' COMMENT 'Invoice No.',
  `OXBILLDATE` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Invoice sent date',
  `OXTRACKCODE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Tracking code',
  `OXSENDDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Order shipping date',
  `OXREMARK` text NOT NULL COMMENT 'User remarks',
  `OXVOUCHERDISCOUNT` double NOT NULL DEFAULT '0' COMMENT 'Coupon (voucher) discount price',
  `OXCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Currency',
  `OXCURRATE` double NOT NULL DEFAULT '0' COMMENT 'Currency rate',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder: ORDERFOLDER_FINISHED, ORDERFOLDER_NEW, ORDERFOLDER_PROBLEMS',
  `OXTRANSID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Paypal: Transaction id',
  `OXPAYID` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `OXXID` varchar(64) NOT NULL DEFAULT '',
  `OXPAID` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when order was paid',
  `OXSTORNO` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Order cancelled',
  `OXIP` varchar(39) NOT NULL DEFAULT '' COMMENT 'User ip address',
  `OXTRANSSTATUS` varchar(30) NOT NULL DEFAULT '' COMMENT 'Order status: NOT_FINISHED, OK, ERROR',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXINVOICENR` int(11) NOT NULL DEFAULT '0' COMMENT 'Invoice number',
  `OXDELTYPE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Delivery id (oxdeliveryset)',
  `OXTSPROTECTID` char(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Trusted shop protection id',
  `OXTSPROTECTCOSTS` double NOT NULL DEFAULT '0' COMMENT 'Trusted shop protection cost',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXISNETTOMODE` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Order created in netto mode',
  PRIMARY KEY (`OXID`),
  KEY `MAINIDX` (`OXSHOPID`,`OXSTORNO`,`OXORDERDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shop orders information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorder`
--

LOCK TABLES `oxorder` WRITE;
/*!40000 ALTER TABLE `oxorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorderarticles`
--

DROP TABLE IF EXISTS `oxorderarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorderarticles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order article id',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Order id (oxorder)',
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Amount',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXARTNUM` varchar(255) NOT NULL DEFAULT '' COMMENT 'Article number',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description',
  `OXSELVARIANT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Selected variant',
  `OXNETPRICE` double NOT NULL DEFAULT '0' COMMENT 'Full netto price (oxnprice * oxamount)',
  `OXBRUTPRICE` double NOT NULL DEFAULT '0' COMMENT 'Full brutto price (oxbprice * oxamount)',
  `OXVATPRICE` double NOT NULL DEFAULT '0' COMMENT 'Calculated VAT price',
  `OXVAT` double NOT NULL DEFAULT '0' COMMENT 'VAT',
  `OXPERSPARAM` text NOT NULL COMMENT 'Serialized persistent parameters',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Base price',
  `OXBPRICE` double NOT NULL DEFAULT '0' COMMENT 'Brutto price for one item',
  `OXNPRICE` double NOT NULL DEFAULT '0' COMMENT 'Netto price for one item',
  `OXWRAPID` varchar(32) NOT NULL DEFAULT '' COMMENT 'Wrapping id (oxwrapping)',
  `OXEXTURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'External URL to other information about the article',
  `OXURLDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text for external URL',
  `OXURLIMG` varchar(128) NOT NULL DEFAULT '' COMMENT 'External URL image',
  `OXTHUMB` varchar(128) NOT NULL DEFAULT '' COMMENT 'Thumbnail filename',
  `OXPIC1` varchar(128) NOT NULL DEFAULT '' COMMENT '1# Picture filename',
  `OXPIC2` varchar(128) NOT NULL DEFAULT '' COMMENT '2# Picture filename',
  `OXPIC3` varchar(128) NOT NULL DEFAULT '' COMMENT '3# Picture filename',
  `OXPIC4` varchar(128) NOT NULL DEFAULT '' COMMENT '4# Picture filename',
  `OXPIC5` varchar(128) NOT NULL DEFAULT '' COMMENT '5# Picture filename',
  `OXWEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Weight (kg)',
  `OXSTOCK` double NOT NULL DEFAULT '-1' COMMENT 'Articles quantity in stock',
  `OXDELIVERY` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Date, when the product will be available again if it is sold out',
  `OXINSERT` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXLENGTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Length',
  `OXWIDTH` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Width',
  `OXHEIGHT` double NOT NULL DEFAULT '0' COMMENT 'Article dimensions: Height',
  `OXFILE` varchar(128) NOT NULL DEFAULT '' COMMENT 'File, shown in article media list',
  `OXSEARCHKEYS` varchar(255) NOT NULL DEFAULT '' COMMENT 'Search terms',
  `OXTEMPLATE` varchar(128) NOT NULL DEFAULT '' COMMENT 'Alternative template filename (use default, if empty)',
  `OXQUESTIONEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'E-mail for question',
  `OXISSEARCH` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is article shown in search',
  `OXFOLDER` varchar(32) NOT NULL DEFAULT '' COMMENT 'Folder: ORDERFOLDER_FINISHED, ORDERFOLDER_NEW, ORDERFOLDER_PROBLEMS',
  `OXSUBCLASS` varchar(32) NOT NULL DEFAULT '' COMMENT 'Subclass',
  `OXSTORNO` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Order cancelled',
  `OXORDERSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops), in which order was done',
  `OXISBUNDLE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Bundled article',
  PRIMARY KEY (`OXID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXARTID` (`OXARTID`),
  KEY `OXARTNUM` (`OXARTNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ordered articles information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorderarticles`
--

LOCK TABLES `oxorderarticles` WRITE;
/*!40000 ALTER TABLE `oxorderarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorderarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxorderfiles`
--

DROP TABLE IF EXISTS `oxorderfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxorderfiles` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order file id',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Order id (oxorder)',
  `OXFILENAME` varchar(128) NOT NULL COMMENT 'Filename',
  `OXFILEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'File id (oxfiles)',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Shop id (oxshops)',
  `OXORDERARTICLEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Ordered article id (oxorderarticles)',
  `OXFIRSTDOWNLOAD` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'First time downloaded time',
  `OXLASTDOWNLOAD` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last time downloaded time',
  `OXDOWNLOADCOUNT` int(10) unsigned NOT NULL COMMENT 'Downloads count',
  `OXMAXDOWNLOADCOUNT` int(10) unsigned NOT NULL COMMENT 'Maximum count of downloads',
  `OXDOWNLOADEXPIRATIONTIME` int(10) unsigned NOT NULL COMMENT 'Download expiration time in hours',
  `OXLINKEXPIRATIONTIME` int(10) unsigned NOT NULL COMMENT 'Link expiration time in hours',
  `OXRESETCOUNT` int(10) unsigned NOT NULL COMMENT 'Count of resets',
  `OXVALIDUNTIL` datetime NOT NULL COMMENT 'Download is valid until time specified',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXFILEID` (`OXFILEID`),
  KEY `OXORDERARTICLEID` (`OXORDERARTICLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files, given to users to download after order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxorderfiles`
--

LOCK TABLES `oxorderfiles` WRITE;
/*!40000 ALTER TABLE `oxorderfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxorderfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxpayments`
--

DROP TABLE IF EXISTS `oxpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxpayments` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Payment id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXDESC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Description (multilanguage)',
  `OXADDSUM` double NOT NULL DEFAULT '0' COMMENT 'Price Surcharge/Reduction amount',
  `OXADDSUMTYPE` enum('abs','%') NOT NULL DEFAULT 'abs' COMMENT 'Price Surcharge/Reduction type (abs|%)',
  `OXADDSUMRULES` int(11) NOT NULL DEFAULT '0' COMMENT 'Base of price surcharge/reduction: 1 - Value of all goods in cart, 2 - Discounts, 4 - Vouchers, 8 - Shipping costs, 16 - Gift Wrapping/Greeting Card',
  `OXFROMBONI` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimal Credit Rating ',
  `OXFROMAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price: From',
  `OXTOAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Purchase Price: To',
  `OXVALDESC` text NOT NULL COMMENT 'Payment additional fields, separated by "field1__@@field2" (multilanguage)',
  `OXCHECKED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Selected as the default method',
  `OXDESC_1` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_1` text NOT NULL,
  `OXDESC_2` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_2` text NOT NULL,
  `OXDESC_3` varchar(128) NOT NULL DEFAULT '',
  `OXVALDESC_3` text NOT NULL,
  `OXLONGDESC` text NOT NULL COMMENT 'Long description (multilanguage)',
  `OXLONGDESC_1` text NOT NULL,
  `OXLONGDESC_2` text NOT NULL,
  `OXLONGDESC_3` text NOT NULL,
  `OXSORT` int(5) NOT NULL DEFAULT '0' COMMENT 'Sorting',
  `OXTSPAYMENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Trusted shop payment id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Payment methods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxpayments`
--

LOCK TABLES `oxpayments` WRITE;
/*!40000 ALTER TABLE `oxpayments` DISABLE KEYS */;
INSERT INTO `oxpayments` VALUES ('oxidcashondel',1,'Nachnahme',7.5,'abs',0,0,0,1000000,'',1,'COD (Cash on Delivery)','','','','','','','','','',0,'','2015-02-03 19:39:05'),('oxidcreditcard',1,'Kreditkarte',20.9,'abs',0,500,0,1000000,'kktype__@@kknumber__@@kkmonth__@@kkyear__@@kkname__@@kkpruef__@@',1,'Credit Card','kktype__@@kknumber__@@kkmonth__@@kkyear__@@kkname__@@kkpruef__@@','','','','','Die Belastung Ihrer Kreditkarte erfolgt mit dem Abschluss der Bestellung.','Your Credit Card will be charged when you submit the order.','','',0,'','2015-02-03 19:39:05'),('oxiddebitnote',1,'Bankeinzug/Lastschrift',0,'abs',0,0,0,1000000,'lsbankname__@@lsblz__@@lsktonr__@@lsktoinhaber__@@',0,'Direct Debit','lsbankname__@@lsblz__@@lsktonr__@@lsktoinhaber__@@','','','','','Die Belastung Ihres Kontos erfolgt mit dem Versand der Ware.','Your bank account will be charged when the order is shipped.','','',0,'','2015-02-03 19:39:05'),('oxidpayadvance',1,'Vorauskasse',0,'abs',0,0,0,1000000,'',1,'Cash in advance','','','','','','','','','',0,'','2015-02-03 19:39:05'),('oxidinvoice',1,'Rechnung',0,'abs',0,800,0,1000000,'',0,'Invoice','','','','','','','','','',0,'','2015-02-03 19:39:05'),('oxempty',1,'Empty',0,'abs',0,0,0,0,'',0,'Empty','','','','','','for other countries','An example. Maybe for use with other countries','','',0,'','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxprice2article`
--

DROP TABLE IF EXISTS `oxprice2article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxprice2article` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXADDABS` double NOT NULL DEFAULT '0' COMMENT 'Price, that will be used for specified article if basket amount is between oxamount and oxamountto',
  `OXADDPERC` double NOT NULL DEFAULT '0' COMMENT 'Discount, that will be used for specified article if basket amount is between oxamount and oxamountto',
  `OXAMOUNT` double NOT NULL DEFAULT '0' COMMENT 'Quantity: From',
  `OXAMOUNTTO` double NOT NULL DEFAULT '0' COMMENT 'Quantity: To',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSHOPID` (`OXSHOPID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Article scale prices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxprice2article`
--

LOCK TABLES `oxprice2article` WRITE;
/*!40000 ALTER TABLE `oxprice2article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxprice2article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxpricealarm`
--

DROP TABLE IF EXISTS `oxpricealarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxpricealarm` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Price alarm id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXEMAIL` varchar(128) NOT NULL DEFAULT '' COMMENT 'Recipient email',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Expected (user) price, when notification email should be sent',
  `OXCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Currency',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXINSERT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXSENDED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time, when notification was sent',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Price fall alarm requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxpricealarm`
--

LOCK TABLES `oxpricealarm` WRITE;
/*!40000 ALTER TABLE `oxpricealarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxpricealarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxratings`
--

DROP TABLE IF EXISTS `oxratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxratings` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Rating id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTYPE` enum('oxarticle','oxrecommlist') NOT NULL COMMENT 'Rating type (oxarticle, oxrecommlist)',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article or Listmania id (oxarticles or oxrecommlists)',
  `OXRATING` int(1) NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxobjectsearch` (`OXTYPE`,`OXOBJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Articles and Listmania ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxratings`
--

LOCK TABLES `oxratings` WRITE;
/*!40000 ALTER TABLE `oxratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxrecommlists`
--

DROP TABLE IF EXISTS `oxrecommlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxrecommlists` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Listmania id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXAUTHOR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Author first and last name',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXDESC` text NOT NULL COMMENT 'Description',
  `OXRATINGCNT` int(11) NOT NULL DEFAULT '0' COMMENT 'Rating votes count',
  `OXRATING` double NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Listmania';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxrecommlists`
--

LOCK TABLES `oxrecommlists` WRITE;
/*!40000 ALTER TABLE `oxrecommlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxrecommlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxremark`
--

DROP TABLE IF EXISTS `oxremark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxremark` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXPARENTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTYPE` enum('o','r','n','c') NOT NULL DEFAULT 'r' COMMENT 'Record type: o - order, r - remark, n - nesletter, c - registration',
  `OXHEADER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Header (default: Creation time)',
  `OXTEXT` text NOT NULL COMMENT 'Remark text',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXPARENTID` (`OXPARENTID`),
  KEY `OXTYPE` (`OXTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxremark`
--

LOCK TABLES `oxremark` WRITE;
/*!40000 ALTER TABLE `oxremark` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxremark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxreviews`
--

DROP TABLE IF EXISTS `oxreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxreviews` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Review id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active',
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Article or Listmania id (oxarticles or oxrecommlist)',
  `OXTYPE` enum('oxarticle','oxrecommlist') NOT NULL COMMENT 'Review type (oxarticle, oxrecommlist)',
  `OXTEXT` text NOT NULL COMMENT 'Review text',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXLANG` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXRATING` int(1) NOT NULL DEFAULT '0' COMMENT 'Rating',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `oxobjectsearch` (`OXTYPE`,`OXOBJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Articles and Listmania reviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxreviews`
--

LOCK TABLES `oxreviews` WRITE;
/*!40000 ALTER TABLE `oxreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxselectlist`
--

DROP TABLE IF EXISTS `oxselectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxselectlist` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Selection list id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTITLE` varchar(254) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXIDENT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Working Title',
  `OXVALDESC` text NOT NULL COMMENT 'List fields, separated by "[field_name]!P![price]__@@[field_name]__@@" (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_1` text NOT NULL,
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_2` text NOT NULL,
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXVALDESC_3` text NOT NULL,
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Selection lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxselectlist`
--

LOCK TABLES `oxselectlist` WRITE;
/*!40000 ALTER TABLE `oxselectlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxselectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseo`
--

DROP TABLE IF EXISTS `oxseo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseo` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Object id',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Hashed seo url (md5)',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (multilanguage)',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXSTDURL` varchar(2048) NOT NULL COMMENT 'Primary url, not seo encoded',
  `OXSEOURL` varchar(2048) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Old seo url',
  `OXTYPE` enum('static','oxarticle','oxcategory','oxvendor','oxcontent','dynamic','oxmanufacturer') NOT NULL COMMENT 'Record type',
  `OXFIXED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Fixed',
  `OXEXPIRED` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Expired',
  `OXPARAMS` char(32) NOT NULL DEFAULT '' COMMENT 'Params',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`),
  UNIQUE KEY `search` (`OXTYPE`,`OXOBJECTID`,`OXSHOPID`,`OXLANG`,`OXPARAMS`),
  KEY `OXOBJECTID` (`OXLANG`,`OXOBJECTID`,`OXSHOPID`),
  KEY `SEARCHSTD` (`OXSTDURL`(100),`OXSHOPID`),
  KEY `SEARCHSEO` (`OXSEOURL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo urls information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseo`
--

LOCK TABLES `oxseo` WRITE;
/*!40000 ALTER TABLE `oxseo` DISABLE KEYS */;
INSERT INTO `oxseo` VALUES ('d3d9e8107af82d038f13908a971fb279','01c381c68e91fc5bbdc61f5e5e9eee69','oxbaseshop',1,'?cl=rss&amp;fnc=topshop','en/rss/OXID-eShop-4/Top-of-the-shop/','dynamic',0,0,'','2015-02-03 19:40:11'),('c855234180a3b4056b496120d229ea68','023abc17c853f9bccc201c5afd549a92','oxbaseshop',1,'index.php?cl=account_wishlist','en/my-gift-registry/','static',0,0,'','2015-02-03 19:39:05'),('e5340b054530ea779fb1802e93c8183e','02b4c1e4049b1baffba090c95a7edbf7','oxbaseshop',0,'index.php?cl=invite','Laden-Sie-Ihre-Freunde/','static',0,0,'','2015-02-03 19:39:05'),('2e17757c0aaf8ed9ef2ba30317fa1faf','0469752d03d80da379a679aaef4c0546','oxbaseshop',1,'index.php?cl=suggest','en/recommend/','static',0,0,'','2015-02-03 19:39:05'),('057ef382f23bdbb84991d049af2baba9','063c82502d9dd528ce2cc40ceb76ade7','oxbaseshop',1,'index.php?cl=compare','en/my-product-comparison/','static',0,0,'','2015-02-03 19:39:05'),('67c5bcf75ee346bd9566bce6c8','0d2f22b49c64eaa138d717ec752e3be3','oxbaseshop',0,'index.php?cl=credits&amp;oxcid=67c5bcf75ee346bd9566bce6c8','Credits/','oxcontent',1,0,'','2015-02-03 19:39:05'),('2eb4676806a3d2e87.06076523','0f0e9506edb981aeabcc77a039cb0f84','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxagb&amp;oxcid=2eb4676806a3d2e87.06076523','en/Terms-and-Conditions/','oxcontent',0,0,'','2015-02-03 19:40:11'),('7bc8a506bbca225a2f95b6eac66020bf','1368f5e45468ca1e1c7c84f174785c35','oxbaseshop',1,'index.php?cl=account_noticelist','en/my-wish-list/','static',0,0,'','2015-02-03 19:39:05'),('c855234180a3b4056b496120d229ea68','1f30ae9b1c78b7dc89d3e5fe9eb0de59','oxbaseshop',0,'index.php?cl=account_wishlist','mein-wunschzettel/','static',0,0,'','2015-02-03 19:39:05'),('965acb9a653478a186e55468c6df7406','295d6617dc22b6d8186667ecd6e3ae87','oxbaseshop',0,'index.php?cl=clearcookies','cookies/','static',0,0,'','2015-02-03 19:39:05'),('f41427a07519469f1.34718981','34191c32cedbe8832d6aebb58b4555b3','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxdeliveryinfo&amp;oxcid=f41427a07519469f1.34718981','en/Shipping-and-Charges/','oxcontent',0,0,'','2015-02-03 19:40:11'),('e56acdd347b0516f68a0afdd811e2382','3a41965fb36fb45df7f4f9a4377f6364','oxbaseshop',1,'index.php?cl=newsletter','en/newsletter/','static',0,0,'','2015-02-03 19:39:05'),('ab459c0dc911137e9cc024d9fba5a68b','3bdd64bd8073d044d8fd60334ed9b725','oxbaseshop',1,'index.php?cl=start','en/home/','static',0,0,'','2015-02-03 19:39:05'),('2eb46767947d21851.22681675','3e2a46c6550d9f8ec5a7f3216d023db2','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oximpressum&amp;oxcid=2eb46767947d21851.22681675','en/About-Us/','oxcontent',0,0,'','2015-02-03 19:40:11'),('efaf9266cf7de3a8c84cea167285eb83','4a70a4cd11d63fdce96fbe4ba8e714e6','oxbaseshop',1,'index.php?cnid=oxmore&amp;cl=alist','en/more/','static',0,0,'','2015-02-03 19:39:05'),('efaf9266cf7de3a8c84cea167285eb83','4d3d4d70b09b5d2bd992991361374c67','oxbaseshop',0,'index.php?cnid=oxmore&amp;cl=alist','mehr/','static',0,0,'','2015-02-03 19:39:05'),('18f64cbbc296a32fb84b3bbe31dfed09','510fef34e5d9b86f6a77af949d15950e','oxbaseshop',1,'index.php?cl=account','en/my-account/','static',0,0,'','2015-02-03 19:39:05'),('ace1e168a1e8183a2aa79c2243171a29','5668048844927ca2767140c219e04efc','oxbaseshop',1,'index.php?cl=account_user','en/my-address/','static',0,0,'','2015-02-03 19:39:05'),('0563ce7f6a400737ce0e1c2b2c733e49','5cc081514a72b0ce3d7eec4fb1e6f1dd','oxbaseshop',1,'index.php?cl=forgotpwd','en/forgot-password/','static',0,0,'','2015-02-03 19:39:05'),('f6bd7f77caae70afad276584caa6450a','5d752e9e8302eeb21df24d1aee573234','oxbaseshop',0,'index.php?cl=wishlist','wunschzettel/','static',0,0,'','2015-02-03 19:39:05'),('6d9b5b3ee58bca1bd7be188f71e80ef2','5eb126725ba500e6bbf1aecaa876dc48','oxbaseshop',1,'index.php?cl=review','en/product-review/','static',0,0,'','2015-02-03 19:39:05'),('57cb6b2fafc870810cd48b8e1d28cf91','63794023f46c56d329e2ee6a1462e8c2','oxbaseshop',0,'index.php?cl=tags','stichworte/','static',0,0,'','2015-02-03 19:39:05'),('56ebd65f4a7cc25de1dc1f7cf15591fb','637daadf1eaad2b9641333c2b1572883','oxbaseshop',0,'index.php?cl=news','news/','static',0,0,'','2015-02-03 19:39:05'),('f560b18b547bca23752a154b45120980','6b30b01fe01b80894efc0f29610e5215','oxbaseshop',0,'index.php?cl=account_password','mein-passwort/','static',0,0,'','2015-02-03 19:39:05'),('f560b18b547bca23752a154b45120980','6c890ac1255a99f8d1eb46f1193843d6','oxbaseshop',1,'index.php?cl=account_password','en/my-password/','static',0,0,'','2015-02-03 19:39:05'),('f41427a099a603773.44301043','70e92b5b1eb44b87f63e76a517935383','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxsecurityinfo&amp;oxcid=f41427a099a603773.44301043','en/Privacy-Policy/','oxcontent',0,0,'','2015-02-03 19:40:11'),('04abcb465a8d3a4441df4c480838d23d','7685924d3f3fb7e9bda421c57f665af4','oxbaseshop',1,'index.php?cl=contact','en/contact/','static',0,0,'','2015-02-03 19:39:05'),('d12b7badee1037e7c1a5a7a245a14e11','7c8aa72aa16b7d4a859b22d8b8328412','oxbaseshop',0,'index.php?cl=guestbook','gaestebuch/','static',0,0,'','2015-02-03 19:39:05'),('c4241316b2e5c1966.96997012','81f0689517088802fef61d4cc9f1d48f','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxhelpdefault&amp;oxcid=c4241316b2e5c1966.96997012','en/Help-Main/','oxcontent',0,0,'','2015-02-03 19:40:11'),('2e17757c0aaf8ed9ef2ba30317fa1faf','82dd672d68d8f6c943f98ccdaecda691','oxbaseshop',0,'index.php?cl=suggest','empfehlen/','static',0,0,'','2015-02-03 19:39:05'),('18f64cbbc296a32fb84b3bbe31dfed09','89c5e6bf1b5441599c4815281debe8df','oxbaseshop',0,'index.php?cl=account','mein-konto/','static',0,0,'','2015-02-03 19:39:05'),('c71c50f5443d85b37a013420857e83e7','8afe769d3de8b5db0a872b23f959dd36','oxbaseshop',1,'index.php?cl=download','en/download/','static',0,0,'','2015-02-03 19:39:05'),('b4f456183a66e6c53b1f3f7f476cf2ee','8d952a1fe47028a6f3fa142e92d27fd1','oxbaseshop',1,'?cl=rss&amp;fnc=newarts','en/rss/OXID-eShop-4/Recent-products-in-shop/','dynamic',0,0,'','2015-02-03 19:40:11'),('05c0f9a36dc4eaf3df528f0da18664d8','8e7ebaebb0a810576453082e1f8f2fa3','oxbaseshop',1,'index.php?cl=account_recommlist','en/my-listmania-list/','static',0,0,'','2015-02-03 19:39:05'),('61c5d6965b480012aabb3a6701254b75','9372b6be2d98021fb93302a6a34bfc8c','oxbaseshop',1,'index.php?cl=recommlist','en/Recommendation-Lists/','static',0,0,'','2015-02-03 19:39:05'),('root','9411d92bed92a131712b1f0f03d9fb42','oxbaseshop',1,'index.php?cl=manufacturerlist&amp;mnid=root','en/By-Manufacturer/','oxmanufacturer',0,0,'','2015-02-03 19:40:11'),('343c043546b3d653647e75d2e246ce94','9508bb0d70121d49e4d4554c5b1af81d','oxbaseshop',0,'index.php?cl=links','links/','static',0,0,'','2015-02-03 19:39:05'),('610f7fc243c7409cb5448b30029431fe','9ff5c21cbc84dbfe815013236e132baf','oxbaseshop',1,'index.php?cl=account_order','en/order-history/','static',0,0,'','2015-02-03 19:39:05'),('67c5bcf75ee346bd9566bce6c8','a150a7b6945213daa7f138e1a042cbb4','oxbaseshop',1,'index.php?cl=credits&amp;oxcid=67c5bcf75ee346bd9566bce6c8','en/Credits/','oxcontent',1,0,'','2015-02-03 19:39:05'),('98964bf04c7edae2d658c5f3b3233ca1','a1b330b85c6f51fd9b50b1eb19707d84','oxbaseshop',1,'index.php?cl=register','en/open-account/','static',0,0,'','2015-02-03 19:39:05'),('7bc8a506bbca225a2f95b6eac66020bf','a24b03f1a3f73c325a7647e6039e2359','oxbaseshop',0,'index.php?cl=account_noticelist','mein-merkzettel/','static',0,0,'','2015-02-03 19:39:05'),('61c5d6965b480012aabb3a6701254b75','a4e5995182ade3cf039800c0ec2d512d','oxbaseshop',0,'index.php?cl=recommlist','Empfehlungslisten/','static',0,0,'','2015-02-03 19:39:05'),('e5340b054530ea779fb1802e93c8183e','a6b775aec57d06b46a958efbafdc7875','oxbaseshop',1,'index.php?cl=invite','en/Invite-your-friends/','static',0,0,'','2015-02-03 19:39:05'),('ace1e168a1e8183a2aa79c2243171a29','a7d5ab5a4e87693998c5aec066dda6e6','oxbaseshop',0,'index.php?cl=account_user','meine-adressen/','static',0,0,'','2015-02-03 19:39:05'),('0563ce7f6a400737ce0e1c2b2c733e49','a9afb500184c584fb5ab2ad9b4162e96','oxbaseshop',0,'index.php?cl=forgotpwd','passwort-vergessen/','static',0,0,'','2015-02-03 19:39:05'),('98964bf04c7edae2d658c5f3b3233ca1','acddcfef9c25bcae3b96eb00669541ff','oxbaseshop',0,'index.php?cl=register','konto-eroeffnen/','static',0,0,'','2015-02-03 19:39:05'),('f6bd7f77caae70afad276584caa6450a','b93b703d313e89662773cffaab750f1d','oxbaseshop',1,'index.php?cl=wishlist','en/gift-registry/','static',0,0,'','2015-02-03 19:39:05'),('05c0f9a36dc4eaf3df528f0da18664d8','baa3b653a618696b06c70a6dda95ebde','oxbaseshop',0,'index.php?cl=account_recommlist','meine-lieblingslisten/','static',0,0,'','2015-02-03 19:39:05'),('1074279e67a85f5b1.96907412','c1298d664559e5c887e3e18c7cda5133','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxorderinfo&amp;oxcid=1074279e67a85f5b1.96907412','en/How-to-order/','oxcontent',0,0,'','2015-02-03 19:40:11'),('c71c50f5443d85b37a013420857e83e7','c552cb8718cde5cb792e181f78f5fde1','oxbaseshop',0,'index.php?cl=download','download/','static',0,0,'','2015-02-03 19:39:05'),('882acc7454f973844d4917515181dcba','c74bbaf961498de897ba7eb98fea8274','oxbaseshop',1,'index.php?cl=account_downloads','en/my-downloads/','static',0,0,'','2015-02-03 19:39:05'),('6d9b5b3ee58bca1bd7be188f71e80ef2','cc28156a4f728c1b33e7e02fd846628e','oxbaseshop',0,'index.php?cl=review','bewertungen/','static',0,0,'','2015-02-03 19:39:05'),('ab459c0dc911137e9cc024d9fba5a68b','ccca27059506a916fb64d673a5dd676b','oxbaseshop',0,'index.php?cl=start','startseite/','static',0,0,'','2015-02-03 19:39:05'),('965acb9a653478a186e55468c6df7406','d50c753d406338d92f52fe55de1e98dd','oxbaseshop',1,'index.php?cl=clearcookies','en/cookies/','static',0,0,'','2015-02-03 19:39:05'),('57cb6b2fafc870810cd48b8e1d28cf91','da6c5523f7c91d108cadb0be7757c27f','oxbaseshop',1,'index.php?cl=tags','en/tags/','static',0,0,'','2015-02-03 19:39:05'),('d12b7badee1037e7c1a5a7a245a14e11','ded4f3786c6f4d6d14e3034834ebdcaf','oxbaseshop',1,'index.php?cl=guestbook','en/guestbook/','static',0,0,'','2015-02-03 19:39:05'),('057ef382f23bdbb84991d049af2baba9','e0dd29a75947539da6b1924d31c9849f','oxbaseshop',0,'index.php?cl=compare','mein-produktvergleich/','static',0,0,'','2015-02-03 19:39:05'),('56ebd65f4a7cc25de1dc1f7cf15591fb','e5a8de0e49e91c5728eadfcb233bdbd1','oxbaseshop',1,'index.php?cl=news','en/news/','static',0,0,'','2015-02-03 19:39:05'),('e56acdd347b0516f68a0afdd811e2382','e604233c5a2804d21ec0252a445e93d3','oxbaseshop',0,'index.php?cl=newsletter','newsletter/','static',0,0,'','2015-02-03 19:39:05'),('38efc02f0f6b6a6d54cfef1fcdb99d70','e6331d115f5323610c639ef2f0369f8a','oxbaseshop',0,'index.php?cl=basket','warenkorb/','static',0,0,'','2015-02-03 19:39:05'),('1ea45574543b21636.29288751','e91d3f4809b713664045f30d900b789a','oxbaseshop',1,'index.php?cl=content&amp;oxloadid=oxrightofwithdrawal&amp;oxcid=1ea45574543b21636.29288751','en/Right-of-Withdrawal/','oxcontent',0,0,'','2015-02-03 19:40:11'),('610f7fc243c7409cb5448b30029431fe','eb692d07ec8608d943db0a3bca29c4ce','oxbaseshop',0,'index.php?cl=account_order','bestellhistorie/','static',0,0,'','2015-02-03 19:39:05'),('38efc02f0f6b6a6d54cfef1fcdb99d70','ecaf0240f9f46bbee5ffc6dd73d0b7f0','oxbaseshop',1,'index.php?cl=basket','en/cart/','static',0,0,'','2015-02-03 19:39:05'),('882acc7454f973844d4917515181dcba','f1c7ccb53fc8d6f239b39d2fc2b76829','oxbaseshop',0,'index.php?cl=account_downloads','de/my-downloads/','static',0,0,'','2015-02-03 19:39:05'),('343c043546b3d653647e75d2e246ce94','f80ace8f87e1d7f446ab1fa58f275f4c','oxbaseshop',1,'index.php?cl=links','en/links/','static',0,0,'','2015-02-03 19:39:05'),('943173edecf6d6870a0f357b8ac84d32','f8335c84c1daa5b13657124f45c0e08b','oxbaseshop',0,'index.php?cl=alist&amp;cnid=943173edecf6d6870a0f357b8ac84d32','Wakeboarding/','oxcategory',0,0,'','2015-02-03 19:39:05'),('04abcb465a8d3a4441df4c480838d23d','f9d1a02ab749dc360c4e21f21de1beaf','oxbaseshop',0,'index.php?cl=contact','kontakt/','static',0,0,'','2015-02-03 19:39:05'),('0f4270b89fbef1481958381410a0dbca','fad614c0f4922228623ae0696b55481f','oxbaseshop',1,'index.php?cl=alist&amp;cnid=0f4270b89fbef1481958381410a0dbca','en/Wakeboarding/Wakeboards/','oxcategory',1,0,'','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxseo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseohistory`
--

DROP TABLE IF EXISTS `oxseohistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseohistory` (
  `OXOBJECTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Object id',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed url (md5)',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id oxshops',
  `OXLANG` int(2) NOT NULL DEFAULT '0' COMMENT 'Language id',
  `OXHITS` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Hits',
  `OXINSERT` timestamp NULL DEFAULT NULL COMMENT 'Creation time',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`),
  KEY `search` (`OXOBJECTID`,`OXSHOPID`,`OXLANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo urls history. If url does not exists in oxseo, then checks here and redirects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseohistory`
--

LOCK TABLES `oxseohistory` WRITE;
/*!40000 ALTER TABLE `oxseohistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxseohistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxseologs`
--

DROP TABLE IF EXISTS `oxseologs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxseologs` (
  `OXSTDURL` text NOT NULL COMMENT 'Primary url, not seo encoded',
  `OXIDENT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Hashed seo url',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXLANG` int(11) NOT NULL COMMENT 'Language id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXIDENT`,`OXSHOPID`,`OXLANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Seo logging. Logs bad requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxseologs`
--

LOCK TABLES `oxseologs` WRITE;
/*!40000 ALTER TABLE `oxseologs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxseologs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxshops`
--

DROP TABLE IF EXISTS `oxshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxshops` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Shop id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXPRODUCTIVE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Productive Mode (if 0, debug info displayed)',
  `OXDEFCURRENCY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Default currency',
  `OXDEFLANGUAGE` int(11) NOT NULL DEFAULT '0' COMMENT 'Default language id',
  `OXNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shop name',
  `OXTITLEPREFIX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Seo title prefix (multilanguage)',
  `OXTITLEPREFIX_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLEPREFIX_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLEPREFIX_3` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Seo title suffix (multilanguage)',
  `OXTITLESUFFIX_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLESUFFIX_3` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Start page title (multilanguage)',
  `OXSTARTTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSTARTTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXINFOEMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Informational email address',
  `OXORDEREMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order email address',
  `OXOWNEREMAIL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Owner email address',
  `OXORDERSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order email subject (multilanguage)',
  `OXREGISTERSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Registration email subject (multilanguage)',
  `OXFORGOTPWDSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Forgot password email subject (multilanguage)',
  `OXSENDEDNOWSUBJECT` varchar(255) NOT NULL DEFAULT '' COMMENT 'Order sent email subject (multilanguage)',
  `OXORDERSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_1` varchar(255) NOT NULL DEFAULT '',
  `OXORDERSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_2` varchar(255) NOT NULL DEFAULT '',
  `OXORDERSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXREGISTERSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXFORGOTPWDSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSENDEDNOWSUBJECT_3` varchar(255) NOT NULL DEFAULT '',
  `OXSMTP` varchar(255) NOT NULL DEFAULT '' COMMENT 'SMTP server',
  `OXSMTPUSER` varchar(128) NOT NULL DEFAULT '' COMMENT 'SMTP user',
  `OXSMTPPWD` varchar(128) NOT NULL DEFAULT '' COMMENT 'SMTP password',
  `OXCOMPANY` varchar(128) NOT NULL DEFAULT '' COMMENT 'Your company',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXZIP` varchar(255) NOT NULL DEFAULT '' COMMENT 'ZIP code',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Country',
  `OXBANKNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank name',
  `OXBANKNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Account Number',
  `OXBANKCODE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Routing Number',
  `OXVATNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sales Tax ID',
  `OXTAXNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tax ID',
  `OXBICCODE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank BIC',
  `OXIBANNUMBER` varchar(255) NOT NULL DEFAULT '' COMMENT 'Bank IBAN',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXTELEFON` varchar(255) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXTELEFAX` varchar(255) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Shop url',
  `OXDEFCAT` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Default category id',
  `OXHRBNR` varchar(64) NOT NULL DEFAULT '' COMMENT 'CBR',
  `OXCOURT` varchar(128) NOT NULL DEFAULT '' COMMENT 'District Court',
  `OXADBUTLERID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Adbutler code (belboon.de) - deprecated',
  `OXAFFILINETID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affilinet code (webmasterplan.com) - deprecated',
  `OXSUPERCLICKSID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Superclix code (superclix.de) - deprecated',
  `OXAFFILIWELTID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affiliwelt code (affiliwelt.net) - deprecated',
  `OXAFFILI24ID` varchar(64) NOT NULL DEFAULT '' COMMENT 'Affili24 code (affili24.com) - deprecated',
  `OXEDITION` char(2) NOT NULL COMMENT 'Shop Edition (CE,PE,EE)',
  `OXVERSION` char(16) NOT NULL COMMENT 'Shop Version',
  `OXSEOACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Seo active (multilanguage)',
  `OXSEOACTIVE_1` tinyint(1) NOT NULL DEFAULT '1',
  `OXSEOACTIVE_2` tinyint(1) NOT NULL DEFAULT '1',
  `OXSEOACTIVE_3` tinyint(1) NOT NULL DEFAULT '1',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Shop config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxshops`
--

LOCK TABLES `oxshops` WRITE;
/*!40000 ALTER TABLE `oxshops` DISABLE KEYS */;
INSERT INTO `oxshops` VALUES ('oxbaseshop',1,0,'',0,'OXID eShop 4','OXID eShop 4','OXID eShop 4','','','online kaufen','purchase online','','','Der Onlineshop','Online Shop','','','info@myoxideshop.com','reply@myoxideshop.com','order@myoxideshop.com','Ihre Bestellung bei OXID eSales','Vielen Dank fÃ¼r Ihre Registrierung im OXID eShop','Ihr Passwort im OXID eShop','Ihre OXID eSales Bestellung wurde versandt','Your order at OXID eShop','Thank you for your registration at OXID eShop','Your OXID eShop password','Your OXID eSales Order has been shipped','','','','','','','','','','','','Your Company Name','2425 Maple Street','9041','Any City, CA','United States','Bank of America','1234567890','900 1234567','','','','','John','Doe','217-8918712','217-8918713','www.myoxideshop.com','','','','','','','','','CE','4.9.3',1,1,0,0,'2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxstates`
--

DROP TABLE IF EXISTS `oxstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxstates` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id',
  `OXCOUNTRYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXTITLE` char(128) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXISOALPHA2` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'SEO short name',
  `OXTITLE_1` char(128) NOT NULL DEFAULT '',
  `OXTITLE_2` char(128) NOT NULL DEFAULT '',
  `OXTITLE_3` char(128) NOT NULL DEFAULT '',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXCOUNTRYID` (`OXCOUNTRYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='US States list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxstates`
--

LOCK TABLES `oxstates` WRITE;
/*!40000 ALTER TABLE `oxstates` DISABLE KEYS */;
INSERT INTO `oxstates` VALUES ('AB','8f241f11095649d18.02676059','Alberta','AB','Alberta','','','2015-02-03 19:39:05'),('BC','8f241f11095649d18.02676059','Britisch-Kolumbien','BC','British Columbia','','','2015-02-03 19:39:05'),('MB','8f241f11095649d18.02676059','Manitoba','MB','Manitoba','','','2015-02-03 19:39:05'),('NB','8f241f11095649d18.02676059','Neubraunschweig','NB','New Brunswick','','','2015-02-03 19:39:05'),('NF','8f241f11095649d18.02676059','Neufundland und Labrador','NF','Newfoundland and Labrador','','','2015-02-03 19:39:05'),('NT','8f241f11095649d18.02676059','Nordwest-Territorien','NT','Northwest Territories','','','2015-02-03 19:39:05'),('NS','8f241f11095649d18.02676059','Nova Scotia','NS','Nova Scotia','','','2015-02-03 19:39:05'),('NU','8f241f11095649d18.02676059','Nunavut','NU','Nunavut','','','2015-02-03 19:39:05'),('ON','8f241f11095649d18.02676059','Ontario','ON','Ontario','','','2015-02-03 19:39:05'),('PE','8f241f11095649d18.02676059','Prince Edward Island','PE','Prince Edward Island','','','2015-02-03 19:39:05'),('QC','8f241f11095649d18.02676059','Quebec','QC','Quebec','','','2015-02-03 19:39:05'),('SK','8f241f11095649d18.02676059','Saskatchewan','SK','Saskatchewan','','','2015-02-03 19:39:05'),('YK','8f241f11095649d18.02676059','Yukon','YK','Yukon','','','2015-02-03 19:39:05'),('AL','8f241f11096877ac0.98748826','Alabama','AL','Alabama','','','2015-02-03 19:39:05'),('AK','8f241f11096877ac0.98748826','Alaska','AK','Alaska','','','2015-02-03 19:39:05'),('AS','8f241f11096877ac0.98748826','Amerikanisch-Samoa','AS','American Samoa','','','2015-02-03 19:39:05'),('AZ','8f241f11096877ac0.98748826','Arizona','AZ','Arizona','','','2015-02-03 19:39:05'),('AR','8f241f11096877ac0.98748826','Arkansas','AR','Arkansas','','','2015-02-03 19:39:05'),('CA','8f241f11096877ac0.98748826','Kalifornien','CA','California','','','2015-02-03 19:39:05'),('CO','8f241f11096877ac0.98748826','Colorado','CO','Colorado','','','2015-02-03 19:39:05'),('CT','8f241f11096877ac0.98748826','Connecticut','CT','Connecticut','','','2015-02-03 19:39:05'),('DE','8f241f11096877ac0.98748826','Delaware','DE','Delaware','','','2015-02-03 19:39:05'),('DC','8f241f11096877ac0.98748826','District of Columbia','DC','District of Columbia','','','2015-02-03 19:39:05'),('FM','8f241f11096877ac0.98748826','FÃ¶derierten Staaten von Mikronesien','FM','Federated States of Micronesia','','','2015-02-03 19:39:05'),('FL','8f241f11096877ac0.98748826','Florida','FL','Florida','','','2015-02-03 19:39:05'),('GA','8f241f11096877ac0.98748826','Georgia','GA','Georgia','','','2015-02-03 19:39:05'),('GU','8f241f11096877ac0.98748826','Guam','GU','Guam','','','2015-02-03 19:39:05'),('HI','8f241f11096877ac0.98748826','Hawaii','HI','Hawaii','','','2015-02-03 19:39:05'),('ID','8f241f11096877ac0.98748826','Idaho','ID','Idaho','','','2015-02-03 19:39:05'),('IL','8f241f11096877ac0.98748826','Illinois','IL','Illinois','','','2015-02-03 19:39:05'),('IN','8f241f11096877ac0.98748826','Indiana','IN','Indiana','','','2015-02-03 19:39:05'),('IA','8f241f11096877ac0.98748826','Iowa','IA','Iowa','','','2015-02-03 19:39:05'),('KS','8f241f11096877ac0.98748826','Kansas','KS','Kansas','','','2015-02-03 19:39:05'),('KY','8f241f11096877ac0.98748826','Kentucky','KY','Kentucky','','','2015-02-03 19:39:05'),('LA','8f241f11096877ac0.98748826','Louisiana','LA','Louisiana','','','2015-02-03 19:39:05'),('ME','8f241f11096877ac0.98748826','Maine','ME','Maine','','','2015-02-03 19:39:05'),('MH','8f241f11096877ac0.98748826','Marshallinseln','MH','Marshall Islands','','','2015-02-03 19:39:05'),('MD','8f241f11096877ac0.98748826','Maryland','MD','Maryland','','','2015-02-03 19:39:05'),('MA','8f241f11096877ac0.98748826','Massachusetts','MA','Massachusetts','','','2015-02-03 19:39:05'),('MI','8f241f11096877ac0.98748826','Michigan','MI','Michigan','','','2015-02-03 19:39:05'),('MN','8f241f11096877ac0.98748826','Minnesota','MN','Minnesota','','','2015-02-03 19:39:05'),('MS','8f241f11096877ac0.98748826','Mississippi','MS','Mississippi','','','2015-02-03 19:39:05'),('MO','8f241f11096877ac0.98748826','Missouri','MO','Missouri','','','2015-02-03 19:39:05'),('MT','8f241f11096877ac0.98748826','Montana','MT','Montana','','','2015-02-03 19:39:05'),('NE','8f241f11096877ac0.98748826','Nebraska','NE','Nebraska','','','2015-02-03 19:39:05'),('NV','8f241f11096877ac0.98748826','Nevada','NV','Nevada','','','2015-02-03 19:39:05'),('NH','8f241f11096877ac0.98748826','New Hampshire','NH','New Hampshire','','','2015-02-03 19:39:05'),('NJ','8f241f11096877ac0.98748826','New Jersey','NJ','New Jersey','','','2015-02-03 19:39:05'),('NM','8f241f11096877ac0.98748826','Neumexiko','NM','New Mexico','','','2015-02-03 19:39:05'),('NY','8f241f11096877ac0.98748826','New York','NY','New York','','','2015-02-03 19:39:05'),('NC','8f241f11096877ac0.98748826','North Carolina','NC','North Carolina','','','2015-02-03 19:39:05'),('ND','8f241f11096877ac0.98748826','North Dakota','ND','North Dakota','','','2015-02-03 19:39:05'),('MP','8f241f11096877ac0.98748826','NÃ¶rdlichen Marianen','MP','Northern Mariana Islands','','','2015-02-03 19:39:05'),('OH','8f241f11096877ac0.98748826','Ohio','OH','Ohio','','','2015-02-03 19:39:05'),('OK','8f241f11096877ac0.98748826','Oklahoma','OK','Oklahoma','','','2015-02-03 19:39:05'),('OR','8f241f11096877ac0.98748826','Oregon','OR','Oregon','','','2015-02-03 19:39:05'),('PW','8f241f11096877ac0.98748826','Palau','PW','Palau','','','2015-02-03 19:39:05'),('PA','8f241f11096877ac0.98748826','Pennsylvania','PA','Pennsylvania','','','2015-02-03 19:39:05'),('PR','8f241f11096877ac0.98748826','Puerto Rico','PR','Puerto Rico','','','2015-02-03 19:39:05'),('RI','8f241f11096877ac0.98748826','Rhode Island','RI','Rhode Island','','','2015-02-03 19:39:05'),('SC','8f241f11096877ac0.98748826','SÃ¼dkarolina','SC','South Carolina','','','2015-02-03 19:39:05'),('SD','8f241f11096877ac0.98748826','SÃ¼ddakota','SD','South Dakota','','','2015-02-03 19:39:05'),('TN','8f241f11096877ac0.98748826','Tennessee','TN','Tennessee','','','2015-02-03 19:39:05'),('TX','8f241f11096877ac0.98748826','Texas','TX','Texas','','','2015-02-03 19:39:05'),('UT','8f241f11096877ac0.98748826','Utah','UT','Utah','','','2015-02-03 19:39:05'),('VT','8f241f11096877ac0.98748826','Vermont','VT','Vermont','','','2015-02-03 19:39:05'),('VI','8f241f11096877ac0.98748826','Jungferninseln','VI','Virgin Islands','','','2015-02-03 19:39:05'),('VA','8f241f11096877ac0.98748826','Virginia','VA','Virginia','','','2015-02-03 19:39:05'),('WA','8f241f11096877ac0.98748826','Washington','WA','Washington','','','2015-02-03 19:39:05'),('WV','8f241f11096877ac0.98748826','West Virginia','WV','West Virginia','','','2015-02-03 19:39:05'),('WI','8f241f11096877ac0.98748826','Wisconsin','WI','Wisconsin','','','2015-02-03 19:39:05'),('WY','8f241f11096877ac0.98748826','Wyoming','WY','Wyoming','','','2015-02-03 19:39:05'),('AA','8f241f11096877ac0.98748826','Armed Forces Americas','AA','Armed Forces Americas','','','2015-02-03 19:39:05'),('AE','8f241f11096877ac0.98748826','Armed Forces','AE','Armed Forces','','','2015-02-03 19:39:05'),('AP','8f241f11096877ac0.98748826','Armed Forces Pacific','AP','Armed Forces Pacific','','','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxstatistics`
--

DROP TABLE IF EXISTS `oxstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxstatistics` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Record id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXTITLE` char(32) NOT NULL DEFAULT '' COMMENT 'Title',
  `OXVALUE` text NOT NULL COMMENT 'Serialized array of reports',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxstatistics`
--

LOCK TABLES `oxstatistics` WRITE;
/*!40000 ALTER TABLE `oxstatistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxtplblocks`
--

DROP TABLE IF EXISTS `oxtplblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxtplblocks` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Block id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Shop id (oxshops)',
  `OXTEMPLATE` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Template filename (with rel. path), where block is located',
  `OXBLOCKNAME` char(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Block name',
  `OXPOS` int(11) NOT NULL COMMENT 'Sorting',
  `OXFILE` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Module template filename, where block replacement is located',
  `OXMODULE` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Module, which uses this template',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `search` (`OXACTIVE`,`OXTEMPLATE`,`OXPOS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module template blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxtplblocks`
--

LOCK TABLES `oxtplblocks` WRITE;
/*!40000 ALTER TABLE `oxtplblocks` DISABLE KEYS */;
INSERT INTO `oxtplblocks` VALUES ('aba2417d4a2846a07c1575a20479c927',1,'oxbaseshop','order_overview.tpl','admin_order_overview_export',1,'views/admin/blocks/order_overview.tpl','invoicepdf','2015-02-03 19:39:05');
/*!40000 ALTER TABLE `oxtplblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuser`
--

DROP TABLE IF EXISTS `oxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuser` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'User id',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `OXRIGHTS` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User rights: user, malladmin',
  `OXSHOPID` char(32) NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXUSERNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Username',
  `OXPASSWORD` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hashed password',
  `OXPASSSALT` char(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Password salt',
  `OXCUSTNR` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Customer number',
  `OXUSTID` varchar(255) NOT NULL DEFAULT '' COMMENT 'VAT ID No.',
  `OXCOMPANY` varchar(255) NOT NULL DEFAULT '' COMMENT 'Company',
  `OXFNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'First name',
  `OXLNAME` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last name',
  `OXSTREET` varchar(255) NOT NULL DEFAULT '' COMMENT 'Street',
  `OXSTREETNR` varchar(16) NOT NULL DEFAULT '' COMMENT 'House number',
  `OXADDINFO` varchar(255) NOT NULL DEFAULT '' COMMENT 'Additional info',
  `OXCITY` varchar(255) NOT NULL DEFAULT '' COMMENT 'City',
  `OXCOUNTRYID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Country id (oxcountry)',
  `OXSTATEID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'State id (oxstates)',
  `OXZIP` varchar(16) NOT NULL DEFAULT '' COMMENT 'ZIP code',
  `OXFON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Phone number',
  `OXFAX` varchar(128) NOT NULL DEFAULT '' COMMENT 'Fax number',
  `OXSAL` varchar(128) NOT NULL DEFAULT '' COMMENT 'User title (Mr/Mrs)',
  `OXBONI` int(11) NOT NULL DEFAULT '0' COMMENT 'Credit points',
  `OXCREATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation time',
  `OXREGISTER` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Registration time',
  `OXPRIVFON` varchar(64) NOT NULL DEFAULT '' COMMENT 'Personal phone number',
  `OXMOBFON` varchar(64) NOT NULL DEFAULT '' COMMENT 'Mobile phone number',
  `OXBIRTHDATE` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Birthday date',
  `OXURL` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url',
  `OXUPDATEKEY` varchar(32) NOT NULL DEFAULT '' COMMENT 'Update key',
  `OXUPDATEEXP` int(11) NOT NULL DEFAULT '0' COMMENT 'Update key expiration time',
  `OXPOINTS` double NOT NULL DEFAULT '0' COMMENT 'User points (for registration, invitation, etc)',
  `OXFBID` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Facebook id (used for openid login)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  UNIQUE KEY `OXUSERNAME` (`OXUSERNAME`,`OXSHOPID`),
  KEY `OXPASSWORD` (`OXPASSWORD`),
  KEY `OXCUSTNR` (`OXCUSTNR`),
  KEY `OXACTIVE` (`OXACTIVE`),
  KEY `OXLNAME` (`OXLNAME`),
  KEY `OXUPDATEEXP` (`OXUPDATEEXP`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Shop administrators and users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuser`
--

LOCK TABLES `oxuser` WRITE;
/*!40000 ALTER TABLE `oxuser` DISABLE KEYS */;
INSERT INTO `oxuser` VALUES ('oxdefaultadmin',1,'malladmin','oxbaseshop','admin@admin.com','ae3d5603c9cad55ac6e4df8d12ac52c6b1ccf759161d9785c9abc6418071a2347b6fb9559bab366e281292a44b1e3441380d75fe9e4cb16a80efa27354b42b06','730f0afa8a6d624429ca8d518c15f003',1,'','Your Company Name','John','Doe','Maple Street','2425','','Any City','a7c40f631fc920687.20179984','','9041','217-8918712','217-8918713','MR',1000,'2003-01-01 00:00:00','2003-01-01 00:00:00','','','0000-00-00','','',0,0,0,'2015-02-03 19:39:35');
/*!40000 ALTER TABLE `oxuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserbasketitems`
--

DROP TABLE IF EXISTS `oxuserbasketitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserbasketitems` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Item id',
  `OXBASKETID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Basket id (oxuserbaskets)',
  `OXARTID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Article id (oxarticles)',
  `OXAMOUNT` char(32) NOT NULL DEFAULT '' COMMENT 'Amount',
  `OXSELLIST` varchar(255) NOT NULL DEFAULT '' COMMENT 'Selection list',
  `OXPERSPARAM` text NOT NULL COMMENT 'Serialized persistent parameters',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXBASKETID` (`OXBASKETID`),
  KEY `OXARTID` (`OXARTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User basket items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserbasketitems`
--

LOCK TABLES `oxuserbasketitems` WRITE;
/*!40000 ALTER TABLE `oxuserbasketitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserbasketitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserbaskets`
--

DROP TABLE IF EXISTS `oxuserbaskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserbaskets` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Basket id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Basket title',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `OXPUBLIC` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is public',
  `OXUPDATE` int(11) NOT NULL DEFAULT '0' COMMENT 'Update timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUPDATE` (`OXUPDATE`),
  KEY `OXTITLE` (`OXTITLE`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Active User baskets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserbaskets`
--

LOCK TABLES `oxuserbaskets` WRITE;
/*!40000 ALTER TABLE `oxuserbaskets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserbaskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxuserpayments`
--

DROP TABLE IF EXISTS `oxuserpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxuserpayments` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Payment id',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxusers)',
  `OXPAYMENTSID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Payment id (oxpayments)',
  `OXVALUE` blob NOT NULL COMMENT 'DYN payment values array as string',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXUSERID` (`OXUSERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User payments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxuserpayments`
--

LOCK TABLES `oxuserpayments` WRITE;
/*!40000 ALTER TABLE `oxuserpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxuserpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `oxv_oxactions`
--

DROP TABLE IF EXISTS `oxv_oxactions`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxactions` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXPIC_1` tinyint NOT NULL,
  `OXPIC_2` tinyint NOT NULL,
  `OXPIC_3` tinyint NOT NULL,
  `OXLINK` tinyint NOT NULL,
  `OXLINK_1` tinyint NOT NULL,
  `OXLINK_2` tinyint NOT NULL,
  `OXLINK_3` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxactions_de`
--

DROP TABLE IF EXISTS `oxv_oxactions_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxactions_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXLINK` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxactions_en`
--

DROP TABLE IF EXISTS `oxv_oxactions_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxactions_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXLINK` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends`
--

DROP TABLE IF EXISTS `oxv_oxartextends`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxartextends` (
  `OXID` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXTAGS` tinyint NOT NULL,
  `OXTAGS_1` tinyint NOT NULL,
  `OXTAGS_2` tinyint NOT NULL,
  `OXTAGS_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends_de`
--

DROP TABLE IF EXISTS `oxv_oxartextends_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxartextends_de` (
  `OXID` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTAGS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxartextends_en`
--

DROP TABLE IF EXISTS `oxv_oxartextends_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxartextends_en` (
  `OXID` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTAGS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles`
--

DROP TABLE IF EXISTS `oxv_oxarticles`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxarticles` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXARTNUM` tinyint NOT NULL,
  `OXEAN` tinyint NOT NULL,
  `OXDISTEAN` tinyint NOT NULL,
  `OXMPN` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXBLFIXEDPRICE` tinyint NOT NULL,
  `OXPRICEA` tinyint NOT NULL,
  `OXPRICEB` tinyint NOT NULL,
  `OXPRICEC` tinyint NOT NULL,
  `OXBPRICE` tinyint NOT NULL,
  `OXTPRICE` tinyint NOT NULL,
  `OXUNITNAME` tinyint NOT NULL,
  `OXUNITQUANTITY` tinyint NOT NULL,
  `OXEXTURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXURLIMG` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPIC1` tinyint NOT NULL,
  `OXPIC2` tinyint NOT NULL,
  `OXPIC3` tinyint NOT NULL,
  `OXPIC4` tinyint NOT NULL,
  `OXPIC5` tinyint NOT NULL,
  `OXPIC6` tinyint NOT NULL,
  `OXPIC7` tinyint NOT NULL,
  `OXPIC8` tinyint NOT NULL,
  `OXPIC9` tinyint NOT NULL,
  `OXPIC10` tinyint NOT NULL,
  `OXPIC11` tinyint NOT NULL,
  `OXPIC12` tinyint NOT NULL,
  `OXWEIGHT` tinyint NOT NULL,
  `OXSTOCK` tinyint NOT NULL,
  `OXSTOCKFLAG` tinyint NOT NULL,
  `OXSTOCKTEXT` tinyint NOT NULL,
  `OXNOSTOCKTEXT` tinyint NOT NULL,
  `OXDELIVERY` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXLENGTH` tinyint NOT NULL,
  `OXWIDTH` tinyint NOT NULL,
  `OXHEIGHT` tinyint NOT NULL,
  `OXFILE` tinyint NOT NULL,
  `OXSEARCHKEYS` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXQUESTIONEMAIL` tinyint NOT NULL,
  `OXISSEARCH` tinyint NOT NULL,
  `OXISCONFIGURABLE` tinyint NOT NULL,
  `OXVARNAME` tinyint NOT NULL,
  `OXVARSTOCK` tinyint NOT NULL,
  `OXVARCOUNT` tinyint NOT NULL,
  `OXVARSELECT` tinyint NOT NULL,
  `OXVARMINPRICE` tinyint NOT NULL,
  `OXVARMAXPRICE` tinyint NOT NULL,
  `OXVARNAME_1` tinyint NOT NULL,
  `OXVARSELECT_1` tinyint NOT NULL,
  `OXVARNAME_2` tinyint NOT NULL,
  `OXVARSELECT_2` tinyint NOT NULL,
  `OXVARNAME_3` tinyint NOT NULL,
  `OXVARSELECT_3` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXSHORTDESC_1` tinyint NOT NULL,
  `OXURLDESC_1` tinyint NOT NULL,
  `OXSEARCHKEYS_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXSHORTDESC_2` tinyint NOT NULL,
  `OXURLDESC_2` tinyint NOT NULL,
  `OXSEARCHKEYS_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXSHORTDESC_3` tinyint NOT NULL,
  `OXURLDESC_3` tinyint NOT NULL,
  `OXSEARCHKEYS_3` tinyint NOT NULL,
  `OXBUNDLEID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXSUBCLASS` tinyint NOT NULL,
  `OXSTOCKTEXT_1` tinyint NOT NULL,
  `OXSTOCKTEXT_2` tinyint NOT NULL,
  `OXSTOCKTEXT_3` tinyint NOT NULL,
  `OXNOSTOCKTEXT_1` tinyint NOT NULL,
  `OXNOSTOCKTEXT_2` tinyint NOT NULL,
  `OXNOSTOCKTEXT_3` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXSOLDAMOUNT` tinyint NOT NULL,
  `OXNONMATERIAL` tinyint NOT NULL,
  `OXFREESHIPPING` tinyint NOT NULL,
  `OXREMINDACTIVE` tinyint NOT NULL,
  `OXREMINDAMOUNT` tinyint NOT NULL,
  `OXAMITEMID` tinyint NOT NULL,
  `OXAMTASKID` tinyint NOT NULL,
  `OXVENDORID` tinyint NOT NULL,
  `OXMANUFACTURERID` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXRATING` tinyint NOT NULL,
  `OXRATINGCNT` tinyint NOT NULL,
  `OXMINDELTIME` tinyint NOT NULL,
  `OXMAXDELTIME` tinyint NOT NULL,
  `OXDELTIMEUNIT` tinyint NOT NULL,
  `OXUPDATEPRICE` tinyint NOT NULL,
  `OXUPDATEPRICEA` tinyint NOT NULL,
  `OXUPDATEPRICEB` tinyint NOT NULL,
  `OXUPDATEPRICEC` tinyint NOT NULL,
  `OXUPDATEPRICETIME` tinyint NOT NULL,
  `OXISDOWNLOADABLE` tinyint NOT NULL,
  `OXSHOWCUSTOMAGREEMENT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_de`
--

DROP TABLE IF EXISTS `oxv_oxarticles_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxarticles_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXARTNUM` tinyint NOT NULL,
  `OXEAN` tinyint NOT NULL,
  `OXDISTEAN` tinyint NOT NULL,
  `OXMPN` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXBLFIXEDPRICE` tinyint NOT NULL,
  `OXPRICEA` tinyint NOT NULL,
  `OXPRICEB` tinyint NOT NULL,
  `OXPRICEC` tinyint NOT NULL,
  `OXBPRICE` tinyint NOT NULL,
  `OXTPRICE` tinyint NOT NULL,
  `OXUNITNAME` tinyint NOT NULL,
  `OXUNITQUANTITY` tinyint NOT NULL,
  `OXEXTURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXURLIMG` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPIC1` tinyint NOT NULL,
  `OXPIC2` tinyint NOT NULL,
  `OXPIC3` tinyint NOT NULL,
  `OXPIC4` tinyint NOT NULL,
  `OXPIC5` tinyint NOT NULL,
  `OXPIC6` tinyint NOT NULL,
  `OXPIC7` tinyint NOT NULL,
  `OXPIC8` tinyint NOT NULL,
  `OXPIC9` tinyint NOT NULL,
  `OXPIC10` tinyint NOT NULL,
  `OXPIC11` tinyint NOT NULL,
  `OXPIC12` tinyint NOT NULL,
  `OXWEIGHT` tinyint NOT NULL,
  `OXSTOCK` tinyint NOT NULL,
  `OXSTOCKFLAG` tinyint NOT NULL,
  `OXSTOCKTEXT` tinyint NOT NULL,
  `OXNOSTOCKTEXT` tinyint NOT NULL,
  `OXDELIVERY` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXLENGTH` tinyint NOT NULL,
  `OXWIDTH` tinyint NOT NULL,
  `OXHEIGHT` tinyint NOT NULL,
  `OXFILE` tinyint NOT NULL,
  `OXSEARCHKEYS` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXQUESTIONEMAIL` tinyint NOT NULL,
  `OXISSEARCH` tinyint NOT NULL,
  `OXISCONFIGURABLE` tinyint NOT NULL,
  `OXVARNAME` tinyint NOT NULL,
  `OXVARSTOCK` tinyint NOT NULL,
  `OXVARCOUNT` tinyint NOT NULL,
  `OXVARSELECT` tinyint NOT NULL,
  `OXVARMINPRICE` tinyint NOT NULL,
  `OXVARMAXPRICE` tinyint NOT NULL,
  `OXBUNDLEID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXSUBCLASS` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXSOLDAMOUNT` tinyint NOT NULL,
  `OXNONMATERIAL` tinyint NOT NULL,
  `OXFREESHIPPING` tinyint NOT NULL,
  `OXREMINDACTIVE` tinyint NOT NULL,
  `OXREMINDAMOUNT` tinyint NOT NULL,
  `OXAMITEMID` tinyint NOT NULL,
  `OXAMTASKID` tinyint NOT NULL,
  `OXVENDORID` tinyint NOT NULL,
  `OXMANUFACTURERID` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXRATING` tinyint NOT NULL,
  `OXRATINGCNT` tinyint NOT NULL,
  `OXMINDELTIME` tinyint NOT NULL,
  `OXMAXDELTIME` tinyint NOT NULL,
  `OXDELTIMEUNIT` tinyint NOT NULL,
  `OXUPDATEPRICE` tinyint NOT NULL,
  `OXUPDATEPRICEA` tinyint NOT NULL,
  `OXUPDATEPRICEB` tinyint NOT NULL,
  `OXUPDATEPRICEC` tinyint NOT NULL,
  `OXUPDATEPRICETIME` tinyint NOT NULL,
  `OXISDOWNLOADABLE` tinyint NOT NULL,
  `OXSHOWCUSTOMAGREEMENT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxarticles_en`
--

DROP TABLE IF EXISTS `oxv_oxarticles_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxarticles_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXARTNUM` tinyint NOT NULL,
  `OXEAN` tinyint NOT NULL,
  `OXDISTEAN` tinyint NOT NULL,
  `OXMPN` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXBLFIXEDPRICE` tinyint NOT NULL,
  `OXPRICEA` tinyint NOT NULL,
  `OXPRICEB` tinyint NOT NULL,
  `OXPRICEC` tinyint NOT NULL,
  `OXBPRICE` tinyint NOT NULL,
  `OXTPRICE` tinyint NOT NULL,
  `OXUNITNAME` tinyint NOT NULL,
  `OXUNITQUANTITY` tinyint NOT NULL,
  `OXEXTURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXURLIMG` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPIC1` tinyint NOT NULL,
  `OXPIC2` tinyint NOT NULL,
  `OXPIC3` tinyint NOT NULL,
  `OXPIC4` tinyint NOT NULL,
  `OXPIC5` tinyint NOT NULL,
  `OXPIC6` tinyint NOT NULL,
  `OXPIC7` tinyint NOT NULL,
  `OXPIC8` tinyint NOT NULL,
  `OXPIC9` tinyint NOT NULL,
  `OXPIC10` tinyint NOT NULL,
  `OXPIC11` tinyint NOT NULL,
  `OXPIC12` tinyint NOT NULL,
  `OXWEIGHT` tinyint NOT NULL,
  `OXSTOCK` tinyint NOT NULL,
  `OXSTOCKFLAG` tinyint NOT NULL,
  `OXSTOCKTEXT` tinyint NOT NULL,
  `OXNOSTOCKTEXT` tinyint NOT NULL,
  `OXDELIVERY` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXLENGTH` tinyint NOT NULL,
  `OXWIDTH` tinyint NOT NULL,
  `OXHEIGHT` tinyint NOT NULL,
  `OXFILE` tinyint NOT NULL,
  `OXSEARCHKEYS` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXQUESTIONEMAIL` tinyint NOT NULL,
  `OXISSEARCH` tinyint NOT NULL,
  `OXISCONFIGURABLE` tinyint NOT NULL,
  `OXVARNAME` tinyint NOT NULL,
  `OXVARSTOCK` tinyint NOT NULL,
  `OXVARCOUNT` tinyint NOT NULL,
  `OXVARSELECT` tinyint NOT NULL,
  `OXVARMINPRICE` tinyint NOT NULL,
  `OXVARMAXPRICE` tinyint NOT NULL,
  `OXBUNDLEID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXSUBCLASS` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXSOLDAMOUNT` tinyint NOT NULL,
  `OXNONMATERIAL` tinyint NOT NULL,
  `OXFREESHIPPING` tinyint NOT NULL,
  `OXREMINDACTIVE` tinyint NOT NULL,
  `OXREMINDAMOUNT` tinyint NOT NULL,
  `OXAMITEMID` tinyint NOT NULL,
  `OXAMTASKID` tinyint NOT NULL,
  `OXVENDORID` tinyint NOT NULL,
  `OXMANUFACTURERID` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXRATING` tinyint NOT NULL,
  `OXRATINGCNT` tinyint NOT NULL,
  `OXMINDELTIME` tinyint NOT NULL,
  `OXMAXDELTIME` tinyint NOT NULL,
  `OXDELTIMEUNIT` tinyint NOT NULL,
  `OXUPDATEPRICE` tinyint NOT NULL,
  `OXUPDATEPRICEA` tinyint NOT NULL,
  `OXUPDATEPRICEB` tinyint NOT NULL,
  `OXUPDATEPRICEC` tinyint NOT NULL,
  `OXUPDATEPRICETIME` tinyint NOT NULL,
  `OXISDOWNLOADABLE` tinyint NOT NULL,
  `OXSHOWCUSTOMAGREEMENT` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute`
--

DROP TABLE IF EXISTS `oxv_oxattribute`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxattribute` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXDISPLAYINBASKET` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_de`
--

DROP TABLE IF EXISTS `oxv_oxattribute_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxattribute_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXDISPLAYINBASKET` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxattribute_en`
--

DROP TABLE IF EXISTS `oxv_oxattribute_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxattribute_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL,
  `OXDISPLAYINBASKET` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories`
--

DROP TABLE IF EXISTS `oxv_oxcategories`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcategories` (
  `OXID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXLEFT` tinyint NOT NULL,
  `OXRIGHT` tinyint NOT NULL,
  `OXROOTID` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXHIDDEN` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXTHUMB_1` tinyint NOT NULL,
  `OXTHUMB_2` tinyint NOT NULL,
  `OXTHUMB_3` tinyint NOT NULL,
  `OXEXTLINK` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXDEFSORT` tinyint NOT NULL,
  `OXDEFSORTMODE` tinyint NOT NULL,
  `OXPRICEFROM` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXACTIVE_1` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXDESC_1` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXACTIVE_2` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXDESC_2` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXACTIVE_3` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXDESC_3` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPROMOICON` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_de`
--

DROP TABLE IF EXISTS `oxv_oxcategories_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcategories_de` (
  `OXID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXLEFT` tinyint NOT NULL,
  `OXRIGHT` tinyint NOT NULL,
  `OXROOTID` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXHIDDEN` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXEXTLINK` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXDEFSORT` tinyint NOT NULL,
  `OXDEFSORTMODE` tinyint NOT NULL,
  `OXPRICEFROM` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPROMOICON` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcategories_en`
--

DROP TABLE IF EXISTS `oxv_oxcategories_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcategories_en` (
  `OXID` tinyint NOT NULL,
  `OXPARENTID` tinyint NOT NULL,
  `OXLEFT` tinyint NOT NULL,
  `OXRIGHT` tinyint NOT NULL,
  `OXROOTID` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXHIDDEN` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTHUMB` tinyint NOT NULL,
  `OXEXTLINK` tinyint NOT NULL,
  `OXTEMPLATE` tinyint NOT NULL,
  `OXDEFSORT` tinyint NOT NULL,
  `OXDEFSORTMODE` tinyint NOT NULL,
  `OXPRICEFROM` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXPROMOICON` tinyint NOT NULL,
  `OXVAT` tinyint NOT NULL,
  `OXSKIPDISCOUNTS` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents`
--

DROP TABLE IF EXISTS `oxv_oxcontents`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcontents` (
  `OXID` tinyint NOT NULL,
  `OXLOADID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXSNIPPET` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVE_1` tinyint NOT NULL,
  `OXPOSITION` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXCONTENT` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXCONTENT_1` tinyint NOT NULL,
  `OXACTIVE_2` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXCONTENT_2` tinyint NOT NULL,
  `OXACTIVE_3` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXCONTENT_3` tinyint NOT NULL,
  `OXCATID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXTERMVERSION` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents_de`
--

DROP TABLE IF EXISTS `oxv_oxcontents_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcontents_de` (
  `OXID` tinyint NOT NULL,
  `OXLOADID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXSNIPPET` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXPOSITION` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXCONTENT` tinyint NOT NULL,
  `OXCATID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXTERMVERSION` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcontents_en`
--

DROP TABLE IF EXISTS `oxv_oxcontents_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcontents_en` (
  `OXID` tinyint NOT NULL,
  `OXLOADID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXSNIPPET` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXPOSITION` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXCONTENT` tinyint NOT NULL,
  `OXCATID` tinyint NOT NULL,
  `OXFOLDER` tinyint NOT NULL,
  `OXTERMVERSION` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry`
--

DROP TABLE IF EXISTS `oxv_oxcountry`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcountry` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXISOALPHA3` tinyint NOT NULL,
  `OXUNNUM3` tinyint NOT NULL,
  `OXVATINPREFIX` tinyint NOT NULL,
  `OXORDER` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXSHORTDESC_1` tinyint NOT NULL,
  `OXSHORTDESC_2` tinyint NOT NULL,
  `OXSHORTDESC_3` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXVATSTATUS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry_de`
--

DROP TABLE IF EXISTS `oxv_oxcountry_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcountry_de` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXISOALPHA3` tinyint NOT NULL,
  `OXUNNUM3` tinyint NOT NULL,
  `OXVATINPREFIX` tinyint NOT NULL,
  `OXORDER` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXVATSTATUS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxcountry_en`
--

DROP TABLE IF EXISTS `oxv_oxcountry_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxcountry_en` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXISOALPHA3` tinyint NOT NULL,
  `OXUNNUM3` tinyint NOT NULL,
  `OXVATINPREFIX` tinyint NOT NULL,
  `OXORDER` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXVATSTATUS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery`
--

DROP TABLE IF EXISTS `oxv_oxdelivery`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdelivery` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXDELTYPE` tinyint NOT NULL,
  `OXPARAM` tinyint NOT NULL,
  `OXPARAMEND` tinyint NOT NULL,
  `OXFIXED` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXFINALIZE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_de`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdelivery_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXDELTYPE` tinyint NOT NULL,
  `OXPARAM` tinyint NOT NULL,
  `OXPARAMEND` tinyint NOT NULL,
  `OXFIXED` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXFINALIZE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdelivery_en`
--

DROP TABLE IF EXISTS `oxv_oxdelivery_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdelivery_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXDELTYPE` tinyint NOT NULL,
  `OXPARAM` tinyint NOT NULL,
  `OXPARAMEND` tinyint NOT NULL,
  `OXFIXED` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXFINALIZE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdeliveryset` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_de`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdeliveryset_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdeliveryset_en`
--

DROP TABLE IF EXISTS `oxv_oxdeliveryset_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdeliveryset_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount`
--

DROP TABLE IF EXISTS `oxv_oxdiscount`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdiscount` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXAMOUNT` tinyint NOT NULL,
  `OXAMOUNTTO` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXITMARTID` tinyint NOT NULL,
  `OXITMAMOUNT` tinyint NOT NULL,
  `OXITMMULTIPLE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_de`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdiscount_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXAMOUNT` tinyint NOT NULL,
  `OXAMOUNTTO` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXITMARTID` tinyint NOT NULL,
  `OXITMAMOUNT` tinyint NOT NULL,
  `OXITMMULTIPLE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxdiscount_en`
--

DROP TABLE IF EXISTS `oxv_oxdiscount_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxdiscount_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXAMOUNT` tinyint NOT NULL,
  `OXAMOUNTTO` tinyint NOT NULL,
  `OXPRICETO` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXITMARTID` tinyint NOT NULL,
  `OXITMAMOUNT` tinyint NOT NULL,
  `OXITMMULTIPLE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups`
--

DROP TABLE IF EXISTS `oxv_oxgroups`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxgroups` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups_de`
--

DROP TABLE IF EXISTS `oxv_oxgroups_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxgroups_de` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxgroups_en`
--

DROP TABLE IF EXISTS `oxv_oxgroups_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxgroups_en` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks`
--

DROP TABLE IF EXISTS `oxv_oxlinks`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxlinks` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXURLDESC_1` tinyint NOT NULL,
  `OXURLDESC_2` tinyint NOT NULL,
  `OXURLDESC_3` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_de`
--

DROP TABLE IF EXISTS `oxv_oxlinks_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxlinks_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxlinks_en`
--

DROP TABLE IF EXISTS `oxv_oxlinks_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxlinks_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXURLDESC` tinyint NOT NULL,
  `OXINSERT` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmanufacturers` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXSHORTDESC_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXSHORTDESC_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXSHORTDESC_3` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_de`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmanufacturers_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmanufacturers_en`
--

DROP TABLE IF EXISTS `oxv_oxmanufacturers_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmanufacturers_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmediaurls` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXDESC_1` tinyint NOT NULL,
  `OXDESC_2` tinyint NOT NULL,
  `OXDESC_3` tinyint NOT NULL,
  `OXISUPLOADED` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls_de`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmediaurls_de` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXISUPLOADED` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxmediaurls_en`
--

DROP TABLE IF EXISTS `oxv_oxmediaurls_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxmediaurls_en` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXISUPLOADED` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxnews`
--

DROP TABLE IF EXISTS `oxv_oxnews`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxnews` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXDATE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXACTIVE_1` tinyint NOT NULL,
  `OXSHORTDESC_1` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXACTIVE_2` tinyint NOT NULL,
  `OXSHORTDESC_2` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXACTIVE_3` tinyint NOT NULL,
  `OXSHORTDESC_3` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxnews_de`
--

DROP TABLE IF EXISTS `oxv_oxnews_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxnews_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXDATE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxnews_en`
--

DROP TABLE IF EXISTS `oxv_oxnews_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxnews_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVEFROM` tinyint NOT NULL,
  `OXACTIVETO` tinyint NOT NULL,
  `OXDATE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxobject2attribute` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXATTRID` tinyint NOT NULL,
  `OXVALUE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXVALUE_1` tinyint NOT NULL,
  `OXVALUE_2` tinyint NOT NULL,
  `OXVALUE_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute_de`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxobject2attribute_de` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXATTRID` tinyint NOT NULL,
  `OXVALUE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxobject2attribute_en`
--

DROP TABLE IF EXISTS `oxv_oxobject2attribute_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxobject2attribute_en` (
  `OXID` tinyint NOT NULL,
  `OXOBJECTID` tinyint NOT NULL,
  `OXATTRID` tinyint NOT NULL,
  `OXVALUE` tinyint NOT NULL,
  `OXPOS` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments`
--

DROP TABLE IF EXISTS `oxv_oxpayments`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxpayments` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUMRULES` tinyint NOT NULL,
  `OXFROMBONI` tinyint NOT NULL,
  `OXFROMAMOUNT` tinyint NOT NULL,
  `OXTOAMOUNT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXCHECKED` tinyint NOT NULL,
  `OXDESC_1` tinyint NOT NULL,
  `OXVALDESC_1` tinyint NOT NULL,
  `OXDESC_2` tinyint NOT NULL,
  `OXVALDESC_2` tinyint NOT NULL,
  `OXDESC_3` tinyint NOT NULL,
  `OXVALDESC_3` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXLONGDESC_1` tinyint NOT NULL,
  `OXLONGDESC_2` tinyint NOT NULL,
  `OXLONGDESC_3` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTSPAYMENTID` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments_de`
--

DROP TABLE IF EXISTS `oxv_oxpayments_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxpayments_de` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUMRULES` tinyint NOT NULL,
  `OXFROMBONI` tinyint NOT NULL,
  `OXFROMAMOUNT` tinyint NOT NULL,
  `OXTOAMOUNT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXCHECKED` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTSPAYMENTID` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxpayments_en`
--

DROP TABLE IF EXISTS `oxv_oxpayments_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxpayments_en` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXDESC` tinyint NOT NULL,
  `OXADDSUM` tinyint NOT NULL,
  `OXADDSUMTYPE` tinyint NOT NULL,
  `OXADDSUMRULES` tinyint NOT NULL,
  `OXFROMBONI` tinyint NOT NULL,
  `OXFROMAMOUNT` tinyint NOT NULL,
  `OXTOAMOUNT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXCHECKED` tinyint NOT NULL,
  `OXLONGDESC` tinyint NOT NULL,
  `OXSORT` tinyint NOT NULL,
  `OXTSPAYMENTID` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist`
--

DROP TABLE IF EXISTS `oxv_oxselectlist`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxselectlist` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXIDENT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXVALDESC_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXVALDESC_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXVALDESC_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_de`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxselectlist_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXIDENT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxselectlist_en`
--

DROP TABLE IF EXISTS `oxv_oxselectlist_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxselectlist_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXIDENT` tinyint NOT NULL,
  `OXVALDESC` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops`
--

DROP TABLE IF EXISTS `oxv_oxshops`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxshops` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXPRODUCTIVE` tinyint NOT NULL,
  `OXDEFCURRENCY` tinyint NOT NULL,
  `OXDEFLANGUAGE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXTITLEPREFIX` tinyint NOT NULL,
  `OXTITLEPREFIX_1` tinyint NOT NULL,
  `OXTITLEPREFIX_2` tinyint NOT NULL,
  `OXTITLEPREFIX_3` tinyint NOT NULL,
  `OXTITLESUFFIX` tinyint NOT NULL,
  `OXTITLESUFFIX_1` tinyint NOT NULL,
  `OXTITLESUFFIX_2` tinyint NOT NULL,
  `OXTITLESUFFIX_3` tinyint NOT NULL,
  `OXSTARTTITLE` tinyint NOT NULL,
  `OXSTARTTITLE_1` tinyint NOT NULL,
  `OXSTARTTITLE_2` tinyint NOT NULL,
  `OXSTARTTITLE_3` tinyint NOT NULL,
  `OXINFOEMAIL` tinyint NOT NULL,
  `OXORDEREMAIL` tinyint NOT NULL,
  `OXOWNEREMAIL` tinyint NOT NULL,
  `OXORDERSUBJECT` tinyint NOT NULL,
  `OXREGISTERSUBJECT` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT` tinyint NOT NULL,
  `OXORDERSUBJECT_1` tinyint NOT NULL,
  `OXREGISTERSUBJECT_1` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT_1` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT_1` tinyint NOT NULL,
  `OXORDERSUBJECT_2` tinyint NOT NULL,
  `OXREGISTERSUBJECT_2` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT_2` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT_2` tinyint NOT NULL,
  `OXORDERSUBJECT_3` tinyint NOT NULL,
  `OXREGISTERSUBJECT_3` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT_3` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT_3` tinyint NOT NULL,
  `OXSMTP` tinyint NOT NULL,
  `OXSMTPUSER` tinyint NOT NULL,
  `OXSMTPPWD` tinyint NOT NULL,
  `OXCOMPANY` tinyint NOT NULL,
  `OXSTREET` tinyint NOT NULL,
  `OXZIP` tinyint NOT NULL,
  `OXCITY` tinyint NOT NULL,
  `OXCOUNTRY` tinyint NOT NULL,
  `OXBANKNAME` tinyint NOT NULL,
  `OXBANKNUMBER` tinyint NOT NULL,
  `OXBANKCODE` tinyint NOT NULL,
  `OXVATNUMBER` tinyint NOT NULL,
  `OXTAXNUMBER` tinyint NOT NULL,
  `OXBICCODE` tinyint NOT NULL,
  `OXIBANNUMBER` tinyint NOT NULL,
  `OXFNAME` tinyint NOT NULL,
  `OXLNAME` tinyint NOT NULL,
  `OXTELEFON` tinyint NOT NULL,
  `OXTELEFAX` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDEFCAT` tinyint NOT NULL,
  `OXHRBNR` tinyint NOT NULL,
  `OXCOURT` tinyint NOT NULL,
  `OXADBUTLERID` tinyint NOT NULL,
  `OXAFFILINETID` tinyint NOT NULL,
  `OXSUPERCLICKSID` tinyint NOT NULL,
  `OXAFFILIWELTID` tinyint NOT NULL,
  `OXAFFILI24ID` tinyint NOT NULL,
  `OXEDITION` tinyint NOT NULL,
  `OXVERSION` tinyint NOT NULL,
  `OXSEOACTIVE` tinyint NOT NULL,
  `OXSEOACTIVE_1` tinyint NOT NULL,
  `OXSEOACTIVE_2` tinyint NOT NULL,
  `OXSEOACTIVE_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops_de`
--

DROP TABLE IF EXISTS `oxv_oxshops_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxshops_de` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXPRODUCTIVE` tinyint NOT NULL,
  `OXDEFCURRENCY` tinyint NOT NULL,
  `OXDEFLANGUAGE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXTITLEPREFIX` tinyint NOT NULL,
  `OXTITLESUFFIX` tinyint NOT NULL,
  `OXSTARTTITLE` tinyint NOT NULL,
  `OXINFOEMAIL` tinyint NOT NULL,
  `OXORDEREMAIL` tinyint NOT NULL,
  `OXOWNEREMAIL` tinyint NOT NULL,
  `OXORDERSUBJECT` tinyint NOT NULL,
  `OXREGISTERSUBJECT` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT` tinyint NOT NULL,
  `OXSMTP` tinyint NOT NULL,
  `OXSMTPUSER` tinyint NOT NULL,
  `OXSMTPPWD` tinyint NOT NULL,
  `OXCOMPANY` tinyint NOT NULL,
  `OXSTREET` tinyint NOT NULL,
  `OXZIP` tinyint NOT NULL,
  `OXCITY` tinyint NOT NULL,
  `OXCOUNTRY` tinyint NOT NULL,
  `OXBANKNAME` tinyint NOT NULL,
  `OXBANKNUMBER` tinyint NOT NULL,
  `OXBANKCODE` tinyint NOT NULL,
  `OXVATNUMBER` tinyint NOT NULL,
  `OXTAXNUMBER` tinyint NOT NULL,
  `OXBICCODE` tinyint NOT NULL,
  `OXIBANNUMBER` tinyint NOT NULL,
  `OXFNAME` tinyint NOT NULL,
  `OXLNAME` tinyint NOT NULL,
  `OXTELEFON` tinyint NOT NULL,
  `OXTELEFAX` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDEFCAT` tinyint NOT NULL,
  `OXHRBNR` tinyint NOT NULL,
  `OXCOURT` tinyint NOT NULL,
  `OXADBUTLERID` tinyint NOT NULL,
  `OXAFFILINETID` tinyint NOT NULL,
  `OXSUPERCLICKSID` tinyint NOT NULL,
  `OXAFFILIWELTID` tinyint NOT NULL,
  `OXAFFILI24ID` tinyint NOT NULL,
  `OXEDITION` tinyint NOT NULL,
  `OXVERSION` tinyint NOT NULL,
  `OXSEOACTIVE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxshops_en`
--

DROP TABLE IF EXISTS `oxv_oxshops_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxshops_en` (
  `OXID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXPRODUCTIVE` tinyint NOT NULL,
  `OXDEFCURRENCY` tinyint NOT NULL,
  `OXDEFLANGUAGE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXTITLEPREFIX` tinyint NOT NULL,
  `OXTITLESUFFIX` tinyint NOT NULL,
  `OXSTARTTITLE` tinyint NOT NULL,
  `OXINFOEMAIL` tinyint NOT NULL,
  `OXORDEREMAIL` tinyint NOT NULL,
  `OXOWNEREMAIL` tinyint NOT NULL,
  `OXORDERSUBJECT` tinyint NOT NULL,
  `OXREGISTERSUBJECT` tinyint NOT NULL,
  `OXFORGOTPWDSUBJECT` tinyint NOT NULL,
  `OXSENDEDNOWSUBJECT` tinyint NOT NULL,
  `OXSMTP` tinyint NOT NULL,
  `OXSMTPUSER` tinyint NOT NULL,
  `OXSMTPPWD` tinyint NOT NULL,
  `OXCOMPANY` tinyint NOT NULL,
  `OXSTREET` tinyint NOT NULL,
  `OXZIP` tinyint NOT NULL,
  `OXCITY` tinyint NOT NULL,
  `OXCOUNTRY` tinyint NOT NULL,
  `OXBANKNAME` tinyint NOT NULL,
  `OXBANKNUMBER` tinyint NOT NULL,
  `OXBANKCODE` tinyint NOT NULL,
  `OXVATNUMBER` tinyint NOT NULL,
  `OXTAXNUMBER` tinyint NOT NULL,
  `OXBICCODE` tinyint NOT NULL,
  `OXIBANNUMBER` tinyint NOT NULL,
  `OXFNAME` tinyint NOT NULL,
  `OXLNAME` tinyint NOT NULL,
  `OXTELEFON` tinyint NOT NULL,
  `OXTELEFAX` tinyint NOT NULL,
  `OXURL` tinyint NOT NULL,
  `OXDEFCAT` tinyint NOT NULL,
  `OXHRBNR` tinyint NOT NULL,
  `OXCOURT` tinyint NOT NULL,
  `OXADBUTLERID` tinyint NOT NULL,
  `OXAFFILINETID` tinyint NOT NULL,
  `OXSUPERCLICKSID` tinyint NOT NULL,
  `OXAFFILIWELTID` tinyint NOT NULL,
  `OXAFFILI24ID` tinyint NOT NULL,
  `OXEDITION` tinyint NOT NULL,
  `OXVERSION` tinyint NOT NULL,
  `OXSEOACTIVE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates`
--

DROP TABLE IF EXISTS `oxv_oxstates`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxstates` (
  `OXID` tinyint NOT NULL,
  `OXCOUNTRYID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates_de`
--

DROP TABLE IF EXISTS `oxv_oxstates_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxstates_de` (
  `OXID` tinyint NOT NULL,
  `OXCOUNTRYID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxstates_en`
--

DROP TABLE IF EXISTS `oxv_oxstates_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxstates_en` (
  `OXID` tinyint NOT NULL,
  `OXCOUNTRYID` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXISOALPHA2` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor`
--

DROP TABLE IF EXISTS `oxv_oxvendor`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxvendor` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXTITLE_1` tinyint NOT NULL,
  `OXSHORTDESC_1` tinyint NOT NULL,
  `OXTITLE_2` tinyint NOT NULL,
  `OXSHORTDESC_2` tinyint NOT NULL,
  `OXTITLE_3` tinyint NOT NULL,
  `OXSHORTDESC_3` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_de`
--

DROP TABLE IF EXISTS `oxv_oxvendor_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxvendor_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxvendor_en`
--

DROP TABLE IF EXISTS `oxv_oxvendor_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxvendor_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXICON` tinyint NOT NULL,
  `OXTITLE` tinyint NOT NULL,
  `OXSHORTDESC` tinyint NOT NULL,
  `OXSHOWSUFFIX` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping`
--

DROP TABLE IF EXISTS `oxv_oxwrapping`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxwrapping` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXACTIVE_1` tinyint NOT NULL,
  `OXACTIVE_2` tinyint NOT NULL,
  `OXACTIVE_3` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXNAME_1` tinyint NOT NULL,
  `OXNAME_2` tinyint NOT NULL,
  `OXNAME_3` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_de`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_de`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_de`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxwrapping_de` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `oxv_oxwrapping_en`
--

DROP TABLE IF EXISTS `oxv_oxwrapping_en`;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `oxv_oxwrapping_en` (
  `OXID` tinyint NOT NULL,
  `OXSHOPID` tinyint NOT NULL,
  `OXACTIVE` tinyint NOT NULL,
  `OXTYPE` tinyint NOT NULL,
  `OXNAME` tinyint NOT NULL,
  `OXPIC` tinyint NOT NULL,
  `OXPRICE` tinyint NOT NULL,
  `OXTIMESTAMP` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oxvendor`
--

DROP TABLE IF EXISTS `oxvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvendor` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Vendor id',
  `OXSHOPID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active',
  `OXICON` varchar(128) NOT NULL DEFAULT '' COMMENT 'Icon filename',
  `OXTITLE` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title (multilanguage)',
  `OXSHORTDESC` varchar(255) NOT NULL DEFAULT '' COMMENT 'Short description (multilanguage)',
  `OXTITLE_1` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_1` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_2` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_2` varchar(255) NOT NULL DEFAULT '',
  `OXTITLE_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHORTDESC_3` varchar(255) NOT NULL DEFAULT '',
  `OXSHOWSUFFIX` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Show SEO Suffix in Category',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXACTIVE` (`OXACTIVE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Distributors list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvendor`
--

LOCK TABLES `oxvendor` WRITE;
/*!40000 ALTER TABLE `oxvendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvouchers`
--

DROP TABLE IF EXISTS `oxvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvouchers` (
  `OXDATEUSED` date DEFAULT NULL COMMENT 'Date, when coupon was used (set on order complete)',
  `OXORDERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Order id (oxorder)',
  `OXUSERID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'User id (oxuser)',
  `OXRESERVED` int(11) NOT NULL DEFAULT '0' COMMENT 'Time, when coupon is added to basket',
  `OXVOUCHERNR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Coupon number',
  `OXVOUCHERSERIEID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Coupon Series id (oxvoucherseries)',
  `OXDISCOUNT` float(9,2) DEFAULT NULL COMMENT 'Discounted amount (if discount was used)',
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Coupon id',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXVOUCHERSERIEID` (`OXVOUCHERSERIEID`),
  KEY `OXORDERID` (`OXORDERID`),
  KEY `OXUSERID` (`OXUSERID`),
  KEY `OXVOUCHERNR` (`OXVOUCHERNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generated coupons';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvouchers`
--

LOCK TABLES `oxvouchers` WRITE;
/*!40000 ALTER TABLE `oxvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxvoucherseries`
--

DROP TABLE IF EXISTS `oxvoucherseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxvoucherseries` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Series id',
  `OXSHOPID` char(32) NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXSERIENR` varchar(255) NOT NULL DEFAULT '' COMMENT 'Series name',
  `OXSERIEDESCRIPTION` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description',
  `OXDISCOUNT` float(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Discount amount',
  `OXDISCOUNTTYPE` enum('percent','absolute') NOT NULL DEFAULT 'absolute' COMMENT 'Discount type (percent, absolute)',
  `OXBEGINDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Valid from',
  `OXENDDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Valid to',
  `OXALLOWSAMESERIES` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of this series can be used with single order',
  `OXALLOWOTHERSERIES` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of different series can be used with single order',
  `OXALLOWUSEANOTHER` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Coupons of this series can be used in multiple orders',
  `OXMINIMUMVALUE` float(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Minimum Order Sum ',
  `OXCALCULATEONCE` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Calculate only once (valid only for product or category vouchers)',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`),
  KEY `OXSERIENR` (`OXSERIENR`),
  KEY `OXSHOPID` (`OXSHOPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon series';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxvoucherseries`
--

LOCK TABLES `oxvoucherseries` WRITE;
/*!40000 ALTER TABLE `oxvoucherseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxvoucherseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxwrapping`
--

DROP TABLE IF EXISTS `oxwrapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oxwrapping` (
  `OXID` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Wrapping id',
  `OXSHOPID` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Shop id (oxshops)',
  `OXACTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active (multilanguage)',
  `OXACTIVE_1` tinyint(1) NOT NULL DEFAULT '1',
  `OXACTIVE_2` tinyint(1) NOT NULL DEFAULT '1',
  `OXACTIVE_3` tinyint(1) NOT NULL DEFAULT '1',
  `OXTYPE` varchar(4) NOT NULL DEFAULT 'WRAP' COMMENT 'Wrapping type: WRAP,CARD',
  `OXNAME` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name (multilanguage)',
  `OXNAME_1` varchar(128) NOT NULL DEFAULT '',
  `OXNAME_2` varchar(128) NOT NULL DEFAULT '',
  `OXNAME_3` varchar(128) NOT NULL DEFAULT '',
  `OXPIC` varchar(128) NOT NULL DEFAULT '' COMMENT 'Image filename',
  `OXPRICE` double NOT NULL DEFAULT '0' COMMENT 'Price',
  `OXTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp',
  PRIMARY KEY (`OXID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Wrappings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxwrapping`
--

LOCK TABLES `oxwrapping` WRITE;
/*!40000 ALTER TABLE `oxwrapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxwrapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `oxv_oxactions`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxactions`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE` AS `OXTITLE`,`oxactions`.`OXTITLE_1` AS `OXTITLE_1`,`oxactions`.`OXTITLE_2` AS `OXTITLE_2`,`oxactions`.`OXTITLE_3` AS `OXTITLE_3`,`oxactions`.`OXLONGDESC` AS `OXLONGDESC`,`oxactions`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxactions`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxactions`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC` AS `OXPIC`,`oxactions`.`OXPIC_1` AS `OXPIC_1`,`oxactions`.`OXPIC_2` AS `OXPIC_2`,`oxactions`.`OXPIC_3` AS `OXPIC_3`,`oxactions`.`OXLINK` AS `OXLINK`,`oxactions`.`OXLINK_1` AS `OXLINK_1`,`oxactions`.`OXLINK_2` AS `OXLINK_2`,`oxactions`.`OXLINK_3` AS `OXLINK_3`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxactions_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxactions_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions_de` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE` AS `OXTITLE`,`oxactions`.`OXLONGDESC` AS `OXLONGDESC`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC` AS `OXPIC`,`oxactions`.`OXLINK` AS `OXLINK`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxactions_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxactions_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxactions_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxactions_en` AS select `oxactions`.`OXID` AS `OXID`,`oxactions`.`OXSHOPID` AS `OXSHOPID`,`oxactions`.`OXTYPE` AS `OXTYPE`,`oxactions`.`OXTITLE_1` AS `OXTITLE`,`oxactions`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxactions`.`OXACTIVE` AS `OXACTIVE`,`oxactions`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxactions`.`OXACTIVETO` AS `OXACTIVETO`,`oxactions`.`OXPIC_1` AS `OXPIC`,`oxactions`.`OXLINK_1` AS `OXLINK`,`oxactions`.`OXSORT` AS `OXSORT`,`oxactions`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxactions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxartextends`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC` AS `OXLONGDESC`,`oxartextends`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxartextends`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxartextends`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxartextends`.`OXTAGS` AS `OXTAGS`,`oxartextends`.`OXTAGS_1` AS `OXTAGS_1`,`oxartextends`.`OXTAGS_2` AS `OXTAGS_2`,`oxartextends`.`OXTAGS_3` AS `OXTAGS_3`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxartextends_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends_de` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC` AS `OXLONGDESC`,`oxartextends`.`OXTAGS` AS `OXTAGS`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxartextends_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxartextends_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxartextends_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxartextends_en` AS select `oxartextends`.`OXID` AS `OXID`,`oxartextends`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxartextends`.`OXTAGS_1` AS `OXTAGS`,`oxartextends`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxartextends` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxarticles`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME_1`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT_1`,`oxarticles`.`OXVARNAME_2` AS `OXVARNAME_2`,`oxarticles`.`OXVARSELECT_2` AS `OXVARSELECT_2`,`oxarticles`.`OXVARNAME_3` AS `OXVARNAME_3`,`oxarticles`.`OXVARSELECT_3` AS `OXVARSELECT_3`,`oxarticles`.`OXTITLE_1` AS `OXTITLE_1`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS_1`,`oxarticles`.`OXTITLE_2` AS `OXTITLE_2`,`oxarticles`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxarticles`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxarticles`.`OXSEARCHKEYS_2` AS `OXSEARCHKEYS_2`,`oxarticles`.`OXTITLE_3` AS `OXTITLE_3`,`oxarticles`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxarticles`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxarticles`.`OXSEARCHKEYS_3` AS `OXSEARCHKEYS_3`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT_1`,`oxarticles`.`OXSTOCKTEXT_2` AS `OXSTOCKTEXT_2`,`oxarticles`.`OXSTOCKTEXT_3` AS `OXSTOCKTEXT_3`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT_1`,`oxarticles`.`OXNOSTOCKTEXT_2` AS `OXNOSTOCKTEXT_2`,`oxarticles`.`OXNOSTOCKTEXT_3` AS `OXNOSTOCKTEXT_3`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxarticles_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_de` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxarticles_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxarticles_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxarticles_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxarticles_en` AS select `oxarticles`.`OXID` AS `OXID`,`oxarticles`.`OXSHOPID` AS `OXSHOPID`,`oxarticles`.`OXPARENTID` AS `OXPARENTID`,`oxarticles`.`OXACTIVE` AS `OXACTIVE`,`oxarticles`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxarticles`.`OXACTIVETO` AS `OXACTIVETO`,`oxarticles`.`OXARTNUM` AS `OXARTNUM`,`oxarticles`.`OXEAN` AS `OXEAN`,`oxarticles`.`OXDISTEAN` AS `OXDISTEAN`,`oxarticles`.`OXMPN` AS `OXMPN`,`oxarticles`.`OXTITLE_1` AS `OXTITLE`,`oxarticles`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxarticles`.`OXPRICE` AS `OXPRICE`,`oxarticles`.`OXBLFIXEDPRICE` AS `OXBLFIXEDPRICE`,`oxarticles`.`OXPRICEA` AS `OXPRICEA`,`oxarticles`.`OXPRICEB` AS `OXPRICEB`,`oxarticles`.`OXPRICEC` AS `OXPRICEC`,`oxarticles`.`OXBPRICE` AS `OXBPRICE`,`oxarticles`.`OXTPRICE` AS `OXTPRICE`,`oxarticles`.`OXUNITNAME` AS `OXUNITNAME`,`oxarticles`.`OXUNITQUANTITY` AS `OXUNITQUANTITY`,`oxarticles`.`OXEXTURL` AS `OXEXTURL`,`oxarticles`.`OXURLDESC_1` AS `OXURLDESC`,`oxarticles`.`OXURLIMG` AS `OXURLIMG`,`oxarticles`.`OXVAT` AS `OXVAT`,`oxarticles`.`OXTHUMB` AS `OXTHUMB`,`oxarticles`.`OXICON` AS `OXICON`,`oxarticles`.`OXPIC1` AS `OXPIC1`,`oxarticles`.`OXPIC2` AS `OXPIC2`,`oxarticles`.`OXPIC3` AS `OXPIC3`,`oxarticles`.`OXPIC4` AS `OXPIC4`,`oxarticles`.`OXPIC5` AS `OXPIC5`,`oxarticles`.`OXPIC6` AS `OXPIC6`,`oxarticles`.`OXPIC7` AS `OXPIC7`,`oxarticles`.`OXPIC8` AS `OXPIC8`,`oxarticles`.`OXPIC9` AS `OXPIC9`,`oxarticles`.`OXPIC10` AS `OXPIC10`,`oxarticles`.`OXPIC11` AS `OXPIC11`,`oxarticles`.`OXPIC12` AS `OXPIC12`,`oxarticles`.`OXWEIGHT` AS `OXWEIGHT`,`oxarticles`.`OXSTOCK` AS `OXSTOCK`,`oxarticles`.`OXSTOCKFLAG` AS `OXSTOCKFLAG`,`oxarticles`.`OXSTOCKTEXT_1` AS `OXSTOCKTEXT`,`oxarticles`.`OXNOSTOCKTEXT_1` AS `OXNOSTOCKTEXT`,`oxarticles`.`OXDELIVERY` AS `OXDELIVERY`,`oxarticles`.`OXINSERT` AS `OXINSERT`,`oxarticles`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxarticles`.`OXLENGTH` AS `OXLENGTH`,`oxarticles`.`OXWIDTH` AS `OXWIDTH`,`oxarticles`.`OXHEIGHT` AS `OXHEIGHT`,`oxarticles`.`OXFILE` AS `OXFILE`,`oxarticles`.`OXSEARCHKEYS_1` AS `OXSEARCHKEYS`,`oxarticles`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxarticles`.`OXQUESTIONEMAIL` AS `OXQUESTIONEMAIL`,`oxarticles`.`OXISSEARCH` AS `OXISSEARCH`,`oxarticles`.`OXISCONFIGURABLE` AS `OXISCONFIGURABLE`,`oxarticles`.`OXVARNAME_1` AS `OXVARNAME`,`oxarticles`.`OXVARSTOCK` AS `OXVARSTOCK`,`oxarticles`.`OXVARCOUNT` AS `OXVARCOUNT`,`oxarticles`.`OXVARSELECT_1` AS `OXVARSELECT`,`oxarticles`.`OXVARMINPRICE` AS `OXVARMINPRICE`,`oxarticles`.`OXVARMAXPRICE` AS `OXVARMAXPRICE`,`oxarticles`.`OXBUNDLEID` AS `OXBUNDLEID`,`oxarticles`.`OXFOLDER` AS `OXFOLDER`,`oxarticles`.`OXSUBCLASS` AS `OXSUBCLASS`,`oxarticles`.`OXSORT` AS `OXSORT`,`oxarticles`.`OXSOLDAMOUNT` AS `OXSOLDAMOUNT`,`oxarticles`.`OXNONMATERIAL` AS `OXNONMATERIAL`,`oxarticles`.`OXFREESHIPPING` AS `OXFREESHIPPING`,`oxarticles`.`OXREMINDACTIVE` AS `OXREMINDACTIVE`,`oxarticles`.`OXREMINDAMOUNT` AS `OXREMINDAMOUNT`,`oxarticles`.`OXAMITEMID` AS `OXAMITEMID`,`oxarticles`.`OXAMTASKID` AS `OXAMTASKID`,`oxarticles`.`OXVENDORID` AS `OXVENDORID`,`oxarticles`.`OXMANUFACTURERID` AS `OXMANUFACTURERID`,`oxarticles`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxarticles`.`OXRATING` AS `OXRATING`,`oxarticles`.`OXRATINGCNT` AS `OXRATINGCNT`,`oxarticles`.`OXMINDELTIME` AS `OXMINDELTIME`,`oxarticles`.`OXMAXDELTIME` AS `OXMAXDELTIME`,`oxarticles`.`OXDELTIMEUNIT` AS `OXDELTIMEUNIT`,`oxarticles`.`OXUPDATEPRICE` AS `OXUPDATEPRICE`,`oxarticles`.`OXUPDATEPRICEA` AS `OXUPDATEPRICEA`,`oxarticles`.`OXUPDATEPRICEB` AS `OXUPDATEPRICEB`,`oxarticles`.`OXUPDATEPRICEC` AS `OXUPDATEPRICEC`,`oxarticles`.`OXUPDATEPRICETIME` AS `OXUPDATEPRICETIME`,`oxarticles`.`OXISDOWNLOADABLE` AS `OXISDOWNLOADABLE`,`oxarticles`.`OXSHOWCUSTOMAGREEMENT` AS `OXSHOWCUSTOMAGREEMENT` from `oxarticles` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxattribute`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXTITLE_1` AS `OXTITLE_1`,`oxattribute`.`OXTITLE_2` AS `OXTITLE_2`,`oxattribute`.`OXTITLE_3` AS `OXTITLE_3`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxattribute_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_de` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxattribute_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxattribute_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxattribute_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxattribute_en` AS select `oxattribute`.`OXID` AS `OXID`,`oxattribute`.`OXSHOPID` AS `OXSHOPID`,`oxattribute`.`OXTITLE_1` AS `OXTITLE`,`oxattribute`.`OXPOS` AS `OXPOS`,`oxattribute`.`OXTIMESTAMP` AS `OXTIMESTAMP`,`oxattribute`.`OXDISPLAYINBASKET` AS `OXDISPLAYINBASKET` from `oxattribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcategories`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB_1`,`oxcategories`.`OXTHUMB_2` AS `OXTHUMB_2`,`oxcategories`.`OXTHUMB_3` AS `OXTHUMB_3`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxcategories`.`OXTITLE_1` AS `OXTITLE_1`,`oxcategories`.`OXDESC_1` AS `OXDESC_1`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxcategories`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxcategories`.`OXTITLE_2` AS `OXTITLE_2`,`oxcategories`.`OXDESC_2` AS `OXDESC_2`,`oxcategories`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxcategories`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxcategories`.`OXTITLE_3` AS `OXTITLE_3`,`oxcategories`.`OXDESC_3` AS `OXDESC_3`,`oxcategories`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcategories_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_de` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE` AS `OXTITLE`,`oxcategories`.`OXDESC` AS `OXDESC`,`oxcategories`.`OXLONGDESC` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcategories_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcategories_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcategories_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcategories_en` AS select `oxcategories`.`OXID` AS `OXID`,`oxcategories`.`OXPARENTID` AS `OXPARENTID`,`oxcategories`.`OXLEFT` AS `OXLEFT`,`oxcategories`.`OXRIGHT` AS `OXRIGHT`,`oxcategories`.`OXROOTID` AS `OXROOTID`,`oxcategories`.`OXSORT` AS `OXSORT`,`oxcategories`.`OXACTIVE_1` AS `OXACTIVE`,`oxcategories`.`OXHIDDEN` AS `OXHIDDEN`,`oxcategories`.`OXSHOPID` AS `OXSHOPID`,`oxcategories`.`OXTITLE_1` AS `OXTITLE`,`oxcategories`.`OXDESC_1` AS `OXDESC`,`oxcategories`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxcategories`.`OXTHUMB_1` AS `OXTHUMB`,`oxcategories`.`OXEXTLINK` AS `OXEXTLINK`,`oxcategories`.`OXTEMPLATE` AS `OXTEMPLATE`,`oxcategories`.`OXDEFSORT` AS `OXDEFSORT`,`oxcategories`.`OXDEFSORTMODE` AS `OXDEFSORTMODE`,`oxcategories`.`OXPRICEFROM` AS `OXPRICEFROM`,`oxcategories`.`OXPRICETO` AS `OXPRICETO`,`oxcategories`.`OXICON` AS `OXICON`,`oxcategories`.`OXPROMOICON` AS `OXPROMOICON`,`oxcategories`.`OXVAT` AS `OXVAT`,`oxcategories`.`OXSKIPDISCOUNTS` AS `OXSKIPDISCOUNTS`,`oxcategories`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxcategories`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcategories` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcontents`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE` AS `OXACTIVE`,`oxcontents`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE` AS `OXTITLE`,`oxcontents`.`OXCONTENT` AS `OXCONTENT`,`oxcontents`.`OXTITLE_1` AS `OXTITLE_1`,`oxcontents`.`OXCONTENT_1` AS `OXCONTENT_1`,`oxcontents`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxcontents`.`OXTITLE_2` AS `OXTITLE_2`,`oxcontents`.`OXCONTENT_2` AS `OXCONTENT_2`,`oxcontents`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxcontents`.`OXTITLE_3` AS `OXTITLE_3`,`oxcontents`.`OXCONTENT_3` AS `OXCONTENT_3`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcontents_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents_de` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE` AS `OXACTIVE`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE` AS `OXTITLE`,`oxcontents`.`OXCONTENT` AS `OXCONTENT`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcontents_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcontents_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcontents_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcontents_en` AS select `oxcontents`.`OXID` AS `OXID`,`oxcontents`.`OXLOADID` AS `OXLOADID`,`oxcontents`.`OXSHOPID` AS `OXSHOPID`,`oxcontents`.`OXSNIPPET` AS `OXSNIPPET`,`oxcontents`.`OXTYPE` AS `OXTYPE`,`oxcontents`.`OXACTIVE_1` AS `OXACTIVE`,`oxcontents`.`OXPOSITION` AS `OXPOSITION`,`oxcontents`.`OXTITLE_1` AS `OXTITLE`,`oxcontents`.`OXCONTENT_1` AS `OXCONTENT`,`oxcontents`.`OXCATID` AS `OXCATID`,`oxcontents`.`OXFOLDER` AS `OXFOLDER`,`oxcontents`.`OXTERMVERSION` AS `OXTERMVERSION`,`oxcontents`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcontents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcountry`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC` AS `OXLONGDESC`,`oxcountry`.`OXTITLE_1` AS `OXTITLE_1`,`oxcountry`.`OXTITLE_2` AS `OXTITLE_2`,`oxcountry`.`OXTITLE_3` AS `OXTITLE_3`,`oxcountry`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxcountry`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxcountry`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxcountry`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxcountry`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxcountry`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcountry_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry_de` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC` AS `OXLONGDESC`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxcountry_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxcountry_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxcountry_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxcountry_en` AS select `oxcountry`.`OXID` AS `OXID`,`oxcountry`.`OXACTIVE` AS `OXACTIVE`,`oxcountry`.`OXTITLE_1` AS `OXTITLE`,`oxcountry`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxcountry`.`OXISOALPHA3` AS `OXISOALPHA3`,`oxcountry`.`OXUNNUM3` AS `OXUNNUM3`,`oxcountry`.`OXVATINPREFIX` AS `OXVATINPREFIX`,`oxcountry`.`OXORDER` AS `OXORDER`,`oxcountry`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxcountry`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxcountry`.`OXVATSTATUS` AS `OXVATSTATUS`,`oxcountry`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxcountry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdelivery`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE_1`,`oxdelivery`.`OXTITLE_2` AS `OXTITLE_2`,`oxdelivery`.`OXTITLE_3` AS `OXTITLE_3`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdelivery_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_de` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdelivery_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdelivery_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdelivery_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdelivery_en` AS select `oxdelivery`.`OXID` AS `OXID`,`oxdelivery`.`OXSHOPID` AS `OXSHOPID`,`oxdelivery`.`OXACTIVE` AS `OXACTIVE`,`oxdelivery`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdelivery`.`OXACTIVETO` AS `OXACTIVETO`,`oxdelivery`.`OXTITLE_1` AS `OXTITLE`,`oxdelivery`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdelivery`.`OXADDSUM` AS `OXADDSUM`,`oxdelivery`.`OXDELTYPE` AS `OXDELTYPE`,`oxdelivery`.`OXPARAM` AS `OXPARAM`,`oxdelivery`.`OXPARAMEND` AS `OXPARAMEND`,`oxdelivery`.`OXFIXED` AS `OXFIXED`,`oxdelivery`.`OXSORT` AS `OXSORT`,`oxdelivery`.`OXFINALIZE` AS `OXFINALIZE`,`oxdelivery`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdelivery` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdeliveryset`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE_1`,`oxdeliveryset`.`OXTITLE_2` AS `OXTITLE_2`,`oxdeliveryset`.`OXTITLE_3` AS `OXTITLE_3`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdeliveryset_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_de` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdeliveryset_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdeliveryset_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdeliveryset_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdeliveryset_en` AS select `oxdeliveryset`.`OXID` AS `OXID`,`oxdeliveryset`.`OXSHOPID` AS `OXSHOPID`,`oxdeliveryset`.`OXACTIVE` AS `OXACTIVE`,`oxdeliveryset`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdeliveryset`.`OXACTIVETO` AS `OXACTIVETO`,`oxdeliveryset`.`OXTITLE_1` AS `OXTITLE`,`oxdeliveryset`.`OXPOS` AS `OXPOS`,`oxdeliveryset`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdeliveryset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdiscount`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE_1`,`oxdiscount`.`OXTITLE_2` AS `OXTITLE_2`,`oxdiscount`.`OXTITLE_3` AS `OXTITLE_3`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdiscount_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_de` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxdiscount_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxdiscount_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxdiscount_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxdiscount_en` AS select `oxdiscount`.`OXID` AS `OXID`,`oxdiscount`.`OXSHOPID` AS `OXSHOPID`,`oxdiscount`.`OXACTIVE` AS `OXACTIVE`,`oxdiscount`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxdiscount`.`OXACTIVETO` AS `OXACTIVETO`,`oxdiscount`.`OXTITLE_1` AS `OXTITLE`,`oxdiscount`.`OXAMOUNT` AS `OXAMOUNT`,`oxdiscount`.`OXAMOUNTTO` AS `OXAMOUNTTO`,`oxdiscount`.`OXPRICETO` AS `OXPRICETO`,`oxdiscount`.`OXPRICE` AS `OXPRICE`,`oxdiscount`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxdiscount`.`OXADDSUM` AS `OXADDSUM`,`oxdiscount`.`OXITMARTID` AS `OXITMARTID`,`oxdiscount`.`OXITMAMOUNT` AS `OXITMAMOUNT`,`oxdiscount`.`OXITMMULTIPLE` AS `OXITMMULTIPLE`,`oxdiscount`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxdiscount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxgroups`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE` AS `OXTITLE`,`oxgroups`.`OXTITLE_1` AS `OXTITLE_1`,`oxgroups`.`OXTITLE_2` AS `OXTITLE_2`,`oxgroups`.`OXTITLE_3` AS `OXTITLE_3`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxgroups_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups_de` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE` AS `OXTITLE`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxgroups_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxgroups_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxgroups_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxgroups_en` AS select `oxgroups`.`OXID` AS `OXID`,`oxgroups`.`OXACTIVE` AS `OXACTIVE`,`oxgroups`.`OXTITLE_1` AS `OXTITLE`,`oxgroups`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxgroups` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxlinks`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC_1`,`oxlinks`.`OXURLDESC_2` AS `OXURLDESC_2`,`oxlinks`.`OXURLDESC_3` AS `OXURLDESC_3`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxlinks_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_de` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxlinks_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxlinks_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxlinks_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxlinks_en` AS select `oxlinks`.`OXID` AS `OXID`,`oxlinks`.`OXSHOPID` AS `OXSHOPID`,`oxlinks`.`OXACTIVE` AS `OXACTIVE`,`oxlinks`.`OXURL` AS `OXURL`,`oxlinks`.`OXURLDESC_1` AS `OXURLDESC`,`oxlinks`.`OXINSERT` AS `OXINSERT`,`oxlinks`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxlinks` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmanufacturers`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE_1`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxmanufacturers`.`OXTITLE_2` AS `OXTITLE_2`,`oxmanufacturers`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxmanufacturers`.`OXTITLE_3` AS `OXTITLE_3`,`oxmanufacturers`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmanufacturers_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_de` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXTITLE` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmanufacturers_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmanufacturers_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmanufacturers_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmanufacturers_en` AS select `oxmanufacturers`.`OXID` AS `OXID`,`oxmanufacturers`.`OXSHOPID` AS `OXSHOPID`,`oxmanufacturers`.`OXACTIVE` AS `OXACTIVE`,`oxmanufacturers`.`OXICON` AS `OXICON`,`oxmanufacturers`.`OXTITLE_1` AS `OXTITLE`,`oxmanufacturers`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxmanufacturers`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxmanufacturers`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmanufacturers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmediaurls`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC` AS `OXDESC`,`oxmediaurls`.`OXDESC_1` AS `OXDESC_1`,`oxmediaurls`.`OXDESC_2` AS `OXDESC_2`,`oxmediaurls`.`OXDESC_3` AS `OXDESC_3`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmediaurls_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls_de` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC` AS `OXDESC`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxmediaurls_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxmediaurls_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxmediaurls_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxmediaurls_en` AS select `oxmediaurls`.`OXID` AS `OXID`,`oxmediaurls`.`OXOBJECTID` AS `OXOBJECTID`,`oxmediaurls`.`OXURL` AS `OXURL`,`oxmediaurls`.`OXDESC_1` AS `OXDESC`,`oxmediaurls`.`OXISUPLOADED` AS `OXISUPLOADED`,`oxmediaurls`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxmediaurls` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxnews`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxnews`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxnews` AS select `oxnews`.`OXID` AS `OXID`,`oxnews`.`OXSHOPID` AS `OXSHOPID`,`oxnews`.`OXACTIVE` AS `OXACTIVE`,`oxnews`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxnews`.`OXACTIVETO` AS `OXACTIVETO`,`oxnews`.`OXDATE` AS `OXDATE`,`oxnews`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxnews`.`OXLONGDESC` AS `OXLONGDESC`,`oxnews`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxnews`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxnews`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxnews`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxnews`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxnews`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxnews`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxnews`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxnews`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxnews`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxnews` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxnews_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxnews_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxnews_de` AS select `oxnews`.`OXID` AS `OXID`,`oxnews`.`OXSHOPID` AS `OXSHOPID`,`oxnews`.`OXACTIVE` AS `OXACTIVE`,`oxnews`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxnews`.`OXACTIVETO` AS `OXACTIVETO`,`oxnews`.`OXDATE` AS `OXDATE`,`oxnews`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxnews`.`OXLONGDESC` AS `OXLONGDESC`,`oxnews`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxnews` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxnews_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxnews_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxnews_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxnews_en` AS select `oxnews`.`OXID` AS `OXID`,`oxnews`.`OXSHOPID` AS `OXSHOPID`,`oxnews`.`OXACTIVE_1` AS `OXACTIVE`,`oxnews`.`OXACTIVEFROM` AS `OXACTIVEFROM`,`oxnews`.`OXACTIVETO` AS `OXACTIVETO`,`oxnews`.`OXDATE` AS `OXDATE`,`oxnews`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxnews`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxnews`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxnews` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxobject2attribute`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXVALUE_1` AS `OXVALUE_1`,`oxobject2attribute`.`OXVALUE_2` AS `OXVALUE_2`,`oxobject2attribute`.`OXVALUE_3` AS `OXVALUE_3`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxobject2attribute_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute_de` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxobject2attribute_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxobject2attribute_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxobject2attribute_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxobject2attribute_en` AS select `oxobject2attribute`.`OXID` AS `OXID`,`oxobject2attribute`.`OXOBJECTID` AS `OXOBJECTID`,`oxobject2attribute`.`OXATTRID` AS `OXATTRID`,`oxobject2attribute`.`OXVALUE_1` AS `OXVALUE`,`oxobject2attribute`.`OXPOS` AS `OXPOS`,`oxobject2attribute`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxobject2attribute` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxpayments`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXDESC_1` AS `OXDESC_1`,`oxpayments`.`OXVALDESC_1` AS `OXVALDESC_1`,`oxpayments`.`OXDESC_2` AS `OXDESC_2`,`oxpayments`.`OXVALDESC_2` AS `OXVALDESC_2`,`oxpayments`.`OXDESC_3` AS `OXDESC_3`,`oxpayments`.`OXVALDESC_3` AS `OXVALDESC_3`,`oxpayments`.`OXLONGDESC` AS `OXLONGDESC`,`oxpayments`.`OXLONGDESC_1` AS `OXLONGDESC_1`,`oxpayments`.`OXLONGDESC_2` AS `OXLONGDESC_2`,`oxpayments`.`OXLONGDESC_3` AS `OXLONGDESC_3`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTSPAYMENTID` AS `OXTSPAYMENTID`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxpayments_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments_de` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXLONGDESC` AS `OXLONGDESC`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTSPAYMENTID` AS `OXTSPAYMENTID`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxpayments_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxpayments_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxpayments_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxpayments_en` AS select `oxpayments`.`OXID` AS `OXID`,`oxpayments`.`OXACTIVE` AS `OXACTIVE`,`oxpayments`.`OXDESC_1` AS `OXDESC`,`oxpayments`.`OXADDSUM` AS `OXADDSUM`,`oxpayments`.`OXADDSUMTYPE` AS `OXADDSUMTYPE`,`oxpayments`.`OXADDSUMRULES` AS `OXADDSUMRULES`,`oxpayments`.`OXFROMBONI` AS `OXFROMBONI`,`oxpayments`.`OXFROMAMOUNT` AS `OXFROMAMOUNT`,`oxpayments`.`OXTOAMOUNT` AS `OXTOAMOUNT`,`oxpayments`.`OXVALDESC_1` AS `OXVALDESC`,`oxpayments`.`OXCHECKED` AS `OXCHECKED`,`oxpayments`.`OXLONGDESC_1` AS `OXLONGDESC`,`oxpayments`.`OXSORT` AS `OXSORT`,`oxpayments`.`OXTSPAYMENTID` AS `OXTSPAYMENTID`,`oxpayments`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxpayments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxselectlist`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE_1`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC_1`,`oxselectlist`.`OXTITLE_2` AS `OXTITLE_2`,`oxselectlist`.`OXVALDESC_2` AS `OXVALDESC_2`,`oxselectlist`.`OXTITLE_3` AS `OXTITLE_3`,`oxselectlist`.`OXVALDESC_3` AS `OXVALDESC_3`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxselectlist_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_de` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxselectlist_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxselectlist_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxselectlist_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxselectlist_en` AS select `oxselectlist`.`OXID` AS `OXID`,`oxselectlist`.`OXSHOPID` AS `OXSHOPID`,`oxselectlist`.`OXTITLE_1` AS `OXTITLE`,`oxselectlist`.`OXIDENT` AS `OXIDENT`,`oxselectlist`.`OXVALDESC_1` AS `OXVALDESC`,`oxselectlist`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxselectlist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxshops`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLEPREFIX_1` AS `OXTITLEPREFIX_1`,`oxshops`.`OXTITLEPREFIX_2` AS `OXTITLEPREFIX_2`,`oxshops`.`OXTITLEPREFIX_3` AS `OXTITLEPREFIX_3`,`oxshops`.`OXTITLESUFFIX` AS `OXTITLESUFFIX`,`oxshops`.`OXTITLESUFFIX_1` AS `OXTITLESUFFIX_1`,`oxshops`.`OXTITLESUFFIX_2` AS `OXTITLESUFFIX_2`,`oxshops`.`OXTITLESUFFIX_3` AS `OXTITLESUFFIX_3`,`oxshops`.`OXSTARTTITLE` AS `OXSTARTTITLE`,`oxshops`.`OXSTARTTITLE_1` AS `OXSTARTTITLE_1`,`oxshops`.`OXSTARTTITLE_2` AS `OXSTARTTITLE_2`,`oxshops`.`OXSTARTTITLE_3` AS `OXSTARTTITLE_3`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXORDERSUBJECT_1` AS `OXORDERSUBJECT_1`,`oxshops`.`OXREGISTERSUBJECT_1` AS `OXREGISTERSUBJECT_1`,`oxshops`.`OXFORGOTPWDSUBJECT_1` AS `OXFORGOTPWDSUBJECT_1`,`oxshops`.`OXSENDEDNOWSUBJECT_1` AS `OXSENDEDNOWSUBJECT_1`,`oxshops`.`OXORDERSUBJECT_2` AS `OXORDERSUBJECT_2`,`oxshops`.`OXREGISTERSUBJECT_2` AS `OXREGISTERSUBJECT_2`,`oxshops`.`OXFORGOTPWDSUBJECT_2` AS `OXFORGOTPWDSUBJECT_2`,`oxshops`.`OXSENDEDNOWSUBJECT_2` AS `OXSENDEDNOWSUBJECT_2`,`oxshops`.`OXORDERSUBJECT_3` AS `OXORDERSUBJECT_3`,`oxshops`.`OXREGISTERSUBJECT_3` AS `OXREGISTERSUBJECT_3`,`oxshops`.`OXFORGOTPWDSUBJECT_3` AS `OXFORGOTPWDSUBJECT_3`,`oxshops`.`OXSENDEDNOWSUBJECT_3` AS `OXSENDEDNOWSUBJECT_3`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE` AS `OXSEOACTIVE`,`oxshops`.`OXSEOACTIVE_1` AS `OXSEOACTIVE_1`,`oxshops`.`OXSEOACTIVE_2` AS `OXSEOACTIVE_2`,`oxshops`.`OXSEOACTIVE_3` AS `OXSEOACTIVE_3`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxshops_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops_de` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLESUFFIX` AS `OXTITLESUFFIX`,`oxshops`.`OXSTARTTITLE` AS `OXSTARTTITLE`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE` AS `OXSEOACTIVE`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxshops_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxshops_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxshops_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxshops_en` AS select `oxshops`.`OXID` AS `OXID`,`oxshops`.`OXACTIVE` AS `OXACTIVE`,`oxshops`.`OXPRODUCTIVE` AS `OXPRODUCTIVE`,`oxshops`.`OXDEFCURRENCY` AS `OXDEFCURRENCY`,`oxshops`.`OXDEFLANGUAGE` AS `OXDEFLANGUAGE`,`oxshops`.`OXNAME` AS `OXNAME`,`oxshops`.`OXTITLEPREFIX_1` AS `OXTITLEPREFIX`,`oxshops`.`OXTITLESUFFIX_1` AS `OXTITLESUFFIX`,`oxshops`.`OXSTARTTITLE_1` AS `OXSTARTTITLE`,`oxshops`.`OXINFOEMAIL` AS `OXINFOEMAIL`,`oxshops`.`OXORDEREMAIL` AS `OXORDEREMAIL`,`oxshops`.`OXOWNEREMAIL` AS `OXOWNEREMAIL`,`oxshops`.`OXORDERSUBJECT_1` AS `OXORDERSUBJECT`,`oxshops`.`OXREGISTERSUBJECT_1` AS `OXREGISTERSUBJECT`,`oxshops`.`OXFORGOTPWDSUBJECT_1` AS `OXFORGOTPWDSUBJECT`,`oxshops`.`OXSENDEDNOWSUBJECT_1` AS `OXSENDEDNOWSUBJECT`,`oxshops`.`OXSMTP` AS `OXSMTP`,`oxshops`.`OXSMTPUSER` AS `OXSMTPUSER`,`oxshops`.`OXSMTPPWD` AS `OXSMTPPWD`,`oxshops`.`OXCOMPANY` AS `OXCOMPANY`,`oxshops`.`OXSTREET` AS `OXSTREET`,`oxshops`.`OXZIP` AS `OXZIP`,`oxshops`.`OXCITY` AS `OXCITY`,`oxshops`.`OXCOUNTRY` AS `OXCOUNTRY`,`oxshops`.`OXBANKNAME` AS `OXBANKNAME`,`oxshops`.`OXBANKNUMBER` AS `OXBANKNUMBER`,`oxshops`.`OXBANKCODE` AS `OXBANKCODE`,`oxshops`.`OXVATNUMBER` AS `OXVATNUMBER`,`oxshops`.`OXTAXNUMBER` AS `OXTAXNUMBER`,`oxshops`.`OXBICCODE` AS `OXBICCODE`,`oxshops`.`OXIBANNUMBER` AS `OXIBANNUMBER`,`oxshops`.`OXFNAME` AS `OXFNAME`,`oxshops`.`OXLNAME` AS `OXLNAME`,`oxshops`.`OXTELEFON` AS `OXTELEFON`,`oxshops`.`OXTELEFAX` AS `OXTELEFAX`,`oxshops`.`OXURL` AS `OXURL`,`oxshops`.`OXDEFCAT` AS `OXDEFCAT`,`oxshops`.`OXHRBNR` AS `OXHRBNR`,`oxshops`.`OXCOURT` AS `OXCOURT`,`oxshops`.`OXADBUTLERID` AS `OXADBUTLERID`,`oxshops`.`OXAFFILINETID` AS `OXAFFILINETID`,`oxshops`.`OXSUPERCLICKSID` AS `OXSUPERCLICKSID`,`oxshops`.`OXAFFILIWELTID` AS `OXAFFILIWELTID`,`oxshops`.`OXAFFILI24ID` AS `OXAFFILI24ID`,`oxshops`.`OXEDITION` AS `OXEDITION`,`oxshops`.`OXVERSION` AS `OXVERSION`,`oxshops`.`OXSEOACTIVE_1` AS `OXSEOACTIVE`,`oxshops`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxshops` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxstates`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTITLE_1` AS `OXTITLE_1`,`oxstates`.`OXTITLE_2` AS `OXTITLE_2`,`oxstates`.`OXTITLE_3` AS `OXTITLE_3`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxstates_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates_de` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxstates_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxstates_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxstates_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxstates_en` AS select `oxstates`.`OXID` AS `OXID`,`oxstates`.`OXCOUNTRYID` AS `OXCOUNTRYID`,`oxstates`.`OXTITLE_1` AS `OXTITLE`,`oxstates`.`OXISOALPHA2` AS `OXISOALPHA2`,`oxstates`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxstates` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxvendor`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXTITLE_1` AS `OXTITLE_1`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC_1`,`oxvendor`.`OXTITLE_2` AS `OXTITLE_2`,`oxvendor`.`OXSHORTDESC_2` AS `OXSHORTDESC_2`,`oxvendor`.`OXTITLE_3` AS `OXTITLE_3`,`oxvendor`.`OXSHORTDESC_3` AS `OXSHORTDESC_3`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxvendor_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_de` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxvendor_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxvendor_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxvendor_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxvendor_en` AS select `oxvendor`.`OXID` AS `OXID`,`oxvendor`.`OXSHOPID` AS `OXSHOPID`,`oxvendor`.`OXACTIVE` AS `OXACTIVE`,`oxvendor`.`OXICON` AS `OXICON`,`oxvendor`.`OXTITLE_1` AS `OXTITLE`,`oxvendor`.`OXSHORTDESC_1` AS `OXSHORTDESC`,`oxvendor`.`OXSHOWSUFFIX` AS `OXSHOWSUFFIX`,`oxvendor`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxvendor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxwrapping`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE_1`,`oxwrapping`.`OXACTIVE_2` AS `OXACTIVE_2`,`oxwrapping`.`OXACTIVE_3` AS `OXACTIVE_3`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXNAME_1` AS `OXNAME_1`,`oxwrapping`.`OXNAME_2` AS `OXNAME_2`,`oxwrapping`.`OXNAME_3` AS `OXNAME_3`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_de`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxwrapping_de`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_de`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_de` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oxv_oxwrapping_en`
--

/*!50001 DROP TABLE IF EXISTS `oxv_oxwrapping_en`*/;
/*!50001 DROP VIEW IF EXISTS `oxv_oxwrapping_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `oxv_oxwrapping_en` AS select `oxwrapping`.`OXID` AS `OXID`,`oxwrapping`.`OXSHOPID` AS `OXSHOPID`,`oxwrapping`.`OXACTIVE_1` AS `OXACTIVE`,`oxwrapping`.`OXTYPE` AS `OXTYPE`,`oxwrapping`.`OXNAME_1` AS `OXNAME`,`oxwrapping`.`OXPIC` AS `OXPIC`,`oxwrapping`.`OXPRICE` AS `OXPRICE`,`oxwrapping`.`OXTIMESTAMP` AS `OXTIMESTAMP` from `oxwrapping` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-03 21:40:55
