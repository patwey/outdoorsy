# README

- [Overview](#overview)
- [Setup](#setup)

### Overview

This application is a proof of concept for a fictional company - Outdoor.sy. It allows users to upload customer data, view a table of past customer data imports, and view a sortable table of customers.

Here's what a basic flow through the application might look like:

![outdoorsy_functionality](https://user-images.githubusercontent.com/6363316/171666336-c94a1371-b152-4d03-8998-37f7439e70c3.gif)

#### Highlights
Customers, like Ansel Adams, can have multiple vehicles:

![outdoorsy_customers](https://user-images.githubusercontent.com/6363316/171668131-dccbbe78-0d9c-427c-bdf1-f992763345a9.png)

Users get receive on how many customers were successfully and unsuccessfully imported:

![outdoorsy_customer_imports](https://user-images.githubusercontent.com/6363316/171668783-3f999dc5-ca37-443b-8b9f-f1fe018f75ca.png)

#### Import Files
The application currently supports .txt or .csv files deliniated by commas or pipes and these fields:
1. First name
2. Last name
3. Email
4. Vehicle type
5. Vehicle name
6. Vehicle length

To see some example import files, check out [spec/fixtures](https://github.com/patwey/outdoorsy/tree/main/spec/fixtures)

#### Schema

TODO


### Setup

TODO
