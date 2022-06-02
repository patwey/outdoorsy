### Contents
- [Overview](#overview)
    * [Areas of Focus](#areas-of-focus)
    * [Highlights](#highlights)
    * [Future Enhancements](#future-enhancements)
    * [Import File Guidelines](#import-file-guidelines)
    * [Schema](#schema)
- [Setup](#setup)
  * [Installing SQLite3](#installing-sqlite3)
  * [Installing Ruby](#installing-ruby)
  * [Installing Rails](#installing-rails)
  * [Installing Bundler](#installing-bundler)
- [Starting the Application](#starting-the-application)

### Overview

This application is a proof of concept for a fictional company - Outdoor.sy. It enables users to:
- Upload customer data
- View a table of past customer data imports
- View a sortable table of customers.

Here's what a basic flow through the application looks like:

![outdoorsy_functionality](https://user-images.githubusercontent.com/6363316/171666336-c94a1371-b152-4d03-8998-37f7439e70c3.gif)

#### Areas of Focus
For this proof of concept, I focused on:
- Testing
- Code structure
- Delivering a full-stack solution

#### Future Enhancements
In the future, I'd like to add:
- JS unit testing
- JWT API authentication
- API pagination
- User authentication

#### Highlights
Customers, like Ansel Adams, can have multiple vehicles:

![outdoorsy_customers](https://user-images.githubusercontent.com/6363316/171668131-dccbbe78-0d9c-427c-bdf1-f992763345a9.png)

Users receive feedback on how many customers were successfully and unsuccessfully imported:

![customer_imports](https://user-images.githubusercontent.com/6363316/171684121-f1be9903-34bb-4a51-b03f-2cbd877059ce.png)

In the database, the application stores this information on a row-by-row basis:

![outdoorsy_customer_import_metadata](https://user-images.githubusercontent.com/6363316/171684203-6adccf97-4dc0-4b77-8a34-a00e12cd11c3.png)

#### Import File Guidelines
The application currently supports .txt or .csv files deliniated by commas or pipes and these fields:
1. First name
2. Last name
3. Email
4. Vehicle type
5. Vehicle name
6. Vehicle length

For examples, check out [spec/fixtures](https://github.com/patwey/outdoorsy/tree/main/spec/fixtures)

#### Schema

![outdoorsy_schema](https://user-images.githubusercontent.com/6363316/171674484-4557c121-82c4-4d30-8ac6-711ba9cbebe0.png)

### Setup

#### Installing SQLite3
You will need an installation of the SQLite3 database. Many popular UNIX-like OSes ship with an acceptable version of SQLite3. Others can find installation instructions at the [SQLite3 website](https://www.sqlite.org/index.html).

Verify that it is correctly installed and in your load PATH:

```bash
$ sqlite3 --version
```

The program should report its version.

#### Installing Ruby
Open up a command line prompt. On macOS open Terminal.app; on Windows choose "Run" from your Start menu and type cmd.exe. Any commands prefaced with a dollar sign $ should be run in the command line. Verify that you have a current version of Ruby installed:

```bash
$ ruby --version
```

This application requires Ruby version 3.0.0 or later. It is preferred to use latest Ruby version. If the version number returned is less than that number (such as 2.3.7, or 1.8.7), you'll need to install a fresh copy of Ruby.

For installation methods for most Operating Systems take a look at [ruby-lang.org](https://www.ruby-lang.org/en/documentation/installation/)

#### Installing Rails
To install Rails, use the gem install command provided by RubyGems:

```bash
$ gem install rails
```

To verify that you have everything installed correctly, you should be able to run the following in a new terminal:

```bash
$ rails --version
```

If it says something like "Rails 7.0.0", you are ready to continue.

#### Installing Bundler
You will need to install bundler:

```bash
$ gem install bundler
```
And install all the dependencies:

```bash
$ bundle install
```

### Starting the Application
Start the server with:
```bash
$ bin/rails server
```

Start sidekiq with:
```bash
$ bundle exec sidekiq
```

To see the application in action, visit: [http://127.0.0.1:3000/](http://127.0.0.1:3000/)
