## Evaluating Marketing Campaign Effectiveness

**The Objective:** 
My goal is to determine the effectiveness of two marketing campaigns, Control and Test, in driving customer engagement and conversions. I will analyze various metrics to see which campaign performed better.

**A successful outcome:** 
A successful outcome would show that the Test campaign leads to better customer engagement and higher conversions than the Control campaign.

**Metrics to quantify success:**

1. **Website Clicks** – Higher number of clicks indicates better engagement.
2. **Searches** – More searches suggest increased interest in products.
3. **View Content** – Indicates more product views.
4. **Add to Cart** – Measures intent to purchase.
5. **Purchase** – Final measure of conversion success.

## Analysis Process

### Campaign Comparison:
### 

1. **How much was spent on each campaign total?**

```sql
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
GROUP BY campaign_name
```

In total, the company spent 66,818$ on the control campaign, 
and 76,892$ on the test campaign.


2. **What are the total impressions and reach of each campaign?**

```sql
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
```

![Screenshot 2024-09-29 at 12.04.18.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1491165a-2f6e-4403-9f5f-0afd62357fd3/3942d596-565b-411d-beef-9989295c44c9/Screenshot_2024-09-29_at_12.04.18.png)

In total, there were 3,177,233 impressions in the control campaign,
and 2,237,544 impressions in the test campaign.

As with the reach of each campaign, the ads reached 2,576,503 unique users in the control campaign, and 1,604,747 unique users in the test campaign.

**Quick conclusion:**

Right of the bat, I can see that the control campaign reached way more unique users than the test campaign. In fact, approximately 60.57% more!

And all of this, while the total spending on the control campaign was actually lower than the spending on the test campaign.

My conclusion from this (so far) is that spending more doesn’t increase the reach of the ad campaign, and this may indicate that additional spending is not impactful.

Let’s continue with the analysis…

3.  **What are the average impressions and reach of each campaign?**

```sql
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
```

![Screenshot 2024-09-29 at 12.20.43.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1491165a-2f6e-4403-9f5f-0afd62357fd3/109083b7-80f2-4d36-936b-5dcc18fff5f3/Screenshot_2024-09-29_at_12.20.43.png)

On average, the control campaign crossed through 109,559 impressions,
while the test campaign crossed through 74,584 impressions.

And on average, the control campaign reached 88,844 unique users,
while the test camapaign reached 53,491 unique users on average.

Again, it seems as if the control campaign was way more successful in terms of 
reaching more users.

4.  **Website engagement:** Which ad campaign produced more website engagement?

```sql
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
```

![Screenshot 2024-09-29 at 12.39.22.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1491165a-2f6e-4403-9f5f-0afd62357fd3/d4d93647-8048-469c-b1d9-a34c88de66b3/Screenshot_2024-09-29_at_12.39.22.png)

Now things take a turn. The total engagement in the control ad campaign is actually lower than the total engagement in the test ad campaign. Approximately **6.84% lower!**

Even though **the reach of the test campaign is lower** than the reach of the control campaign, 
**the total website engagement is higher**!

5.  **Conversion rate:** What is the conversion rate from clicks to purchases 
in each ad campaign?

```sql
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
```

![Screenshot 2024-09-29 at 13.19.17.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1491165a-2f6e-4403-9f5f-0afd62357fd3/8391cc54-7319-42f2-b6df-ebcc1d8e5702/Screenshot_2024-09-29_at_13.19.17.png)

Based on the results of the analysis, looking at the control ad campaign, the website had 15,161 purchases from 154,303 website clicks, indicating that **9.83%** of the visitors took the desired action. As with the test ad campaign, the website had 15,637 purchases from 180,970 website clicks, indicating that **8.64%** of the visitors that came through the ad took the desired action.

When comparing the conversion rate, I can see that the control ad campaign resulted in a higher conversion rate, bringing us back to the question whether or not the ad budget is being used effectively.

**Potential reasons for performance differences (& recommendations):**

So far, I came to a few conclusions:

- The **total reach** of the control campaign was higher than the test campaign.
- The **company spent less** on the control campaign and more on the test campaign.
- The test ad campaign has **produced more engagement** than the control ad campaign.
- The **conversion rate** of the control campaign is higher than the one of the test campaign.

*To my understanding, there might be a few potential reasons for the performance differences:*

1. **Targeting -** The target audience on one campaign might be different than the target audience on the second campaign. Since the control ad campaign seems to be more successful, I would recommend running the test ad campaign again, but with the same target audience as the control ad’s campaign. If this doesn’t produce better marketing results, I would recommend further analysis of the test campaign engagement results, and the reason it was higher than the control campaign engagement results. If the call to action is different than the control campaign, I would start there.
2. **Messaging -** The messaging on the ad of the control campaign might not be as strong as the messaging on the ad of the test campaign, since the total clicks of the test campaign were much higher than the control campaign. I would start by running the test campaign with the same messaging as before, but change the messaging on the website, since the conversion rate was higher with the control campaign.

### Daily Metrics Analysis:

1. **Conversion rate analysis by day -** Calculating the conversion rate from website_clicks to purchases for each day:

```sql
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
```

My goal with this question was to track how effective each day’s ad spend was in converting clicks into purchases. I set up a “scoring” system to see which of the conversion rates are good, solid, high or very high. The good news are there are no low conversion rates, with the lowest conversion rate being 3% which is considered quite high for E-commerce!

There are some outliers, with conversion rates being higher than 20%.

There might be some potential explanations for these extremely high conversion rate days:

- High conversion rates on certain days could indicate better-aligned audience targeting, resulting in higher engagement and purchases.
- External factors like time-limited discounts or exclusive deals may have incentivized users to convert at a higher rate.
- High conversion rates could align with specific holidays, events, or seasonal trends. For example, Black Friday!
- A trending topic, influencer shoutout, or viral moment could have encouraged more visitors to click and purchase on those days.

It seems as if August 10th was the most successfull day within the control campaign, since it was the day with the lowest number of website clicks, and the highest conversion rate.


2. **Daily Correlation Between Spend and Purchases:**

```sql
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
```

![Screenshot 2024-09-30 at 12.15.14.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/1491165a-2f6e-4403-9f5f-0afd62357fd3/4c13014f-99be-444b-bc32-2f3327eabcd3/Screenshot_2024-09-30_at_12.15.14.png)

The low values of **0.04299** and **0.0282** suggest that there is **little to no linear correlation** between the amount spent on ads and the number of purchases, meaning that changes in ad budget do not have a strong, consistent effect on purchases in a simple linear fashion.

3. **Daily Comparison Between Reach and Purchases +** what is the conversion rate from reach to purchases?

```sql
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
```

When comparing the reach of the control ad campaign with the website purchases, 
**I come to a few observations:**

- The total reach varies greatly from day to day. For example, on 2019-08-03, the reach was over **110,000**, while on 2019-08-18, it was as low as **42,859**.
- High reach days like 2019-08-03 (110,662) do not necessarily correspond to significantly higher purchases (372).
- Despite the large daily fluctuations in reach, the number of purchases remains somewhat stable but follows a similar fluctuating pattern.
- There are some days when a lower reach led to more purchases (e.g., 2019-08-01, **56,930** reach but **618** purchases), while higher reach days did not always lead to a proportional increase in purchases.
- **Low Conversion Rates**: The conversion rates across all days are generally quite low, mostly below **1%**, which suggests that for every 100 people reached, fewer than 1 person makes a purchase on most days.
- Inconsistent Relationship Between Reach and Purchases: The relationship between reach and purchases does not show a clear linear pattern. There are days where increased reach led to more purchases (like 2019-08-01) but also days where higher reach did not yield significantly more purchases.

**Recommendations:**

- **Possible Saturation or Irrelevant Audience**: On days with higher reach but lower conversion rates, it could be that the ad reached people who were either uninterested or not part of the target demographic. This can suggest that spending more to increase reach might not always be effective if the target audience isn’t being properly engaged.
- **Analysis by Segment**: It might be helpful to analyze specific segments of the audience (e.g., demographics, geography, or behavior) to determine if a more targeted ad strategy would result in higher conversions.

In summary, the data shows **inconsistent results** between increased reach and purchases, and conversion rates remain **low**. A more targeted approach, rather than just increasing reach, may yield better results.

Now comparing the results of the control campaign to the results of the test campaign, 
here are the **key insights:**

- The **conversion rates** in the Test Campaign exhibit some unusually high spikes. For example, on **2019-08-12**, the conversion rate is **6.689%**, and on **2019-08-14**, it's **13.022%**, compared to much lower average rates in the Control Campaign. This suggests that, on certain days, a much higher proportion of the audience reached is converting into purchases.
- The Test Campaign shows **much greater volatility** in conversion rates, swinging from **0.221%** (2019-08-21) to **6.689%**(2019-08-12), and even **13.022%** (2019-08-14). This is in contrast to the Control Campaign, where the conversion rate generally stays below **1%**, with more consistent day-to-day fluctuations. The significant spikes in certain days raise questions about what happened on those specific days—whether there was a special promotion, discount, or audience shift.
- The higher conversion rates on days with lower reach may suggest that the Test Campaign is better at **targeting the right audience** at certain times.

**Recommendations:**

- The Test Campaign appears to have **greater potential for optimizing ad spend** based on specific days when the conversion rate spikes. If the patterns behind these high-conversion days can be identified, the budget could be adjusted to focus more on these effective times.
- While the Test Campaign has higher peaks, it also has days with extremely low conversion rates (e.g., 2019-08-21 at **0.221%**). The volatility indicates that consistency is still an issue, and more data might be needed to understand why some days underperform drastically.

The Test Campaign has **much higher potential** in terms of daily conversions compared to the Control Campaign, but it also shows **greater volatility**.
