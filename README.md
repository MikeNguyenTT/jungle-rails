# Jungle

A mini e-commerce application built with Ruby on Rails
Testing: RSpec and Capybara

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshot

#### Add items to cart and order processing with Strip

![Add items to cart and order processing with Strip](https://github.com/MikeNguyenTT/jungle-rails/blob/master/docs/cart_and_order.gif?raw=true)


#### Only admin can create new categories and new products

![Only admin can create new categories and new products](https://github.com/MikeNguyenTT/jungle-rails/blob/master/docs/new_product_by_admin.gif?raw=true)