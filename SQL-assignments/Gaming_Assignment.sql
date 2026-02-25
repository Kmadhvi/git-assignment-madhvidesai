Create database Game_db
use Game_db

 CREATE TABLE players (
    player_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    level INT DEFAULT 1 CHECK (level >= 1),
    coins INT DEFAULT 0 CHECK (coins >= 0),
    status VARCHAR(20) CHECK (status IN ('Active','Banned','Inactive'))
)
INSERT INTO players (player_id, username, email, full_name, country, registration_date, level, coins, status) VALUES
(1,  'ProGamer123',    'progamer123@gmail.com',      'Aarav Sharma',      'India',    '2021-03-15', 45,  12500, 'Active'),
(2,  'NinjaKiller',    'ninjakiller@yahoo.com',      'Rohan Verma',       'India',    '2021-06-20', 38,  9800,  'Active'),
(3,  'LegendSlayer',   'legendslayer@gmail.com',     'Priya Mehta',       'India',    '2021-09-10', 52,  18400, 'Active'),
(4,  'DragonMaster',   'dragonmaster@hotmail.com',   'Vikram Singh',      'India',    '2022-01-05', 41,  11200, 'Active'),
(5,  'ShadowHunter',   'shadowhunter@gmail.com',     'Ananya Iyer',       'India',    '2022-03-18', 29,  6500,  'Active'),
(6,  'BlazeKing',      'blazeking@outlook.com',      'Karan Kapoor',      'India',    '2022-05-22', 35,  8900,  'Active'),
(7,  'StormRider',     'stormrider@gmail.com',       'Divya Nair',        'India',    '2022-08-14', 48,  15300, 'Active'),
(8,  'PhantomStrike',  'phantomstrike@yahoo.com',    'Rahul Desai',       'India',    '2022-10-03', 33,  7400,  'Active'),
(9,  'ThunderBolt',    'thunderbolt@gmail.com',      'Sneha Patel',       'India',    '2022-12-11', 27,  5200,  'Active'),
(10, 'IronFist',       'ironfist@gmail.com',         'Arjun Reddy',       'India',    '2023-02-08', 50,  17600, 'Active'),
(11, 'WolfPack',       'wolfpack@gmail.com',         'James Carter',      'USA',      '2023-04-15', 44,  13100, 'Active'),
(12, 'VenomStrike',    'venomstrike@yahoo.com',      'Emily Watson',      'USA',      '2023-06-20', 39,  10500, 'Active'),
(13, 'TitanSlayer',    'titanslayer@gmail.com',      'Ahmed Al-Rashid',   'UAE',      '2023-08-05', 31,  7100,  'Active'),
(14, 'GhostRider',     'ghostrider@outlook.com',     'Sarah Johnson',     'UK',       '2023-09-12', 36,  9200,  'Active'),
(15, 'FireFox',        'firefox@gmail.com',          'Siddharth Joshi',   'India',    '2023-10-18', 42,  12800, 'Active'),
(16, 'NoobPlayer',     'noobplayer@gmail.com',       'Nisha Agarwal',     'India',    '2020-05-10',  3,  150,   'Inactive'),
(17, 'CyberNinja',     'cyberninja@yahoo.com',       'Riya Malhotra',     'India',    '2023-11-25', 26,  4800,  'Active'),
(18, 'VortexKing',     'vortexking@gmail.com',       'Suresh Babu',       'India',    '2024-01-08', 22,  3500,  'Active'),
(19, 'ApexPredator',   'apexpredator@hotmail.com',   'Kavitha Menon',     'India',    '2024-02-14', 19,  2400,  'Active'),
(20, 'SilverBullet',   'silverbullet@gmail.com',     'Pooja Gupta',       'India',    '2024-03-05', 15,  1800,  'Active'),
(21, 'HackerPro',      'hackerpro@gmail.com',        'John Smith',        'USA',      '2022-07-20', 40,  11000, 'Banned'),
(22, 'EliteSniper',    'elitesniper@yahoo.com',      'Michael Brown',     'USA',      '2023-05-10', 37,  9500,  'Active'),
(23, 'MysticWarrior',  'mysticwarrior@gmail.com',    'Lakshmi Rao',       'India',    '2023-12-02', 24,  4200,  'Active'),
(24, 'AlphaWolf',      'alphawolf@outlook.com',      'David Lee',         'Australia','2024-01-20', 18,  2200,  'Active'),
(25, 'InactiveUser',   'inactiveuser@gmail.com',     'Amit Trivedi',      'India',    '2020-02-15',  2,  50,    'Inactive');

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL UNIQUE,
    genre VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL,
    developer VARCHAR(100) NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0.0 AND 5.0),
    price DECIMAL(8,2) DEFAULT 0.00 CHECK (price >= 0),
    downloads INT DEFAULT 0 CHECK (downloads >= 0)
)
INSERT INTO games (game_id, game_name, genre, release_date, developer, rating, price, downloads) VALUES
(1,  'Battleground Elite',     'Action',     '2020-05-15', 'Epic Studios',      4.5, 0.00,    5000000),
(2,  'Legends Arena',           'MOBA',       '2019-08-20', 'Riot Games',        4.7, 0.00,    8000000),
(3,  'War Strategy Pro',        'Strategy',   '2021-03-10', 'Paradox Interactive', 4.3, 799.00,  1200000),
(4,  'Fantasy Quest',           'RPG',        '2020-11-25', 'CD Projekt',        4.8, 1499.00, 3500000),
(5,  'Speed Racer X',           'Racing',     '2021-06-18', 'Electronic Arts',   4.2, 599.00,  2000000),
(6,  'Zombie Survival',         'Horror',     '2019-10-31', 'Capcom',            4.4, 899.00,  2800000),
(7,  'Cricket Champion',        'Sports',     '2022-04-01', 'Big Ant Studios',   4.0, 399.00,  1500000),
(8,  'Chess Grandmaster',       'Board Game', '2018-07-14', 'Chess.com',         4.6, 0.00,    4500000),
(9,  'Space Invaders HD',       'Arcade',     '2020-09-05', 'Atari',             3.9, 199.00,  800000),
(10, 'City Builder Deluxe',     'Simulation', '2021-01-20', 'Colossal Order',    4.5, 999.00,  1800000),
(11, 'Puzzle Master 2023',      'Puzzle',     '2023-02-14', 'King Games',        4.3, 0.00,    6000000),
(12, 'Ninja Warrior',           'Action',     '2022-08-10', 'Ubisoft',           4.4, 1299.00, 2200000),
(13, 'Galactic Wars',           'Sci-Fi',     '2020-12-01', 'Bungie',            4.6, 1999.00, 3000000),
(14, 'Farm Tycoon',             'Simulation', '2021-05-30', 'Zynga',             3.8, 0.00,    3200000),
(15, 'Hero Legends',            'RPG',        '2023-07-22', 'Square Enix',       4.7, 1799.00, 2500000);

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    match_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    score INT NOT NULL CHECK (score >= 0),
    duration_min INT NOT NULL CHECK (duration_min >= 0),
    result VARCHAR(10) CHECK (result IN ('Win','Loss','Draw')),
    mode VARCHAR(20) CHECK (mode IN ('Solo','Duo','Squad','Team')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
)
INSERT INTO matches (match_id, player_id, game_id, match_date, score, duration_min, result, mode) VALUES
(1,  1,  1,  '2024-01-05 14:30:00', 2450, 35, 'Win',  'Squad'),
(2,  1,  2,  '2024-01-08 18:00:00', 1820, 42, 'Win',  'Team'),
(3,  2,  1,  '2024-01-10 20:15:00', 1950, 38, 'Loss', 'Squad'),
(4,  3,  4,  '2024-01-12 19:00:00', 3800, 120,'Win',  'Solo'),
(5,  3,  2,  '2024-01-15 21:30:00', 2100, 45, 'Win',  'Team'),
(6,  4,  3,  '2024-01-18 16:00:00', 1500, 90, 'Draw', 'Solo'),
(7,  5,  6,  '2024-01-20 22:00:00', 980,  55, 'Loss', 'Duo'),
(8,  6,  1,  '2024-01-22 15:45:00', 2200, 40, 'Win',  'Squad'),
(9,  7,  4,  '2024-01-25 17:30:00', 4200, 110,'Win',  'Solo'),
(10, 8,  5,  '2024-01-28 19:00:00', 1650, 25, 'Loss', 'Solo'),
(11, 9,  2,  '2024-02-01 20:00:00', 1400, 38, 'Loss', 'Team'),
(12, 10, 1,  '2024-02-03 14:00:00', 2800, 42, 'Win',  'Squad'),
(13, 10, 4,  '2024-02-05 18:30:00', 3950, 115,'Win',  'Solo'),
(14, 11, 13, '2024-02-08 21:00:00', 3200, 75, 'Win',  'Solo'),
(15, 12, 2,  '2024-02-10 19:30:00', 2300, 48, 'Win',  'Team'),
(16, 13, 1,  '2024-02-12 16:00:00', 2050, 36, 'Win',  'Squad'),
(17, 14, 6,  '2024-02-15 22:30:00', 1100, 60, 'Loss', 'Duo'),
(18, 15, 3,  '2024-02-18 17:00:00', 1700, 85, 'Draw', 'Solo'),
(19, 1,  12, '2024-02-20 20:00:00', 2900, 50, 'Win',  'Solo'),
(20, 2,  4,  '2024-02-22 19:00:00', 3600, 105,'Win',  'Solo'),
(21, 3,  1,  '2024-02-25 15:30:00', 2650, 44, 'Win',  'Squad'),
(22, 5,  8,  '2024-02-28 18:00:00', 850,  30, 'Draw', 'Solo'),
(23, 7,  2,  '2024-03-01 21:00:00', 2400, 50, 'Win',  'Team'),
(24, 10, 13, '2024-03-03 20:00:00', 3500, 70, 'Win',  'Solo'),
(25, 11, 1,  '2024-03-05 16:30:00', 2150, 39, 'Win',  'Squad'),
(26, 12, 4,  '2024-03-08 19:30:00', 3750, 108,'Win',  'Solo'),
(27, 15, 6,  '2024-03-10 22:00:00', 1250, 58, 'Loss', 'Duo'),
(28, 17, 2,  '2024-03-12 20:30:00', 1600, 40, 'Loss', 'Team'),
(29, 18, 1,  '2024-03-15 17:00:00', 1850, 35, 'Loss', 'Squad'),
(30, 19, 5,  '2024-03-18 19:00:00', 1450, 22, 'Loss', 'Solo'),
(31, 20, 11, '2024-03-20 18:00:00', 650,  20, 'Loss', 'Solo'),
(32, 22, 1,  '2024-03-22 15:00:00', 2550, 41, 'Win',  'Squad'),
(33, 23, 2,  '2024-03-24 20:00:00', 1750, 43, 'Loss', 'Team'),
(34, 1,  13, '2024-03-26 21:00:00', 3400, 72, 'Win',  'Solo'),
(35, 3,  12, '2024-03-28 19:00:00', 3100, 55, 'Win',  'Solo'),
(36, 6,  4,  '2024-03-30 18:00:00', 3850, 112,'Win',  'Solo'),
(37, 7,  1,  '2024-04-01 16:00:00', 2750, 43, 'Win',  'Squad'),
(38, 10, 2,  '2024-04-03 20:30:00', 2500, 47, 'Win',  'Team'),
(39, 11, 4,  '2024-04-05 19:30:00', 4000, 118,'Win',  'Solo'),
(40, 15, 1,  '2024-04-08 17:30:00', 2350, 38, 'Win',  'Squad');

CREATE TABLE tournaments (
    tournament_id INT PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL,
    game_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    prize_pool DECIMAL(10,2) NOT NULL CHECK (prize_pool > 0),
    winner_id INT NULL,
    status VARCHAR(20) CHECK (status IN ('Upcoming','Ongoing','Completed')),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (winner_id) REFERENCES players(player_id)
)
INSERT INTO tournaments (tournament_id, tournament_name, game_id, start_date, end_date, prize_pool, winner_id, status) VALUES
(1,  'Battleground World Cup 2023',    1,  '2023-12-01', '2023-12-15', 500000.00, 10, 'Completed'),
(2,  'Legends Arena Championship',     2,  '2024-01-10', '2024-01-25', 750000.00,  3, 'Completed'),
(3,  'Fantasy Quest Masters',          4,  '2024-02-05', '2024-02-20', 1000000.00, 7, 'Completed'),
(4,  'Galactic Wars Invitational',     13, '2024-03-01', '2024-03-15', 800000.00, 11, 'Completed'),
(5,  'Speed Racer X Grand Prix',       5,  '2024-03-20', '2024-03-28', 300000.00,  1, 'Completed'),
(6,  'War Strategy Elite League',      3,  '2024-04-01', '2024-04-30', 400000.00, NULL, 'Ongoing'),
(7,  'Ninja Warrior Pro Series',       12, '2024-04-10', '2024-04-25', 600000.00, NULL, 'Ongoing'),
(8,  'Cricket Champion IPL',           7,  '2024-05-01', '2024-05-31', 350000.00, NULL, 'Upcoming'),
(9,  'Hero Legends World Finals',      15, '2024-06-01', '2024-06-15', 1200000.00, NULL, 'Upcoming'),
(10, 'Battleground Asia Cup',          1,  '2024-07-01', '2024-07-20', 450000.00, NULL, 'Upcoming');

CREATE TABLE achievements (
    achievement_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    achievement_name VARCHAR(100) NOT NULL,
    description TEXT,
    earned_date DATE DEFAULT CURRENT_DATE,
    rarity VARCHAR(20) CHECK (rarity IN ('Common','Rare','Epic','Legendary')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id))

INSERT INTO achievements (achievement_id, player_id, game_id, achievement_name, description, earned_date, rarity) VALUES
(1,  1,  1,  'First Blood',           'Get your first kill',                    '2024-01-05', 'Common'),
(2,  1,  1,  'Victory Royale',        'Win your first match',                   '2024-01-05', 'Rare'),
(3,  1,  2,  'Pentakill Master',      'Eliminate 5 enemies in one match',      '2024-01-08', 'Epic'),
(4,  3,  4,  'Dragon Slayer',         'Defeat the ancient dragon',             '2024-01-12', 'Legendary'),
(5,  3,  2,  'Team Player',           'Win 10 team matches',                    '2024-01-15', 'Rare'),
(6,  7,  4,  'Legendary Hero',        'Complete the main storyline',           '2024-01-25', 'Legendary'),
(7,  10, 1,  'Sharpshooter',          'Achieve 90% accuracy',                   '2024-02-03', 'Epic'),
(8,  10, 4,  'Treasure Hunter',       'Find all hidden treasures',             '2024-02-05', 'Rare'),
(9,  10, 13, 'Galactic Commander',    'Win 5 space battles',                    '2024-02-08', 'Epic'),
(10, 11, 13, 'Space Ace',             'Complete all missions',                  '2024-02-08', 'Legendary'),
(11, 12, 2,  'Support Hero',          'Assist teammates 100 times',            '2024-02-10', 'Rare'),
(12, 1,  12, 'Stealth Master',        'Complete 10 missions undetected',       '2024-02-20', 'Epic'),
(13, 2,  4,  'Quest Completionist',   'Finish all side quests',                '2024-02-22', 'Legendary'),
(14, 3,  1,  'Survival Expert',       'Survive for 30 minutes',                '2024-02-25', 'Rare'),
(15, 6,  4,  'Master of Magic',       'Learn all spells',                      '2024-03-30', 'Epic'),
(16, 7,  1,  'Squad Leader',          'Lead your team to 20 victories',        '2024-04-01', 'Epic'),
(17, 11, 1,  'Demolition Expert',     'Destroy 50 vehicles',                   '2024-03-05', 'Rare'),
(18, 11, 4,  'Champion of the Realm', 'Defeat all bosses',                     '2024-04-05', 'Legendary'),
(19, 15, 6,  'Zombie Killer',         'Eliminate 1000 zombies',                '2024-03-10', 'Epic'),
(20, 1,  13, 'Star Pilot',            'Win 10 galactic races',                 '2024-03-26', 'Rare'),
(21, 3,  12, 'Shadow Assassin',       'Complete all assassination contracts',  '2024-03-28', 'Legendary'),
(22, 5,  8,  'Chess Grandmaster',     'Win 50 chess matches',                  '2024-02-28', 'Rare'),
(23, 7,  2,  'MVP Champion',          'Win MVP award 5 times',                 '2024-03-01', 'Epic'),
(24, 10, 2,  'Tactician',             'Execute perfect strategies 20 times',   '2024-04-03', 'Epic'),
(25, 12, 4,  'Artifact Collector',    'Collect all legendary artifacts',       '2024-03-08', 'Legendary'),
(26, 15, 1,  'Survivor',              'Win with last man standing',            '2024-04-08', 'Rare'),
(27, 6,  1,  'Winning Streak',        'Win 5 matches consecutively',           '2024-01-22', 'Epic'),
(28, 8,  5,  'Speed Demon',           'Complete race under 2 minutes',         '2024-01-28', 'Rare'),
(29, 13, 1,  'Grenade Master',        'Eliminate 10 enemies with grenades',   '2024-02-12', 'Rare'),
(30, 22, 1,  'Headshot King',         'Achieve 100 headshots',                 '2024-03-22', 'Epic');

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    item_name VARCHAR(100) NOT NULL,
    amount DECIMAL(8,2) NOT NULL CHECK (amount >= 0),
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('Card','UPI','Wallet','PayPal')),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
)
INSERT INTO purchases (purchase_id, player_id, game_id, item_name, amount, purchase_date, payment_method) VALUES
(1,  1,  1,  'Battle Pass Season 5',       499.00,  '2024-01-10 10:00:00', 'UPI'),
(2,  1,  4,  'Legendary Sword Pack',       1299.00, '2024-01-15 14:30:00', 'Card'),
(3,  3,  2,  'Champion Skin Bundle',       799.00,  '2024-01-20 18:00:00', 'UPI'),
(4,  3,  4,  'Dragon Mount DLC',           1999.00, '2024-02-01 11:00:00', 'Card'),
(5,  7,  4,  'Ultimate Weapon Pack',       2499.00, '2024-02-08 16:00:00', 'Card'),
(6,  10, 1,  'Elite Sniper Skin',          599.00,  '2024-02-15 19:00:00', 'UPI'),
(7,  10, 13, 'Spaceship Upgrade',          1499.00, '2024-02-20 20:30:00', 'Wallet'),
(8,  11, 1,  'Tactical Gear Set',          899.00,  '2024-02-25 15:00:00', 'Card'),
(9,  11, 13, 'Galactic Expansion Pack',    1799.00, '2024-03-01 17:00:00', 'Card'),
(10, 12, 2,  'Hero Collection',            999.00,  '2024-03-05 12:00:00', 'UPI'),
(11, 12, 4,  'Magic Spell Book',           1199.00, '2024-03-10 14:00:00', 'PayPal'),
(12, 15, 1,  'Legendary Outfit',           699.00,  '2024-03-12 18:30:00', 'UPI'),
(13, 15, 6,  'Survival Kit Pro',           499.00,  '2024-03-15 20:00:00', 'Card'),
(14, 1,  12, 'Ninja Costume Pack',         899.00,  '2024-03-18 16:00:00', 'UPI'),
(15, 2,  4,  'Artifact Bundle',            1599.00, '2024-03-20 19:00:00', 'Card'),
(16, 6,  4,  'Enchanted Armor Set',        1899.00, '2024-03-22 11:00:00', 'Card'),
(17, 7,  1,  'Elite Battle Pass',          799.00,  '2024-03-25 17:30:00', 'UPI'),
(18, 3,  12, 'Shadow Assassin Bundle',     1399.00, '2024-03-28 15:00:00', 'Wallet'),
(19, 10, 4,  'Legendary Mount Pack',       2199.00, '2024-04-01 13:00:00', 'Card'),
(20, 11, 4,  'Ultimate Power Boost',       999.00,  '2024-04-05 18:00:00', 'UPI'),
(21, 13, 1,  'Weapon Skin Collection',     599.00,  '2024-02-18 16:00:00', 'UPI'),
(22, 17, 2,  'Champion Emote Pack',        299.00,  '2024-03-14 19:00:00', 'Wallet'),
(23, 22, 1,  'Pro Player Bundle',          1499.00, '2024-03-26 14:00:00', 'Card'),
(24, 5,  6,  'Zombie Apocalypse DLC',      799.00,  '2024-02-05 21:00:00', 'UPI'),
(25, 14, 6,  'Horror Survival Pack',       699.00,  '2024-02-20 22:30:00', 'PayPal');


-- ============================================================
-- END OF INSERT STATEMENTS
-- Total Records Inserted:
--   players      : 25 rows (Active, Inactive, Banned)
--   games        : 15 rows (Action, RPG, Strategy, MOBA, etc.)
--   matches      : 40 rows (Win, Loss, Draw across Solo/Duo/Squad/Team)
--   tournaments  : 10 rows (Completed, Ongoing, Upcoming)
--   achievements : 30 rows (Common, Rare, Epic, Legendary)
--   purchases    : 25 rows (Various in-game items and DLCs)
--
-- Note: Some players have no match history (good for LEFT JOIN)
--       Some games have no matches/tournaments (good for LEFT JOIN)
-- ============================================================

--11
INSERT INTO players VALUES
(26,'ProGamer12','progamer_new@gmail.com','Rahul Mehta','India','2024-01-10',20,5000,'Active'),
(27,'NinjaKillr','ninja_new@gmail.com','Amit Shah','India','2024-02-01',15,3000,'Active'),
(28,'LegendSlyer','legend_new@gmail.com','Kiran Patel','India','2024-03-05',22,6000,'Active');

--12
INSERT INTO games VALUES
(16,'Battle Storm','Action','2023-10-10','Ubisoft',4.4,999,100000),
(17,'Empire Tactics','Strategy','2024-01-15','EA Sports',4.2,799,80000);

--13
INSERT INTO matches VALUES
(41,1,1,'2024-04-10',2000,40,'Win','Solo'),
(42,2,2,'2024-04-11',1500,30,'Loss','Team'),
(43,3,4,'2024-04-12',2500,60,'Win','Squad'),
(44,4,5,'2024-04-13',1200,25,'Draw','Duo'),
(45,5,6,'2024-04-14',900,20,'Loss','Solo');

-- 14
INSERT INTO tournaments (tournament_name,game_id,start_date,end_date,prize_pool,winner_id,status)
VALUES ('Mega Battle Cup',1,'2024-02-01','2024-02-10',100000,NULL,'Ongoing');

--15
UPDATE players SET level=25, coins=coins+500 WHERE player_id=5;

--16
UPDATE players SET status='Inactive'
WHERE registration_date<'2023-01-01' AND level<5;

--17
UPDATE games SET price=price*1.10 WHERE genre='RPG';

--18
UPDATE tournaments SET winner_id=10, status='Completed'
WHERE tournament_id=3;

--19
DELETE FROM matches WHERE result='Loss' AND score<100;

--20
DELETE FROM achievements WHERE DATEDIFF(CURDATE(),earned_date) > 730;


--21
SELECT * FROM players;

--22
SELECT username,email,country FROM players

--23
SELECT * FROM players WHERE country='India'

--24
SELECT * FROM games WHERE rating>=4.0;

--25
SELECT * FROM matches WHERE result='Win';

--26
SELECT * FROM players WHERE level BETWEEN 10 AND 50;

--27
SELECT * FROM games WHERE price>500;

--28
SELECT * FROM tournaments WHERE status='Completed';

--29
SELECT * FROM players WHERE username LIKE 'Pro%';

--30
SELECT * FROM games WHERE genre IN ('Action','Strategy');

--31
SELECT * FROM purchases WHERE payment_method IN ('UPI','Card');

--32
SELECT * FROM achievements WHERE rarity='Legendary';

--33
SELECT * FROM players WHERE email LIKE '%@gmail.com';

--34
SELECT DISTINCT country FROM players;

--35
SELECT * FROM matches WHERE mode!='Solo';


--36
SELECT * FROM players ORDER BY level DESC

--37
SELECT * FROM games ORDER BY rating DESC, price ASC

--38
SELECT * FROM matches ORDER BY score DESC LIMIT 10

--39
SELECT * FROM tournaments ORDER BY prize_pool DESC

--40
SELECT * FROM purchases ORDER BY purchase_date DESC;

--41
SELECT p.username,g.game_name,m.score,m.result,m.match_date
FROM matches m
INNER JOIN players p ON m.player_id=p.player_id
INNER JOIN games g ON m.game_id=g.game_id;

--42
SELECT p.username,g.game_name,a.achievement_name,a.rarity,a.earned_date
FROM achievements a
JOIN players p ON a.player_id=p.player_id
JOIN games g ON a.game_id=g.game_id;

--43
SELECT p.username,g.game_name,pu.item_name,pu.amount,pu.purchase_date
FROM purchases pu
JOIN players p ON pu.player_id=p.player_id
JOIN games g ON pu.game_id=g.game_id;

--44
SELECT t.tournament_name,g.game_name,p.username,t.prize_pool,t.status
FROM tournaments t
JOIN games g ON t.game_id=g.game_id
LEFT JOIN players p ON t.winner_id=p.player_id;

--45
SELECT p.username,g.game_name,m.score,m.match_date
FROM matches m
JOIN players p ON m.player_id=p.player_id
JOIN games g ON m.game_id=g.game_id
WHERE m.score>1000;


--46
SELECT p.username,p.email
FROM players p LEFT JOIN matches m
ON p.player_id=m.player_id
WHERE m.match_id IS NULL;

--47
SELECT g.game_name,COUNT(m.match_id) match_count
FROM games g LEFT JOIN matches m
ON g.game_id=m.game_id
GROUP BY g.game_id;

--48
SELECT p.username,p.country
FROM players p LEFT JOIN achievements a
ON p.player_id=a.player_id
WHERE a.achievement_id IS NULL;

--49
SELECT g.game_name,COALESCE(SUM(pu.amount),0) revenue
FROM games g LEFT JOIN purchases pu
ON g.game_id=pu.game_id
GROUP BY g.game_id;

--50
SELECT t.tournament_name,p.username
FROM tournaments t LEFT JOIN players p
ON t.winner_id=p.player_id;


--51
SELECT p.username,g.game_name,m.score,m.result,m.duration_min,m.match_date
FROM players p JOIN matches m ON p.player_id=m.player_id
JOIN games g ON m.game_id=g.game_id;

--52
SELECT t.tournament_name,g.game_name,p.username,p.country,t.prize_pool,t.start_date,t.end_date
FROM tournaments t
JOIN games g ON t.game_id=g.game_id
LEFT JOIN players p ON t.winner_id=p.player_id;

--53
SELECT p.username,p.country,g.game_name,pu.item_name,pu.amount,pu.payment_method,pu.purchase_date
FROM purchases pu
JOIN players p ON pu.player_id=p.player_id
JOIN games g ON pu.game_id=g.game_id;

--54
SELECT p.username,g.game_name,m.score,m.match_date
FROM players p
JOIN matches m ON p.player_id=m.player_id
JOIN games g ON m.game_id=g.game_id
WHERE p.country='India' AND g.genre='Action' AND m.result='Win';

--55
SELECT p.username,g.game_name,a.achievement_name,a.rarity,g.rating
FROM achievements a
JOIN players p ON a.player_id=p.player_id
JOIN games g ON a.game_id=g.game_id
WHERE g.rating>4.0;


--56
SELECT p1.username,p2.username,p1.country
FROM players p1 JOIN players p2
ON p1.country=p2.country AND p1.player_id<p2.player_id;

--57
SELECT g1.game_name,g2.game_name,YEAR(g1.release_date)
FROM games g1 JOIN games g2
ON YEAR(g1.release_date)=YEAR(g2.release_date) AND g1.game_id<g2.game_id;


--58
SELECT * FROM players p LEFT JOIN matches m ON p.player_id=m.player_id
UNION
SELECT * FROM players p RIGHT JOIN matches m ON p.player_id=m.player_id;

--59
SELECT g.game_name,m.mode
FROM games g
CROSS JOIN (SELECT 'Solo' mode UNION SELECT 'Duo' UNION SELECT 'Squad' UNION SELECT 'Team') m;

--60
SELECT p.username,g.game_name
FROM players p CROSS JOIN games g LIMIT 20;


--61
SELECT COUNT(*) total_players FROM players;

--62
SELECT MAX(score) highest, MIN(score) lowest, AVG(score) average
FROM matches;

--63
SELECT SUM(amount) total_revenue FROM purchases;

--64
SELECT AVG(prize_pool) avg_prize
FROM tournaments WHERE status='Completed';

--65
SELECT rarity,COUNT(*) total FROM achievements GROUP BY rarity;


--66
SELECT p.username,COUNT(m.match_id) match_count
FROM players p JOIN matches m
ON p.player_id=m.player_id
GROUP BY p.player_id
ORDER BY match_count DESC;

--67
SELECT g.game_name,SUM(pu.amount) total_revenue
FROM games g JOIN purchases pu
ON g.game_id=pu.game_id
GROUP BY g.game_id
ORDER BY total_revenue DESC;

--68
SELECT result,COUNT(*) match_count
FROM matches GROUP BY result;

--69
SELECT p.username,COUNT(a.achievement_id) total
FROM players p JOIN achievements a
ON p.player_id=a.player_id
GROUP BY p.player_id HAVING COUNT(a.achievement_id)>3;

--70
SELECT g.game_name,COUNT(m.match_id) total_matches
FROM games g JOIN matches m
ON g.game_id=m.game_id
GROUP BY g.game_id HAVING COUNT(m.match_id)>10
ORDER BY total_matches DESC;