-- This program is free software. It comes without any warranty, to
-- the extent permitted by applicable law. You can redistribute it
-- and/or modify it under the terms of the Do What The Fuck You Want
-- To Public License, Version 2, as published by Sam Hocevar. See
-- http://sam.zoy.org/wtfpl/COPYING for more details.

-- MySQL dump 10.9
--
-- Host: localhost    Database: kyberia2
-- ------------------------------------------------------
-- Server version	4.1.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `node_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `event` varchar(23) default NULL,
  `parameter1` varchar(23) default NULL,
  `parameter2` varchar(23) default NULL,
  `result` varchar(10) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL auto_increment,
  `mail_user` int(11) NOT NULL default '0',
  `mail_from` int(11) NOT NULL default '0',
  `mail_to` int(11) NOT NULL default '0',
  `mail_text` text,
  `mail_timestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `mail_read` enum('yes','no') default 'no',
  `mail_duplicate_id` int(11) default NULL,
  `mail_user_new` enum('yes','no') default NULL,
  `mail_from_new` enum('yes','no') default NULL,
  `mail_to_new` enum('yes','no') default NULL,
  KEY `mf` (`mail_from`,`mail_from_new`),
  KEY `mt` (`mail_to`,`mail_to_new`),
  KEY `mail_id` (`mail_id`),
  KEY `mail` (`mail_user`,`mail_timestamp`),
  KEY `mail_read` (`mail_user`,`mail_to`,`mail_read`),
  KEY `mail_user_id` (`mail_user`,`mail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `neurons`
--

DROP TABLE IF EXISTS `neurons`;
CREATE TABLE `neurons` (
  `dst` int(11) default NULL,
  `src` int(11) default NULL,
  `synapse` int(11) NOT NULL default '0',
  `link` enum('hard','soft','bookmark') default 'soft',
  `last_impulse` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `synapse_created` datetime default NULL,
  `dst_vector` char(232) default NULL,
  `synapse_creator` int(11) NOT NULL default '0',
  UNIQUE KEY `relation` (`dst`,`src`),
  KEY `central_link` (`dst`,`link`),
  KEY `dst_vector` (`dst_vector`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
CREATE TABLE `node_access` (
  `node_id` int(13) NOT NULL default '0',
  `user_id` int(13) NOT NULL default '0',
  `node_bookmark` enum('yes','no') default 'no',
  `node_permission` enum('master','op','access','silence','ban','execute') default NULL,
  `node_user_subchild_count` int(13) default NULL,
  `last_visit` datetime default NULL,
  `visits` int(6) default '0',
  `bookmark_category` int(11) default NULL,
  `given_k` enum('yes','no') default 'no',
  UNIQUE KEY `node_access` (`node_id`,`user_id`),
  KEY `user_bookmark` (`user_id`,`node_bookmark`),
  KEY `node_bookmark` (`node_id`,`node_bookmark`),
  KEY `node_user` (`node_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `node_content`
--

DROP TABLE IF EXISTS `node_content`;
CREATE TABLE `node_content` (
  `node_id` int(13) NOT NULL default '0',
  `node_content` mediumtext,
  UNIQUE KEY `id` (`node_id`),
  FULLTEXT KEY `node_content` (`node_content`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes` (
  `node_id` int(13) NOT NULL auto_increment,
  `node_name` varchar(132) default NULL,
  `node_parent` int(13) NOT NULL default '0',
  `node_type` int(2) default '1',
  `node_external_access` enum('yes','no') default 'no',
  `node_system_access` enum('public','moderated','private','cube','crypto') default 'public',
  `node_children_count` int(11) default '0',
  `node_creator` int(13) default NULL,
  `node_created` datetime default NULL,
  `lastchild_created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `k` int(5) default '0',
  `node_views` int(8) default NULL,
  `node_descendant_count` int(11) default NULL,
  `lastdescendant_created` datetime default NULL,
  `template_id` int(11) default NULL,
  `node_updated` datetime default NULL,
  `external_link` varchar(123) default NULL,
  `node_vector` varchar(230) default NULL,
  PRIMARY KEY  (`node_id`),
  KEY `node_name` (`node_name`),
  KEY `type_id` (`node_type`,`node_id`),
  KEY `created_vector_k` (`node_created`,`node_vector`,`k`),
  KEY `vector` (`node_vector`),
  KEY `template_id` (`template_id`,`node_creator`),
  KEY `vector_templateid` (`node_vector`,`template_id`),
  KEY `creator_external_link` (`node_creator`,`external_link`),
  KEY `parent` (`node_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `tiamat`
--

DROP TABLE IF EXISTS `tiamat`;
CREATE TABLE `tiamat` (
  `node_id` int(13) NOT NULL default '0',
  `node_name` varchar(132) default NULL,
  `node_parent` int(13) NOT NULL default '0',
  `node_vector` varchar(232) default NULL,
  `node_external_access` enum('yes','no') default 'no',
  `node_system_access` enum('public','moderated','private','personal','crypto') default 'public',
  `node_children_count` int(11) default '0',
  `node_creator` int(13) default NULL,
  `node_created` datetime default NULL,
  `lastchild_created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `k` int(5) default '0',
  `node_views` int(8) default NULL,
  `node_destructor` int(11) default NULL,
  `node_content` text,
  `node_descendant_count` int(11) default NULL,
  `lastdescendant_created` datetime default NULL,
  `template_id` int(11) default NULL,
  `update_performed` timestamp NOT NULL default '0000-00-00 00:00:00',
  `external_link` varchar(123) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(13) NOT NULL default '0',
  `login` char(66) default NULL,
  `password` char(32) default NULL,
  `icq` char(10) default NULL,
  `email` char(50) default NULL,
  `last_action` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_action` char(75) default NULL,
  `www` char(50) default NULL,
  `user_mail` int(11) default NULL,
  `user_mail_name` char(40) default NULL,
  `listing_amount` int(8) default '32',
  `session_string` char(64) default NULL,
  `user_action_id` int(11) default NULL,
  `user_k` tinyint(4) default '23',
  `user_location_vector` char(123) default NULL,
  `ldap_id` int(11) NOT NULL auto_increment,
  `listing_order` enum('asc','desc') default 'desc',
  `header_id` int(11) default NULL,
  `cube_vector` char(23) default NULL,
  `k_wallet` int(8) default '0',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `ldap_id` (`ldap_id`),
  UNIQUE KEY `session_string` (`session_string`),
  UNIQUE KEY `login` (`login`),
  KEY `user_action_id` (`user_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

