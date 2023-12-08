CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_role_name` varchar(30) NOT NULL,
  `user_role_desc` varchar(200) NOT NULL
);

INSERT INTO `user_roles` (`user_role_id`, `user_role_name`, `user_role_desc`) VALUES
(1, 'Standard User', 'Normal user with no special permissions'),
(2, 'Admin', 'Extra permissions');

CREATE TABLE users (
  user_id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_first_name varchar(30) NOT NULL,
  user_last_name varchar(30) NOT NULL,
  user_email varchar(100) NOT NULL UNIQUE,
  user_password char(255) NOT NULL,
  user_salt char(32) NOT NULL,
  user_role INT NOT NULL DEFAULT '1',
  user_active boolean NOT NULL DEFAULT true,
  FOREIGN KEY (user_role) REFERENCES user_roles(user_role_id)
);

INSERT INTO users (user_first_name,user_last_name, user_email, user_password, user_salt, user_role, user_active) VALUES 
('John', 'Doe','john@doe.com', 'opensesame', 'xxx', '1', true),
('Jane', 'Anderson','jane@doe.com', 'letmein', 'xxx', '2', true),
('Bob', 'Smith','bob@smith.com', 'test', 'xxx', '2', false);

CREATE TABLE animals (
  animal_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  species VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  available_for_adoption BOOLEAN NOT NULL DEFAULT true
);

-- DUMMY DATA FOR ANIMALS...

INSERT INTO animals (name, species, age, available_for_adoption) VALUES
('Buddy', 'Dog', 3, true),
('Whiskers', 'Cat', 2, true),
('Fluffer Guy', 'Rabbit', 1, true),
('Mr. Macaw', 'Bird', 23, true),
('Spotter', 'Dog', 4, true),
('Ziggy', 'Cat', 5, true);


CREATE TABLE adoptions (
  adoption_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  animal_id INT NOT NULL,
  adoption_date DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
);

-- DUMMY DATA FOR ADOPTIONS...

INSERT INTO adoptions (user_id, animal_id, adoption_date) VALUES
(1, 1, '2019-06-05'),
(2, 2, '2023-10-06'),
(3, 3, '2020-12-07'),
(1, 4, '2006-04-14'),
(2, 5, '2021-03-23'),
(3, 6, '2020-10-10');

CREATE TABLE animal_vaccinations (
  vaccination_id INT PRIMARY KEY AUTO_INCREMENT,
  animal_id INT NOT NULL,
  vaccination_name VARCHAR(50) NOT NULL,
  vaccination_date DATE NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
);

-- ANIMAL VACCINATION DATA...
INSERT INTO animal_vaccinations (animal_id, vaccination_name, vaccination_date) VALUES
(1, 'Rabies', '2020-01-15'),
(2, 'Feline Distemper', '2023-10-08'),
(3, 'Rabbit Myxomatosis', '2020-12-20'),
(4, 'Avian Influenza', '2006-05-01'),
(5, 'Canine Parvovirus', '2021-10-05'),
(6, 'Feline Leukemia', '2021-01-10');
