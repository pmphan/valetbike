[IN PROGRESS]

# Hydrabike

#### **Starter App for ValetBike project | Smith College CSC223: Software Engineering**


## Prototype Review
This prototype review is a reflection of the process that Hydabike has completed so far. It aims to help us evaluate the features still under development and determine next steps for delivering a final software product. It also allows us to think about our team collabration for ensuring future success. 


## Environment Configuration


### Step 1: Cloning the project 
- Click 'code' at th top of this GitHub page
- Create a local copy of your fork with: `git clone https://github.com/<your_username>/valetbike.git`.
- Make sure to store the project in a designated location (i.e. /Users/Code/)

### Step 2: Install MySQL 8

- Download [MySQL](https://www.mysql.com/downloads/). Make sure to select the version that correlates to your operating system

- Follow this [installation guide](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) for proper installation 

- In the `env.rb` file, include: 
```
- ENV['MYSQL_USERNAME'] = "root"
- ENV['MYSQL_PASSWORD'] = password
- MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
- MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

### Step 3: Install Ruby 3.12

- To set up your local machine from scratch, you will first need to install Ruby. Depending on your operating system, use one of the following guides for the initial step.

- Install Ruby on Mac (Intel and M1)
- Install Ruby on Mac (M1 additional details)
- Install Ruby on Windows 10

* Make sure you have the correct Ruby version installed. To check, use command `ruby -v` to see your version.*

* Consult this [Ruby Terminal Commands](https://docs.railsbridge.org/ruby/command_line) for more options*

### Step 4: Installing Gems

- Disable gem docs:
 `echo "gem: --no-document" >> ~/.gemrc`
- Install Rails 6.1.4:
 `gem install rails --version 6.1.4`
- Install MySQL gem:
 `gem install mysql2`
 
- Install required gems:
`bundle install`

### Step 5: Running your project
Congratulations, you should be all set to run the project!
- If using `rackup` open `http://localhost:9292 (or http://127.0.0.1:9292)` in a browser
- If using `rails s` open `http://localhost:3000 (or http://127.0.0.1:3000)` in a browser

## Updates

### Map Visability 
In order to see the map, we overrode precompile assets. In `valetbike/.gitignore`, we add 
```
# Ignore precompile assets
public/assets/
```

### Gemfile
Added devise gem for user log-in and registration
`gem 'devise`
`gem 'uniquify`

### Gemfile.lock
In GEM, added
`bcrypt (3.1.18)` to hash and secure passwords

In PLATFORMS, add 
```
  arm64-darwin-21
  x86_64-darwin-21
 ```
 All commands
- nokogiri (1.13.8-x86_64-darwin)
- racc (~> 1.4)
- tailwindcss-rails (2.0.12-x86_64-darwin)
- railties (>= 6.0.0)
- devise (4.8.1)
- bcrypt (~> 3.0)
- orm_adapter (~> 0.1)
- railties (>= 4.1.0)
- responders
- warden (~> 1.2.3)
- orm_adapter (0.5.0)
- responders (3.0.1)
- actionpack (>= 5.0)
- railties (>= 5.0)
- warden (1.2.9)
- rack (>= 2.0.9)
- devise

##Seeding the database

These commands can help you create and edit databases
1. `bundle install`
2. `rake db:drop` (if a previous database has been created or in use)
3. `rake db:create`
4. `rake db:migrate`
5. `rake db:seed`
6. `rackup` or `rails s`
- run rake import_csv:create_stations
- run rake import_csv:create_bikes
- run rake import_csv:create_rides


# MVP Functionality 


| Feature        | Location           | Function |
| ------------- |:-------------:| -----:|
| Map      | Home Page | The homepage includes a map with hoverable markers fo riders to see available bikes using hoverable pins|
| Sign Up     | User  |  Checks for input validity with a unique username, password,and email  |
| Log in |  User     | Checks log-in information, directs user to profile and supports renting process|
| User Profile |  User     | Basic account information and past bike transactions|
| FAQ | Resources     |  User can find questions and answers, can also look at relevant biking resources |
| Renting | Rent      |  User can choose membership options and pricing plans for bike renting |
| About | About     |   Mission of Hydrabike with information about the team |

# WalkThrough

Welcome to Hydrabikes, a bike sharing collabration for all. 

Once you clone the project and open it using 'rails s' or 'rackup', you will be on the greeted on the **home page**. This page includes a map of bikes and stations in Nipmoc Notch. If you hover over the **map**, you would see a hand icon that will allow you to click and grab the map. Hover over the markers to see available bike. 

On the top there is a **navigation bar** which every webpage will include for easy access to our features. If you're hoping to use Hydrabike in a different language, there is a **Google Translate** feature in the footer. Additionally, our **contact information** is open to your questions or concerns. 

Do you want to learn a little more about Valetbike before signing up? Check out our **About** page to see our mission and team members. One of our founding principles is to keep the users at the center of the process. 

Do you have questions? Check out our **Resources Page** for FAQs. We also have resources and articles about biking to explore!

If you are ready to create an account, click on the **Sign Up** to get started. Once you created a account and aree signed in, check out your new user profile in the account page.

Now that you are a new member of the Hydrabike community, navigate to the home page and map to rent a bike. On our **rent** page includes a variety of membership options and  pricing plans suited for your lifestyle. Select a option and checkout with Paypal. 

Thank you so much for purchasing a bike from Hydrabike! Enjoy your ride!

Make sure when you are done using the website to **log out**. Logging back in is simple, just click the sign in again!
