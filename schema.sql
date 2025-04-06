-- This is my schema projec file



-- Dimension Table
-- CREATE DATABASE `DATAWAREHOUSINGFORBUSINESSFINALPROJECT`;
-- USE DATAWAREHOUSINGFORBUSINESSFINALPROJECT
;

CREATE TABLE 'Customer'
(
    "Cust_key" BIGINT Primary Key  ,-- Primary key
    "Cust_name" varchar NOT NULL ,
    "Active" boolean ,
    "Address_1" varchar Not Null ,
    "Address_2" varchar ,
    "Address_3" varchar  ,
    "City" varchar NOT NULL ,
    "Country" varchar ,
    "Credit_Limit" numeric  ,
    "Date_First_Order" date NOT NULL ,
    "E_Mail_Address" varchar NOT NULL ,
    "Fax" char(10) ,
    "Phone" char(10) NOT NULL ,
    "Sales_Tax_Code" char(10)  ,
    "State" char(2) NOT NULL ,
    "Terms_Code" char(10)  ,
    "ZIP" char(10)

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
    "City" varchar ,
    "Country" varchar ,
    "Credot_limit" numeric ,
    "E_Mail_Address" varchar ,
    "Fax" char(10) ,
    "Phone" char(10) ,
    "Sales_Tax_Cod" char(10) ,
    "State" char(2) ,
    "Terms_Code" char(10) ,
    "ZIP" char(10) ,
    "Cust_key" BIGINT


);

-- Fact Table
CREATE TABLE 'Invoices'
(
    "Invoice_Id" BIGINT Primary Key ,
    "Date_Invoiced" date ,
    "Date_Due" date   ,
    "Posting_Date" date  ,
    "Invoice_Desc" date ,
    "Invoice_Amount" numeric  ,
    "Invoice_Quantity" int  ,
    "Invoice_Shipped" int  ,
    "Cust_Key" BIGINT

);


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
    "ales_Class_Id" BIGINT ,
    "Sales_Agent_Id" BIGINT ,
    "Cust_Key" BIGINT

);


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
    "Date_Prod_En" date ,
    "Quantity_Produced" int ,
    "Sub_Job_Amount" numeric ,
    "Machine_Type_Id" BIGINT

);

-- Dimension Table
CREATE TABLE 'Shipment'
(
    "Shipment_Id" BIGINT ,
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
    "Cust_Loc_Key" BIGINT

);


CREATE TABLE 'Location'
(
    "Location_Id" BIGINT ,
    "Location_Name" char(50)

);


CREATE TABLE 'MachineType'
(
    "Machine_Type_Id" BIGINT ,
    "Manufacturer" BIGINT ,
    "Model" varchar ,
    "Rate_Per_Hour" numeric ,
    "Number_Of_Machines" int

);


CREATE TABLE 'SalesAgent'
(
    "Sales_Agent_Id" BIGINT
    "Sales_Agent_Name" varchar ,
"State" char
    (2) ,
"Country" char
    (25) ,
"Record_Active" boolean

);


    CREATE TABLE 'SalesClass'
    (
        "Sales_Class_Id" BIGINT ,
        "sales_class_Desc" varchar

    );
