-- phpMyAdmin SQL Dump
-- version 2.11.11
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2015 at 12:16 AM
-- Server version: 5.0.95
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `group2`
--

-- --------------------------------------------------------

--
-- Table structure for table `COMMENTS`
--

CREATE TABLE IF NOT EXISTS `COMMENTS` (
  `Comment_ID` int(11) NOT NULL auto_increment,
  `Poster_email` varchar(30) NOT NULL,
  `Post_ID` int(11) NOT NULL,
  `Text` varchar(512) NOT NULL,
  `Date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Comment_ID`),
  KEY `Poster_email` (`Poster_email`),
  KEY `Post_ID` (`Post_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `COMMENTS`
--

INSERT INTO `COMMENTS` (`Comment_ID`, `Poster_email`, `Post_ID`, `Text`, `Date`) VALUES
(1, 'smith@cougars.csusm.edu', 1, 'This is a great company to work for.', '2014-10-01 02:25:00'),
(3, 'smith@cougars.csusm.edu', 3, 'I''m in!', '2014-11-01 02:25:00'),
(2, 'jones@cougars.csusm.edu', 1, 'I work for this company and Love it', '2014-10-01 02:25:00'),
(4, 'hcarrillo92@gmail.com', 4, 'Tomorrow at noon!', '2014-11-30 00:51:14'),
(5, 'hcarrillo92@gmail.com', 1, 'It''s alright', '2014-11-30 01:45:27'),
(6, 'stric013@cougars.csusm.edu', 5, 'testing', '2014-12-01 16:43:06'),
(7, 'stric013@cougars.csusm.edu', 5, 'cool', '2014-12-01 16:43:09'),
(8, 'jones236@cougars.csusm.edu', 10, 'adventures of val and tia is the best', '2014-12-02 11:52:35'),
(9, 'jones236@cougars.csusm.edu', 10, 'this is vince', '2014-12-02 11:52:44'),
(10, 'jones236@cougars.csusm.edu', 10, 'just kidding its jessica', '2014-12-02 11:52:50'),
(11, 'jones236@cougars.csusm.edu', 10, 'no it is vince', '2014-12-02 11:53:13'),
(12, 'hcarrillo92@gmail.com', 10, 'Best game ever! ', '2014-12-02 11:53:16'),
(13, 'jones236@cougars.csusm.edu', 10, 'he is an ugry camel', '2014-12-02 11:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `IMAGES`
--

CREATE TABLE IF NOT EXISTS `IMAGES` (
  `Image_ID` int(11) NOT NULL auto_increment,
  `Post_ID` int(11) NOT NULL,
  `Url` varchar(1024) NOT NULL,
  PRIMARY KEY  (`Image_ID`),
  KEY `Post_ID` (`Post_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `IMAGES`
--

INSERT INTO `IMAGES` (`Image_ID`, `Post_ID`, `Url`) VALUES
(2, 1, 'http://www.cpl.ie/blog/wp-content/uploads/2012/03/Cool-Jobs-Image3.jpg'),
(3, 1, 'http://www.justchecking.co.uk/wp-content/uploads/2011/10/developers-wanted.jpeg'),
(4, 1, 'http://www.entrepreneur.com/dbimages/slideshow/bzzagent.jpg'),
(16, 3, 'http://dyersoundworks.com/wp-content/uploads/2014/05/photodune-2755655-party-time-m.jpg'),
(15, 3, 'http://www.ripleypatton.com/wp-content/uploads/2013/09/lets_party_title.png'),
(14, 3, 'http://www.dmvfollowers.com/wp-content/uploads/2014/05/alcohol-bar-liquor-party-vodka-Favim.com-300906.jpg'),
(8, 2, 'http://photos2.meetupstatic.com/photos/event/a/7/f/a/600_369403002.jpeg'),
(9, 2, 'http://adventured.com/wp-content/uploads/hike.jpeg'),
(10, 2, 'http://www.travelingmyself.com/wp-content/uploads/2013/04/Potato-Chip-Rock-Without-People.jpg'),
(19, 4, 'http://www.lovethispic.com/uploaded_images/27196-Live-Life-Have-Fun.gif'),
(18, 4, 'http://departments.bloomu.edu/solve/img\\KidsFun.jpg'),
(17, 4, 'http://yournaperville.com/wp-content/uploads/2013/10/holiday-fun.jpg'),
(25, 5, 'http://www.pjrc.com/mp3/gallery/empty.gif'),
(24, 5, 'http://www.lessons4living.com/images/penclchk.gif'),
(26, 5, 'http://www.pjrc.com/mp3/gallery/empty.gif'),
(27, 6, 'http://img1.wikia.nocookie.net/__cb20140605022457/town-of-salem/images/7/7a/Smiley-face-1600x1200-wallpaper-775678.jpg'),
(28, 6, 'http://img1.wikia.nocookie.net/__cb20140605022457/town-of-salem/images/7/7a/Smiley-face-1600x1200-wallpaper-775678.jpg'),
(29, 6, 'http://img1.wikia.nocookie.net/__cb20140605022457/town-of-salem/images/7/7a/Smiley-face-1600x1200-wallpaper-775678.jpg'),
(34, 10, 'http://p1.pichost.me/i/41/1640752.jpg'),
(33, 10, 'http://i.ytimg.com/vi/mFwtqs_gi-8/mqdefault.jpg'),
(35, 10, 'http://assets1.ignimgs.com/2013/06/07/tiaovh0530131600jpg-30b6a7.jpg'),
(36, 11, 'http://www.momsmack.com/wp-content/uploads/2010/07/2009128174423_Cougar-4.jpg'),
(37, 11, 'http://www.momsmack.com/wp-content/uploads/2010/07/2009128174423_Cougar-4.jpg'),
(38, 11, 'http://www.momsmack.com/wp-content/uploads/2010/07/2009128174423_Cougar-4.jpg'),
(46, 12, 'http://www.pjrc.com/mp3/gallery/empty.gif'),
(44, 12, 'http://blog.boxesaz.com/wp-content/uploads/2013/10/Blog-15-Party.jpg'),
(45, 12, 'http://dyersoundworks.com/wp-content/uploads/2014/05/photodune-2755655-party-time-m.jpg'),
(52, 13, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSymTxXxwD7LqQEiyYrUaJsXUCP8TiRShLVGeeiIzx8OQLcfM-WQg'),
(50, 13, 'http://media1.giphy.com/media/aAZUV69OiM6OI/200_s.gif'),
(51, 13, 'https://pbs.twimg.com/profile_images/2359292627/image.jpg'),
(53, 14, 'http://ghsvoyager.com/wp-content/uploads/2014/11/study.jpg'),
(54, 14, 'http://sd.keepcalm-o-matic.co.uk/i/keep-calm-and-go-back-studying.png'),
(55, 14, 'http://www.lovethispic.com/uploaded_images/14678-Studying-And-Dying.jpg'),
(61, 16, ' http://cdn1.expertreviews.co.uk/sites/expertreviews/files/images/dir_417/er_photo_208573.jpg?itok=nyZxKkE8'),
(60, 16, ' http://cdn1.expertreviews.co.uk/sites/expertreviews/files/images/dir_417/er_photo_208573.jpg?itok=nyZxKkE8'),
(59, 16, ' http://fc03.deviantart.net/fs70/i/2013/312/7/2/ps4_logo_wallpaper_06_by_b4h-d6thivy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `POSTS`
--

CREATE TABLE IF NOT EXISTS `POSTS` (
  `Post_ID` int(11) NOT NULL auto_increment,
  `Poster_email` varchar(30) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Thumb_url` varchar(1024) default NULL,
  `Short_desc` varchar(256) NOT NULL,
  `Long_desc` varchar(1024) NOT NULL,
  `Create_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Expire_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Post_ID`),
  KEY `Poster_email` (`Poster_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `POSTS`
--

INSERT INTO `POSTS` (`Post_ID`, `Poster_email`, `Title`, `Thumb_url`, `Short_desc`, `Long_desc`, `Create_date`, `Expire_date`) VALUES
(1, 'smith@cougars.csusm.edu', 'Web Developers wanted!', 'http://usa-rc.com/wp-content/uploads/2014/08/job-opportunities.jpg', 'Seeking Enthusiastic and Talented Web Developers for a part time opportunity at WebMasters Inc.', 'Seeking Enthusiastic and Talented Web Developers for a part time opportunity at WebMasters Inc.', '2014-10-01 02:25:00', '2014-11-01 02:25:00'),
(2, 'jones@cougars.csusm.edu', 'Let''s go Hiking!', 'https://img0.etsystatic.com/009/0/5129215/il_570xN.455688144_8q5v.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2014-10-01 02:25:00', '2014-11-01 02:25:00'),
(3, 'jones@cougars.csusm.edu', 'Let''s Party!', 'http://societysouth.com/content/uploads/2014/08/lLq2B1T.gif', 'Come party with Dan the man!', 'Come party with Dan the man!', '2014-10-01 02:25:00', '2014-11-01 02:25:00'),
(4, 'hcarrillo92@gmail.com', 'Let''s Have Fun!', 'http://img1.wikia.nocookie.net/__cb20140605022457/town-of-salem/images/7/7a/Smiley-face-1600x1200-wallpaper-775678.jpg', 'Let''s do this, this and that!!', 'More details!!!', '2014-11-30 00:50:03', '0000-00-00 00:00:00'),
(5, 'stric013@cougars.csusm.edu', 'Testing', 'https://celadorsanitario.files.wordpress.com/2011/11/aptitude_test1.gif', 'Test', 'Test', '2014-12-01 16:41:24', '0000-00-00 00:00:00'),
(6, 'hcarrillo92@gmail.com', 'Let''s have fun!', 'http://img1.wikia.nocookie.net/__cb20140605022457/town-of-salem/images/7/7a/Smiley-face-1600x1200-wallpaper-775678.jpg', 'Party to celebrate the end of the semester!', 'Full Details', '2014-12-01 22:36:58', '0000-00-00 00:00:00'),
(10, 'jones236@cougars.csusm.edu', 'Adventures of Val and Tia', 'http://p1.pichost.me/i/41/1640752.jpg', 'LAN party', 'play', '2014-12-02 11:50:02', '0000-00-00 00:00:00'),
(11, 'hcarrillo92@gmail.com', '', 'http://www.momsmack.com/wp-content/uploads/2010/07/2009128174423_Cougar-4.jpg', '', '', '2014-12-03 23:19:37', '0000-00-00 00:00:00'),
(12, 'hcarrillo92@gmail.com', 'Party Under the Stars!', 'http://i.imgur.com/uH61x.jpg', 'Party at Natalie''s house! Celebrating the end of a bitching semester and the Christmas Season!', 'Party will be the weekend after finals. Address will be sent out the day of to avoid losers from coming. Let me know if you''re interested below and I will add you to the list!', '2014-12-03 23:23:01', '0000-00-00 00:00:00'),
(13, 'stric013@cougars.csusm.edu', 'Pick up soccer games!', 'http://www.uschedule.com/Portals/0/soccer400.png', 'Lots of Fun.', 'We gather of group of fun people to play some pick up soccer games under the lights. \n\nIt is a lot of fun and everyone is welcome.\n\nSee you there.', '2014-12-04 00:24:58', '0000-00-00 00:00:00'),
(14, 'stric013@cougars.csusm.edu', 'CS351 Study Group', 'http://racetams.net/wp-content/uploads/2014/07/Studying-book.jpg', 'Come study with us.', 'We are preparing for the CS351 Final come join us.', '2014-12-04 11:08:08', '0000-00-00 00:00:00'),
(15, 'stric013@cougars.csusm.edu', 'Couch for Sale ($35)', 'http://commercebugdemo.pulsestorm.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/o/couch.jpg', '2 Year old couch. Great shape', 'I am moving and need to sale this couch. The coach is in great shape.\n\nIf interested text me at 760-345-6734', '2014-12-04 11:12:08', '0000-00-00 00:00:00'),
(16, 'stric013@cougars.csusm.edu', 'Changed', 'http://www.extremetech.com/wp-content/uploads/2013/06/ps4-rhombox-cropped.jpg', 'Almost new PS4', '250', '2014-12-04 13:18:31', '0000-00-00 00:00:00'),
(17, 'lihuey42@gmail.com', 'Testing', '', 'Just a test!', 'Nothing but a test!', '2014-12-11 15:14:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `POST_TAGS`
--

CREATE TABLE IF NOT EXISTS `POST_TAGS` (
  `PT_ID` int(11) NOT NULL auto_increment,
  `Tag_ID` int(11) NOT NULL,
  `Post_ID` int(11) NOT NULL,
  PRIMARY KEY  (`PT_ID`),
  KEY `Post_ID` (`Post_ID`),
  KEY `Tag_ID` (`Tag_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `POST_TAGS`
--

INSERT INTO `POST_TAGS` (`PT_ID`, `Tag_ID`, `Post_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TAGS`
--

CREATE TABLE IF NOT EXISTS `TAGS` (
  `Tag_ID` int(11) NOT NULL auto_increment,
  `Name` varchar(128) NOT NULL,
  `Num_uses` int(11) NOT NULL,
  PRIMARY KEY  (`Tag_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `TAGS`
--

INSERT INTO `TAGS` (`Tag_ID`, `Name`, `Num_uses`) VALUES
(1, 'Jobs', 1),
(2, 'Computer Science', 1),
(3, 'Recreation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE IF NOT EXISTS `USERS` (
  `Email` varchar(30) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Img` varchar(1024) NOT NULL,
  PRIMARY KEY  (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`Email`, `Name`, `Img`) VALUES
('cougarpost.group2@gmail.com', 'Cougar Post', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('smith@cougars.csusm.edu', 'Smith', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg'),
('jones@cougars.csusm.edu', 'Jones', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg'),
('hcarrillo92@gmail.com', 'Horacio Carrillo', 'https://lh6.googleusercontent.com/-npf3mE_rgtE/AAAAAAAAAAI/AAAAAAAAEVs/tFUizaCR-g4/photo.jpg?sz=50'),
('reesedogg1@gmail.com', 'Maurice Strickland', 'https://lh5.googleusercontent.com/-0DfTItEP7to/AAAAAAAAAAI/AAAAAAAAAEk/M_IUNsiKty4/photo.jpg?sz=50'),
('nataliearmstrong27@gmail.com', 'Natalie Armstrong', 'https://lh3.googleusercontent.com/-yDNgoMD9yXQ/AAAAAAAAAAI/AAAAAAAADsc/q-Dyogg8csQ/photo.jpg?sz=50'),
('jimen082@cougars.csusm.edu', 'Luis Jimenez', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('stric013@cougars.csusm.edu', 'Maurice Strickland', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('phong001@cougars.csusm.edu', 'Vincent Phongsamran', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('jones236@cougars.csusm.edu', 'Jessica Jones', 'https://lh5.googleusercontent.com/-xP7QvZW8PQY/AAAAAAAAAAI/AAAAAAAAAQM/oXEzaV-NkaQ/photo.jpg?sz=50'),
('marti496@cougars.csusm.edu', 'Arturo Martinez', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('meado006@cougars.csusm.edu', 'Kevin Meador', 'https://lh6.googleusercontent.com/-Fi1GqOksHNs/AAAAAAAAAAI/AAAAAAAAICQ/h0QjIj0mD7o/photo.jpg?sz=50'),
('vaism001@cougars.csusm.edu', 'Allen Vaisman', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('cook079@cougars.csusm.edu', 'Raymond Cook', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50'),
('lihuey42@gmail.com', 'Li-huey Wu', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50');
