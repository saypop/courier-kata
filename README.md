# courier-kata

## Introduction
This is a tech test for FundApps, modeling a courier system in Ruby.  Ruby aside, the only other technology used is the RSpec testing framework.

Instructions were to approach the project in a step wise manner without looking ahead to following tasks.
Required output is a collection of items with their individual cost and type, with a total cost.  There is no limitation set on the inputs.
Total time given is 2 hours, I will be aiming to complete all tasks and will make a note of where I get to at the 2 hour mark.

## Quickstart
_Getting setup_
Ensure that you have Ruby and Bundler installed.  Then, clone this repo and install the dependencies:
`$ bundle install`
Ensure that you are running Ruby 2.5.0 (you can use RVM to manage Ruby versions)
_Running the application_
After you have followed the setup instructions, launch the application:
`$ ruby main.rb`
From there follow the instructions printed to your terminal.
_Running the tests_
After you have followed the setup instructions, run the tests with RSpec:
`$ rspec                    ## runs the entire test suite`
`$ rspec spec/file.rb       ## runs a specific test file`
`$ rspec -e "Test name"     ## runs a specific test`

## Approach
### Task 1
_As instructed I approached the problem in a step wise manner._
The first task was to implement a simple cost calculator based on the size of the parcels.
I know from the output requirements that the calculation needs to be done on a collection of parcels, this indicates that I will need two classes:
1. A Parcel class: which will contain info specific to each parcel, in this first instance that would be length, width, and height.  I will also include a name attribute to make reading the output easier.
2. A Batch class: which will contain the collection of all parcels in a specific batch. So it will require an add method which adds a parcel to the batch.

_I also need something to do the calculations, which gives rise to another class._
3. A Calculator class: instances of which will need to have methods like:
    - parcel_cost: that takes a parcel and returns the cost of shipping a parcel;
    - batch_cost: takes a batch and returns the total cost of shipping a batch; and
    - This will also need to contain the size limits and associated cost.

_At this point I envisage an interface that gives the user the option to: add new parcels to a batch or return the cost output of the batch. Which gives rise to four more classes._
4. A Menu class: instances of which contain the instructions for each stage of the user journey and methods that return those steps;
5. A Receiver class: instances of which receive and share input from the user;
6. A Compiler class: instances of which generate the objects that need to be printed as outputs; and
7. A Printer class: instances of which prints out instructions from the menu and results from the calculator.

_While completing this task I found that it would be useful to have another class._
8. A Sizer class: instances of which will have a method that takes a parcel object and return the appropriate size based on the dimensions of the parcel.

_With all that in mind, I started coding for this step at 12:28pm and completed this task at XX:XXpm. Which included about 25 minutes of break time._
