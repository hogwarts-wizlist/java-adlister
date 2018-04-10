USE wizlist_db;

# Seed Users
INSERT INTO users(username, password, email, first_name, last_name, biography, profile_pic, created_at, updated_at) VALUES
  ('bahodge', '12345', 'email@email.com', 'Ben', 'Hodge', 'I like turtles', NULL, NOW(), NOW()),
  ('bettina', '12345', 'email1@email.com', 'Bettina', 'Trejo', 'I too like turtles', NULL, NOW(), NOW()),
  ('zachyboi', '12345', 'email2@email.com', 'Zach', 'Ramos', 'I dislike all humans. Turtle master race!', NULL, NOW(), NOW());

# Seed Ads
INSERT INTO ads(user_id, title, description, price, created_at, updated_at) VALUES
  (1, 'Wand', 'a super powerful wand capable of vaporizing muggles', 150, NOW(), NOW()),
  (1, 'Robe', 'Cloak that looks cool but isn\'t magical, but its cool', 18, NOW(), NOW()),
  (1, 'Dragon', 'It looks like a dragon, but pretty sure it is actually not', 11000,  NOW(), NOW()),
  (2, 'Subscription to Muggle Daily', 'Learn all about muggles and the muggle world', 50, NOW(), NOW()),
  (3, 'Love Potion', 'A very powerful love potion that promises to make your crush into a menace.', 832, NOW(), NOW());

INSERT INTO categories(id, title) VALUES
  (1, 'Wands'),
  (2, 'Potions'),
  (3, 'Creatures'),
  (4, 'Robes'),
  (5, 'Brooms'),
  (6, 'Subscriptions'),
  (7, 'Spells'),
  (8, 'Misc'),
  (9, 'Services'),
  (10, 'Books');

# Ad cat pivot
INSERT INTO ad_cat(ad_id, cat_id) VALUES
  (1, 1),
  (2, 4),
  (3, 3),
  (4, 6),
  (5, 2);