# MySQL dump 7.1
#
# Host: localhost    Database: kyberia
#--------------------------------------------------------
# Server version	3.23.47

#
# Table structure for table 'admin'
#
CREATE TABLE admin (
  action_id int(11) NOT NULL auto_increment,
  action_name varchar(23) DEFAULT '' NOT NULL,
  action_parameter int(11) DEFAULT '0' NOT NULL,
  action_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  action_status enum('opened','resolved','stopped','veto','referendum') DEFAULT 'opened',
  action_result varchar(23),
  action_data_1 text,
  admin_id int(11) DEFAULT '0' NOT NULL,
  action_data_2 text,
  PRIMARY KEY (action_id)
);

#
# Table structure for table 'admin_logs'
#
CREATE TABLE admin_logs (
  action_id int(11) NOT NULL auto_increment,
  action_name varchar(23) DEFAULT '' NOT NULL,
  action_parameter int(11) DEFAULT '0' NOT NULL,
  action_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  action_status enum('opened','resolved','stopped','veto','referendum') DEFAULT 'opened',
  action_result varchar(23),
  action_data_1 text,
  admin_id int(11) DEFAULT '0' NOT NULL,
  action_data_2 text,
  PRIMARY KEY (action_id)
);

#
# Table structure for table 'albums'
#
CREATE TABLE albums (
  id_album int(11) NOT NULL auto_increment,
  title varchar(255),
  name varchar(255),
  description text,
  hits int(11),
  fotos int(11),
  datum timestamp(14),
  PRIMARY KEY (id_album)
);

#
# Table structure for table 'articles'
#
CREATE TABLE articles (
  id_article int(11) NOT NULL auto_increment,
  id_rubrika int(11) DEFAULT '0' NOT NULL,
  datum datetime,
  nazov varchar(120),
  short_desc text,
  autor varchar(255),
  id_rubrika_secondary int(11),
  title_image varchar(100),
  on_main enum('yes','no') DEFAULT 'no',
  hits int(11),
  text1 text,
  text2 text,
  text3 text,
  image1 varchar(40),
  image2 varchar(40),
  image3 varchar(40),
  id_diskuse int(11),
  prispevky int(11),
  gallery varchar(200),
  photos text,
  keywords text,
  PRIMARY KEY (id_article)
);

#
# Table structure for table 'category'
#
CREATE TABLE category (
  category_id int(11) NOT NULL auto_increment,
  category_name char(255),
  category_owner int(11) DEFAULT '1',
  category_forums int(11) DEFAULT '0',
  category_parent int(11),
  category_subcats int(11) DEFAULT '0',
  category_tree char(23) DEFAULT '' NOT NULL,
  PRIMARY KEY (category_id)
);

#
# Table structure for table 'dennik'
#
CREATE TABLE dennik (
  id int(4) NOT NULL auto_increment,
  autor int(3),
  nadpis varchar(100),
  datum datetime,
  zapis text,
  id_diskuse int(11) DEFAULT '0',
  hits int(11) DEFAULT '0',
  prispevky int(11) DEFAULT '0',
  dennik_type enum('journaux','report','story','dream','poetry','portugal') DEFAULT 'journaux',
  type enum('private','public','kyberia') DEFAULT 'public',
  PRIMARY KEY (id),
  KEY id (id),
  KEY id_diskuse (id_diskuse)
);

#
# Table structure for table 'diskuse'
#
CREATE TABLE diskuse (
  id_diskuse int(11) NOT NULL auto_increment,
  kat varchar(64) DEFAULT '' NOT NULL,
  pocet_prispevku int(11) DEFAULT '0' NOT NULL,
  zalozeno datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  titulek varchar(255),
  PRIMARY KEY (id_diskuse),
  KEY idx_pocet_prispevku (pocet_prispevku)
);

#
# Table structure for table 'forum'
#
CREATE TABLE forum (
  forum_id int(11) NOT NULL auto_increment,
  forum_name varchar(255),
  forum_type enum('flat','threaded') DEFAULT 'flat',
  forum_owner int(11) DEFAULT '38',
  forum_submissions int(11) DEFAULT '0',
  forum_public enum('private','public') DEFAULT 'public',
  forum_co enum('yes','no') DEFAULT 'no',
  forum_category int(11),
  forum_guild int(11),
  PRIMARY KEY (forum_id)
);

#
# Table structure for table 'forum_info'
#
CREATE TABLE forum_info (
  forum_id int(11) DEFAULT '0' NOT NULL,
  forum_info text,
  PRIMARY KEY (forum_id)
);

#
# Table structure for table 'friends'
#
CREATE TABLE friends (
  user_id int(11) DEFAULT '0' NOT NULL,
  friend_id int(11) DEFAULT '0' NOT NULL,
  friend_text text
);

#
# Table structure for table 'guild'
#
CREATE TABLE guild (
  guild_id int(11) NOT NULL auto_increment,
  guild_name char(200) DEFAULT '' NOT NULL,
  PRIMARY KEY (guild_id)
);

#
# Table structure for table 'intros'
#
CREATE TABLE intros (
  id_intro int(11) NOT NULL auto_increment,
  id_forum int(11),
  id_user text,
  text text,
  PRIMARY KEY (id_intro)
);

#
# Table structure for table 'k_logs'
#
CREATE TABLE k_logs (
  donor_id int(11) DEFAULT '0' NOT NULL,
  acceptor_id int(11) DEFAULT '0' NOT NULL,
  k_amount int(11),
  node_id int(11),
  node_type enum('dennik','submission'),
  timestamp timestamp(14)
);

#
# Table structure for table 'kbs_category'
#
CREATE TABLE kbs_category (
  category_id int(11) NOT NULL auto_increment,
  category_name char(255),
  category_parent int(11),
  category_tree char(23),
  PRIMARY KEY (category_id)
);

#
# Table structure for table 'kbs_items_get'
#
CREATE TABLE kbs_items_get (
  item_id int(11) NOT NULL auto_increment,
  user_id int(11),
  name varchar(123),
  description text,
  type set('get','buy','exchange'),
  price int(11),
  location varchar(123),
  PRIMARY KEY (item_id)
);

#
# Table structure for table 'kbs_items_give'
#
CREATE TABLE kbs_items_give (
  item_id int(11) NOT NULL auto_increment,
  user_id int(11),
  name varchar(123),
  description text,
  type set('give','sell','exchange','auction'),
  price int(11),
  auction_id int(11),
  category_id int(11),
  location varchar(123),
  PRIMARY KEY (item_id)
);

#
# Table structure for table 'last_submissions'
#
CREATE TABLE last_submissions (
  forum_id int(11),
  submission_owner int(11) DEFAULT '0' NOT NULL,
  submission_text text DEFAULT '' NOT NULL,
  submission_timestamp timestamp(14),
  submission_thread varchar(60) DEFAULT '' NOT NULL,
  submission_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (submission_id),
  UNIQUE submission_index (submission_id,forum_id,submission_owner),
  KEY submission_owner (submission_owner)
);

#
# Table structure for table 'links'
#
CREATE TABLE links (
  link_id int(11) NOT NULL auto_increment,
  link_text char(255),
  link_submission int(11) DEFAULT '0' NOT NULL,
  link_owner int(11) DEFAULT '0' NOT NULL,
  link_forum int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (link_id)
);

#
# Table structure for table 'mail'
#
CREATE TABLE mail (
  mail_id int(11) NOT NULL auto_increment,
  mail_from int(11) DEFAULT '0' NOT NULL,
  mail_to int(11) DEFAULT '0' NOT NULL,
  mail_text text,
  mail_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  mail_no int(11) DEFAULT '0',
  mail_to_name varchar(20),
  PRIMARY KEY (mail_id),
  UNIQUE mail_order (mail_id,mail_no,mail_to,mail_from),
  KEY mail_from (mail_from),
  KEY mail_to (mail_to),
  KEY mail (mail_from,mail_to)
);

#
# Table structure for table 'mail2'
#
CREATE TABLE mail2 (
  mail_id int(11) NOT NULL auto_increment,
  mail_user int(11) DEFAULT '0' NOT NULL,
  mail_from int(11) DEFAULT '0' NOT NULL,
  mail_to int(11) DEFAULT '0' NOT NULL,
  mail_text text,
  mail_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  PRIMARY KEY (mail_id),
  KEY mail_user (mail_user,mail_id),
  KEY mail1 (mail_user,mail_to),
  KEY mail_to (mail_to),
  KEY mail_from (mail_from)
);

#
# Table structure for table 'mail_from'
#
CREATE TABLE mail_from (
  mail_id int(11) NOT NULL auto_increment,
  mail_from int(11) DEFAULT '0' NOT NULL,
  mail_to int(11) DEFAULT '0' NOT NULL,
  mail_text text,
  mail_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  PRIMARY KEY (mail_id),
  UNIQUE mail_order (mail_id,mail_to,mail_from),
  KEY mail_from (mail_from),
  KEY mail_to (mail_to),
  KEY mail (mail_from,mail_to)
);

#
# Table structure for table 'mail_to'
#
CREATE TABLE mail_to (
  mail_id int(11) NOT NULL auto_increment,
  mail_from int(11) DEFAULT '0' NOT NULL,
  mail_to int(11) DEFAULT '0' NOT NULL,
  mail_text text,
  mail_timestamp datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  PRIMARY KEY (mail_id),
  UNIQUE mail_order (mail_id,mail_to,mail_from),
  KEY mail_from (mail_from),
  KEY mail_to (mail_to),
  KEY mail (mail_from,mail_to)
);

#
# Table structure for table 'mailinfo'
#
CREATE TABLE mailinfo (
  email varchar(50),
  datum datetime,
  active enum('yes','no')
);

#
# Table structure for table 'mmm_articles'
#
CREATE TABLE mmm_articles (
  id_article int(11) NOT NULL auto_increment,
  id_rubrika int(11) DEFAULT '0' NOT NULL,
  datum datetime,
  nazov varchar(120),
  short_desc text,
  autor varchar(255),
  id_rubrika_secondary int(11),
  title_image varchar(100),
  on_main enum('yes','no') DEFAULT 'no',
  hits int(11),
  text1 text,
  text2 text,
  text3 text,
  image1 varchar(40),
  image2 varchar(40),
  image3 varchar(40),
  id_diskuse int(11),
  prispevky int(11),
  PRIMARY KEY (id_article)
);

#
# Table structure for table 'node_access'
#
CREATE TABLE node_access (
  node_type enum('forum','journaux') DEFAULT 'forum' NOT NULL,
  node_id int(11) DEFAULT '0' NOT NULL,
  user_id int(11) DEFAULT '0' NOT NULL,
  access_type enum('master','op','access','ban') DEFAULT 'access' NOT NULL,
  UNIQUE access (node_type,user_id,node_id)
);

#
# Table structure for table 'outro'
#
CREATE TABLE outro (
  id_outro int(11) NOT NULL auto_increment,
  outro text,
  autor varchar(100),
  PRIMARY KEY (id_outro)
);

#
# Table structure for table 'personalize'
#
CREATE TABLE personalize (
  mail varchar(100) DEFAULT '' NOT NULL,
  java enum('yes','no') DEFAULT 'no',
  flash enum('yes','no') DEFAULT 'no',
  wired enum('yes','no') DEFAULT 'no',
  shadowbox enum('yes','no') DEFAULT 'no',
  zion enum('yes','no') DEFAULT 'no',
  sound enum('yes','no') DEFAULT 'no',
  article_count int(4) DEFAULT '15',
  nick varchar(30),
  skin int(5),
  partylist enum('yes','no') DEFAULT 'no',
  underground enum('yes','no') DEFAULT 'no',
  mailinfo varchar(50) DEFAULT 'no',
  PRIMARY KEY (mail)
);

#
# Table structure for table 'poll_options'
#
CREATE TABLE poll_options (
  id_option int(11) NOT NULL auto_increment,
  id_poll int(11),
  text varchar(255),
  number int(11),
  PRIMARY KEY (id_option),
  KEY id_poll (id_poll)
);

#
# Table structure for table 'polls'
#
CREATE TABLE polls (
  id_poll int(11) NOT NULL auto_increment,
  time timestamp(14),
  question varchar(255),
  responses int(11) DEFAULT '0' NOT NULL,
  forum_id int(11),
  PRIMARY KEY (id_poll),
  KEY id_poll (id_poll),
  KEY forum_id (forum_id)
);

#
# Table structure for table 'prispevky'
#
CREATE TABLE prispevky (
  id_prispevku int(11) NOT NULL auto_increment,
  id_diskuse int(11) DEFAULT '0' NOT NULL,
  vlozeno datetime DEFAULT '0000-00-00 00:00:00' NOT NULL,
  jmeno varchar(255) DEFAULT '' NOT NULL,
  email varchar(255) DEFAULT '' NOT NULL,
  email_upozorneni enum('ne','ano') DEFAULT 'ne' NOT NULL,
  www varchar(255) DEFAULT '' NOT NULL,
  titulek varchar(255) DEFAULT '' NOT NULL,
  telo text DEFAULT '' NOT NULL,
  thread varchar(255) DEFAULT '' NOT NULL,
  znamka tinyint(4) DEFAULT '0' NOT NULL,
  duplicita varchar(32) DEFAULT '' NOT NULL,
  PRIMARY KEY (id_prispevku)
);

#
# Table structure for table 'referers'
#
CREATE TABLE referers (
  referer varchar(255),
  adresa varchar(100),
  cas timestamp(14),
  id int(11)
);

#
# Table structure for table 'rss_items'
#
CREATE TABLE rss_items (
  id int(11) NOT NULL auto_increment,
  id_module int(11),
  title varchar(255),
  link varchar(255),
  description text,
  active enum('yes','no') DEFAULT 'yes',
  datetime timestamp(14),
  poradi int(11),
  imagelink varchar(255),
  imagetitle varchar(255),
  imageurl varchar(255),
  PRIMARY KEY (id)
);

#
# Table structure for table 'rss_news'
#
CREATE TABLE rss_news (
  news_id int(8) NOT NULL auto_increment,
  news_desc varchar(255),
  news_title varchar(200),
  news_url varchar(200),
  news_image varchar(200),
  news_md5 varchar(25) DEFAULT '' NOT NULL,
  news_image_link varchar(25) DEFAULT '' NOT NULL,
  news_image_title varchar(25) DEFAULT '' NOT NULL,
  news_source int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (news_id)
);

#
# Table structure for table 'rss_sources'
#
CREATE TABLE rss_sources (
  rss_id int(8) NOT NULL auto_increment,
  rss_source varchar(200),
  rss_title varchar(200),
  rss_url varchar(200),
  rss_image varchar(200),
  rss_hash varchar(32) DEFAULT '' NOT NULL,
  PRIMARY KEY (rss_id)
);

#
# Table structure for table 'rubriky'
#
CREATE TABLE rubriky (
  id_rubriky int(11) NOT NULL auto_increment,
  id_parent int(11),
  nazov varchar(60),
  obrazok varchar(100),
  description text,
  hits int(11),
  PRIMARY KEY (id_rubriky)
);

#
# Table structure for table 'session'
#
CREATE TABLE session (
  session varchar(50),
  user_name varchar(30),
  user_action varchar(20),
  user_action_id int(11),
  user_action_name varchar(30),
  user_id int(11) DEFAULT '0' NOT NULL,
  user_idle timestamp(14),
  user_mode enum('normal','depresia','stastie','LASKA','vykaleny','nasrany','invisible') DEFAULT 'normal',
  user_amount int(9) DEFAULT '23' NOT NULL,
  user_mode_message varchar(200) DEFAULT '' NOT NULL,
  admin enum('yes','no') DEFAULT 'no',
  UNIQUE user_id (user_id)
);

#
# Table structure for table 'submissions'
#
CREATE TABLE submissions (
  forum_id int(11),
  submission_owner int(11) DEFAULT '0' NOT NULL,
  submission_text text DEFAULT '' NOT NULL,
  submission_timestamp datetime,
  submission_thread varchar(60) DEFAULT '' NOT NULL,
  submission_id int(11) NOT NULL auto_increment,
  submission_k int(8) DEFAULT '0' NOT NULL,
  PRIMARY KEY (submission_id),
  UNIQUE submission_index (submission_id,forum_id,submission_owner),
  KEY submission_owner (submission_owner),
  KEY lala (forum_id,submission_owner),
  KEY lalala (forum_id,submission_owner,submission_id),
  KEY submission_timestamp (submission_timestamp),
  KEY k (submission_k)
);

#
# Table structure for table 'user'
#
CREATE TABLE user (
  id int(3) NOT NULL auto_increment,
  email varchar(50),
  login varchar(20),
  password varchar(128),
  last_login timestamp(14),
  user_action varchar(20),
  user_mode enum('off','normal','happy','depka','nasracky','neviditelny') DEFAULT 'off',
  user_action_param_name varchar(50),
  user_action_param_value varchar(50),
  user_action_param_id int(11),
  user_ad enum('yes','no') DEFAULT 'yes',
  user_info text,
  user_registered timestamp(14),
  user_mail int(3) DEFAULT '0',
  user_icq varchar(20) DEFAULT '' NOT NULL,
  user_www varchar(100),
  user_active enum('yes','no','waiting'),
  mail_name varchar(23),
  charisma int(11) DEFAULT '0' NOT NULL,
  user_amount int(11) DEFAULT '23',
  user_happy varchar(200) DEFAULT '' NOT NULL,
  user_sad varchar(200) DEFAULT '' NOT NULL,
  user_love varchar(200) DEFAULT '' NOT NULL,
  user_agressive varchar(200) DEFAULT '' NOT NULL,
  user_drugged varchar(200) DEFAULT '' NOT NULL,
  user_k int(11) DEFAULT '0' NOT NULL,
  user_karma int(11) DEFAULT '0' NOT NULL,
  admin enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (id),
  UNIQUE id (id)
);

#
# Table structure for table 'user_discussion'
#
CREATE TABLE user_discussion (
  user_id int(11),
  discussion_id int(11),
  submission_count int(11),
  last_visit datetime,
  KEY user_id (user_id),
  KEY discussion_id (discussion_id)
);

#
# Table structure for table 'user_forum'
#
CREATE TABLE user_forum (
  user_id int(11) DEFAULT '0' NOT NULL,
  forum_id int(11) DEFAULT '0' NOT NULL,
  submission_count int(11) DEFAULT '0',
  last_visit datetime DEFAULT '0000-00-00 00:00:00',
  user_bookmark enum('yes','no') DEFAULT 'no',
  UNIQUE user_forum (user_id,forum_id),
  KEY booked_users (forum_id,user_bookmark)
);

#
# Table structure for table 'user_ip'
#
CREATE TABLE user_ip (
  user_id int(11),
  ip char(23),
  datetime timestamp(14)
);

#
# Table structure for table 'user_poll'
#
CREATE TABLE user_poll (
  user_id int(11) DEFAULT '0' NOT NULL,
  poll_id int(11) DEFAULT '0' NOT NULL
);

