# Recipe-api // hatchways.io backend assessment in ruby
ruby 3.1.1
rails 7.0.2.2
postgres 12.10

# Database
Must have postgres set up and configured, 
my user:pass is test:test (as seen in database.yml)
I only run this code in localhost / dev env.

run `rails db:setup`
run `rails db:migrate`

This creates database + table

run `rake db:populate`

This takes the data.json file and loads it into the postgres database
