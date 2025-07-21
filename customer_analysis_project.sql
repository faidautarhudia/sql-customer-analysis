Create Database Marketing_Analysis ;

Show Tables;
select * from ifood_df;

# Total Komplen
Select count(*) as Total_Komplain
from ifood_df
where Complain = 1;

# Rata-Rata pengeluaran
Select avg(MntTotal) as Avg_pengeluaran_pelanggan
from ifood_df;

# Jumlah Pelanggan Berdasarkan status pernikahan
select 'marital_single' as status,
count(*) as total_single
from ifood_df
where marital_single = 1

union all

select 'marital_married',
count(*) as total_married
from ifood_df
where marital_married = 1

union all

select 'marital_divorce', 
count(*) as total_divorced
from ifood_df
where marital_divorced = 1

union all

select 'marital_together',
count(*) as total_together
from ifood_df
where marital_together = 1

union all

select 'marital_widow',
count(*) as total_widow
from ifood_df
where marital_widow = 1;

describe ifood_df;

# 10 pelanggan dengan Pengeluaran Tertinggi
select Age, mnttotal
from ifood_df
order by mnttotal desc
limit 10;

# Rata rata pengeluaran wine dengan daging
select 
avg(mntmeatproducts) as rata2_pembelian_daging,
avg(mntwines) as rata2_pembelian_wines
from ifood_df;

# Jumlah pelanggan yang tidak pernah beli via web
select 'numwebpurchases',
count(*) as tidak_beli_diweb
from ifood_df
where numwebpurchases = 0;

# Segmentasi Usia pelanggan
Select '<30' as age_group,
count(*) as total_pelanggan
from ifood_df
where age < 30

union all

Select '>30 and <50' as age_group,
count(*) as total_pelanggan
from ifood_df
where age > 30 and age < 50

Union all

Select '>50' as age_group,
count(*) as total_pelanggan
from ifood_df
where age > 50;

# produk favorit setiap segmen pendidikan

select 'Sarjana' as Pendidikan,
sum(MntWines) AS Wines,
SUM(MntFruits) AS Fruits,
SUM(MntMeatProducts) AS Meat,
SUM(MntFishProducts) AS Fish,
SUM(MntSweetProducts) AS Sweets,
SUM(MntGoldProds) AS Gold
from ifood_df
where education_basic = 1

union all

select 'Master' as Pendidikan,
sum(MntWines) AS Wines,
SUM(MntFruits) AS Fruits,
SUM(MntMeatProducts) AS Meat,
SUM(MntFishProducts) AS Fish,
SUM(MntSweetProducts) AS Sweets,
SUM(MntGoldProds) AS Gold
from ifood_df
where education_master = 1

union all

select 'Double Degree' as Pendidikan,
sum(MntWines) AS Wines,
SUM(MntFruits) AS Fruits,
SUM(MntMeatProducts) AS Meat,
SUM(MntFishProducts) AS Fish,
SUM(MntSweetProducts) AS Sweets,
SUM(MntGoldProds) AS Gold
from ifood_df
where education_2nCycle = 1

union all

select 'phD' as Pendidikan,
sum(MntWines) AS Wines,
SUM(MntFruits) AS Fruits,
SUM(MntMeatProducts) AS Meat,
SUM(MntFishProducts) AS Fish,
SUM(MntSweetProducts) AS Sweets,
SUM(MntGoldProds) AS Gold
from ifood_df
where education_phD = 1

union all

select 'Lulus' as Pendidikan,
sum(MntWines) AS Wines,
SUM(MntFruits) AS Fruits,
SUM(MntMeatProducts) AS Meat,
SUM(MntFishProducts) AS Fish,
SUM(MntSweetProducts) AS Sweets,
SUM(MntGoldProds) AS Gold
from ifood_df
where education_graduation = 1;

describe ifood_df;

# Pelanggan Setia
select 'pelanggan setia' as pelanggan,
count(*) as jumlah_pelanggan
from ifood_df
where (numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) >20

union all 

select 'pelanggan tidak setia',
count(*) as jumlah_pelanggan
from ifood_df
where (numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) <20;

# Analisis kampanye marketing
SELECT response,
  COUNT(*) AS jumlah_pelanggan
FROM ifood_df
WHERE (AcceptedCmp1 + AcceptedCmp2 + AcceptedCmp3 + AcceptedCmp4 + AcceptedCmp5) > 1
GROUP BY Response;

