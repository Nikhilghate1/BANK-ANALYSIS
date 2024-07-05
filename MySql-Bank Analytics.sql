use bank_analytics;
select * from finance_1;
select * from finance_2;

select count(*) from finance_1;
select count(*) from finance_2;

---- KPI 1
select year(issue_d) as year_of_issue_d,concat(format(round(sum(loan_amnt)/1000000,2),2), " M ") as Total_loan_amnt from finance_1 
group by year_of_issue_d order by year_of_issue_d;


---- KPI 2
select grade,sub_grade,concat(format(round(sum(revol_bal)/1000000,2),2), " M ") as total_revol_bal from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;


---- KPI 3
select verification_status ,
concat(format(round(sum(total_pymnt)/1000000,2),2), " M ") as total_payment
from finance_1 inner join finance_2 on
(finance_1.id = finance_2.id)
group by verification_status; 


---- KPI 4
select addr_state, month(issue_d) as month_of_issue_d,loan_status from finance_1;


---- KPI 5
select home_ownership, last_pymnt_d,
concat(format(round(sum(last_pymnt_amnt)/10000,2),2), " K " ) as Total_Amount 
from
finance_1 inner join finance_2 on finance_1.id=finance_2.id
group by home_ownership,last_pymnt_d
order by last_pymnt_d desc,home_ownership desc;
