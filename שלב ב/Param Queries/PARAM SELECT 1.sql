SELECT
    EXTRACT(MONTH FROM o.orderDate) AS Month,          
    EXTRACT(YEAR FROM o.orderDate) AS Year,            
    w.address AS Warehouse_Address,                    
    SUM(o.ordQuantity) AS Total_Quantity               
FROM Orders o
JOIN Warehouse w ON o.whId = w.whId                    
WHERE o.orderDate BETWEEN TO_DATE('&<name = "START date" list = "select distinct O.ORDERDATE FROM orders O ORDER BY O.ORDERDATE" 
hint = "parameter list">','DD/MM/YYYY') 
  AND TO_DATE('&<name = "END date" list = "select distinct O.ORDERDATE FROM orders O ORDER BY O.ORDERDATE" 
  hint = "parameter list">','DD/MM/YYYY')
  AND o.supplierId > &<name = "min supplier id" 
  list = "select distinct s.supplierid from suppliers s ORDER BY s.supplierid " 
  hint = "parameter list">
GROUP BY EXTRACT(MONTH FROM o.orderDate),              
         EXTRACT(YEAR FROM o.orderDate),               
         w.address                                     
ORDER BY EXTRACT(YEAR FROM o.orderDate),               
         EXTRACT(MONTH FROM o.orderDate),              
         w.address ASC;                                
