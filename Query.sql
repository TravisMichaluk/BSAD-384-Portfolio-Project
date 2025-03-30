SELECT 
    P.ProvCode, 
    AVG(C.IncomeLevel) AS AvgIncome
FROM 
    Province P
JOIN 
    Customer C ON P.ProvCode = C.ProvCode
GROUP BY 
    P.ProvCode
ORDER BY 
    AvgIncome DESC;

SELECT 
    G.ProgName, 
    SUM(G.BenefitAmount) AS TotalBenefits
FROM 
    GovSupportProgram G
GROUP BY 
    G.ProgName
ORDER BY 
    TotalBenefits DESC;

SELECT 
    C.Fname, 
    C.Lname, 
    F.Name AS ItemName, 
    CI.Quantity
FROM 
    CartItems CI
JOIN 
    Customer C ON CI.CustomerId = C.CustomerID
JOIN 
    FoodItem F ON CI.ItemID = F.ItemID
ORDER BY 
    C.Lname, C.Fname;

	
SELECT 
    C.Fname, 
    C.Lname, 
    G.ProgName AS SupportProgram
FROM 
    Customer C
JOIN 
    MayQualifyFor MQF ON C.CustomerID = MQF.CustomerID
JOIN 
    GovSupportProgram G ON MQF.ProgName = G.ProgName
WHERE 
    C.IncomeLevel < 60000  
ORDER BY 
    C.Lname, C.Fname;


SELECT 
    F.Name AS ItemName, 
    R.RetName AS RetailerName, 
    R.RetLocation
FROM 
    FoodItem F
JOIN 
    Retailers R ON F.RetailerID = R.RetailerID
ORDER BY 
    F.Name;





