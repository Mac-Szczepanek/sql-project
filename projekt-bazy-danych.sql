SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Booking_wizyty
-- ----------------------------
DROP TABLE IF EXISTS `Booking_wizyty`;
CREATE TABLE `Booking_wizyty`  (
  `ID_lekarz` int(10) UNSIGNED NOT NULL,
  `ID_pacjent` int(10) UNSIGNED NOT NULL,
  `Data_wizyty` datetime NOT NULL,
  INDEX `ID_lekarz25`(`ID_lekarz`) USING BTREE,
  INDEX `ID_pacjent`(`ID_pacjent`) USING BTREE,
  CONSTRAINT `Booking_wizyty_ibfk_1` FOREIGN KEY (`ID_pacjent`) REFERENCES `Pacjenci` (`ID_pacjent`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ID_lekarz25` FOREIGN KEY (`ID_lekarz`) REFERENCES `Lekarze` (`ID_lekarz`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Dyskusja_lekarzy
-- ----------------------------
DROP TABLE IF EXISTS `Dyskusja_lekarzy`;
CREATE TABLE `Dyskusja_lekarzy`  (
  `ID_dyskusja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_lekarz` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pacjent` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_do_dyskusji` int(10) UNSIGNED NULL DEFAULT NULL,
  `tresc_dyskusja` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `data_dys` date NOT NULL,
  PRIMARY KEY (`ID_dyskusja`, `data_dys`) USING BTREE,
  FULLTEXT INDEX `tresc_dyskusja`(`tresc_dyskusja`)
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (year(`data_dys`))
PARTITIONS 24
(PARTITION `2000` VALUES LESS THAN (2001) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2001` VALUES LESS THAN (2002) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2002` VALUES LESS THAN (2003) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2003` VALUES LESS THAN (2004) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2004` VALUES LESS THAN (2005) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2005` VALUES LESS THAN (2006) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2006` VALUES LESS THAN (2007) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2007` VALUES LESS THAN (2008) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2008` VALUES LESS THAN (2009) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2009` VALUES LESS THAN (2010) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2010` VALUES LESS THAN (2011) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2011` VALUES LESS THAN (2012) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2012` VALUES LESS THAN (2013) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2013` VALUES LESS THAN (2014) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2014` VALUES LESS THAN (2015) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2015` VALUES LESS THAN (2016) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2016` VALUES LESS THAN (2017) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2017` VALUES LESS THAN (2018) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2018` VALUES LESS THAN (2019) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2019` VALUES LESS THAN (2020) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2020` VALUES LESS THAN (2021) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2021` VALUES LESS THAN (2022) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2022` VALUES LESS THAN (2023) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2023` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for Lekarze
-- ----------------------------
DROP TABLE IF EXISTS `Lekarze`;
CREATE TABLE `Lekarze`  (
  `ID_lekarz` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Login` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Plec` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Data_urodzenia` date NULL DEFAULT NULL,
  `Pesel_numer_paszportu_numer_dowodu` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Numer_telefonu` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_lekarz`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Lekarze_godziny
-- ----------------------------
DROP TABLE IF EXISTS `Lekarze_godziny`;
CREATE TABLE `Lekarze_godziny`  (
  `ID_lekarz` int(10) UNSIGNED NOT NULL,
  `Godziny_przyjęć` time NOT NULL,
  INDEX `ID_lekarz`(`ID_lekarz`) USING BTREE,
  CONSTRAINT `Lekarze_godziny_ibfk_1` FOREIGN KEY (`ID_lekarz`) REFERENCES `Lekarze` (`ID_lekarz`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Lekarze_specjalizacja
-- ----------------------------
DROP TABLE IF EXISTS `Lekarze_specjalizacja`;
CREATE TABLE `Lekarze_specjalizacja`  (
  `ID_lekarz` int(10) UNSIGNED NOT NULL,
  `ID_specjalizacja` int(10) UNSIGNED NOT NULL,
  INDEX `ID_lekarz`(`ID_lekarz`) USING BTREE,
  INDEX `ID_specjalizacja`(`ID_specjalizacja`) USING BTREE,
  CONSTRAINT `Lekarze_specjalizacja_ibfk_1` FOREIGN KEY (`ID_lekarz`) REFERENCES `Lekarze` (`ID_lekarz`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Lekarze_specjalizacja_ibfk_2` FOREIGN KEY (`ID_specjalizacja`) REFERENCES `Specjalizacje` (`ID_specjalizacja`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Leki
-- ----------------------------
DROP TABLE IF EXISTS `Leki`;
CREATE TABLE `Leki`  (
  `ID_lek` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_leku` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_lek`) USING BTREE,
  FULLTEXT INDEX `Nazwa_leku`(`Nazwa_leku`)
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Pacjenci
-- ----------------------------
DROP TABLE IF EXISTS `Pacjenci`;
CREATE TABLE `Pacjenci`  (
  `ID_pacjent` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Login` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT concat(lcase(left(`Imie`,1)),lcase(`Nazwisko`)),
  `Haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT lcase(`Nazwisko`),
  `Plec` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Data_urodzenia` date NULL DEFAULT NULL,
  `Pesel_numer_paszportu_numer_dowodu` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Miejsce_zamieszkania` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Numer_telefonu` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_pacjent`) USING BTREE,
  INDEX `Pesel_numer_paszportu_numer_dowodu`(`Pesel_numer_paszportu_numer_dowodu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Personel
-- ----------------------------
DROP TABLE IF EXISTS `Personel`;
CREATE TABLE `Personel`  (
  `ID_personel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Login` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Plec` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Data_urodzenia` date NULL DEFAULT NULL,
  `Pesel_numer_paszportu_numer_dowodu` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Numer_telefonu` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_personel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Personel_typ
-- ----------------------------
DROP TABLE IF EXISTS `Personel_typ`;
CREATE TABLE `Personel_typ`  (
  `ID_personel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_typ_personel` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_personel`) USING BTREE,
  INDEX `ID_typ_personel`(`ID_typ_personel`) USING BTREE,
  CONSTRAINT `ID_personel` FOREIGN KEY (`ID_personel`) REFERENCES `Personel` (`ID_personel`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ID_typ_personel` FOREIGN KEY (`ID_typ_personel`) REFERENCES `Typ_personel` (`ID_typ_personel`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Recepta_leki
-- ----------------------------
DROP TABLE IF EXISTS `Recepta_leki`;
CREATE TABLE `Recepta_leki`  (
  `ID_recepta` int(10) UNSIGNED NOT NULL,
  `ID_lek` int(10) UNSIGNED NOT NULL,
  INDEX `ID_recepta`(`ID_recepta`) USING BTREE,
  INDEX `ID_lek`(`ID_lek`) USING BTREE,
  CONSTRAINT `Recepta_leki_ibfk_1` FOREIGN KEY (`ID_lek`) REFERENCES `Leki` (`ID_lek`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Skierowanie_Typ_skierowania
-- ----------------------------
DROP TABLE IF EXISTS `Skierowanie_Typ_skierowania`;
CREATE TABLE `Skierowanie_Typ_skierowania`  (
  `ID_skierowanie` int(10) UNSIGNED NOT NULL,
  `ID_typ_skierowania` int(10) UNSIGNED NOT NULL,
  INDEX `ID_typ_skierowania`(`ID_typ_skierowania`) USING BTREE,
  INDEX `ID_skierowanie`(`ID_skierowanie`) USING BTREE,
  CONSTRAINT `Skierowanie_Typ_skierowania_ibfk_1` FOREIGN KEY (`ID_typ_skierowania`) REFERENCES `Typ_skierowania` (`ID_typ_skierowania`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Specjalizacje
-- ----------------------------
DROP TABLE IF EXISTS `Specjalizacje`;
CREATE TABLE `Specjalizacje`  (
  `ID_specjalizacja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Specjalizacja` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_specjalizacja`) USING BTREE,
  UNIQUE INDEX `Specjalizacja`(`Specjalizacja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 581234578 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Typ_personel
-- ----------------------------
DROP TABLE IF EXISTS `Typ_personel`;
CREATE TABLE `Typ_personel`  (
  `ID_typ_personel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Profesja` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_personel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Typ_skierowania
-- ----------------------------
DROP TABLE IF EXISTS `Typ_skierowania`;
CREATE TABLE `Typ_skierowania`  (
  `ID_typ_skierowania` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_skierowania` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_skierowania`) USING BTREE,
  FULLTEXT INDEX `Nazwa_skierowania`(`Nazwa_skierowania`)
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Typ_wizyty
-- ----------------------------
DROP TABLE IF EXISTS `Typ_wizyty`;
CREATE TABLE `Typ_wizyty`  (
  `ID_typ_wizyty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_typ_wizyty` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_wizyty`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Wizyta
-- ----------------------------
DROP TABLE IF EXISTS `Wizyta`;
CREATE TABLE `Wizyta`  (
  `ID_wizyta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_typ_wizyty` int(10) UNSIGNED NOT NULL,
  `ID_lekarz` int(10) UNSIGNED NOT NULL,
  `ID_personel` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pacjent` int(10) UNSIGNED NOT NULL,
  `data_wizyty` date NOT NULL,
  `ID_wizyta_recepty` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_wizyta_skierowania` int(10) UNSIGNED NULL DEFAULT NULL,
  `Opis_wizyty` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_wizyta`, `data_wizyty`) USING BTREE,
  FULLTEXT INDEX `Opis_wizyty`(`Opis_wizyty`)
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (year(`data_wizyty`))
PARTITIONS 5
(PARTITION `2000-2005` VALUES LESS THAN (2006) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2006-2010` VALUES LESS THAN (2011) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2011-2015` VALUES LESS THAN (2016) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2016-2020` VALUES LESS THAN (2021) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2021-obecnie` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Table structure for Wizyta_recepty
-- ----------------------------
DROP TABLE IF EXISTS `Wizyta_recepty`;
CREATE TABLE `Wizyta_recepty`  (
  `ID_wizyta_recepty` int(10) UNSIGNED NOT NULL,
  `ID_recepta` int(10) UNSIGNED NOT NULL,
  INDEX `ID_recepta`(`ID_recepta`) USING BTREE,
  CONSTRAINT `Wizyta_recepty_ibfk_1` FOREIGN KEY (`ID_recepta`) REFERENCES `Recepta_leki` (`ID_recepta`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for Wizyta_skierowania
-- ----------------------------
DROP TABLE IF EXISTS `Wizyta_skierowania`;
CREATE TABLE `Wizyta_skierowania`  (
  `ID_wizyta_skierowania` int(10) UNSIGNED NOT NULL,
  `ID_skierowanie` int(10) UNSIGNED NOT NULL,
  INDEX `ID_skierowanie`(`ID_skierowanie`) USING BTREE,
  CONSTRAINT `Wizyta_skierowania_ibfk_1` FOREIGN KEY (`ID_skierowanie`) REFERENCES `Skierowanie_Typ_skierowania` (`ID_skierowanie`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for Historia_lekow_pacjenta
-- ----------------------------
DROP VIEW IF EXISTS `Historia_lekow_pacjenta`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `Historia_lekow_pacjenta` AS select `Wizyta`.`ID_pacjent` AS `ID_pacjent`,`Wizyta`.`ID_lekarz` AS `ID_lekarz`,`Recepta_leki`.`ID_recepta` AS `ID_recepta`,`Leki`.`Nazwa_leku` AS `Nazwa_leku` from ((`Wizyta` join `Recepta_leki` on(`Wizyta`.`ID_wizyta_recepty` = `Recepta_leki`.`ID_recepta`)) join `Leki` on(`Recepta_leki`.`ID_lek` = `Leki`.`ID_lek`));

-- ----------------------------
-- View structure for Historia_skierowan_pacjenta
-- ----------------------------
DROP VIEW IF EXISTS `Historia_skierowan_pacjenta`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `Historia_skierowan_pacjenta` AS select `Wizyta`.`ID_pacjent` AS `ID_pacjent`,`Wizyta`.`ID_lekarz` AS `ID_lekarz`,`Skierowanie_Typ_skierowania`.`ID_skierowanie` AS `ID_skierowanie`,`Typ_skierowania`.`Nazwa_skierowania` AS `Nazwa_skierowania` from (((`Wizyta` join `Wizyta_skierowania` on(`Wizyta`.`ID_wizyta_skierowania` = `Wizyta_skierowania`.`ID_wizyta_skierowania`)) join `Skierowanie_Typ_skierowania` on(`Wizyta_skierowania`.`ID_skierowanie` = `Skierowanie_Typ_skierowania`.`ID_skierowanie`)) join `Typ_skierowania` on(`Skierowanie_Typ_skierowania`.`ID_typ_skierowania` = `Typ_skierowania`.`ID_typ_skierowania`));

-- ----------------------------
-- View structure for Personel_profesja
-- ----------------------------
DROP VIEW IF EXISTS `Personel_profesja`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `Personel_profesja` AS select `Typ_personel`.`Profesja` AS `Profesja`,`Personel`.`Imie` AS `Imie`,`Personel`.`Nazwisko` AS `Nazwisko`,`Personel`.`Numer_telefonu` AS `Numer_telefonu` from ((`Personel` join `Personel_typ` on(`Personel`.`ID_personel` = `Personel_typ`.`ID_personel`)) join `Typ_personel` on(`Personel_typ`.`ID_typ_personel` = `Typ_personel`.`ID_typ_personel`)) where `Typ_personel`.`Profesja` = `Typ_personel`.`Profesja`;

-- ----------------------------
-- View structure for Spec_lekarza_widok
-- ----------------------------
DROP VIEW IF EXISTS `Spec_lekarza_widok`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `Spec_lekarza_widok` AS select `Specjalizacje`.`Specjalizacja` AS `specjalizacja`,`Lekarze`.`Imie` AS `Imie`,`Lekarze`.`Nazwisko` AS `Nazwisko`,`Lekarze`.`Numer_telefonu` AS `Numer_telefonu` from ((`Lekarze` join `Lekarze_specjalizacja` on(`Lekarze`.`ID_lekarz` = `Lekarze_specjalizacja`.`ID_lekarz`)) join `Specjalizacje` on(`Lekarze_specjalizacja`.`ID_specjalizacja` = `Specjalizacje`.`ID_specjalizacja`)) where `Specjalizacje`.`Specjalizacja` = `Specjalizacje`.`Specjalizacja`;

-- ----------------------------
-- Procedure structure for bookuj_wizyty
-- ----------------------------
DROP PROCEDURE IF EXISTS `bookuj_wizyty`;
delimiter ;;
CREATE PROCEDURE `bookuj_wizyty`(IN`vID_lekarz`int, 
IN`vID_pacjent`int, IN vData_wizyty datetime)
BEGIN
 set session transaction isolation level read committed;
 start transaction;
 set @godzina_wizyty = null;
 select Godziny_przyjęć into @godzina_wizyty from Lekarze_godziny where ID_lekarz = vID_lekarz 
and cast(Godziny_przyjęć as time) = cast(vData_wizyty as time);
 if @godzina_wizyty is null then
 rollback;
 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='Podany lekarz nie ma 
przyjęć o tej godzinie lub nie istnieje.';
 else
 set @count = 0;
 select count(*) into @count from Booking_wizyty where ID_lekarz = vID_lekarz and 
cast(Data_wizyty as time) = @godzina_wizyty and date(Data_wizyty) = date(vData_wizyty);
 if (date(vData_wizyty) >= curdate() AND date(vData_wizyty) <= curdate() + INTERVAL 7 DAY AND 
@count = 0) then
 insert into Booking_wizyty (ID_lekarz, ID_pacjent, Data_wizyty) values (vID_lekarz, 
vID_pacjent, CONCAT(date(vData_wizyty),' ',@godzina_wizyty));
 commit;
 else
 rollback;
 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=30001, MESSAGE_TEXT='Rejestracja wizyt jest 
możliwa tylko w ciągu najbliższych 7 dni, lub ta godzina jest już zarezerwowana przez innego 
pacjenta.';
 end if;
 end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dyskusja_cte
-- ----------------------------
DROP PROCEDURE IF EXISTS `dyskusja_cte`;
delimiter ;;
CREATE PROCEDURE `dyskusja_cte`(vID_dyskusja int)
BEGIN
WITH recursive konwersacja AS
(SELECT Dyskusja_lekarzy.tresc_dyskusja Tresc,Dyskusja_lekarzy.*
FROM Dyskusja_lekarzy WHERE ID_dyskusja=vID_dyskusja
UNION ALL 
SELECT concat(d.tresc_dyskusja,'=>',k.tresc_dyskusja),d.*
FROM
Dyskusja_lekarzy d 
JOIN
konwersacja k 
ON d.ID_do_dyskusji=k.ID_dyskusja)
cycle ID_dyskusja restrict
SELECT Tresc,ID_dyskusja,ID_lekarz,ID_pacjent,ID_do_dyskusji,tresc_dyskusja FROM konwersacja;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for fill_lekarze
-- ----------------------------
DROP PROCEDURE IF EXISTS `fill_lekarze`;
delimiter ;;
CREATE PROCEDURE `fill_lekarze`(IN `N` int)
BEGIN
START TRANSACTION;      
FOR i in 1 .. N DO 
SET @imie = ELT(FLOOR(RAND()*(100-1+1)+1),'Leon','Joanna', 'Natasza', 'Ewelina', 'Józef', 'Patryk', 'Wyszesława', 'Maja', 'Bogdan', 'Barbara', 'Szymon', 'Kinga', 'Julia', 'Emilia', 'Mateusz', 'Amelia', 'Michał', 'Ela', 'Lilianna', 'Mira', 'Marcin', 'Anastazja', 'Natalia', 'Stanisław', 'Małgorzata', 'Wojciech', 'Oliwia', 'Monika', 'Agnieszka', 'Klara', 'Karolina', 'Grzegorz', 'Alicja', 'Marek', 'Izabela', 'Aneta', 'Oskar', 'Henryk', 'Melania', 'Kryspin', 'Dawid', 'Łukasz', 'Kamila', 'Maria', 'Weronika', 'Maciej', 'Beata', 'Danuta', 'Jakub', 'Dominika', 'Jagoda', 'Mariusz', 'Lena', 'Krzysztof', 'Klaudia', 'Jacek', 'Mikołaj', 'Robert', 'Marta', 'Grażyna', 'Iga', 'Róża', 'Tadeusz', 'Adam', 'Andrzej', 'Bartosz', 'Bogumił', 'Tomasz', 'Artur', 'Bolesława', 'Kamil', 'Magdalena', 'Ania', 'Zenon', 'Bartłomiej', 'Leszek', 'Renata', 'Bogumiła', 'Konrad', 'Paulina', 'Zuzanna', 'Julian', 'Ryszard', 'Rafał', 'Kajetan', 'Cezary', 'Janusz', 'Martyna', 'Aleksandra', 'Paweł', 'Błażej', 'Kacper', 'Krystyna', 'Piotr', 'Dariusz', 'Adrianna', 'Adrian', 'Eliza', 'Katarzyna', 'Ewa');
SET @nazwisko = ELT(FLOOR(RAND()*(200-1+1)+1),'Kaczmarek', 'Szczepanek', 'Bąk', 'Kucharski', 'Dobrzycki', 'Fijałkowski', 'Jakubiec', 'Chmura', 'Kiwior', 'Wieczorek', 'Michalski', 'Wojciechowski', 'Kowalewski', 'Pawlak', 'Karczewski', 'Król', 'Nowak', 'Baranowski', 'Grzesiak', 'Klepacki', 'Kucharczyk', 'Szczygieł', 'Jasiński', 'Borkowski', 'Cegieła', 'Walczak', 'Kłosowski', 'Chmielewski', 'Mierzejewski', 'Czarnocki', 'Czubak', 'Krupa', 'Fijołek', 'Głowacki', 'Jużyniec', 'Długosz', 'Hynek', 'Jabłoński', 'Borek', 'Szymański', 'Kołodziej', 'Maj', 'Brzeziński', 'Bednarczyk', 'Dąbrowski', 'Jarosz', 'Cegielski', 'Wrona', 'Szymczak', 'Rutkowski', 'Szcześniak', 'Jarmuła', 'Kaczmarczyk', 'Olszewski', 'Orłowski', 'Kisiel', 'Czajkowski', 'Piotrowski', 'Kowalski', 'Jackowski', 'Baran', 'Frąckowiak', 'Sadowski', 'Adamczyk', 'Bruzda', 'Mazur', 'Jakimowicz', 'Górka', 'Dziuba', 'Nowicki', 'Wróblewski', 'Szulc', 'Kuca', 'Kowalik', 'Gawlik', 'Cegła', 'Pawlikowski', 'Majchrzak', 'Kapcia', 'Kotowski', 'Głogowski', 'Zalewski', 'Zając', 'Hudziec', 'Kaczorowski', 'Rudnicki', 'Grudzień', 'Błaszczyk', 'Czyżewski', 'Pietrzak', 'Błachut', 'Jaworski', 'Cech', 'Jakubowski', 'Mróz', 'Buczek', 'Włodarczyk', 'Kopczyński', 'Ficek', 'Mazurek', 'Nowakowski', 'Sikora', 'Chomiak', 'Michalak', 'Wójcik', 'Forysiuk', 'Zieliński', 'Zakrzewski', 'Chudzicki', 'Cetnarowski', 'Burzyński', 'Witkowski', 'Krzyżanowski', 'Ciesielski', 'Forycki', 'Czarnecki', 'Dudek', 'Malinowski', 'Drabik', 'Rojek', 'Czachor', 'Blicharski', 'Górecki', 'Stępień', 'Foltyn', 'Kowal', 'Chlebosz', 'Barański', 'Leszczyński', 'Górski', 'Gąska', 'Dudkiewicz', 'Kabat', 'Chudzik', 'Dziedzic', 'Chyła', 'Czyszczoń', 'Markowski', 'Kwiatkowski', 'Lewandowski', 'Kloc', 'Chabowski', 'Józefiak', 'Bednarek', 'Lipiec', 'Zajęcka', 'Niewiarowski', 'Makowski', 'Jankowski', 'Marciniak', 'Gryko', 'Chmielak', 'Lis', 'Grabowski', 'Kolanowski', 'Majewski', 'Ziółkowski', 'Frączek', 'Kamiński', 'Byrski', 'Ostrowski', 'Olszówka', 'Pawłowski', 'Czajka', 'Mrugała', 'Bryła', 'Tomaszewski', 'Kowalczyk', 'Jakubiak', 'Borowiec', 'Dobrzański', 'Kozak', 'Dobrowolski', 'Szewczyk', 'Wawrzyniak', 'Wójcicki', 'Owczarek', 'Cebula', 'Gajewski', 'Kulesza', 'Krawczyk', 'Dobrzyński', 'Czaja', 'Chlebowski', 'Duda', 'Cieślak', 'Gibała', 'Filipek', 'Drozdowski', 'Paszkowski', 'Hajduk', 'Krajewski', 'Klimek', 'Góra', 'Wróbel', 'Szafrański', 'Lipiński', 'Woźniak', 'Kozłowski', 'Wiśniewski');
SET @data_uro = DATE_ADD('1943-01-01', INTERVAL FLOOR(RAND()*364*54) DAY);
SET @plec = IF(RIGHT(@imie,1)='a','K','M');
SET @pesel = utworz_pesel(@data_uro, @plec);
SET @nr_tel = FLOOR(100000000 + RAND() * 900000000);
INSERT INTO Lekarze(Imie, Nazwisko, Plec, Data_urodzenia, Pesel_numer_paszportu_numer_dowodu, Numer_telefonu) VALUES 
(@imie, @nazwisko, @plec, @data_uro, @pesel, @nr_tel); 
END FOR;
COMMIT; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for fill_pacjenci
-- ----------------------------
DROP PROCEDURE IF EXISTS `fill_pacjenci`;
delimiter ;;
CREATE PROCEDURE `fill_pacjenci`(IN `N` int)
BEGIN
START TRANSACTION;      
FOR i in 1 .. N DO 
SET @imie = ELT(FLOOR(RAND()*(100-1+1)+1),'Leon','Joanna', 'Natasza', 'Ewelina', 'Józef', 'Patryk', 'Wyszesława', 'Maja', 'Bogdan', 'Barbara', 'Szymon', 'Kinga', 'Julia', 'Emilia', 'Mateusz', 'Amelia', 'Michał', 'Ela', 'Lilianna', 'Mira', 'Marcin', 'Anastazja', 'Natalia', 'Stanisław', 'Małgorzata', 'Wojciech', 'Oliwia', 'Monika', 'Agnieszka', 'Klara', 'Karolina', 'Grzegorz', 'Alicja', 'Marek', 'Izabela', 'Aneta', 'Oskar', 'Henryk', 'Melania', 'Kryspin', 'Dawid', 'Łukasz', 'Kamila', 'Maria', 'Weronika', 'Maciej', 'Beata', 'Danuta', 'Jakub', 'Dominika', 'Jagoda', 'Mariusz', 'Lena', 'Krzysztof', 'Klaudia', 'Jacek', 'Mikołaj', 'Robert', 'Marta', 'Grażyna', 'Iga', 'Róża', 'Tadeusz', 'Adam', 'Andrzej', 'Bartosz', 'Bogumił', 'Tomasz', 'Artur', 'Bolesława', 'Kamil', 'Magdalena', 'Ania', 'Zenon', 'Bartłomiej', 'Leszek', 'Renata', 'Bogumiła', 'Konrad', 'Paulina', 'Zuzanna', 'Julian', 'Ryszard', 'Rafał', 'Kajetan', 'Cezary', 'Janusz', 'Martyna', 'Aleksandra', 'Paweł', 'Błażej', 'Kacper', 'Krystyna', 'Piotr', 'Dariusz', 'Adrianna', 'Adrian', 'Eliza', 'Katarzyna', 'Ewa');
SET @nazwisko = ELT(FLOOR(RAND()*(200-1+1)+1),'Kaczmarek', 'Szczepanek', 'Bąk', 'Kucharski', 'Dobrzycki', 'Fijałkowski', 'Jakubiec', 'Chmura', 'Kiwior', 'Wieczorek', 'Michalski', 'Wojciechowski', 'Kowalewski', 'Pawlak', 'Karczewski', 'Król', 'Nowak', 'Baranowski', 'Grzesiak', 'Klepacki', 'Kucharczyk', 'Szczygieł', 'Jasiński', 'Borkowski', 'Cegieła', 'Walczak', 'Kłosowski', 'Chmielewski', 'Mierzejewski', 'Czarnocki', 'Czubak', 'Krupa', 'Fijołek', 'Głowacki', 'Jużyniec', 'Długosz', 'Hynek', 'Jabłoński', 'Borek', 'Szymański', 'Kołodziej', 'Maj', 'Brzeziński', 'Bednarczyk', 'Dąbrowski', 'Jarosz', 'Cegielski', 'Wrona', 'Szymczak', 'Rutkowski', 'Szcześniak', 'Jarmuła', 'Kaczmarczyk', 'Olszewski', 'Orłowski', 'Kisiel', 'Czajkowski', 'Piotrowski', 'Kowalski', 'Jackowski', 'Baran', 'Frąckowiak', 'Sadowski', 'Adamczyk', 'Bruzda', 'Mazur', 'Jakimowicz', 'Górka', 'Dziuba', 'Nowicki', 'Wróblewski', 'Szulc', 'Kuca', 'Kowalik', 'Gawlik', 'Cegła', 'Pawlikowski', 'Majchrzak', 'Kapcia', 'Kotowski', 'Głogowski', 'Zalewski', 'Zając', 'Hudziec', 'Kaczorowski', 'Rudnicki', 'Grudzień', 'Błaszczyk', 'Czyżewski', 'Pietrzak', 'Błachut', 'Jaworski', 'Cech', 'Jakubowski', 'Mróz', 'Buczek', 'Włodarczyk', 'Kopczyński', 'Ficek', 'Mazurek', 'Nowakowski', 'Sikora', 'Chomiak', 'Michalak', 'Wójcik', 'Forysiuk', 'Zieliński', 'Zakrzewski', 'Chudzicki', 'Cetnarowski', 'Burzyński', 'Witkowski', 'Krzyżanowski', 'Ciesielski', 'Forycki', 'Czarnecki', 'Dudek', 'Malinowski', 'Drabik', 'Rojek', 'Czachor', 'Blicharski', 'Górecki', 'Stępień', 'Foltyn', 'Kowal', 'Chlebosz', 'Barański', 'Leszczyński', 'Górski', 'Gąska', 'Dudkiewicz', 'Kabat', 'Chudzik', 'Dziedzic', 'Chyła', 'Czyszczoń', 'Markowski', 'Kwiatkowski', 'Lewandowski', 'Kloc', 'Chabowski', 'Józefiak', 'Bednarek', 'Lipiec', 'Zajęcka', 'Niewiarowski', 'Makowski', 'Jankowski', 'Marciniak', 'Gryko', 'Chmielak', 'Lis', 'Grabowski', 'Kolanowski', 'Majewski', 'Ziółkowski', 'Frączek', 'Kamiński', 'Byrski', 'Ostrowski', 'Olszówka', 'Pawłowski', 'Czajka', 'Mrugała', 'Bryła', 'Tomaszewski', 'Kowalczyk', 'Jakubiak', 'Borowiec', 'Dobrzański', 'Kozak', 'Dobrowolski', 'Szewczyk', 'Wawrzyniak', 'Wójcicki', 'Owczarek', 'Cebula', 'Gajewski', 'Kulesza', 'Krawczyk', 'Dobrzyński', 'Czaja', 'Chlebowski', 'Duda', 'Cieślak', 'Gibała', 'Filipek', 'Drozdowski', 'Paszkowski', 'Hajduk', 'Krajewski', 'Klimek', 'Góra', 'Wróbel', 'Szafrański', 'Lipiński', 'Woźniak', 'Kozłowski', 'Wiśniewski');
SET @miejsce_zam = ELT(FLOOR(RAND()*(38-1+1)+1), 'Kraków-Nowa Huta', 'Gorlice', 'Łukowica', 'Dąbrowa Tarnowska', 'Słomniki', 'Olkusz', 'Brzesko', 'Zawoja', 'Szczawnica', 'Zator', 'Łapsze Niżne', 'Skawina', 'Bochnia', 'Łącko', 'Żywiec', 'Proszowice', 'Czchów', 'Zakopane', 'Sucha Beskidzka', 'Wadowice', 'Piwniczna-Zdrój', 'Kraków', 'Limanowa', 'Wieliczka', 'Nowy Targ', 'Oświęcim', 'Tarnów', 'Łososina Dolna', 'Chrzanów', 'Nowy Sącz', 'Miechów', 'Nowy Wiśnicz', 'Jordanów', 'Kęty', 'Mszana Dolna', 'Świątniki Górne', 'Olsztyn', 'Tarnów-Kurów');
SET @data_uro = DATE_ADD('1943-01-01', INTERVAL FLOOR(RAND()*364*54) DAY);
SET @plec = IF(RIGHT(@imie,1)='a','K','M');
SET @pesel = utworz_pesel(@data_uro, @plec);
SET @nr_tel = FLOOR(100000000 + RAND() * 900000000);
INSERT INTO Pacjenci(Imie, Nazwisko, Plec, Data_urodzenia, Pesel_numer_paszportu_numer_dowodu,Miejsce_zamieszkania,Numer_telefonu) VALUES 
(@imie, @nazwisko, @plec, @data_uro, @pesel,@miejsce_zam, @nr_tel); 
END FOR;
COMMIT; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for fill_personel
-- ----------------------------
DROP PROCEDURE IF EXISTS `fill_personel`;
delimiter ;;
CREATE PROCEDURE `fill_personel`(IN `N` int)
BEGIN
START TRANSACTION;      
FOR i in 1 .. N DO 
SET @imie = ELT(FLOOR(RAND()*(100-1+1)+1),'Leon','Joanna', 'Natasza', 'Ewelina', 'Józef', 'Patryk', 'Wyszesława', 'Maja', 'Bogdan', 'Barbara', 'Szymon', 'Kinga', 'Julia', 'Emilia', 'Mateusz', 'Amelia', 'Michał', 'Ela', 'Lilianna', 'Mira', 'Marcin', 'Anastazja', 'Natalia', 'Stanisław', 'Małgorzata', 'Wojciech', 'Oliwia', 'Monika', 'Agnieszka', 'Klara', 'Karolina', 'Grzegorz', 'Alicja', 'Marek', 'Izabela', 'Aneta', 'Oskar', 'Henryk', 'Melania', 'Kryspin', 'Dawid', 'Łukasz', 'Kamila', 'Maria', 'Weronika', 'Maciej', 'Beata', 'Danuta', 'Jakub', 'Dominika', 'Jagoda', 'Mariusz', 'Lena', 'Krzysztof', 'Klaudia', 'Jacek', 'Mikołaj', 'Robert', 'Marta', 'Grażyna', 'Iga', 'Róża', 'Tadeusz', 'Adam', 'Andrzej', 'Bartosz', 'Bogumił', 'Tomasz', 'Artur', 'Bolesława', 'Kamil', 'Magdalena', 'Ania', 'Zenon', 'Bartłomiej', 'Leszek', 'Renata', 'Bogumiła', 'Konrad', 'Paulina', 'Zuzanna', 'Julian', 'Ryszard', 'Rafał', 'Kajetan', 'Cezary', 'Janusz', 'Martyna', 'Aleksandra', 'Paweł', 'Błażej', 'Kacper', 'Krystyna', 'Piotr', 'Dariusz', 'Adrianna', 'Adrian', 'Eliza', 'Katarzyna', 'Ewa');
SET @nazwisko = ELT(FLOOR(RAND()*(200-1+1)+1),'Kaczmarek', 'Szczepanek', 'Bąk', 'Kucharski', 'Dobrzycki', 'Fijałkowski', 'Jakubiec', 'Chmura', 'Kiwior', 'Wieczorek', 'Michalski', 'Wojciechowski', 'Kowalewski', 'Pawlak', 'Karczewski', 'Król', 'Nowak', 'Baranowski', 'Grzesiak', 'Klepacki', 'Kucharczyk', 'Szczygieł', 'Jasiński', 'Borkowski', 'Cegieła', 'Walczak', 'Kłosowski', 'Chmielewski', 'Mierzejewski', 'Czarnocki', 'Czubak', 'Krupa', 'Fijołek', 'Głowacki', 'Jużyniec', 'Długosz', 'Hynek', 'Jabłoński', 'Borek', 'Szymański', 'Kołodziej', 'Maj', 'Brzeziński', 'Bednarczyk', 'Dąbrowski', 'Jarosz', 'Cegielski', 'Wrona', 'Szymczak', 'Rutkowski', 'Szcześniak', 'Jarmuła', 'Kaczmarczyk', 'Olszewski', 'Orłowski', 'Kisiel', 'Czajkowski', 'Piotrowski', 'Kowalski', 'Jackowski', 'Baran', 'Frąckowiak', 'Sadowski', 'Adamczyk', 'Bruzda', 'Mazur', 'Jakimowicz', 'Górka', 'Dziuba', 'Nowicki', 'Wróblewski', 'Szulc', 'Kuca', 'Kowalik', 'Gawlik', 'Cegła', 'Pawlikowski', 'Majchrzak', 'Kapcia', 'Kotowski', 'Głogowski', 'Zalewski', 'Zając', 'Hudziec', 'Kaczorowski', 'Rudnicki', 'Grudzień', 'Błaszczyk', 'Czyżewski', 'Pietrzak', 'Błachut', 'Jaworski', 'Cech', 'Jakubowski', 'Mróz', 'Buczek', 'Włodarczyk', 'Kopczyński', 'Ficek', 'Mazurek', 'Nowakowski', 'Sikora', 'Chomiak', 'Michalak', 'Wójcik', 'Forysiuk', 'Zieliński', 'Zakrzewski', 'Chudzicki', 'Cetnarowski', 'Burzyński', 'Witkowski', 'Krzyżanowski', 'Ciesielski', 'Forycki', 'Czarnecki', 'Dudek', 'Malinowski', 'Drabik', 'Rojek', 'Czachor', 'Blicharski', 'Górecki', 'Stępień', 'Foltyn', 'Kowal', 'Chlebosz', 'Barański', 'Leszczyński', 'Górski', 'Gąska', 'Dudkiewicz', 'Kabat', 'Chudzik', 'Dziedzic', 'Chyła', 'Czyszczoń', 'Markowski', 'Kwiatkowski', 'Lewandowski', 'Kloc', 'Chabowski', 'Józefiak', 'Bednarek', 'Lipiec', 'Zajęcka', 'Niewiarowski', 'Makowski', 'Jankowski', 'Marciniak', 'Gryko', 'Chmielak', 'Lis', 'Grabowski', 'Kolanowski', 'Majewski', 'Ziółkowski', 'Frączek', 'Kamiński', 'Byrski', 'Ostrowski', 'Olszówka', 'Pawłowski', 'Czajka', 'Mrugała', 'Bryła', 'Tomaszewski', 'Kowalczyk', 'Jakubiak', 'Borowiec', 'Dobrzański', 'Kozak', 'Dobrowolski', 'Szewczyk', 'Wawrzyniak', 'Wójcicki', 'Owczarek', 'Cebula', 'Gajewski', 'Kulesza', 'Krawczyk', 'Dobrzyński', 'Czaja', 'Chlebowski', 'Duda', 'Cieślak', 'Gibała', 'Filipek', 'Drozdowski', 'Paszkowski', 'Hajduk', 'Krajewski', 'Klimek', 'Góra', 'Wróbel', 'Szafrański', 'Lipiński', 'Woźniak', 'Kozłowski', 'Wiśniewski');
SET @data_uro = DATE_ADD('1958-01-01', INTERVAL FLOOR(RAND()*364*45) DAY);
SET @plec = IF(RIGHT(@imie,1)='a','K','M');
SET @pesel = utworz_pesel(@data_uro, @plec);
SET @nr_tel = FLOOR(100000000 + RAND() * 900000000);
INSERT INTO Personel(Imie, Nazwisko, Plec, Data_urodzenia, Pesel_numer_paszportu_numer_dowodu, Numer_telefonu) VALUES 
(@imie, @nazwisko, @plec, @data_uro, @pesel, @nr_tel); 
END FOR;
COMMIT; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for kalendarz_lekarzy
-- ----------------------------
DROP PROCEDURE IF EXISTS `kalendarz_lekarzy`;
delimiter ;;
CREATE PROCEDURE `kalendarz_lekarzy`(IN id INT)
BEGIN
	SELECT ID_pacjent, Data_wizyty FROM Booking_wizyty WHERE ID_pacjent = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for rezerwuj_wizyte
-- ----------------------------
DROP PROCEDURE IF EXISTS `rezerwuj_wizyte`;
delimiter ;;
CREATE PROCEDURE `rezerwuj_wizyte`(IN vID_lekarz INT(10), IN vID_pacjent INT(10), IN vData_wizyty DATETIME)
BEGIN
DECLARE godziny_pracy TIME;

SELECT Godziny_przyjęć INTO godziny_pracy FROM Lekarze_godziny WHERE ID_lekarz = vID_lekarz;

IF (TIME(vData_wizyty) NOT BETWEEN TIME(godziny_pracy) AND TIME(ADDTIME(godziny_pracy, "01:00:00"))) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany lekarz nie przyjmuje w tym czasie';
ELSE
IF (EXISTS (SELECT ID_wizyta FROM Booking_wizyty WHERE ID_lekarz = vID_lekarz AND Data_wizyty = vData_wizyty)) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wybrany lekarz ma już wizytę w tym czasie';
ELSE
INSERT INTO Booking_wizyty (ID_lekarz, ID_pacjent, Data_wizyty) VALUES (vID_lekarz, vID_pacjent, vData_wizyty);
END IF;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stworz_tabele_pacjenci
-- ----------------------------
DROP PROCEDURE IF EXISTS `stworz_tabele_pacjenci`;
delimiter ;;
CREATE PROCEDURE `stworz_tabele_pacjenci`()
BEGIN
   CREATE OR REPLACE TABLE `Pacjenci` (
  `ID_pacjent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(255) NOT NULL,
  `Login` varchar(256) DEFAULT (concat(lcase(left(`Imie`,1)),lcase(`Nazwisko`))) NOT NULL,
  `Haslo` varchar(255) DEFAULT (lcase(`Nazwisko`)) NOT NULL,
  `Plec` varchar(1) ,
  `Data_urodzenia` date,
    `Pesel_numer_paszportu_numer_dowodu` varchar(11),
        `Miejsce_zamieszkania` varchar(50),
       `Numer_telefonu` varchar(16) ,
  PRIMARY KEY (`ID_pacjent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for utworz_pesel
-- ----------------------------
DROP FUNCTION IF EXISTS `utworz_pesel`;
delimiter ;;
CREATE FUNCTION `utworz_pesel`(data_ur date, plec VARCHAR(1))
 RETURNS varchar(11) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
BEGIN
DECLARE gotowy_pesel VARCHAR(11);
SET @A = SUBSTR(data_ur,3,1);
SET @B = SUBSTR(data_ur,4,1);
SET @rok = YEAR(data_ur);
SET @C = IF(month(data_ur) IN(10,11,12), IF(@rok BETWEEN 1800 AND 1899, "8", IF(@rok BETWEEN 1900 AND 1999, "0", IF(@rok BETWEEN 2000 AND 2099, "2", NULL)))+1, IF(@rok BETWEEN 1800 AND 1899, "8", IF(@rok BETWEEN 1900 AND 1999, "0", IF(@rok BETWEEN 2000 AND 2099, "2", NULL))));
SET @D = SUBSTR(data_ur,7,1);
SET @E = SUBSTR(data_ur,9,1);
SET @F = SUBSTR(data_ur,10,1);
SET @G = FLOOR(RAND()*10);
SET @H = FLOOR(RAND()*10);
SET @I =  FLOOR(RAND()*10);
SET @J = IF(Plec='M', ELT(FLOOR(RAND()*(5-1+1)+1), '1','3','5','7','9'), ELT(FLOOR(RAND()*(5-1+1)+1), '0','2','4','6','8'));
SET @mod10 = MOD(1*@A + 3*@B + 7*@C + 9*@D + 1*@E + 3*@F + 7*@G + 9*@H + 1*@I + 3*@J, 10);
SET @K = IF(@mod10 = 0, "0", CAST(10 - @mod10 AS VARCHAR(1)));
SET gotowy_pesel = CONCAT(@A, @B, @C, @D, @E, @F, @G, @H, @I, @J, @K);
RETURN gotowy_pesel;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for wizyta_uzupelnienie
-- ----------------------------
DROP PROCEDURE IF EXISTS `wizyta_uzupelnienie`;
delimiter ;;
CREATE PROCEDURE `wizyta_uzupelnienie`(IN `N` int)
BEGIN
	DECLARE losowy_pacjent INT;
    FOR i IN 1 .. N/2 DO
            SET losowy_pacjent := FLOOR(RAND()*(((N/2)+1)-1)+1);
            IF losowy_pacjent NOT IN (SELECT ID_pacjent from `Wizyta`)
            THEN
                INSERT INTO `Wizyta` (ID_wizyta, ID_typ_wizyty,ID_lekarz, ID_personel, ID_pacjent, data_wizyty) VALUES (DEFAULT, 1, 1, NULL, losowy_pacjent, CURRENT_DATE);
            ELSE
                SET i := i - 1;
            END IF;
    END FOR;
    FOR i IN 1 .. N/2 DO
            SET losowy_pacjent := FLOOR(RAND()*(((N/2)+1)-1)+1);
            INSERT INTO `Wizyta` (ID_wizyta, ID_typ_wizyty,ID_lekarz, ID_personel, ID_pacjent, data_wizyty) VALUES (DEFAULT, 1, 1, NULL, losowy_pacjent, CURRENT_DATE);
    END FOR;
    FOR i IN 1 .. N DO
            UPDATE `Wizyta`
            SET ID_typ_wizyty = RAND()*((SELECT COUNT(ID_typ_wizyty) FROM Typ_wizyty)-1)+1, ID_lekarz = RAND()*((SELECT COUNT(ID_lekarz) FROM Lekarze)-1)+1, ID_personel = RAND()*((SELECT COUNT(ID_personel) FROM Personel)-1)+1, data_wizyty = date_add('2000-01-01',interval rand()*365*22 day),ID_wizyta_recepty = RAND()*((SELECT COUNT(ID_wizyta_recepty) FROM Wizyta_recepty)-1)+1, ID_wizyta_skierowania = RAND()*((SELECT COUNT(ID_wizyta_skierowania) FROM Wizyta_skierowania)-1)+1;
   END FOR;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `automat_haslo`;
delimiter ;;
CREATE TRIGGER `automat_haslo` BEFORE INSERT ON `Lekarze` FOR EACH ROW BEGIN
IF new.haslo IS NULL OR LENGTH(NEW.haslo) = 0 THEN
SET new.haslo = LOWER(CONCAT(new.nazwisko));
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `automat_login`;
delimiter ;;
CREATE TRIGGER `automat_login` BEFORE INSERT ON `Lekarze` FOR EACH ROW BEGIN
IF new.login IS NULL OR LENGTH(NEW.login) = 0 THEN
SET new.login = LOWER(CONCAT(LEFT(new.imie,1),new.nazwisko));
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `z_dużych`;
delimiter ;;
CREATE TRIGGER `z_dużych` BEFORE UPDATE ON `Lekarze` FOR EACH ROW BEGIN
set NEW.imie = CONCAT(upper(left(NEW.imie,1)),lower(RIGHT(NEW.imie, LENGTH(NEW.imie)-1)));
set NEW.nazwisko = CONCAT(upper(left(NEW.nazwisko,1)),lower(RIGHT(NEW.nazwisko, LENGTH(NEW.nazwisko)-1)));
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update`;
delimiter ;;
CREATE TRIGGER `PK_update` AFTER UPDATE ON `Lekarze` FOR EACH ROW BEGIN
UPDATE Dyskusja_lekarzy SET ID_lekarz = NEW.ID_lekarz WHERE ID_lekarz = OLD.ID_lekarz;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update4`;
delimiter ;;
CREATE TRIGGER `PK_update4` AFTER UPDATE ON `Lekarze` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_lekarz = NEW.ID_lekarz WHERE ID_lekarz = OLD.ID_lekarz;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete`;
delimiter ;;
CREATE TRIGGER `PK_delete` AFTER DELETE ON `Lekarze` FOR EACH ROW BEGIN
DELETE FROM Dyskusja_lekarzy WHERE ID_lekarz=OLD.ID_lekarz;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Lekarze
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete4`;
delimiter ;;
CREATE TRIGGER `PK_delete4` AFTER DELETE ON `Lekarze` FOR EACH ROW BEGIN
DELETE FROM Wizyta WHERE ID_lekarz = OLD.ID_lekarz;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Pacjenci
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update1`;
delimiter ;;
CREATE TRIGGER `PK_update1` AFTER UPDATE ON `Pacjenci` FOR EACH ROW BEGIN
UPDATE Dyskusja_lekarzy SET ID_pacjent = NEW.ID_pacjent WHERE ID_pacjent = OLD.ID_pacjent;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Pacjenci
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update6`;
delimiter ;;
CREATE TRIGGER `PK_update6` AFTER UPDATE ON `Pacjenci` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_pacjent = NEW.ID_pacjent WHERE ID_pacjent = OLD.ID_pacjent;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Pacjenci
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete1`;
delimiter ;;
CREATE TRIGGER `PK_delete1` AFTER DELETE ON `Pacjenci` FOR EACH ROW BEGIN
DELETE FROM Dyskusja_lekarzy WHERE ID_pacjent=OLD.ID_pacjent;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Pacjenci
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete6`;
delimiter ;;
CREATE TRIGGER `PK_delete6` AFTER DELETE ON `Pacjenci` FOR EACH ROW BEGIN
DELETE FROM Wizyty WHERE ID_pacjent=OLD.ID_pacjent;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Personel
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_login2`;
delimiter ;;
CREATE TRIGGER `auto_login2` BEFORE INSERT ON `Personel` FOR EACH ROW BEGIN
IF new.login IS NULL OR LENGTH(NEW.login) = 0 THEN
SET new.login = LOWER(CONCAT(LEFT(new.imie,1),new.nazwisko));
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Personel
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_hasło2`;
delimiter ;;
CREATE TRIGGER `auto_hasło2` BEFORE INSERT ON `Personel` FOR EACH ROW BEGIN
IF new.Haslo IS NULL OR LENGTH(NEW.Haslo) = 0 THEN
SET new.Haslo = LOWER(CONCAT(new.Nazwisko));
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Personel
-- ----------------------------
DROP TRIGGER IF EXISTS `duze_litery`;
delimiter ;;
CREATE TRIGGER `duze_litery` BEFORE UPDATE ON `Personel` FOR EACH ROW BEGIN
set NEW.imie = CONCAT(upper(left(NEW.imie,1)),lower(RIGHT(NEW.imie, LENGTH(NEW.imie)-1)));
set NEW.nazwisko = CONCAT(upper(left(NEW.nazwisko,1)),lower(RIGHT(NEW.nazwisko, LENGTH(NEW.nazwisko)-1)));
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Personel
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update5`;
delimiter ;;
CREATE TRIGGER `PK_update5` AFTER UPDATE ON `Personel` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_personel = NEW.ID_personel WHERE ID_personel = OLD.ID_personel;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Personel
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete5`;
delimiter ;;
CREATE TRIGGER `PK_delete5` AFTER DELETE ON `Personel` FOR EACH ROW BEGIN
DELETE FROM Wizyta WHERE ID_personel=OLD.ID_personel;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Typ_wizyty
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update2`;
delimiter ;;
CREATE TRIGGER `PK_update2` AFTER UPDATE ON `Typ_wizyty` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_typ_wizyty = NEW.ID_typ_wizyty WHERE ID_typ_wizyty = OLD.ID_typ_wizyty;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Typ_wizyty
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete2`;
delimiter ;;
CREATE TRIGGER `PK_delete2` AFTER DELETE ON `Typ_wizyty` FOR EACH ROW BEGIN
DELETE FROM Wizyta WHERE ID_typ_wizyty=OLD.ID_typ_wizyty;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Wizyta_recepty
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update7`;
delimiter ;;
CREATE TRIGGER `PK_update7` AFTER UPDATE ON `Wizyta_recepty` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_wizyta_recepty = NEW.ID_wizyta_recepty WHERE ID_wizyta_recepty = OLD.ID_wizyta_recepty;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Wizyta_recepty
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete7`;
delimiter ;;
CREATE TRIGGER `PK_delete7` AFTER DELETE ON `Wizyta_recepty` FOR EACH ROW BEGIN
DELETE FROM Wizyta WHERE ID_wizyta_recepty=OLD.ID_wizyta_recepty;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Wizyta_skierowania
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_update8`;
delimiter ;;
CREATE TRIGGER `PK_update8` AFTER UPDATE ON `Wizyta_skierowania` FOR EACH ROW BEGIN
UPDATE Wizyta SET ID_wizyta_skierowania = NEW.ID_wizyta_skierowania WHERE ID_wizyta_skierowania = OLD.ID_wizyta_skierowania;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Wizyta_skierowania
-- ----------------------------
DROP TRIGGER IF EXISTS `PK_delete8`;
delimiter ;;
CREATE TRIGGER `PK_delete8` AFTER DELETE ON `Wizyta_skierowania` FOR EACH ROW BEGIN
DELETE FROM Wizyta WHERE ID_wizyta_skierowania=OLD.ID_wizyta_skierowania;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
