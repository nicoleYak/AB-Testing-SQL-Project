CREATE DATABASE AB_Testing;
USE AB_Testing;

CREATE TABLE control_campaign (
    campaign_name VARCHAR(255),
    date DATE,
    spend_usd DECIMAL(10, 2),
    impressions INT,
    reach INT,
    website_clicks INT,
    searches INT,
    view_content INT,
    add_to_cart INT,
    purchase INT
);

CREATE TABLE test_campaign (
    campaign_name VARCHAR(255),
    date DATE,
    spend_usd DECIMAL(10, 2),
    impressions INT,
    reach INT,
    website_clicks INT,
    searches INT,
    view_content INT,
    add_to_cart INT,
    purchase INT
);


INSERT INTO control_campaign (campaign_name, date, spend_usd, impressions, reach, website_clicks, searches, view_content, add_to_cart, purchase) VALUES
('Control Campaign', STR_TO_DATE('1.08.2019', '%d.%m.%Y'), 2280, 82702, 56930, 7016, 2290, 2159, 1819, 618),
('Control Campaign', STR_TO_DATE('2.08.2019', '%d.%m.%Y'), 1757, 121040, 102513, 8110, 2033, 1841, 1219, 511),
('Control Campaign', STR_TO_DATE('3.08.2019', '%d.%m.%Y'), 2343, 131711, 110862, 6508, 1737, 1549, 1134, 372),
('Control Campaign', STR_TO_DATE('4.08.2019', '%d.%m.%Y'), 1940, 72878, 61235, 3065, 1042, 982, 1183, 340),
('Control Campaign', STR_TO_DATE('5.08.2019', '%d.%m.%Y'), 1835, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Control Campaign', STR_TO_DATE('6.08.2019', '%d.%m.%Y'), 3083, 109076, 87998, 4028, 1709, 1249, 784, 764),
('Control Campaign', STR_TO_DATE('7.08.2019', '%d.%m.%Y'), 2544, 142123, 127852, 2640, 1388, 1106, 1166, 499),
('Control Campaign', STR_TO_DATE('8.08.2019', '%d.%m.%Y'), 1900, 90939, 65217, 7260, 3047, 2746, 930, 462),
('Control Campaign', STR_TO_DATE('9.08.2019', '%d.%m.%Y'), 2813, 121332, 94896, 6198, 2487, 2179, 645, 501),
('Control Campaign', STR_TO_DATE('10.08.2019', '%d.%m.%Y'), 2149, 117624, 91257, 2277, 2475, 1984, 1629, 734),
('Control Campaign', STR_TO_DATE('11.08.2019', '%d.%m.%Y'), 2490, 115247, 95843, 8137, 2941, 2486, 1887, 475),
('Control Campaign', STR_TO_DATE('12.08.2019', '%d.%m.%Y'), 2319, 116639, 100189, 2993, 1397, 1147, 1439, 794),
('Control Campaign', STR_TO_DATE('13.08.2019', '%d.%m.%Y'), 2697, 82847, 68214, 6554, 2390, 1975, 1794, 766),
('Control Campaign', STR_TO_DATE('14.08.2019', '%d.%m.%Y'), 1875, 145248, 118632, 4521, 1209, 1149, 1339, 788),
('Control Campaign', STR_TO_DATE('15.08.2019', '%d.%m.%Y'), 2774, 132845, 102479, 4896, 1179, 1005, 1641, 366),
('Control Campaign', STR_TO_DATE('16.08.2019', '%d.%m.%Y'), 2024, 71274, 42859, 5224, 2427, 2158, 1613, 438),
('Control Campaign', STR_TO_DATE('17.08.2019', '%d.%m.%Y'), 2177, 119612, 106518, 6628, 1756, 1642, 878, 222),
('Control Campaign', STR_TO_DATE('18.08.2019', '%d.%m.%Y'), 1876, 108452, 96518, 7253, 2447, 2115, 1695, 243),
('Control Campaign', STR_TO_DATE('19.08.2019', '%d.%m.%Y'), 2596, 107890, 81268, 3706, 2483, 2098, 908, 542),
('Control Campaign', STR_TO_DATE('20.08.2019', '%d.%m.%Y'), 2675, 113430, 78625, 2578, 1001, 848, 1709, 299),
('Control Campaign', STR_TO_DATE('21.08.2019', '%d.%m.%Y'), 1803, 74654, 59873, 5691, 2711, 2496, 1460, 800),
('Control Campaign', STR_TO_DATE('22.08.2019', '%d.%m.%Y'), 2939, 105705, 86218, 6843, 3102, 2988, 819, 387),
('Control Campaign', STR_TO_DATE('23.08.2019', '%d.%m.%Y'), 2496, 129880, 109413, 4410, 2896, 2496, 1913, 766),
('Control Campaign', STR_TO_DATE('24.08.2019', '%d.%m.%Y'), 1892, 72515, 51987, 4085, 1274, 1149, 1146, 585),
('Control Campaign', STR_TO_DATE('25.08.2019', '%d.%m.%Y'), 1962, 117006, 100398, 4234, 2423, 2096, 883, 386),
('Control Campaign', STR_TO_DATE('26.08.2019', '%d.%m.%Y'), 2233, 124897, 98432, 5435, 2847, 2421, 1448, 251),
('Control Campaign', STR_TO_DATE('27.08.2019', '%d.%m.%Y'), 2061, 104678, 91579, 4941, 3549, 3249, 980, 605),
('Control Campaign', STR_TO_DATE('28.08.2019', '%d.%m.%Y'), 2421, 141654, 125874, 6287, 1672, 1589, 1711, 643),
('Control Campaign', STR_TO_DATE('29.08.2019', '%d.%m.%Y'), 2375, 92029, 74192, 8127, 4891, 4219, 1486, 334),
('Control Campaign', STR_TO_DATE('30.08.2019', '%d.%m.%Y'), 2324, 111306, 88632, 4658, 1615, 1249, 442, 670);

INSERT INTO test_campaign (campaign_name, date, spend_usd, impressions, reach, website_clicks, searches, view_content, add_to_cart, purchase) VALUES
('Test Campaign', STR_TO_DATE('1.08.2019', '%d.%m.%Y'), 3008, 39550, 35820, 3038, 1946, 1069, 894, 255),
('Test Campaign', STR_TO_DATE('2.08.2019', '%d.%m.%Y'), 2542, 100719, 91236, 4657, 2359, 1548, 879, 677),
('Test Campaign', STR_TO_DATE('3.08.2019', '%d.%m.%Y'), 2365, 70263, 45198, 7885, 2572, 2367, 1268, 578),
('Test Campaign', STR_TO_DATE('4.08.2019', '%d.%m.%Y'), 2710, 78451, 25937, 4216, 2216, 1437, 566, 340),
('Test Campaign', STR_TO_DATE('5.08.2019', '%d.%m.%Y'), 2297, 114295, 95138, 5863, 2106, 858, 956, 768),
('Test Campaign', STR_TO_DATE('6.08.2019', '%d.%m.%Y'), 2458, 42684, 31489, 7488, 1854, 1073, 882, 488),
('Test Campaign', STR_TO_DATE('7.08.2019', '%d.%m.%Y'), 2838, 53986, 42148, 4221, 2733, 2182, 1301, 890),
('Test Campaign', STR_TO_DATE('8.08.2019', '%d.%m.%Y'), 2916, 33669, 20149, 7184, 2867, 2194, 1240, 431),
('Test Campaign', STR_TO_DATE('9.08.2019', '%d.%m.%Y'), 2652, 45511, 31598, 8259, 2899, 2761, 1200, 845),
('Test Campaign', STR_TO_DATE('10.08.2019', '%d.%m.%Y'), 2790, 95054, 79632, 8125, 2312, 1804, 424, 275),
('Test Campaign', STR_TO_DATE('11.08.2019', '%d.%m.%Y'), 2420, 83633, 71286, 3750, 2893, 2617, 1075, 668),
('Test Campaign', STR_TO_DATE('12.08.2019', '%d.%m.%Y'), 2831, 124591, 10598, 8264, 2081, 1992, 1382, 709),
('Test Campaign', STR_TO_DATE('13.08.2019', '%d.%m.%Y'), 1972, 65827, 49531, 7568, 2213, 2058, 1391, 812),
('Test Campaign', STR_TO_DATE('14.08.2019', '%d.%m.%Y'), 2537, 56304, 25982, 3993, 1979, 1059, 779, 340),
('Test Campaign', STR_TO_DATE('15.08.2019', '%d.%m.%Y'), 2516, 94338, 76219, 4993, 2537, 1609, 1090, 398),
('Test Campaign', STR_TO_DATE('16.08.2019', '%d.%m.%Y'), 3076, 106584, 81389, 6800, 2661, 2594, 1059, 487),
('Test Campaign', STR_TO_DATE('17.08.2019', '%d.%m.%Y'), 1968, 95843, 54389, 7910, 1995, 1576, 383, 238),
('Test Campaign', STR_TO_DATE('18.08.2019', '%d.%m.%Y'), 1979, 53632, 43241, 6909, 2824, 2522, 461, 257),
('Test Campaign', STR_TO_DATE('19.08.2019', '%d.%m.%Y'), 2626, 22521, 10698, 7617, 2924, 2801, 788, 512),
('Test Campaign', STR_TO_DATE('20.08.2019', '%d.%m.%Y'), 2712, 39470, 31893, 6050, 2061, 1894, 1047, 730),
('Test Campaign', STR_TO_DATE('21.08.2019', '%d.%m.%Y'), 3112, 133771, 109834, 5471, 1995, 1868, 278, 245),
('Test Campaign', STR_TO_DATE('22.08.2019', '%d.%m.%Y'), 2899, 34752, 27932, 4431, 1983, 1131, 367, 276),
('Test Campaign', STR_TO_DATE('23.08.2019', '%d.%m.%Y'), 2407, 60286, 49329, 5077, 2592, 2004, 632, 473),
('Test Campaign', STR_TO_DATE('24.08.2019', '%d.%m.%Y'), 2078, 36650, 30489, 7156, 2687, 2427, 327, 269),
('Test Campaign', STR_TO_DATE('25.08.2019', '%d.%m.%Y'), 2928, 120576, 105978, 3596, 2937, 2551, 1228, 651),
('Test Campaign', STR_TO_DATE('26.08.2019', '%d.%m.%Y'), 2311, 80841, 61589, 3820, 2037, 1046, 346, 284),
('Test Campaign', STR_TO_DATE('27.08.2019', '%d.%m.%Y'), 2915, 111469, 92159, 6435, 2976, 2552, 992, 771),
('Test Campaign', STR_TO_DATE('28.08.2019', '%d.%m.%Y'), 2247, 54627, 41267, 8144, 2432, 1281, 1009, 721),
('Test Campaign', STR_TO_DATE('29.08.2019', '%d.%m.%Y'), 2805, 67444, 43219, 7651, 1920, 1240, 1168, 677),
('Test Campaign', STR_TO_DATE('30.08.2019', '%d.%m.%Y'), 1977, 120203, 89380, 4399, 2978, 1625, 1034, 572);


SELECT * FROM control_campaign;
SELECT * FROM test_campaign;

-- Deleting a row with a null value
DELETE FROM control_campaign WHERE date='2019-08-05';

