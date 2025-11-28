select count(*) from maritime_connectivity;
select * from maritime_connectivity;

--  1. ECONOMIES WITH THE HIGHEST AVERAGE LSCI (BEST GLOBAL MARITIME CONNECTIVITY)

select economy, round(avg(LSCI), 2) as avg_LSCI
from maritime_connectivity
group by economy
order by avg_LSCI desc limit 10; -- China has the highest average LSCI by far at 957.66, followed by Singapore at 567.89


-- 2. ECONOMIES WITH THE HIGHEST AVERAGE LCSI FOR EACH YEAR

with yearly_average as (
    select `year`, economy, round(avg(LSCI), 2) as avg_LSCI
    from maritime_connectivity
    group by `year`, economy
),
ranked_average as (
    select *, row_number() over(partition by `year` order by avg_LSCI desc) as rank_in_year
    from yearly_average
)
select `year`, economy, avg_LSCI
from ranked_average
where rank_in_year = 1
order by `year` desc; -- China has consistently had the LSCI average since 2006 to 2025


-- 3. ECONOMIES WITH THE LOWEST AVERAGE LSCI

select economy, round(avg(LSCI), 2) as avg_LSCI
from maritime_connectivity
group by economy
order by avg_LSCI asc limit 10; -- The Dem. People's Rep. of Korea has the lowest average LSCI at only 3.32

-- 4. ECONOMIES WITH THE LOWEST AVERAGE LSCI FOR EACH YEAR
with yearly_average as (
    select `year`, economy, round(avg(LSCI), 2) as avg_LSCI
    from maritime_connectivity
    where LSCI is not null
    group by `year`, economy
),
ranked_average as (
    select *, row_number() over(partition by `year` order by avg_LSCI asc) as rank_in_year
    from yearly_average
)
select `year`, economy, avg_LSCI
from ranked_average
where rank_in_year = 1 
order by `year` desc; -- Norfolk Island and Republic of Moldova have had the lowest LSCI most of the years

-- 5. CHANGES IN GLOBAL SHIPPING CONNECTIVITY OVER THE YEARS

select 	`year`, round(avg(LSCI), 2) as avg_LSCI
from maritime_connectivity
group by `year`
order by `year`; -- The average LSCI has been on a somewhat steady rise and was lowest in 2016 and highest in 2025. It crossed the 100 mark in 2023. There was a slight drop in the covid years

-- 6. CHECKING THE LSCI AVERAGE BY CONTINENT
select continent, round(avg(LSCI), 2) as avg_LSCI
from maritime_connectivity
group by continent
order by avg_LSCI desc; -- Asia has the highest index average and Oceania has the lowest

-- 7. LSCI AVERAGE OF DIFFERENT CONTINENTS OVER THE YEARS
with yearly_average as (
    select `year`, continent, round(avg(LSCI), 2) as avg_LSCI
    from maritime_connectivity
    group by `year`, continent
),
ranked_average as (
    select *, row_number() over(partition by `year` order by avg_LSCI desc) as rank_in_year
    from yearly_average
)
select `year`, continent, avg_LSCI
from ranked_average
order by `year` desc; -- Asia has consistently had the highest LSCI average over the years while Oceania has had the lowest


-- 8. FINDING ECONOMIES WITH THE FASTEST GROWING MARITIME CONNECTIVITY (CAGR)
with ranked as (
    select
        economy,
        year,
        lsci,
        row_number() over (partition by economy order by `year` asc) as rn_first,
        row_number() over (partition by economy order by `year` desc) as rn_last
    from maritime_connectivity
    where lsci is not null
),
first_last as (
    select
        f.economy,
        f.`year` as first_year,
        l.`year` as last_year,
        f.lsci as first_lsci,
        l.lsci as last_lsci
    from ranked f
    join ranked l
        on f.economy = l.economy
       and f.rn_first = 1
       and l.rn_last = 1
)
select
    economy,
    first_year,
    last_year,
    round(first_lsci, 2) as starting_lsci,
    round(last_lsci, 2) as ending_lsci,
    (last_year - first_year) as years,
    round((pow(last_lsci / first_lsci, 1.0 / (last_year - first_year)) - 1) * 100, 2) as cagr_percentage
from first_last
where first_lsci > 0
  and last_year > first_year
  and (last_year - first_year) >= 5
order by cagr_percentage desc
limit 20; -- Iraq has the highest growing maritime connectivity with a CAGR of 13.51%, followed by Morroco at 7.31%


-- 9. ECONOMIES WITH THE LOWEST CAGR (SLOWEST GROWTH IN MARITIME CONNECTIVITY)
with ranked as (
    select
        economy,
        year,
        lsci,
        row_number() over (partition by economy order by `year` asc) as rn_first,
        row_number() over (partition by economy order by `year` desc) as rn_last
    from maritime_connectivity
    where lsci is not null
),
first_last as (
    select
        f.economy,
        f.`year` as first_year,
        l.`year` as last_year,
        f.lsci as first_lsci,
        l.lsci as last_lsci
    from ranked f
    join ranked l
        on f.economy = l.economy
       and f.rn_first = 1
       and l.rn_last = 1
)
select
    economy,
    first_year,
    last_year,
    round(first_lsci, 2) as starting_lsci,
    round(last_lsci, 2) as ending_lsci,
    (last_year - first_year) as years,
    round((pow(last_lsci / first_lsci, 1.0 / (last_year - first_year)) - 1) * 100, 2) as cagr_percentage
from first_last
where first_lsci > 0
  and last_year > first_year
  and (last_year - first_year) >= 5
order by cagr_percentage asc
limit 20; -- Venezuela tops this list with a CAGR of -5.6%, followed by Ukraine at -4.52%. The list also has some economic giants like Germany (-2.1%) & China, Hong Kong (-2.22%) 


-- 10. HOW AFRICA'S CONNECTIVITY HAS CHANGED OVER THE YEARS

select `year`, round(avg(LSCI), 2) 
from maritime_connectivity
where continent = 'Africa'
group by `year`
order by `year` desc; -- Africa's connectivity went from 46 in 2006 to 62 in 2025 and is on an upward trajectory

-- Leading countries in connectivity in Africa

select economy, round(avg(LSCI), 2) avg_LSCI
from maritime_connectivity
where continent = 'Africa'
group by economy
order by avg_LSCI desc limit 10; -- Egypt has the highest average LSCI at 229.22, followed by Morocco at 186.98 and South Africa at 129.15

-- Lowest connectivity in Africa
select economy, round(avg(LSCI), 2) avg_LSCI
from maritime_connectivity
where continent = 'Africa'
group by economy
order by avg_LSCI asc limit 10; -- Saint Helena has the lowest average at 3.44