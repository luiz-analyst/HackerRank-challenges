Select S.Name
From ( Students S join Friends F using(ID)
 join Packages P1 on S.ID=P1.ID
 join Packages P2 on F.Friend_ID=P2.ID)
Where P2.Salary > P1.Salary
Order By P2.Salary;
