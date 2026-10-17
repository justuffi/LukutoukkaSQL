-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               12.3.3-MariaDB - MariaDB Server
-- Server OS:                    Win64
-- HeidiSQL Version:             12.20.0.7320
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lukutoukka
CREATE DATABASE IF NOT EXISTS `lukutoukka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `lukutoukka`;

-- Dumping structure for table lukutoukka.kategoria
CREATE TABLE IF NOT EXISTS `kategoria` (
  `kategoria_id` int(11) NOT NULL,
  `kategorian_nimi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kategoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table lukutoukka.kategoria: ~5 rows (approximately)
INSERT IGNORE INTO `kategoria` (`kategoria_id`, `kategorian_nimi`) VALUES
	(1, 'Manga'),
	(2, 'Kaunokirjallisuus'),
	(3, 'Tietokirja'),
	(4, 'Romaani'),
	(5, 'Klassikko');

-- Dumping structure for table lukutoukka.kirja
CREATE TABLE IF NOT EXISTS `kirja` (
  `kirja_id` int(11) NOT NULL,
  `nimi` varchar(100) DEFAULT NULL,
  `kirjailija` varchar(100) DEFAULT NULL,
  `ostohinta` decimal(6,2) DEFAULT NULL,
  `ostopaiva` date DEFAULT NULL,
  `kategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`kirja_id`),
  KEY `kategoria_id` (`kategoria_id`),
  CONSTRAINT `1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`kategoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table lukutoukka.kirja: ~5 rows (approximately)
INSERT IGNORE INTO `kirja` (`kirja_id`, `nimi`, `kirjailija`, `ostohinta`, `ostopaiva`, `kategoria_id`) VALUES
	(1, 'One Piece Vol. 1', 'Eiichiro Oda', 24.90, '2024-01-15', 1),
	(2, 'Pieni Elämä', 'Hanya Yanagihara', 19.90, '2024-02-10', 4),
	(3, 'Äkkilähtöjä Tampereella', 'Ritva Vepsä', 29.90, '2024-03-05', 4),
	(4, 'Tympeät tytöt - Aikuistumisriittejä', 'Emmi-Liia Sjöholm', 39.90, '2024-04-20', 3),
	(5, 'Danten 7 helvettiä', 'Dante Alighieri', 22.50, '2024-05-12', 1);

-- Dumping structure for table lukutoukka.laina
CREATE TABLE IF NOT EXISTS `laina` (
  `laina_id` int(11) NOT NULL,
  `kirja_id` int(11) DEFAULT NULL,
  `omistaja_id` int(11) DEFAULT NULL,
  `lainauspaiva` date DEFAULT NULL,
  `lainausaika` time DEFAULT NULL,
  `palautuspaiva` date DEFAULT NULL,
  `palautusaika` time DEFAULT NULL,
  PRIMARY KEY (`laina_id`),
  KEY `kirja_id` (`kirja_id`),
  KEY `omistaja_id` (`omistaja_id`),
  CONSTRAINT `1` FOREIGN KEY (`kirja_id`) REFERENCES `kirja` (`kirja_id`),
  CONSTRAINT `2` FOREIGN KEY (`omistaja_id`) REFERENCES `omistaja` (`omistaja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table lukutoukka.laina: ~5 rows (approximately)
INSERT IGNORE INTO `laina` (`laina_id`, `kirja_id`, `omistaja_id`, `lainauspaiva`, `lainausaika`, `palautuspaiva`, `palautusaika`) VALUES
	(1, 2, 2, '2026-01-15', '16:30:00', '2026-02-05', '15:45:00'),
	(2, 1, 4, '2026-03-12', '14:15:00', '2026-03-25', '13:20:00'),
	(3, 5, 3, '2026-05-08', '18:45:00', '2026-05-29', '17:30:00'),
	(4, 4, 5, '2026-07-21', '17:20:00', '2026-08-04', '16:10:00'),
	(5, 3, 1, '2026-09-10', '15:00:00', '2026-09-24', '14:30:00');

-- Dumping structure for table lukutoukka.omistaja
CREATE TABLE IF NOT EXISTS `omistaja` (
  `omistaja_id` int(11) NOT NULL,
  `etunimi` varchar(50) DEFAULT NULL,
  `sukunimi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`omistaja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table lukutoukka.omistaja: ~5 rows (approximately)
INSERT IGNORE INTO `omistaja` (`omistaja_id`, `etunimi`, `sukunimi`) VALUES
	(1, 'Jyti', 'Cee'),
	(2, 'Mikael', 'Kosola'),
	(3, 'Eino', 'Leino'),
	(4, 'Donkey', 'Kong'),
	(5, 'Kimmo', 'Laiho');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
