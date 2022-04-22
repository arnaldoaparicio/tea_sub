# Tea Subscription
***
Tea Subscription is a Rails Backend API available for a frontend client to consume. The frontend client has access to three API endpoints.

- Being able to subscribe a customer to a tea subscription.
- Cancel a subscription.
- Retrieve all of a customer's subscriptions (active and inactive).



## Database Schema
![image](https://user-images.githubusercontent.com/88012780/164586711-7a7fefb9-0d79-4b84-9bdc-ce851b896222.png)

## Local Setup
1. Fork and clone this repo ``` $ git clone git@github.com:arnaldoaparicio/tea_sub.git```
2. Navigate to the newly cloned directory ``` $ cd tea_sub ```
3. If bundler is not installed run ```$ gem install bundler ```
4. If or after bundler is installed run ```$ bundle install``` to install required Gems
5. If errors occur, check for proper installation and versions of ```bundler```, ```ruby```, and ```rails```
6. Set up the database locally with ```$ rails db:{drop,create,migrate,seed}```
7. In your terminal, start the server ```$ rails s -p 3000```


## Available API Endpoints
| http verb | name | description
| --- | --- | --- |
| GET | /customers/:customer_id/subscriptions | Returns a specific customer's subscriptions |
| PATCH | /customers/:customer_id/subscriptions/:subscription_id | Changes the status of a subscription (cancels) |
| POST | /subscriptions | Creates a subscription |
