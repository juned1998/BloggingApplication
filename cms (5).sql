-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2019 at 09:12 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `user_id`, `cat_title`) VALUES
(41, 0, 'Cars'),
(42, 23, 'JAVA'),
(43, 0, 'PHP'),
(44, 0, 'OOP'),
(45, 0, 'technology'),
(46, 0, 'NEW'),
(47, 0, 'NEW'),
(48, 0, 'technology'),
(49, 23, 'NEW'),
(50, 24, 'USER2');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(36, 14, 'sdasd', 'test@gmail.com', 'dsfsf', 'approved', '2019-03-29'),
(39, 17, 'Junaid', 'test@gmail.com', 'weafdse', 'approved', '2019-03-29'),
(41, 17, 'sdfsg', 'test@gmail.com', 'dassefr', 'unapproved', '2019-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `user_id` int(10) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `user_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(14, 44, 15, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-15', 'image_5.jpg', 'ghnjghjnjythgjhjghjmvcbvv\r\nx\r\nx', 'blog wordpress article , robot', 0, 'published', 8, 0),
(16, 41, 15, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'published', 1, 0),
(17, 43, 23, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'published', 2, 0),
(18, 44, 23, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'draft', 0, 0),
(19, 44, 23, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'draft', 4, 0),
(20, 41, 15, 'Apple Iphone 7', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'jfyjfyuklsadaiuiluiuloiuolscddxzv cdsvcfdvf', 'apple ,  mobile,', 0, 'draft', 0, 0),
(21, 41, 15, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'draft', 0, 0),
(22, 43, 15, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'draft', 0, 0),
(24, 41, 15, 'Hwo top make a blogpost', 'Steve Jobs', '2019-03-10', '', 'asddfdhgfh', 'blog wordpress article , robot', 0, 'draft', 1, 0),
(25, 41, 23, 'One plus 6T review', 'Steve Jobs', '2019-03-11', '', 'jnjknjk', 'blog wordpress article , robot', 0, 'draft', 1, 0),
(27, 41, 23, 'TEST', 'admin', '2019-03-11', '', '', '', 0, 'draft', 0, 0),
(28, 45, 23, 'How to make a car', 'Kevin_speilberg', '2019-03-11', '', '', 'sdfdfgd', 0, 'draft', 1, 0),
(31, 41, 23, 'One plus 6T review', 'Steve Jobs', '2019-03-15', '', 'jnjknjk', 'blog wordpress article , robot', 0, 'draft', 0, 0),
(32, 41, 23, 'This is a new Post', 'user', '2019-03-29', 'Desert.jpg', 'This is a test post', 'test', 0, 'draft', 0, 0),
(33, 50, 24, 'HELLO POST FROM USER2', 'user2', '2019-03-29', 'Chrysanthemum.jpg', '', 'NEW POST', 0, 'published', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(15, 'admin', '$2y$10$hCxasejAH7nL2JGHz.tzhO8GXy6URm4GutUXpsCnjWyUZoICTkvWK', 'Juned', 'Khan', 'test@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(23, 'user', '$2y$12$vdqs96R/Yt71QxQpSAplde.LQawqdK/dFEL1gJjrY05gnQeRH2EwW', '', '', 'user@cms.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(24, 'user2', '$2y$12$6mAfGlIXTX2byvsUqS2v2e2q7ILaLZd8XBfsJxOF39qPlripY4HSa', '', '', 'user2@cms.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(3, 'c231755j0ipf0a8gi015t812og', 1552230665),
(4, 'egv0ptf770f1b49ca9apn6v25r', 1552230662),
(5, '5v5183r0k2mbvvq8fe0i9rnfsd', 1552237621),
(6, '59t6h81vjgo3eojkg79ap1idna', 1552236376),
(7, '43na250s2qi4ntaunfrhmmvf3k', 1552237685),
(8, 'ku09u0oiplj2ilao40dsd7of23', 1552309621),
(9, 'vssmduquge973ukjsavuerjmnh', 1552327255),
(10, 'bp7uhosutrse411g8lqcjccqs9', 1552404248),
(11, 'okp5h3nboacj6fsoncc9ttk0nr', 1552675172),
(12, 'pkca3tna8f54s1bnchqt3jv3go', 1552765015),
(13, 'edm415sj57v38kl8unruem80vl', 1553803935);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
