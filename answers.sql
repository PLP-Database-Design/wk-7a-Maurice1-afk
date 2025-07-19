/*Question 1 Achieving 1NF (First Normal Form)/*
SELECT 
  OrderID,
  CustomerName,
  LTRIM(RTRIM(value)) AS Product
FROM ProductDetail
CROSS APPLY STRING_SPLIT(Products, ',');

/*Question 2 Achieving 2NF (Second Normal Form) /*
1.	Create Orders table (remove partial dependency)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
2.	Create OrderItems table (no partial dependencies)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


