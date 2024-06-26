SELECT
    au.uName AS Unit_Name,
    e.Name AS Equipment_Name,                 
    s.Name AS Supplier_Name,
    w.address AS Warehouse_Address,             
    SUM(o.ordQuantity) AS Total_Quantity        
FROM Orders o
            JOIN armyUnit au ON o.unitId = au.unitId        
            JOIN Equipment e ON o.eqtId = e.eqtId           
            JOIN Suppliers s ON o.supplierId = s.supplierId 
            JOIN Warehouse w ON o.whId = w.whId             
WHERE o.orderDate BETWEEN TO_DATE('&<name = "START date" list = "select distinct O.ORDERDATE FROM orders O ORDER BY O.ORDERDATE" hint = 
"parameter list">','DD/MM/YYYY') 
AND TO_DATE('&<name = "END date" list = "select distinct O.ORDERDATE FROM orders O ORDER BY O.ORDERDATE" hint = "parameter list">','DD/MM/YYYY') 
  AND o.supplierId > &<name = "min supplier id" list = "select distinct s.supplierid from suppliers s ORDER BY s.supplierid " 
  hint = "parameter list">                
GROUP BY au.uName, e.Name, s.Name, w.address    
ORDER BY Total_Quantity DESC,                  
         au.uName ASC,
         e.Name ASC,
         s.Name ASC,
         w.address ASC;
