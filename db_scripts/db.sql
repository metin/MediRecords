/*
CREATE USER 'webuser1'@'localhost' IDENTIFIED BY 'pass1';
GRANT ALL ON *.* TO 'webuser1'@'localhost';
*/

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS  `records`;
CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `details` varchar(255) NOT NULL,
  `doctor_id` int,
  `insurance_id` int(11),
  `status` tinyint(2),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;



INSERT INTO `records` (`user_id`, `type`, `date_added`, `details`, `doctor_id`, `status`, `insurance_id`) VALUES
(1, 'Prescription', '2010-11-24 00:19:08', 'Paxil 50 mg - 30 pills - Prescribed by Dr. Kumar', 3, 2, 4),
(2, 'Procedure', '2010-11-24 00:19:39', 'Chest X-ray', 3, 1, 4),
(1, 'Hospitalization', '2010-11-24 00:20:52', 'St. Mary''s - 3 day', 3, 1, 4),
(3, 'Prescription', '2010-11-24 00:21:50', 'Paxil 50 mg - 30 pills - Prescribed for John Smith', 3, 2, 4),
(2, 'Prescription', '2010-11-24 00:22:53', 'Xanax 50 mg - Prescribed by Dr. Kumar', 3, 1, 6),
(3, 'Prescription', '2010-11-24 00:24:19', 'Xanax 50 mg - Prescribed for B. Gates', 3, 3, 6),
(2, 'Prescription', '2010-11-24 00:25:09', 'Xanax 50 mg - Prescribed by Dr. Kumar, for B. Gates', 3, 2, 6),
(1, 'Prescription', '2010-11-24 00:25:34', 'Paxil 50 mg - 30 pills - Prescribed by Dr. Kumar, for John Smith', 3, 1, 6),
(3, 'Procedure', '2010-11-24 00:26:55', 'Chest X-ray for John Smith', 3, 1, 6),
(2, 'Hospitalization', '2010-11-24 00:27:57', 'St. Mary''s - 3 day for John Smith', 3, 1, 6),

(2, 'Prescription', '2010-11-20 00:25:09', 'Xanax 50 mg - Prescribed by Dr. Kumar, for B. Gates', 3, 2, 6),
(1, 'Prescription', '2010-10-24 00:25:34', 'Paxil 50 mg - 30 pills - Prescribed by Dr. Kumar, for John Smith', 3, 1, 4),
(3, 'Procedure', '2010-11-21 00:26:55', 'Chest X-ray for John Smith', 3, 1, 4),
(2, 'Hospitalization', '2010-09-24 00:27:57', 'St. Mary''s - 3 day for John Smith', 3, 1, 4),

(1, 'Prescription', '2010-09-22 00:25:09', 'Xanax 10 mg - Prescribed by Dr. Kumar, for B. Gates', 3, 1, 4),
(1, 'Prescription', '2010-08-10 00:25:34', 'Paxil 20 mg - 30 pills - Prescribed by Dr. Kumar, for John Smith', 3, 1, 4),
(1, 'Procedure', '2010-07-28 00:26:55', 'Chest X-ray for John Smith', 3, 1, 4),
(1, 'Hospitalization', '2010-11-20 00:27:57', 'St. Mary''s - 3 day for John Smith', 3, 1, 4),

(1, 'Prescription', '2010-11-22 00:25:09', 'Xanax 50 mg - Prescribed by Dr. Kumar, for B. Gates', 3, 1, 4),
(1, 'Prescription', '2010-11-23 00:25:34', 'Paxil 50 mg - 30 pills - Prescribed by Dr. Kumar, for John Smith', 3, 1, 4),
(1, 'Procedure', '2010-11-25 00:26:55', 'Chest X-ray for John Smith', 3, 1, 4),
(1, 'Hospitalization', '2010-11-27 00:27:57', 'St. Mary''s - 3 day for John Smith', 3, 1, 4)
;


DROP TABLE IF EXISTS  `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;


INSERT INTO `roles` (`id`, `name`, `description`, `created_on`, `updated_on`) VALUES
(1, 'Patient', 'Customers of health services', '2010-11-24 02:37:04', '2010-11-24 02:37:07'),
(2, 'Doctor', 'Providers of health Services', '2010-11-24 02:38:46', '2010-11-24 02:38:48'),
(3, 'Insurance Provider', 'A company to reduce medical cost liability', '2010-11-24 02:40:15', '2010-11-24 02:40:17');

DROP TABLE IF EXISTS  `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insurance_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `users` (`id`, `login`, `password`, `email`, `role_id`, `last_login`, `created_on`, `updated_on`, `insurance_id`) VALUES
(1, 'jsmith', 'password', 'jsmith@gmail.com', 1, '2010-11-24 02:41:35', '2010-11-24 02:41:32', '2010-11-24 02:41:40', 4),
(2, 'bgates', 'microsoft', 'gateb@microsoft.com', 1, '2010-11-24 02:42:57', '2010-11-24 02:42:54', '2010-11-24 02:43:01', 6),
(3, 'drkumar', 'health', 'kumar@gmail.com', 2, '2010-11-24 02:44:02', '2010-11-24 02:43:59', '2010-11-24 02:44:04', 4),
(4, 'medicaid', 'bones', 'mail@medicaid.gov', 3, '2010-11-24 03:08:39', '2010-11-24 03:08:37', '2010-11-24 03:08:41', null),
(5, 'drwillson', 'doctor', 'drwillson@gmail.com', 2, '2010-11-24 02:44:02', '2010-11-24 02:43:59', '2010-11-24 02:44:04', 6),
(6, 'aplusins', 'insurance', 'aplus@aplus.com', 3, '2010-11-24 03:08:39', '2010-11-24 03:08:37', '2010-11-24 03:08:41', null),
(7, 'john', 'pwd', 'john@gmail.com', 1, '2010-11-24 02:41:35', '2010-11-24 02:41:32', '2010-11-24 02:41:40', 4),
(8, 'jenny', 'pwd', 'jenny@microsoft.com', 1, '2010-11-24 02:42:57', '2010-11-24 02:42:54', '2010-11-24 02:43:01', 4),
(9, 'jimmy', 'pwd', 'jimmy@gmail.com', 1, '2010-11-24 02:41:35', '2010-11-24 02:41:32', '2010-11-24 02:41:40', 4),
(10, 'boris', 'pwd', 'boris@microsoft.com', 1, '2010-11-24 02:42:57', '2010-11-24 02:42:54', '2010-11-24 02:43:01', 4),
(11, 'drjohn', 'doctor', 'drj@gmail.com', 2, '2010-11-24 02:44:02', '2010-11-24 02:43:59', '2010-11-24 02:44:04', 4),
(12, 'drj', 'doctor', 'drj1@gmail.com', 2, '2010-11-24 02:44:02', '2010-11-24 02:43:59', '2010-11-24 02:44:04', 4),
(13, 'drw', 'doctor', 'drw@gmail.com', 2, '2010-11-24 02:44:02', '2010-11-24 02:43:59', '2010-11-24 02:44:04', 6)
;

DROP TABLE IF EXISTS  `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_details` (`user_id`, `first_name`, `last_name`, `address1`, `address2`, `city`, `state`, `zipcode`, `created_on`, `updated_on`) VALUES
(1, 'John', 'Smith', '123 Main Street', NULL, 'Newark', 'NJ', '07567', '2010-11-24 03:05:33', '2010-11-24 03:05:35'),
(2, 'Bill', 'Gates', '45 Redmond Ave', NULL, 'Seatle', 'Washington', '87565', '2010-11-24 03:06:26', '2010-11-24 03:06:28'),
(3, 'Harsha', 'Kumar', '32 Evergreen Terrace', NULL, 'Montvale', 'NJ', '07547', '2010-11-24 03:07:14', '2010-11-24 03:07:16'),
(4, 'Medicaid', '', '89 Haywood Boulevard', NULL, 'Washington, D.C', 'Maryland', '65324', '2010-11-24 03:10:12', '2010-11-24 03:10:15'),
(5, 'David', 'Willson', '32 Evergreen Terrace', NULL, 'Montvale', 'NJ', '07547', '2010-11-24 03:07:14', '2010-11-24 03:07:16'),
(6, 'A Plus Ins.', '', '1 Abc Street', NULL, 'Lodi', 'NJ', '07644', '2010-11-24 03:07:14', '2010-11-24 03:07:16'),
(7, 'John', 'Smith', '123 Main Street', NULL, 'Newark', 'NJ', '07567', '2010-11-24 03:05:33', '2010-11-24 03:05:35'),
(8, 'Jenny', 'Gates', '45 Redmond Ave', NULL, 'Seatle', 'Washington', '87565', '2010-11-24 03:06:26', '2010-11-24 03:06:28'),
(9, 'Jimmy', 'Kumar', '32 Evergreen Terrace', NULL, 'Montvale', 'NJ', '07547', '2010-11-24 03:07:14', '2010-11-24 03:07:16'),
(10, 'Boris', 'Smith', '123 Main Street', NULL, 'Newark', 'NJ', '07567', '2010-11-24 03:05:33', '2010-11-24 03:05:35'),
(11, 'Doctor', 'X', '45 Redmond Ave', NULL, 'Seatle', 'Washington', '87565', '2010-11-24 03:06:26', '2010-11-24 03:06:28'),
(12, 'Doctor', 'Y', '32 Evergreen Terrace', NULL, 'Montvale', 'NJ', '07547', '2010-11-24 03:07:14', '2010-11-24 03:07:16'),
(13, 'Doctor', 'Oz', '32 Evergreen Terrace', NULL, 'Montvale', 'NJ', '07547', '2010-11-24 03:07:14', '2010-11-24 03:07:16')
;

DROP TABLE IF EXISTS  `doctors_insurances`;
CREATE TABLE IF NOT EXISTS `doctors_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `insurance_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `doctors_insurances` 
(`doctor_id`, `insurance_id`, `rate`, `created_on`, `updated_on`) 
VALUES
(3, 4, 80, '2010-11-24 03:05:33', '2010-11-24 03:05:35'),
(3, 6, 85, '2010-11-28 03:05:33', '2010-11-28 03:05:35'),
(5, 4, 88, '2010-11-26 03:05:33', '2010-11-26 03:05:35'),
(6, 6, 80, '2010-11-22 03:05:33', '2010-11-22 03:05:35'),
(11, 4, 85, '2010-11-28 03:05:33', '2010-11-28 03:05:35'),
(12, 4, 88, '2010-11-26 03:05:33', '2010-11-26 03:05:35'),
(13, 6, 80, '2010-11-22 03:05:33', '2010-11-22 03:05:35')
;




ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;


ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

  SET foreign_key_checks = 1;
  