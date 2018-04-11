use wizlist_db;

SELECT a.*, u.username FROM ads a JOIN users u ON u.id = a.user_id