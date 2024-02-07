

--1 Compare the sales and orders on the basis of month 
 
 select datepart(MONTH, date) as Month ,sum(amount) as sales , COUNT(order_id) as orders from vrinda_store
 group by datepart(MONTH, date)
 order by Month ;

 

--2 Who purchased more- men or women in 2022?
 
  select top 1 gender ,sum(amount) as sales from vrinda_store
  where gender in ('Men', 'Women')
  group by gender
  order by sales desc ;
  

 --3 What are different order status in 2022?

   select status , count(order_id) as Orders from vrinda_store
   where DATEPART(YEAR,date) = '2022'
   group by status ;



--4 List top 5 states contributing to the sales?
    
	select Top 5 [ship-state] , sum (amount) as Sales from vrinda_store
	group by [ship-state]
	order by Sales desc ;



--5 Number of orders between genders based on age-group

	with cte as 
	(select [age group] ,count( order_id) as men_orders  from vrinda_store
	where gender = 'Men'
	group by [age group] )
	,cte_1 as (select [age group] , count( order_id) as women_orders from vrinda_store
    where gender = 'Women'
	group by [age group] )
	select c.[age group] ,c.men_orders , c1.women_orders from cte c
	inner join 
	cte_1 c1 on c.[age group] = c1.[age group] ;



--6 Which channel is contributing to maximum sales?

	select [channel ] ,round((sum(amount)/21175461)*100,1) as sales_percentage from vrinda_store
	group by [channel ] 
	order by sales_percentage desc ;


--7 Highest selling category?

    select top 1 category ,sum(amount) as sales from vrinda_store
	group by category
	order by sales desc ;

	
--8 Which month got the highest sales and orders?
 
 select top 1 month , sum(amount) as highest_sales , COUNT(order_id) as orders from vrinda_store
 group by month
 order by  highest_sales desc, orders desc ;
 
