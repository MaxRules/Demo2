# This Terraform configuration Creates DynamoDB tables for CloudMart on AWS.

provider "aws" {
    region = "us-east-1" # Specify the AWS region
}

# DynamoDB table for storing product information
resource "aws_dynamodb_table" "products" {
    name           = "CloudMart_Products"
    billing_mode   = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key       = "ProductID"       # Partition key

    attribute {
        name = "ProductID"
        type = "S" # String type
    }

    tags = {
        Environment = "Production"
        Application = "CloudMart"
    }
}

# DynamoDB table for storing customer information
resource "aws_dynamodb_table" "customers" {
    name           = "CloudMart_Customers"
    billing_mode   = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key       = "CustomerID"      # Partition key

    attribute {
        name = "CustomerID"
        type = "S" # String type
    }

    tags = {
        Environment = "Production"
        Application = "CloudMart"
    }
}

# DynamoDB table for storing order information
resource "aws_dynamodb_table" "orders" {
    name           = "CloudMart_Orders"
    billing_mode   = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key       = "OrderID"         # Partition key
    range_key      = "CustomerID"      # Sort key

    attribute {
        name = "OrderID"
        type = "S" # String type
    }

    attribute {
        name = "CustomerID"
        type = "S" # String type
    }

    tags = {
        Environment = "Production"
        Application = "CloudMart"
    }
}

# DynamoDB table for storing inventory information
resource "aws_dynamodb_table" "inventory" {
    name           = "CloudMart_Inventory"
    billing_mode   = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key       = "ProductID"       # Partition key
    range_key      = "WarehouseID"     # Sort key

    attribute {
        name = "ProductID"
        type = "S" # String type
    }

    attribute {
        name = "WarehouseID"
        type = "S" # String type
    }

    tags = {
        Environment = "Production"
        Application = "CloudMart"
    }
}