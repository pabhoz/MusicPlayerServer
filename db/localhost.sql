-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2019 at 03:16 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AplicacionSuperCool`
--
CREATE DATABASE IF NOT EXISTS `AplicacionSuperCool` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `AplicacionSuperCool`;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `songsNumber` varchar(45) NOT NULL,
  `releaseDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `albums_has_artists`
--

CREATE TABLE `albums_has_artists` (
  `albums_id` int(11) NOT NULL,
  `artists_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `artistname` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `collaborators`
--

CREATE TABLE `collaborators` (
  `playlists_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `libraries`
--

CREATE TABLE `libraries` (
  `users_id` int(11) NOT NULL,
  `songs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `owner` int(11) NOT NULL,
  `isPublic` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playlists_has_songs`
--

CREATE TABLE `playlists_has_songs` (
  `playlists_id` int(11) NOT NULL,
  `songs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `format` varchar(45) NOT NULL,
  `file` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `songs_has_albums`
--

CREATE TABLE `songs_has_albums` (
  `songs_id` int(11) NOT NULL,
  `albums_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `songs_has_artists`
--

CREATE TABLE `songs_has_artists` (
  `songs_id` int(11) NOT NULL,
  `artists_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`) VALUES
(1, 'pabhoz@usbcali.edu.co', 'pabhoz', 'cookies'),
(2, 'foo@bar.doe', 'jhon', 'doe'),
(3, 'pa@la.casa', 'vamonos', 'cookies'),
(4, 'asdas@sads.com', 'aasdas', '123'),
(5, 'lore@nita.com', 'lorena', 'tengo frio'),
(6, 'usuario@gmail.com', 'otro', '1234'),
(7, 'intento@deverdad.com', 'ultimo', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums_has_artists`
--
ALTER TABLE `albums_has_artists`
  ADD PRIMARY KEY (`albums_id`,`artists_id`),
  ADD KEY `fk_albums_has_artists_artists1_idx` (`artists_id`),
  ADD KEY `fk_albums_has_artists_albums1_idx` (`albums_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`playlists_id`,`users_id`),
  ADD KEY `fk_playlists_has_users_users1_idx` (`users_id`),
  ADD KEY `fk_playlists_has_users_playlists1_idx` (`playlists_id`);

--
-- Indexes for table `libraries`
--
ALTER TABLE `libraries`
  ADD PRIMARY KEY (`users_id`,`songs_id`),
  ADD KEY `fk_users_has_songs_songs1_idx` (`songs_id`),
  ADD KEY `fk_users_has_songs_users_idx` (`users_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_playlists_users1_idx` (`owner`);

--
-- Indexes for table `playlists_has_songs`
--
ALTER TABLE `playlists_has_songs`
  ADD PRIMARY KEY (`playlists_id`,`songs_id`),
  ADD KEY `fk_playlists_has_songs_songs1_idx` (`songs_id`),
  ADD KEY `fk_playlists_has_songs_playlists1_idx` (`playlists_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs_has_albums`
--
ALTER TABLE `songs_has_albums`
  ADD PRIMARY KEY (`songs_id`,`albums_id`),
  ADD KEY `fk_songs_has_albums_albums1_idx` (`albums_id`),
  ADD KEY `fk_songs_has_albums_songs1_idx` (`songs_id`);

--
-- Indexes for table `songs_has_artists`
--
ALTER TABLE `songs_has_artists`
  ADD PRIMARY KEY (`songs_id`,`artists_id`),
  ADD KEY `fk_songs_has_artists_artists1_idx` (`artists_id`),
  ADD KEY `fk_songs_has_artists_songs1_idx` (`songs_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums_has_artists`
--
ALTER TABLE `albums_has_artists`
  ADD CONSTRAINT `fk_albums_has_artists_albums1` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_albums_has_artists_artists1` FOREIGN KEY (`artists_id`) REFERENCES `artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD CONSTRAINT `fk_playlists_has_users_playlists1` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playlists_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libraries`
--
ALTER TABLE `libraries`
  ADD CONSTRAINT `fk_users_has_songs_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_songs_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `fk_playlists_users1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `playlists_has_songs`
--
ALTER TABLE `playlists_has_songs`
  ADD CONSTRAINT `fk_playlists_has_songs_playlists1` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playlists_has_songs_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `songs_has_albums`
--
ALTER TABLE `songs_has_albums`
  ADD CONSTRAINT `fk_songs_has_albums_albums1` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_songs_has_albums_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `songs_has_artists`
--
ALTER TABLE `songs_has_artists`
  ADD CONSTRAINT `fk_songs_has_artists_artists1` FOREIGN KEY (`artists_id`) REFERENCES `artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_songs_has_artists_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
