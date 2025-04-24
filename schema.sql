-- This is my schema projec file



-- Dimension Table
-- CREATE DATABASE `DATAWAREHOUSINGFORBUSINESSFINALPROJECT`;
-- USE DATAWAREHOUSINGFORBUSINESSFINALPROJECT ;


-- Deminsion Table
-- this table has two hierarchicals (country, state, city), (country, zipcode)
CREATE TABLE 'Customer'
(
    "Cust_key" BIGINT Primary Key  ,-- Primary key
    "Cust_name" varchar NOT NULL ,
    "Active" boolean ,
    "Address_1" varchar Not Null ,
    "Address_2" varchar ,
    "Address_3" varchar  ,
    "Country" varchar ,
    "State" char(2) NOT NULL ,
    "City" varchar NOT NULL ,
    "ZIP" char(10),
    "Credit_Limit" numeric  ,
    "Date_First_Order" date NOT NULL ,
    "E_Mail_Address" varchar NOT NULL ,
    "Fax" char(10) ,
    "Phone" char(10) NOT NULL ,
    "Sales_Tax_Code" char(10)  ,
    "Terms_Code" char(10)

);


CREATE TABLE 'Shipment'
(
    "Shipment_Id" BIGINT PRIMARY KEY,
    "Actual_Ship_Date" date ,
    "Requested_Ship_Date" date ,
    "Actual_Quantity" int ,
    "Requested_Quantity" int ,
    "Boxes" int ,
    "Quantity_Per_Box" int ,
    "Quantity_Per_Partial_Box" int ,
    "Job_Id" BIGINT ,
    "Shipment_Amount" numeric ,
    "Sub_Job_Id" BIGINT ,
    "Invoice_Id" BIGINT ,
    "Cust_Loc_Key" BIGINT,
    FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id) ,
    FOREIGN KEY (Sub_Job_Id) REFERENCES SubJob(Sub_Job_Id),
    FOREIGN KEY (Invoice_Id) REFERENCES Invoice(Invoice_Id),
    FOREIGN KEY (Cust_Loc_Key) REFERENCES CustLocation(Cust_Loc_Key)
);

-- Deminsion Table
CREATE TABLE 'Location'
(
    "Location_Id" BIGINT PRIMARY KEY ,
    "Location_Name" char(50)

);

-- Deminsion Table
CREATE TABLE 'MachineType'
(
    "Machine_Type_Id" BIGINT PRIMARY KEY,
    "Manufacturer" BIGINT ,
    "Model" varchar ,
    "Rate_Per_Hour" numeric ,
    "Number_Of_Machines" int
);

-- Deminsion Table
CREATE TABLE 'SalesAgent'
(
    "Sales_Agent_Id" BIGINT PRIMARY KEY ,
    "Sales_Agent_Name" varchar ,
    "State" char(2) ,
    "Country" char(25) ,
    "Record_Active" boolean

);

-- Deminsion Table
CREATE TABLE 'SalesClass'
(
    "Sales_Class_Id" BIGINT Primary key,
    "Sales_Class_Desc" varchar

);


-- Deminsion Table
CREATE TABLE 'CustLocation'
(
    "Cust_Loc_Key" BIGINT Primary Key  ,
    "Cust_Name" varchar ,
    "Active" boolean ,
    "Address_1" varchar ,
    "Address_2" varchar ,
    "Address_3" varchar ,
    "Country" varchar ,
    "State" char(2) ,
    "City" varchar ,
    "ZIP" char(10) ,
    "Credot_limit" numeric ,
    "E_Mail_Address" varchar ,
    "Fax" char(10) ,
    "Phone" char(10) ,
    "Sales_Tax_Cod" char(10) ,
    "Terms_Code" char(10) ,
    "Cust_key" BIGINT ,
    FOREIGN KEY (Cust_Key) REFERENCES Customer(Cust_Key)


);

-- Deminsion Table
CREATE TABLE 'Invoice'
(
    "Invoice_Id" BIGINT Primary Key ,
    "Date_Invoiced" date ,
    "Date_Due" date   ,
    "Posting_Date" date  ,
    "Invoice_Desc" date ,
    "Invoice_Amount" numeric  ,
    "Invoice_Quantity" int  ,
    "Invoice_Shipped" int  ,
    "Cust_Key" BIGINT,
    FOREIGN KEY (Cust_Key) REFERENCES Customer(Cust_Key)

);


-- Deminsion Table
CREATE TABLE 'SubJob'
(
    "Job_Id" BIGINT ,
    "Sub_Job_Id" tinyint ,
    "Sub_Job_Desc" char(50) ,
    "Cost_Labor" numeric ,
    "Cost_Material" numeric ,
    "Cost_Overhead" numeric ,
    "Machine_Hours" decimal(10,2) ,
    "Date_Prod_Begin" date ,
    "Date_Prod_End" date ,
    "Quantity_Produced" int ,
    "Sub_Job_Amount" numeric ,
    "Machine_Type_Id" BIGINT ,
    PRIMARY KEY (Job_Id, Sub_Job_Id) ,
    FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id) ,
    FOREIGN KEY (Machine_Type_Id) REFERENCES MachineType(Machine_Type_Id)

);


-- Deminsion Table
CREATE TABLE 'Job'
(
    "Job_Id" BIGINT Primary Key ,
    "ob_Desc" char(50) ,
    "Contract_Date" date ,
    "Date_Promised" date ,
    "Number_Of_Subjobs" int ,
    "PO_Number" char(10)  ,
    "Record_Active" boolean ,
    "Date_Ship_By" date ,
    "Job_Complete" boolean ,
    "Print_Flow_Status" char(10) ,
    "Contact_Name" char(50) ,
    "Unit_Price" numeric ,
    "Quantity_Ordered" tinyint ,
    "Quotation_Amount" numeric ,
    "Quotation_Ordered" tinyint  ,
    "Location_Id" BIGINT ,
    "Sales_Class_Id" BIGINT ,
    "Sales_Agent_Id" BIGINT ,
    "Cust_Key" BIGINT ,
    FOREIGN KEY (Cust_Key) REFERENCES Customer(Cust_Key) ,
    FOREIGN KEY (Sales_Agent_Id) REFERENCES SalesAgent(Sales_Agent_Id) ,
    FOREIGN KEY (Location_Id) REFERENCES Location(Location_Id) ,
    FOREIGN KEY (Sales_Class_Id) REFERENCES SalesClass(Sales_Class_Id)

);

CREATE TABLE 'FinancialSalesSummary'
(
    "Summary_Sales_Id" BIGINT Primary KEY ,
    "Actual_Units" INTEGER ,
    "Actual_Amount" numeric ,
    "Forecast_Units" INTEGER ,
    "Forecast_Amount" numeric ,
    "Location_Id" BIGINT ,
    "Sales_Class_Id" BIGINT ,
    "Begin_Date" Date ,
    "End_Date" Date,
    FOREIGN KEY (Sales_Class_Id) REFERENCES SalesClass(Sales_Class_Id),
    FOREIGN KEY (Location_Id) REFERENCES Location(Location_Id)
);

CREATE TABLE 'FinancialCostSummary'
(
    "Summary_Cost_Id" BIGINT PRIMARY KEY ,
    "Actual_Units" INTEGER ,
    "Actual_Labor_Cost" numeric ,
    "Actual_Material_Cost" numeric ,
    "Actual_Machine_Cost" numeric ,
    "Actual_Overhead_Cost" numeric ,
    "Budget_Units" INTEGER ,
    "Budget_Labor_Cost" NUMERIC ,
    "Budget_Material_Cost" numeric ,
    "Budget_Machine_Cost" numeric ,
    "Budget_Overhead_Cos" numeric ,
    "Location_Id" BIGINT ,
    "Machine_Type_Id" BIGINT ,
    "Sales_Class_Id" BIGINT ,
    "Begin_Date" date ,
    "End_Date" date,
    FOREIGN KEY (Machine_Type_Id) REFERENCES MachineType(Machine_Type_Id),
    FOREIGN KEY (Sales_Class_Id) REFERENCES SalesClass(Sales_Class_Id),
    FOREIGN KEY (Location_Id) REFERENCES Location(Location_Id)

);

CREATE TABLE 'LeadFile'
(
    "Lead_Id" BIGINT PRIMARY Key ,
    "Quote_Qty" INTEGER ,
    "Quote_Price" NUMERIC ,
    "Quote_Value" NUMERIC ,
    "Success" boolean ,
    "PO_Number" Char(10) ,
    "Created_Date" Date ,
    "Cust_Key" BIGINT ,
    "Location_Id" BIGINT ,
    "Sales_Agent_Id" BIGINT  ,
    "Sales_Class_Id" BIGINT ,
    FOREIGN KEY (PO_Number) REFERENCES Job(PO_Number) ,
    FOREIGN KEY (Cust_Key) REFERENCES Customer(Cust_Key) ,
    FOREIGN KEY (Location_Id) REFERENCES Location(Location_Id) ,
    FOREIGN KEY (Sales_Agent_Id) REFERENCES SalesAgent(Sales_Agent_Id),
    FOREIGN KEY (Sales_Class_Id) REFERENCES SalesClass(Sales_Class_Id)
);


















