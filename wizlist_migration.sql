USE wizlist_db;


DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS ad_cat;
DROP TABLE IF EXISTS ads_medias;
DROP TABLE IF EXISTS faves;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  biography TEXT,
  profile_pic TEXT,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ads(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  price DOUBLE UNSIGNED,
  low_price DOUBLE UNSIGNED,
  high_price DOUBLE UNSIGNED,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE reviews(
  ad_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  rating INT,
  review TEXT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (ad_id) REFERENCES ads(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE ad_cat(
  ad_id INT UNSIGNED NOT NULL,
  cat_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (ad_id) REFERENCES ads(id),
  FOREIGN KEY (cat_id) REFERENCES categories(id)
);

CREATE TABLE ads_medias(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ad_id INT UNSIGNED NOT NULL,
  url TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (ad_id) REFERENCES ads(id)
);

CREATE TABLE faves (
  user_id INT UNSIGNED NOT NULL,
  ad_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (ad_id) REFERENCES ads(id)
);

