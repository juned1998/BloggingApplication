-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2019 at 06:04 PM
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
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(41, 'Cars'),
(42, 'JAVA'),
(43, 'PHP'),
(44, 'OOP');

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
(18, 4, 'Junaid', 'test@gmail.com', 'dsad', 'approved', '2019-03-08'),
(19, 5, 'Junaid', 'test@gmail.com', 'sdfsdg', 'approved', '2019-03-09'),
(20, 4, 'Junaid', 'test@gmail.com', 'this is good post', 'unapproved', '2019-03-10'),
(21, 4, 'Junaid', 'test@gmail.com', 'this is good post', 'unapproved', '2019-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(4, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 3, 'published', 1),
(5, 41, 'Apple Iphone 7', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'jfyjfyuklsadaiuiluiuloiuolscddxzv cdsvcfdvf', 'apple ,  mobile,', 1, 'published', 0),
(6, 41, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-09', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'published', 0),
(7, 43, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'draft', 0),
(8, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 1),
(9, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 3),
(10, 41, 'Apple Iphone 7', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'jfyjfyuklsadaiuiluiuloiuolscddxzv cdsvcfdvf', 'apple ,  mobile,', 0, 'published', 0),
(11, 41, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'published', 0),
(12, 43, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'draft', 0),
(13, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 0),
(14, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 1),
(15, 41, 'Apple Iphone 7', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'jfyjfyuklsadaiuiluiuloiuolscddxzv cdsvcfdvf', 'apple ,  mobile,', 0, 'published', 0),
(16, 41, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'published', 0),
(17, 43, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'draft', 0),
(18, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 0),
(19, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 1),
(20, 41, 'Apple Iphone 7', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'jfyjfyuklsadaiuiluiuloiuolscddxzv cdsvcfdvf', 'apple ,  mobile,', 0, 'published', 0),
(21, 41, 'Apple iphone 7+ review', 'Steve Jobs', '2019-03-10', 'image_1.jpg', 'Hello this is a test post', 'iphone review ,', 0, 'published', 0),
(22, 43, 'hawjdkjbwsfb', 'tom', '2019-03-10', '', '', 'iphone review ,', 0, 'draft', 0),
(23, 44, 'Hwo top make a blogpost', 'Junaid Khan', '2019-03-10', 'image_5.jpg', '', 'blog wordpress article , robot', 0, 'published', 0),
(24, 41, 'Hwo top make a blogpost', 'Steve Jobs', '2019-03-10', '', 'asddfdhgfh', 'blog wordpress article , robot', 0, 'published', 1);

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
(1, 'juned', 'admin', 'Juned', 'Khan', 'juned@cms.com', '', 'subscriber', ''),
(4, 'james', '1234', 'james', 'bond', 'james@cms.com', '', 'subscriber', ''),
(7, 'test12', '123', 'update', 'test', 'test@cms.com', '', 'admin', ''),
(8, 'admin', 'admin', 'admin', 'admin', 'admin@cms.com', '', 'admin', ''),
(9, 'dhsfhv', '123', 'juned', 'khan', 'bdjb@sdjkkj.com', '', 'subscriber', ''),
(12, 'demo', '123', '', '', 'demo@cms.com', '', 'subscriber', '$2y$10$iusesomecrazystring22'),
(13, 'juned', '$1$xZ0fpVoX$vqa/imDu9QzzkUGObHlki/', '', '', 'juned@cms.com', '', 'admin', '$2y$10$iusesomecrazystring22');

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
(5, '5v5183r0k2mbvvq8fe0i9rnfsd', 1552237475),
(6, '59t6h81vjgo3eojkg79ap1idna', 1552236376);

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
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
