# ValetBike

*Prototype for ValetBike project*

*Smith College CSC223: Software Engineering*

## Prototype Review

This prototype review is a reflection of the process that Hydabike has completed so far. It aims to help us evaluate the features still under development and determine next steps for delivering a final software product. It also allows us to think about our team collabration for ensuring future success. 

## MVP Functionality

| Feature        | Location           | Function |
| ------------- |:-------------:| -----:|
| Map      | Home Page | The homepage includes a map with hoverable markers fo riders to see available bikes using hoverable pins|
| Sign Up     | User  |  Checks for input validity with a unique username, password,and email  |
| Log in |  User     | Checks log-in information, directs user to profile and supports renting process|
| User Profile |  User     | Basic account information and past bike transactions|
| FAQ | Resources     |  User can find questions and answers, can also look at relevant biking resources |
| Renting | Rent      |  User can choose membership options and pricing plans for bike renting |
| About | About     |   Mission of Hydrabike with information about the team |

## Environment Configuration

### With Docker

#### Step 1: Install Docker

- [Install Docker](https://docs.docker.com/engine/install/)
- Don't forget to [configure Docker permission](https://docs.docker.com/engine/install/linux-postinstall/)
- Make sure you can run Docker without sudo with: `docker run hello-world`

#### Step 2: Install Docker Compose

- Install the [Compose plugin](https://docs.docker.com/compose/install/linux/) or [Compose standalone](https://docs.docker.com/compose/install/other/).

#### Step 3: Clone this project

- Create a local copy of this project with:\
  `git clone https://github.com/abeltranandrade/valetbike.git`
- Alternatively, you can clone with SSH:\
  `git clone git@github.com:abeltranandrade/valetbike.git`
- **Note:** you should run that command when you are in the folder where you want to store the repo\
  (e.g. `/Users/<your_username>/Development`)

#### Step 4: Start the server

Run `docker-compose up -d`.

### Manual Configuration

HydraBike runs on Ruby 3.1.2 and Rails 7.0.3.1. It is essential that you configure your environment to use these precise versions of the language and framework.

#### Step 1: Install Ruby on Rails with MySQL

On Mac it is strongly recommended that you use asdf to install Ruby. On Windows you should set up your environment through the Windows Subsystem for Linux (WSL). The guides below explain how to do so in detail:

- [Mac Ruby on Rails Developer Environment Setup](https://github.com/abeltranandrade/valetbike/blob/master/notes/mac-setup.md)
- [Windows Ruby on Rails Developer Environment Setup](https://github.com/abeltranandrade/valetbike/blob/master/notes/windows-setup.md)

Be sure to complete all the installation procedures in the relevant guide before continuing on to the next step.

#### Step 2: Clone this project

- Create a local copy of this project with:\
  `git clone https://github.com/abeltranandrade/valetbike.git`
- Alternatively, you can clone with SSH:\
  `git clone git@github.com:abeltranandrade/valetbike.git`
- **Note:** you should run that command when you are in the folder where you want to store the repo\
  (e.g. `/Users/<your_username>/Development`)

#### Step 3. Prepare the application

- Enter the directory you just created: `cd valetbike`
- Add `.tool-versions` to app directory to ensure the right ruby is always used: `asdf local ruby 3.1.2`
- Install required gems with: `bundle install`

#### Step 4. Configure the database environment variables

- Add a file called `.env` to the valetbike root directory
- Ensure that it includes the credentials you setup when installing MySQL:

```shell
MYSQL_USERNAME=root
MYSQL_PASSWORD=YOURPASSWORD
MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

- **Note**: Your socket might not be at the above two locations. Find where your MySQL socket resides with `mysql_config --socket`

- Alternatively, you might want to set a different username other than `root` to isolate your application. However, you will have to set up this user with appropriate credentials and authorization as follow.

#### Step 4.5: (Optional) Set up users with appropriate credentials

Again, this step is only needed if you had set up your username with anything other than `root` in the previous step.

- Access the database with\
`mysql -u root -p`
and enter your password.
- You have entered the MySQL CLI. Create new user with:\
`CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';`\
Make sure your new username and password matched what you entered in previous step.
- Grant permission to `valetbike_development` and `valetbike_test` to this user (it's okay even if these two tables have not been created):

```shell
GRANT ALL PRIVILEGES ON valetbike_development.* TO 'username'@'localhost';
GRANT ALL PRIVILEGES ON valetbike_test.* TO 'username'@'localhost';
```

#### Step 5. Prepare the database in MySQL

- Use rails to create both the development and test databases with:\
  `rake db:create`
- Or use mysql to just create the development database with:\
  `mysql -u username -p`\
  `CREATE DATABASE valetbike_development;`\
  `exit`
- Then run the database migrations with:\
  `rake db:migrate`

### Step 6: Integrate Stripe API

- Create a Stripe account at https://stripe.com/
- Get the API key at Account Settings > API keys. By default you should find two keys, the test secret key and the test publishable key.
- Add these keys to the environment file `.env`

```shell
...
STRIPE_SECRET_KEY=sk_test_XXXX
STRIPE_PUBLISHABLE_KEY=sk_test_XXXX
```

- Generate bike product on Stripe with:\
    `rake stripe:products:create`

### Step 7: Confirm that the app runs

- Launch the web server using `rackup` or `rails s` (short for `rails server`) or `bin/dev`
- If using `rackup` open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
- If using `rails s` or `bin/dev` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
- You should see ValetBike welcome page.

## Team Members

* [Adriana Beltran Andrade](https://github.com/abeltranandrade/valetbike)
* [Helen Y. Glover](https://github.com/hglovercode/hyrabike)
* [M. Phuong Phan](https://github.com/pmphan/valetbike)
* [Bobi Arce Mack](https://github.com/bobiamack/valetbike)
* Jingwen Xiang

## WalkThrough

Welcome to Hydrabikes, a bike sharing collabration for all. 

Once you clone the project and open it using 'rails s' or 'rackup', you will be on the greeted on the **home page**. This page includes a map of bikes and stations in Nipmoc Notch. If you hover over the **map**, you would see a hand icon that will allow you to click and grab the map. Hover over the markers to see available bike. 

On the top there is a **navigation bar** which every webpage will include for easy access to our features. If you're hoping to use Hydrabike in a different language, there is a **Google Translate** feature in the footer. Additionally, our **contact information** is open to your questions or concerns. 

Do you want to learn a little more about Valetbike before signing up? Check out our **About** page to see our mission and team members. One of our founding principles is to keep the users at the center of the process. 

Do you have questions? Check out our **Resources Page** for FAQs. We also have resources and articles about biking to explore!

If you are ready to create an account, click on the **Sign Up** to get started. Once you created a account and aree signed in, check out your new user profile in the account page.

Now that you are a new member of the Hydrabike community, navigate to the home page and map to rent a bike. On our **rent** page includes a variety of membership options and  pricing plans suited for your lifestyle. Select a option and checkout with Paypal. 

Thank you so much for purchasing a bike from Hydrabike! Enjoy your ride!

Make sure when you are done using the website to **log out**. Logging back in is simple, just click the sign in again!
