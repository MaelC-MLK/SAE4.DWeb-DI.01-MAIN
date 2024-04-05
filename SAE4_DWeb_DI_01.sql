-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : ven. 05 avr. 2024 à 13:12
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `SAE4_DWeb_DI_01`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Science-Fiction'),
(3, 'Comédie'),
(4, 'Horreur'),
(5, 'Fantaisie'),
(6, 'Drame'),
(7, 'Romantique'),
(8, 'Western'),
(9, 'Animation'),
(10, 'Gangster'),
(11, 'MCU / Super-héros'),
(12, 'Thriller'),
(13, 'Guerre'),
(15, 'Policier'),
(16, 'Aventure');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240315100329', '2024-03-18 10:31:11', 533),
('DoctrineMigrations\\Version20240315134038', '2024-03-18 10:31:11', 58),
('DoctrineMigrations\\Version20240315134920', '2024-03-18 10:31:11', 32),
('DoctrineMigrations\\Version20240318144245', '2024-03-18 14:43:15', 161),
('DoctrineMigrations\\Version20240318150059', '2024-03-18 15:01:18', 91),
('DoctrineMigrations\\Version20240325104638', '2024-03-25 10:46:53', 179),
('DoctrineMigrations\\Version20240326170004', '2024-03-26 17:00:11', 47),
('DoctrineMigrations\\Version20240327140849', '2024-03-27 14:08:53', 72),
('DoctrineMigrations\\Version20240402081101', '2024-04-02 08:11:10', 53),
('DoctrineMigrations\\Version20240404082912', '2024-04-04 08:29:20', 47),
('DoctrineMigrations\\Version20240404091957', '2024-04-04 09:20:05', 537),
('DoctrineMigrations\\Version20240404115939', '2024-04-04 11:59:46', 295),
('DoctrineMigrations\\Version20240404160616', '2024-04-04 16:06:21', 242);

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `realisateur` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lien` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bigimg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `duree` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `misenavant` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `name`, `year`, `realisateur`, `img`, `lien`, `description`, `bigimg`, `duree`, `misenavant`) VALUES
(1, 'Kill Bill - Volume 1', '2003', 'Quentin Tarantino', 'killbill.webp', 'https://www.youtube.com/embed/7kSuas6mRpk?si=MD1ec8Qx1LLq3_U_', '\"Kill Bill: Volume 1\" est un film d\'action réalisé par Quentin Tarantino en 2003, mettant en scène Uma Thurman dans le rôle de \"The Bride\", une ancienne assassin en quête de vengeance contre son ex-amant et son équipe d\'assassins.', 'killbillbig.webp', '1h 51m', 0),
(2, 'Avatar', '2009', 'James cameron', 'avatar.webp', 'https://www.youtube.com/embed/5PSNL1qE6VY?si=VcMLD2BthTmxS80D', '\"Avatar\" (2009) : Sur Pandora, Jake Sully, ex-marine, devient lié à un avatar pour interagir avec les Na\'vi. Entre les humains et Pandora, il doit choisir.', 'avatarbig.webp', '2h 41m', 0),
(3, 'Orange mécanique', '1971', 'Stanley Kubrick', 'orangemecanique.webp', 'https://www.youtube.com/embed/T54uZPI4Z8A?si=fn9QVaj1OPH1MKOU', '\"Orange Mécanique\" (1971) : Alex DeLarge, jeune délinquant, subit un traitement expérimental pour réduire son comportement violent.', 'orangemecaniquebig.webp', '2h 16m', 0),
(4, 'The Thing', '1982', 'John Carpenter', 'thething.webp', 'https://www.youtube.com/embed/K5tyF4tmWf0?si=isZw1UMjqGrHEC1Z', '\"The Thing\" (1982) : Une équipe de chercheurs en Antarctique découvre une créature extraterrestre capable d\'imiter n\'importe quelle forme de vie.', 'thethingbig.webp', '1h 49m', 0),
(5, 'La cité de la peur', '1994', 'Alain Berberian', 'lacitedelapeur.webp', 'https://www.youtube.com/embed/8Drj9uNHgfs?si=1xFuDuCgELh4ciOd', '\"La Cité de la Peur\" est une comédie française réalisée par Alain Berbérian, sortie en 1994. Le film met en scène les aventures burlesques d\'une équipe de télévision envoyée pour couvrir le Festival de Cannes.', 'lacitedelapeurbig.webp', '1h 33m', 0),
(6, 'Miss Peregrine et les enfants particuliers', '2016', 'Tim Burton', 'missperegrine.webp', 'https://www.youtube.com/embed/INJOMaHbgeY?si=ghf3jjhLyYSe1dQD', '\"Miss Peregrine et les Enfants Particuliers\" (2016) : Jacob découvre un refuge pour enfants dotés de pouvoirs spéciaux, dirigé par Miss Peregrine, et doit les aider à affronter des créatures dangereuses pour protéger leur refuge.', 'missperegrinebig.webp', '2h 7m', 0),
(7, 'Avatar : The Way of Water', '2022', 'James Cameron', 'avatarthewayofwater.webp', 'https://www.youtube.com/embed/d9MyW72ELq0', 'Suite très attendue du film original Avatar, explorant à nouveau les mondes extraordinaires de Pandora.', 'avatarthewayofwaterbig.webp', '3h 12m', 1),
(8, 'Creed : L\'Héritage de Rocky Balboa', '2015', 'Ryan Coogler', 'creed1.webp', 'https://www.youtube.com/embed/Uv554B7YHk4', 'Spin-off de la franchise Rocky, suivant le parcours d\'Adonis Creed, le fils d\'Apollo Creed, qui cherche à faire son propre nom dans le monde de la boxe.', 'creed1big.webp', '2h 13m', 0),
(9, 'Creed II', '2018', 'Steven Caple Jr.', 'creed2.webp', 'https://www.youtube.com/embed/u22BXhMu4tI', 'Adonis Creed affronte Viktor Drago, fils d\'Ivan Drago, dans un combat chargé d\'émotion et de rédemption.', 'creed2big.webp', '2h 10m', 0),
(10, 'Creed III', '2022', 'Michael B. Jordan', 'creed3.webp', 'https://www.youtube.com/embed/IJWSR9WyWtA', 'Adonis Creed doit faire face à de nouveaux défis personnels et professionnels tout en continuant le héritage familial dans le ring.', 'creed3big.webp', '1h 56m', 0),
(11, 'Inception', '2010', 'Christopher Nolan', 'inception.webp', 'https://www.youtube.com/embed/CPTIgILtna8', 'Un voleur d\'élite utilise une technologie révolutionnaire pour pénétrer dans l\'esprit de ses cibles et voler leurs secrets les plus précieux.', 'inceptionweb.webp', '2h 28m', 0),
(12, 'Fight Club', '1999', 'David Fincher', 'fightclub.webp', 'https://www.youtube.com/embed/BBCgux99CEg', 'Un employé de bureau désillusionné et un vendeur de savon charismatique forment un club clandestin où les hommes se battent dans un combat brutal pour se sentir vivants.', 'fightclubbig.webp', '2h 19m', 0),
(13, 'Pulp Fiction', '1994', 'Quentin Tarantino', 'pulpfiction.webp', 'https://www.youtube.com/embed/tGpTpVyI_OQ', 'Une série d\'histoires entrelacées mettant en vedette des gangsters, des boxeurs, des drogués et des femmes fatales dans une exploration audacieuse du crime, de la violence et de la culture pop.', 'pulpfictionbig.webp', '2h 34m', 0),
(14, 'Interstellar', '2014', 'Christopher Nolan', 'interstellar.webp', 'https://www.youtube.com/embed/VaOijhK3CRU', 'Une équipe d\'explorateurs voyage à travers un trou de ver dans l\'espace à la recherche d\'une nouvelle planète habitable pour sauver l\'humanité menacée d\'extinction sur Terre.', 'interstellarbig.webp', '2h 49m', 0),
(15, '2001 : L\'Odyssée de l\'espace', '1968', 'Stanley Kubrick', '2001lodysseedelespace.webp', 'https://www.youtube.com/embed/5px2VwyCeWE', 'Une exploration épique de l\'évolution de l\'humanité, de la préhistoire à un avenir mystérieux, sous l\'influence d\'une intelligence extraterrestre.', '2001lodysseedelespacebig.webp', '2h 29m', 0),
(16, 'Blade Runner', '1982', 'Ridley Scott', 'bladerunner.webp', 'https://www.youtube.com/embed/FfRPKYwsFNg', 'Dans un Los Angeles futuriste, un détective spécialisé dans la traque des \"réplicants\" synthétiques devient obsédé par la traque de ceux qui ont défié leur date de péremption.', 'bladerunnerbig.webp', '1h 57m', 0),
(17, 'Le Parrain', '1972', 'Francis Ford Coppola', 'leparrain.webp', 'https://www.youtube.com/embed/bmtuIhesQWA', 'Une saga de crime épique suivant la montée au pouvoir d\'une famille mafieuse italo-américaine, dirigée par le patriarche impitoyable Don Vito Corleone.', 'leparrainbig.webp', '2h 55m', 1),
(18, 'Forrest Gump', '1994', 'Robert Zemeckis', 'forrestgump.webp', 'https://www.youtube.com/embed/7pDDuroFBGM', 'L\'histoire extraordinaire d\'un homme simple d\'esprit qui se retrouve impliqué dans certains des moments les plus marquants de l\'histoire américaine du XXe siècle.', 'forrestgumpbig.webp', '2h 22m', 0),
(19, 'Le Seigneur des Anneaux - Le Retour du Roi', '2003', 'Peter Jackson', 'leseigneurdesanneauxleretourduroi.webp', 'https://www.youtube.com/embed/RCuDRcK0BBM', 'Conclusion épique de la trilogie du Seigneur des Anneaux, où Frodo et ses compagnons se battent pour détruire l\'Anneau Unique et sauver la Terre du Milieu.', 'leseigneurdesanneauxleretourduroibig.webp', '3h 21m', 1),
(20, 'Le Bon, la Brute et le Truand', '1966', 'Sergio Leone', 'lebonlabruteetletruand.webp', 'https://www.youtube.com/embed/0ecn0TmeD_I', 'Un western spaghetti classique mettant en vedette trois hommes impitoyables en quête d\'un trésor caché pendant la guerre civile américaine.', 'lebonlabruteetletruandbig.webp', '2h 41m', 0),
(21, 'The Dark Knight - Le Chevalier Noir', '2008', 'Christopher Nolan', 'thedarkknight.webp', 'https://www.youtube.com/embed/wrcaivEjWCo', 'Batman affronte le Joker dans un duel intense de moralité et de chaos qui menace de détruire Gotham City.', 'thedarkknightbig.webp', '2h 32m', 0),
(22, 'Le seigneur des Anneaux - La communauté de l\'anneau', '2001', 'Peter Jackson', 'leseigneurdesanneauxlacommunautedelanneau.webp', 'https://www.youtube.com/embed/nalLU8i4zgs', 'Le début de la quête épique pour détruire l\'Anneau Unique et vaincre Sauron, le Seigneur des Ténèbres, dans la Terre du Milieu.', 'leseigneurdesanneauxlacommunautedelanneaubig.webp', '2h 58m', 0),
(23, 'Apocalypse Now', '1979', 'Francis Ford Coppola', 'apocalypsenow.webp', 'https://www.youtube.com/embed/FTjG-Aux_yQ?si=UmlH5DhNKpgMTvF7', 'Une plongée hallucinante dans la folie de la guerre du Vietnam, où un capitaine de l\'armée américaine est chargé d\'assassiner un colonel devenu fou.', 'apocalypsenowbig.webp', '2h 33m', 0),
(24, 'Princesse Mononoké', '1997', 'Hayao Miyazaki', 'princessemononoke.webp', 'https://www.youtube.com/embed/8tpd5SAUAkM', 'Une fable épique animée où un prince exilé se bat pour protéger sa forêt natale des forces industrielles destructrices de l\'homme.', 'princessemononokebig.webp', '2h 25m', 0),
(25, 'Eternal Sunshine of the Spotless Mind', '2004', 'Michel Gondry', 'eternalsunshineofthespotlessmind.webp', 'https://www.youtube.com/embed/iY8B790zlR0', 'Une romance originale et émouvante où un homme tente d\'effacer de sa mémoire les souvenirs de son ex-petite amie, mais se rend compte qu\'il ne veut pas oublier.', 'eternalsunshineofthespotlessmindbig.webp', '1h 48m', 0),
(26, 'Mulholland Drive', '2001', 'David Lynch', 'mulhollanddrive.webp', 'https://www.youtube.com/embed/U-Y70mhkiJo', 'Un thriller psychologique labyrinthique explorant les rêves, la réalité et l\'illusion à Hollywood, où rien n\'est ce qu\'il semble être.', 'mulhollanddrivebig.webp', '2h 27m', 0),
(27, 'Old Boy', '2003', 'Park Chan-wook', 'oldboy.webp', 'https://www.youtube.com/embed/wHqvqUzICtM', 'n homme est mystérieusement enlevé et emprisonné pendant 15 ans, puis relâché sans explication, déterminé à se venger de ceux qui l\'ont emprisonné.', 'oldboybig.webp', '2 heures', 0),
(28, 'Le Voyage de Chihiro', '2001', 'Hayao Miyazaki', 'levoyagedechihiro.webp', 'https://www.youtube.com/embed/EhIZrZQoHuA', 'Une jeune fille découvre un monde magique et mystérieux peuplé de créatures étranges alors qu\'elle tente de sauver ses parents transformés en porcs.', 'levoyagedechihirobig.webp', '2h 5m', 0),
(29, 'Matrix', '1999', 'Les Sœurs Wachowski', 'matrix.webp', 'https://www.youtube.com/embed/8xx91zoASLY', 'Un programmeur découvre que le monde dans lequel il vit est une simulation informatique contrôlée par des machines, et il se joint à une rébellion pour libérer l\'humanité.', 'matrixbig.webp', '2h 16m', 0),
(30, 'Douze Hommes en Colère', '1957', 'Sidney Lumet', 'douzehommesencolere.webp', 'https://www.youtube.com/embed/TEN-2uTi2c0', 'Un huis clos captivant dans une salle de délibération où douze jurés doivent décider du sort d\'un adolescent accusé de meurtre.', 'douzehommesencolerebig.webp', '1h 35m', 0),
(31, 'Retour vers le Futur', '1985', 'Robert Zemeckis', 'retourverslefutur.webp', 'https://www.youtube.com/embed/cU5BREZ9ke0', 'Un adolescent voyage dans le temps à bord d\'une DeLorean modifiée, où il rencontre ses parents adolescents et doit s\'assurer de leur rencontre pour sauver son propre avenir.', 'retourverslefuturbig.webp', '1h 56m', 0),
(32, 'Il était une fois en Amérique', '1984', 'Sergio Leone', 'unefoisenamerique.webp', 'https://www.youtube.com/embed/nHncGNNSDRE', 'Une saga criminelle épique suivant les destins entrelacés de gangsters juifs dans le New York du début du 20e siècle.', 'unefoisenameriquebig.webp', '4h 11m', 0),
(33, 'Il Était une Fois dans l\'Ouest', '1969', 'Sergio Leone', 'iletaitunefoisdanslouest.webp', 'https://www.youtube.com/embed/591ov1tj3EQ', 'Un western spaghetti classique rempli de personnages emblématiques et de moments épiques, orchestré par le maître du genre, Sergio Leone.', 'iletaitunefoisdanslouestbig.webp', '2h 55m', 0),
(34, 'Shining', '1980', 'Stanley Kubrick', 'shining.webp', 'https://www.youtube.com/embed/JkZzWDaId-s', 'Une adaptation terrifiante du roman de Stephen King, où un écrivain en panne d\'inspiration devient gardien d\'un hôtel isolé hanté par des forces sinistres.', 'shiningbig.webp', '2h 26m', 0),
(35, 'Gladiator', '2000', 'Ridley Scott', 'gladiator.webp', 'https://www.youtube.com/embed/ChcgxBAzrks?start=4', 'Un général romain déchu se bat dans l\'arène pour venger sa famille et regagner son honneur dans cette épopée spectaculaire de vengeance et de courage.', 'gladiatorbig.webp', '2h 35m', 0),
(36, 'Les Affranchis', '1990', 'Martin Scorsese', 'lesaffranchis.webp', 'https://www.youtube.com/embed/0v0NUEmeqbI', 'Une plongée brutale dans le monde de la mafia new-yorkaise, basée sur la vraie histoire du gangster Henry Hill et de ses complices.', 'lesaffranchisbig.webp', '2h 26m', 1),
(37, 'Seven', '1995', 'David Fincher', 'seven.webp', 'https://www.youtube.com/embed/5eYUMIjNOS4', 'Un thriller sombre et captivant suivant deux détectives traquant un tueur en série qui commet des meurtres inspirés des sept péchés capitaux.', 'sevenbig.webp', '2h 7m', 0),
(38, 'Into the Wild', '2007', 'Sean Penn', 'intothewild.webp', 'https://www.youtube.com/embed/wRLMEEFEf1M', 'Basé sur une histoire vraie, ce film raconte l\'odyssée d\'un jeune homme qui abandonne tout pour vivre une vie d\'aventure et de liberté dans la nature sauvage de l\'Alaska.', 'intothewildbig.webp', '2h 28m', 0),
(39, 'Les Évadés', '1994', 'Frank Darabont', 'lesevades.webp', 'https://www.youtube.com/embed/2e8Otbbcowc', 'Inspiré d\'une nouvelle de Stephen King, ce film émouvant et captivant suit l\'amitié improbable entre deux prisonniers qui planifient une évasion spectaculaire.', 'lesevadesbig.webp', '2h 22m', 0),
(40, 'Drive', '2011', 'Nicolas Winding Refn', 'drive.webp', 'https://www.youtube.com/embed/4Wz990aqSDA', 'Un chauffeur de voitures cascadeur solitaire se retrouve entraîné dans une spirale de violence lorsqu\'il tente de protéger sa voisine et son fils d\'un gang de criminels.', 'drivebig.webp', '1h 40m', 0),
(41, 'Alien - Le 8ème Passager', '1979', 'Ridley Scott', 'alien.webp', 'https://www.youtube.com/embed/gaJFi3LiFOQ', 'Un classique de la science-fiction horrifique où l\'équipage d\'un vaisseau spatial commercial est traqué par une créature extraterrestre meurtrière.', 'Chemin de la grande image', '1h 56m', 0),
(42, 'The Big Lebowski', '1998', 'Joel Coen, Ethan Coen', 'the_big_lebowski.webp', 'https://www.youtube.com/embed/m65W-gm7XO4', 'Une comédie déjantée suivant les mésaventures d\'un fainéant nommé Le Duc et de ses amis marginaux alors qu\'ils se retrouvent mêlés à une affaire de kidnapping.', 'Chemin de la grande image', '1h 57m', 0),
(43, 'La Ligne Verte', '1999', 'Frank Darabont', 'la_ligne_verte.webp', 'https://www.youtube.com/embed/mccs8Ql8m8o', 'Un gardien de prison découvre que l\'un de ses détenus possède un don surnaturel, ce qui change à jamais la vie de ceux qui l\'entourent dans cette adaptation poignante du roman de Stephen King.', 'Chemin de la grande image', '3h 09m', 0),
(44, 'Django Unchained', '2012', 'Quentin Tarantino', 'django_unchained.webp', 'https://www.youtube.com/embed/K2XjgsfzDrU', 'Un western audacieux et sanglant se déroulant dans le Sud des États-Unis avant la guerre civile, où un esclave affranchi se lance dans une mission de vengeance contre des propriétaires de plantations cruels.', 'Chemin de la grande image', '2h 44m', 0),
(45, 'Barry Lyndon', '1975', 'Stanley Kubrick', 'barry_lyndon.webp', 'https://www.youtube.com/embed/0woOx2fz-Mc', 'Une fresque historique époustouflante suivant les aventures d\'un jeune homme irlandais ambitieux qui gravit les échelons de la société aristocratique du XVIIIe siècle.', 'Chemin de la grande image', '3h 07m', 0),
(46, 'Shutter Island', '2010', 'Martin Scorsese', 'shutter_island.webp', 'https://www.youtube.com/embed/Hz0ToXuAxag', 'Dans ce thriller psychologique, deux agents enquêtent sur la disparition d\'une patiente d\'un hôpital psychiatrique sur une île isolée, mais découvrent des secrets troublants qui remettent en question la réalité.', 'Chemin de la grande image', '2h 17m', 0),
(47, 'American Beauty', '1999', 'Sam Mendes', 'american-beauty.webp', 'https://www.youtube.com/embed/FfWnZthD9Tw?start=7', 'Une exploration satirique et sombre de la vie suburbaine américaine, mettant en lumière les frustrations et les désirs inassouvis d\'un homme qui remet en question sa vie après une crise de milieu de vie.', 'Chemin de la grande image', '2h 02m', 0),
(48, 'Le Seigneur des Anneaux - Les Deux Tours', '2002', 'Peter Jackson', 'le_seigneur_des_anneaux_les_deux_tours.webp', 'https://www.youtube.com/embed/c9blKqmyeV4', 'La deuxième partie de l\'épique trilogie fantastique de J.R.R. Tolkien, où la Communauté de l\'Anneau se sépare pour faire face à des défis individuels dans sa quête pour détruire l\'Anneau Unique.', 'Chemin de la grande image', '2h 59m', 0),
(49, 'Reservoir Dogs', '1992', 'Quentin Tarantino', 'reservoir-dogs.webp', 'https://www.youtube.com/embed/pswIExH61dw?start=3', 'Le premier long métrage de Quentin Tarantino est un thriller tendu et stylisé qui suit les péripéties d\'une équipe de criminels alors qu\'une transaction de diamants tourne au désastre.', 'Chemin de la grande image', '1h 39m', 0),
(50, 'Taxi Driver', '1976', 'Martin Scorsese', 'taxi_driver.webp', 'https://www.youtube.com/embed/u9M02nrQIF0', 'Un vétéran de la guerre du Vietnam devenu chauffeur de taxi à New York sombre dans la folie alors qu\'il tente de purifier la ville de la corruption et de la décadence qui la consume.', 'Chemin de la grande image', '1h 55m', 0),
(51, 'Donnie Darko', '2002', 'Richard Kelly', 'donnie_darko.webp', 'https://www.youtube.com/embed/TzPxI3L752I', 'Un adolescent tourmenté par des visions de lapin géant prédit la fin du monde dans ce film culte au mélange unique de science-fiction, de thriller psychologique et de drame adolescent.', 'Chemin de la grande image', '1h 53m', 0),
(52, 'Requiem for a Dream', '2000', 'Darren Aronofsky', 'requiem_for_a_dream.webp', 'https://www.youtube.com/embed/mGMT1z5ng2w', 'Un regard brutal et saisissant sur la descente aux enfers de quatre individus pris dans une spirale de toxicomanie, de dépendance et de désespoir.', 'Chemin de la grande image', '1h 42m', 0),
(53, 'Usual Suspects', '1995', 'Bryan Singer', 'usual_suspects.webp', 'https://www.youtube.com/embed/oiXdPolca5w', 'Un brillant escroc raconte une histoire complexe à la police, impliquant une mystérieuse figure criminelle connue sous le nom de Keyser Söze, dans ce thriller rempli de rebondissements.', 'Chemin de la grande image', '1h 46m', 0),
(54, 'American History X', '1998', 'Tony Kaye', 'american_history_x.webp', 'https://www.youtube.com/embed/GlOT1vpy9oM?start=5', 'Ce drame poignant explore les racines du racisme et de la haine à travers l\'histoire d\'un néonazi repenti qui tente de protéger son jeune frère de suivre le même chemin destructeur.', 'Chemin de la grande image', '1h 59m', 0),
(55, 'La La Land', '2016', 'Damien Chazelle', 'la_la_land.webp', 'https://www.youtube.com/embed/0tA70NaL7mY', 'Une romance moderne et envoûtante entre une aspirante actrice et un pianiste de jazz à Los Angeles, qui explore les thèmes de l\'ambition, de l\'amour et des compromis artistiques.', 'Chemin de la grande image', '2h 08m', 0),
(56, 'V pour Vendetta', '2005', 'James McTeigue', 'v_for_vendetta.webp', 'https://www.youtube.com/embed/hmbQgEHGpLg', 'Dans une dystopie futuriste, un mystérieux combattant de la liberté masqué nommé \"V\" orchestre une révolution contre un régime totalitaire en utilisant la terreur et le symbolisme.', 'Chemin de la grande image', '2h 10m', 0),
(57, 'La Liste de Schindler', '1993', 'Steven Spielberg', 'la_liste_de_schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE', 'Inspiré de faits réels, ce film émouvant suit l\'histoire vraie d\'Oskar Schindler, un homme d\'affaires allemand qui a sauvé des centaines de Juifs pendant l\'Holocauste en les employant dans son usine.', 'Chemin de la grande image', '3h 15m', 0),
(58, 'La Guerre des étoiles', '1977', 'George Lucas', 'star_wars.webp', 'https://www.youtube.com/embed/DIw76J_nVMs', 'Le début de l\'épopée spatiale légendaire qui a captivé des générations de fans, suivant les aventures de Luke Skywalker, Han Solo, la princesse Leia et le reste de l\'équipage du Faucon Millenium.', 'Chemin de la grande image', '2h 01m', 0),
(59, 'Le Fabuleux Destin d\'Amélie Poulain', '2001', 'Jean-Pierre Jeunet', 'le_fabuleux_destin_d_amelie_poulain.webp', 'https://www.youtube.com/embed/_cZyjM_R6-E', 'Dans ce conte moderne, une jeune femme rêveuse du quartier de Montmartre à Paris se lance dans une quête pour apporter du bonheur aux autres tout en cherchant le sien.', 'Chemin de la grande image', '2h 00m', 0),
(60, 'Inglourious Basterds', '2009', 'Quentin Tarantino', 'inglourious_basterds.webp', 'https://www.youtube.com/embed/BiPUoLI9eGM', 'Dans ce film alternatif sur la Seconde Guerre mondiale, un groupe de soldats juifs-américains s\'engage dans une mission de vengeance contre les nazis, tandis qu\'une jeune juive cherche à assassiner le haut commandement nazi.', 'Chemin de la grande image', '2h 33m', 0),
(61, 'Titanic', '1997', 'James Cameron', 'titanic.webp', 'https://www.youtube.com/embed/Quf4qIkD3KY', 'Une histoire d\'amour épique se déroulant à bord du célèbre paquebot Titanic, alors qu\'il fait face à sa tragique destinée dans les eaux glacées de l\'Atlantique Nord.', 'Chemin de la grande image', '3h 14m', 0),
(62, 'Le Parrain - 2e Partie', '1974', 'Francis Ford Coppola', 'le_parrain2.webp', 'https://www.youtube.com/embed/9O1Iy9od7-A', 'La suite du classique du crime qui plonge plus profondément dans l\'histoire de la famille Corleone, mêlant passé et présent pour explorer les origines du parrain Vito Corleone et la montée en puissance de son fils Michael.', 'Chemin de la grande image', '3h 20m', 0),
(63, 'La Vie est belle', '1997', 'Roberto Benigni', 'la_vie_est_belle.webp', 'https://www.youtube.com/embed/8CTjcVr9Iao', 'Un conte poignant sur un homme juif italien emmené dans un camp de concentration avec son jeune fils, qui utilise son incroyable imagination pour protéger son enfant de l\'horreur de la réalité.', 'Chemin de la grande image', '1h 57m', 0),
(64, 'Edward aux mains d\'argent', '1990', 'Tim Burton', 'edward_aux_mains_d_argent.webp', 'https://www.youtube.com/embed/r6IwTHOKLGc', 'L\'histoire touchante d\'un homme artificiellement créé avec des lames à la place de ses mains, qui est découvert par une famille suburbaine et introduit dans leur communauté, malgré sa nature différente.', 'Chemin de la grande image', '1h 45m', 0),
(65, 'Her', '2013', 'Spike Jonze', 'her.webp', 'https://www.youtube.com/embed/5ttWV3D44Zs', 'Dans un avenir proche, un écrivain solitaire tombe amoureux d\'un système d\'exploitation informatique doté d\'une IA avancée, remettant en question les frontières entre l\'homme et la technologie, ainsi que la nature de l\'amour lui-même.', 'Chemin de la grande image', '2h 06m', 0),
(66, 'Le Tombeau des lucioles', '1988', 'Isao Takahata', 'le_tombeau_des_lucioles.webp', 'https://www.youtube.com/embed/bQzQhSyByCs', 'Un jeune garçon et sa petite sœur tentent de survivre à la brutalité de la Seconde Guerre mondiale au Japon, se réfugiant dans un abri de fortune alors qu\'ils luttent contre la faim, la maladie et les ravages de la guerre.', 'Chemin de la grande image', '1h 30', 0),
(67, 'Bienvenue à Gattaca', '1997', 'Andrew Niccol', 'bienvenue_gattaca.webp', 'https://www.youtube.com/embed/PUakC5VfeRk', 'Dans une société où la génétique détermine le destin, un homme né naturellement défie les normes en se faisant passer pour un \"Valide\" afin de réaliser son rêve de voyage dans l\'espace malgré son statut d\'\"Invalide\".', 'Chemin de la grande image', '1h 46m', 0),
(68, 'Big Fish', '2003', 'Tim Burton', 'big_fish.webp', 'https://www.youtube.com/embed/0PAvegjZF38', 'Un père raconte à son fils des histoires extravagantes sur sa vie, mélangeant réalité et fiction, alors que le fils cherche à démêler la vérité derrière les récits fantaisistes de son père mourant.', 'Chemin de la grande image', '2h 05m', 0),
(69, 'Mr. Nobody', '2010', 'Jaco van Dormael', 'mr_nobody.webp', 'https://www.youtube.com/embed/qwiSsBuyyFk', 'Dans un monde où l\'immortalité est devenue possible, un homme âgé se souvient de ses multiples vies et des choix qui ont façonné son destin, offrant une méditation philosophique sur les possibilités infinies de l\'existence.', 'Chemin de la grande image', '2h 21m', 0),
(70, 'Memento', '2000', 'Christopher Nolan', 'memento.webp', 'https://www.youtube.com/embed/rX7nZxY8OFk', 'Un homme souffrant d\'amnésie à court terme tente de traquer le meurtrier de sa femme en utilisant des tatouages, des notes et des photos pour se souvenir de détails de sa vie alors qu\'il cherche vengeance et justice.', 'Chemin de la grande image', '1h 56m', 0),
(71, 'Le Prestige', '2006', 'Christopher Nolan', 'le_prestige.webp', 'https://www.youtube.com/embed/2zVbrV1ehnU', 'Deux magiciens rivaux du XIXe siècle se livrent à une compétition acharnée pour créer le tour de magie ultime, entraînant une série de retournements de situation, de trahisons et de mystères dans leur quête obsessionnelle de perfection.', 'Chemin de la grande image', '2h 08m', 0),
(72, 'Whiplash', '2014', 'Damien Chazelle', 'whiplash.webp', 'https://www.youtube.com/embed/yff8XTT3-5o', 'Un jeune batteur de jazz ambitieux entre en collision avec un instructeur de musique tyrannique et perfectionniste, déclenchant un duel d\'intensité et de passion où rien, pas même la santé mentale, ne peut entraver la quête de la grandeur musicale.', 'Chemin de la grande image', '1h 47m', 0),
(73, 'Stalker', '1979', 'Andrei Tarkovsky', 'stalker.webp', 'https://www.youtube.com/embed/qt6Q8kJMsLM', 'Dans un monde post-apocalyptique, un mystérieux guide connu sous le nom de \"Stalker\" emmène des voyageurs intrépides à travers une zone interdite appelée \"La Zone\", où les désirs les plus profonds peuvent être réalisés, mais au risque de perdre son âme.', 'Chemin de la grande image', '2h 43m', 0),
(74, 'Le château ambulant', '2004', 'Hayao Miyazaki', 'le_chateau_ambulant.webp', 'https://www.youtube.com/embed/Bqt1_J4GUIc', 'Une jeune femme maudite se retrouve transformée en vieille dame et cherche refuge dans un mystérieux château ambulant, où elle rencontre un magicien excentrique, déclenchant une aventure enchantée remplie de magie, de romance et de découvertes de soi.', 'Chemin de la grande image', '1h 59m', 0),
(75, 'The Grand Budapest Hotel', '2014', 'Wes Anderson', 'the_grand_budapest_hotel.webp', 'https://www.youtube.com/embed/Lo1nz-scO4Q', 'Dans l\'Europe des années 1930, un concierge excentrique et son jeune protégé se retrouvent impliqués dans une série de péripéties rocambolesques après qu\'un héritage précieux ait été volé, entraînant une comédie déjantée et pleine de rebondissements.', 'Chemin de la grande image', '1h 40m', 0),
(76, 'Gran Torino', '2008', 'Clint Eastwood', 'gran_torino.webp', 'https://www.youtube.com/embed/uCYSV3iSjYo', 'Un vétéran de la guerre de Corée solitaire et raciste se lie d\'amitié avec son jeune voisin, un adolescent d\'origine hmong, alors qu\'il tente de défendre sa communauté contre des gangs violents, offrant une réflexion sur le pardon et la rédemption.', 'Chemin de la grande image', '1h 56m', 0),
(77, 'Voyage au bout de l\'enfer', '1978', 'Michael Cimino', 'voyage_au_bout_de_l_enfer.webp', 'https://www.youtube.com/embed/YfuXFJbiYEg', 'L\'histoire d\'un groupe d\'ouvriers sidérurgistes de Pennsylvanie qui voient leur vie bouleversée après avoir été envoyés au Vietnam, offrant un portrait poignant des effets dévastateurs de la guerre sur l\'âme humaine.', 'Chemin de la grande image', '3h 03m', 0),
(78, 'Sueurs froides', '1958', 'Alfred Hitchcock', 'sueurs_froides.webp', 'https://www.youtube.com/embed/i2nZRVOE6XQ', 'Un détective tourmenté est engagé pour suivre la femme énigmatique de son ami, mais se retrouve entraîné dans un tourbillon d\'obsession et de mystère dans ce thriller psychologique emblématique du maître du suspense, Alfred Hitchcock.', 'Chemin de la grande image', '2h 09m', 0),
(79, 'Mad Max - Fury Road', '2015', 'George Miller', 'mad_max_fury_road.webp', 'https://www.youtube.com/embed/mtolAJbj44s', 'Dans un désert post-apocalyptique, Max, un ancien policier solitaire, et Furiosa, une impératrice rebelle, s\'unissent pour échapper à un tyran impitoyable et libérer un groupe de femmes esclaves, offrant une course effrénée pleine d\'action et de chaos.', 'Chemin de la grande image', '2h 00m', 0),
(80, 'Le Roi Lion', '1994', 'Roger Allers, Rob Minkoff', 'le_roi_lion.webp', 'https://www.youtube.com/embed/-KfIYw-D4Iw', 'Un jeune lionceau nommé Simba doit affronter son destin et réclamer sa place légitime en tant que roi des terres de la savane après la mort de son père, dans ce chef-d\'œuvre animé de Disney qui célèbre le cercle de la vie.', 'Chemin de la grande image', '1h 29m', 0),
(81, 'Léon', '1994', 'Luc Besson', 'leon.webp', 'https://www.youtube.com/embed/M242Bp0PcwE', 'Un tueur à gages solitaire et taciturne se lie d\'amitié avec une jeune fille négligée après que sa famille a été assassinée par un flic corrompu, déclenchant une relation improbable et touchante dans ce thriller d\'action emblématique.', 'Chemin de la grande image', '1h 43m', 0),
(82, 'Le Silence des agneaux', '1991', 'Jonathan Demme', 'le_silence_des_agneaux.webp', 'https://www.youtube.com/embed/ZDbh9f9GoNM', 'Un jeune agent du FBI fait équipe avec un psychopathe cannibale emprisonné pour traquer un tueur en série insaisissable, dans ce thriller glaçant qui a captivé les spectateurs avec son intrigue intense et ses performances mémorables.', 'Chemin de la grande image', '1h 58m', 0),
(83, 'Psychose', '1960', 'Alfred Hitchcock', 'psychose.webp', 'https://www.youtube.com/embed/BSuMxSyyKlU', 'Lorsqu\'une secrétaire en fuite se réfugie dans un mystérieux motel isolé, elle se retrouve prise au piège dans une toile de mensonges, de folie et de meurtre, dans ce classique du thriller psychologique qui a redéfini le genre.', 'Chemin de la grande image', '1h 49m', 0),
(84, 'Heat', '1995', 'Michael Mann', 'heat.webp', 'https://www.youtube.com/embed/Xl7X4Pf3PTY', 'Un brillant braqueur de banque et un détective tenace se lancent dans un jeu dangereux de chat et de souris à travers les rues de Los Angeles, dans ce thriller policier épique caractérisé par une tension palpitante et des confrontations inoubliables.', 'Chemin de la grande image', '2h 50m', 0),
(85, 'Terminator 2 - Le Jugement dernier', '1991', 'James Cameron', 'terminator2.webp', 'https://www.youtube.com/embed/vT2DPdCN_5c', 'Dans un avenir dystopique, un cyborg envoyé du futur doit protéger un jeune garçon destiné à sauver l\'humanité de la domination des machines, dans ce film d\'action révolutionnaire qui repousse les limites des effets spéciaux et de l\'émotion.', 'Chemin de la grande image', '2h 17m', 0),
(86, 'Full Metal Jacket', '1987', 'Stanley Kubrick', 'full_metal_jacket.webp', 'https://www.youtube.com/embed/Ldxda5cqQh4', 'À travers les rigueurs brutales du camp d\'entraînement et les horreurs du champ de bataille pendant la guerre du Vietnam, ce drame de guerre captivant explore la nature complexe de l\'humanité et de la brutalité de la guerre.', 'Chemin de la grande image', '1h 56m', 0);

-- --------------------------------------------------------

--
-- Structure de la table `movie_category`
--

CREATE TABLE `movie_category` (
  `movie_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `movie_category`
--

INSERT INTO `movie_category` (`movie_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 6),
(4, 4),
(5, 3),
(6, 5),
(7, 2),
(8, 1),
(8, 6),
(9, 1),
(9, 6),
(10, 1),
(10, 6),
(11, 2),
(11, 12),
(12, 6),
(12, 12),
(13, 6),
(13, 15),
(14, 2),
(14, 6),
(15, 2),
(16, 2),
(17, 6),
(17, 10),
(17, 15),
(18, 3),
(18, 6),
(18, 7),
(19, 5),
(19, 16),
(20, 8),
(21, 1),
(21, 11),
(21, 12),
(22, 5),
(22, 16),
(23, 6),
(23, 13),
(24, 9),
(25, 2),
(25, 3),
(25, 6),
(26, 5),
(26, 6),
(26, 12),
(27, 1),
(27, 6),
(27, 12),
(28, 9),
(29, 1),
(29, 2),
(30, 6),
(31, 2),
(31, 3),
(31, 16),
(32, 6),
(32, 15),
(33, 8),
(34, 4),
(34, 12),
(35, 1),
(35, 16),
(36, 6),
(36, 15),
(37, 6),
(37, 12),
(37, 15),
(38, 6),
(38, 16),
(39, 6),
(40, 1),
(40, 12),
(41, 2),
(41, 4),
(42, 3),
(42, 15),
(43, 6),
(43, 15),
(44, 8),
(45, 6),
(45, 16),
(46, 12),
(47, 6),
(48, 5),
(48, 16),
(49, 12),
(49, 15),
(50, 6),
(50, 12),
(50, 15),
(51, 2),
(51, 6),
(52, 6),
(53, 12),
(53, 15),
(54, 6),
(54, 15),
(55, 7),
(56, 1),
(56, 2),
(57, 6),
(57, 13),
(58, 2),
(58, 16),
(59, 3),
(59, 5),
(60, 1),
(60, 13),
(61, 6),
(61, 7),
(62, 6),
(62, 15),
(63, 3),
(63, 6),
(63, 7),
(64, 5),
(64, 6),
(64, 7),
(65, 2),
(65, 6),
(65, 7),
(66, 6),
(66, 9),
(66, 13),
(67, 2),
(68, 3),
(68, 6),
(69, 2),
(69, 5),
(69, 6),
(70, 12),
(70, 15),
(71, 6),
(71, 12),
(72, 6),
(73, 2),
(73, 6),
(74, 5),
(74, 9),
(74, 16),
(75, 3),
(75, 6),
(76, 6),
(77, 6),
(77, 13),
(78, 6),
(78, 12),
(79, 1),
(79, 2),
(80, 6),
(80, 9),
(80, 16),
(81, 1),
(81, 6),
(81, 12),
(81, 15),
(82, 6),
(82, 12),
(82, 15),
(83, 4),
(83, 12),
(84, 1),
(84, 6),
(84, 15),
(85, 1),
(85, 2),
(86, 6),
(86, 13);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pseudo` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`) VALUES
(1, 'jean@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$xfqQCIDI7kWxKotNnsQn.O3HCbMNvLm/DBPgkvmSg5TEkF2bmHX0G', 'Jean'),
(10, 'michel@gmail.com', '[]', '$2y$13$m.tf7DxIHL04eS316JDYLufarhadDAFOeNsYJL7jWQ1ZlkExTdHqu', 'Michel');

-- --------------------------------------------------------

--
-- Structure de la table `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `watchlist`
--

INSERT INTO `watchlist` (`id`, `user_id`) VALUES
(1, 1),
(6, 10);

-- --------------------------------------------------------

--
-- Structure de la table `watchlist_movie`
--

CREATE TABLE `watchlist_movie` (
  `watchlist_id` int NOT NULL,
  `movie_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `watchlist_movie`
--

INSERT INTO `watchlist_movie` (`watchlist_id`, `movie_id`) VALUES
(1, 2),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(6, 2),
(6, 5),
(6, 7),
(6, 12),
(6, 14);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movie_category`
--
ALTER TABLE `movie_category`
  ADD PRIMARY KEY (`movie_id`,`category_id`),
  ADD KEY `IDX_DABA824C8F93B6FC` (`movie_id`),
  ADD KEY `IDX_DABA824C12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- Index pour la table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_340388D3A76ED395` (`user_id`);

--
-- Index pour la table `watchlist_movie`
--
ALTER TABLE `watchlist_movie`
  ADD PRIMARY KEY (`watchlist_id`,`movie_id`),
  ADD KEY `IDX_B38D698383DD0D94` (`watchlist_id`),
  ADD KEY `IDX_B38D69838F93B6FC` (`movie_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movie_category`
--
ALTER TABLE `movie_category`
  ADD CONSTRAINT `FK_DABA824C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DABA824C8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `FK_340388D3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `watchlist_movie`
--
ALTER TABLE `watchlist_movie`
  ADD CONSTRAINT `FK_B38D698383DD0D94` FOREIGN KEY (`watchlist_id`) REFERENCES `watchlist` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B38D69838F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
