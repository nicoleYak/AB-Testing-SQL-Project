## ANALYZING DAILY METRICS OF EACH CAMPAIGN:

-- 1. Conversion rate analysis by day:

SELECT 
    date,
    campaign_name,
    daily_conversion_rate,
    CASE
        WHEN daily_conversion_rate BETWEEN 3.00 AND 5.00 THEN "Good"
        WHEN daily_conversion_rate BETWEEN 5.00 AND 10.00 THEN "Solid"
        WHEN daily_conversion_rate BETWEEN 10.00 AND 20.00 THEN "High"
        WHEN daily_conversion_rate > 20.00 THEN "Very High"
        ELSE ""
    END AS Rating
FROM (
    SELECT 
        date,
        campaign_name,
        ROUND(SUM(purchase) / SUM(website_clicks) * 100, 2) AS daily_conversion_rate
    FROM (
        SELECT 
            date,
            campaign_name,
            website_clicks,
            purchase
        FROM control_campaign
        UNION ALL
        SELECT 
            date,
            campaign_name,
            website_clicks,
            purchase
        FROM test_campaign
    ) AS combined_campaigns
    GROUP BY date, campaign_name
) AS rates
ORDER BY date, campaign_name;


-- 2. Daily Correlation Between Spend and Purchases:

SELECT 
	campaign_name,
    (COUNT(*) * SUM(spend_usd * purchase) - SUM(spend_usd) * SUM(purchase)) /
    (SQRT(COUNT(*) * SUM(spend_usd * spend_usd) - POWER(SUM(spend_usd), 2)) * 
     SQRT(COUNT(*) * SUM(purchase * purchase) - POWER(SUM(purchase), 2))) AS correlation_coefficient
FROM control_campaign
UNION ALL
SELECT 
	campaign_name,
    (COUNT(*) * SUM(spend_usd * purchase) - SUM(spend_usd) * SUM(purchase)) /
    (SQRT(COUNT(*) * SUM(spend_usd * spend_usd) - POWER(SUM(spend_usd), 2)) * 
     SQRT(COUNT(*) * SUM(purchase * purchase) - POWER(SUM(purchase), 2))) AS correlation_coefficient
FROM test_campaign;


--  3. Daily Comparison Between Reach and Purchases + what is the conversion rate from reach to purchases:

SELECT 
    date,
    campaign_name,
    SUM(reach) AS total_reach,
    SUM(purchase) AS total_purchases,
    SUM(purchase) / SUM(reach) * 100 AS conversion_rate
FROM (
    SELECT * FROM control_campaign
    UNION ALL
    SELECT * FROM test_campaign
) AS combined_campaigns
GROUP BY date, campaign_name
ORDER BY date, campaign_name;


## COMPARING BOTH CAMPAIGNS:

-- 1. How much was spent on each campaign total?

SELECT 
	campaign_name, 
    SUM(spend_usd) AS total_spent
FROM control_campaign
GROUP BY campaign_name
UNION
SELECT 
	campaign_name, 
    SUM(spend_usd) AS total_spent
FROM test_campaign
GROUP BY campaign_name;

-- 2. What are the total impression and reach of each campaign?

SELECT
    campaign_name,
    ROUND(SUM(impressions), 2) AS total_impressions,
    ROUND(SUM(reach), 2) AS total_reach
FROM (
    SELECT * FROM control_campaign
    UNION ALL
    SELECT * FROM test_campaign
) AS combined_campaigns
GROUP BY campaign_name;

-- 3. What are the average impressions and reach of each campaign?

SELECT
    campaign_name,
    ROUND(AVG(impressions), 2) AS average_impressions,
    ROUND(AVG(reach), 2) AS average_reach
FROM (
    SELECT * FROM control_campaign
    UNION ALL
    SELECT * FROM test_campaign
) AS combined_campaigns
GROUP BY campaign_name;

-- 4. Website engagement: Which ad campaign produced more website engagement?

SELECT
    campaign_name,
    SUM(website_clicks) AS total_clicks,
    SUM(searches) AS total_searches,
    SUM(view_content) AS total_content_views,
    SUM(add_to_cart) AS total_add_to_cart,
    -- Sum of all engagement metrics for total engagement
    SUM(website_clicks) + SUM(searches) + SUM(view_content) + SUM(add_to_cart) AS total_engagement
FROM (
    SELECT * FROM control_campaign
    UNION ALL
    SELECT * FROM test_campaign
) AS combined_campaign
GROUP BY campaign_name;

-- 5. Conversion rate: What is the conversion rate from clicks to purchases in each ad campaign?

SELECT
    campaign_name,
    SUM(website_clicks) AS total_clicks,
    SUM(purchase) AS total_purchases,
    ROUND(CASE 
        WHEN SUM(website_clicks) = 0 THEN 0 
        ELSE SUM(purchase) / SUM(website_clicks) * 100 
    END, 2) AS conversion_rate
FROM (
    SELECT 
        campaign_name,
        purchase,
        website_clicks
    FROM control_campaign
    UNION ALL
    SELECT 
        campaign_name,
        purchase,
        website_clicks
    FROM test_campaign
) AS combined_campaign
GROUP BY campaign_name;








