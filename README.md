# courier-kata

## Introduction
This is a tech test for FundApps, modelling a courier system in Ruby.  Ruby aside, the only other technology used is the RSpec testing framework.

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
`$ irb`
From there create a new CourierBot instance:
`$ my_bot = CourierBot.new`
Then you can add a new parcel to your batch:
`$ my_bot.new_parcel(length, height, length, weight)  # where the dimension arguments passed are integers, the weight arguments can be floats`
Once you've added a few parcels, you can get your quote:
`$ my_bot.get_quote(speedy: true)  # for normal delivery`
or
`$ my_bot.get_quote(speedy: true)  # for speedy delivery`
_Running the tests_
After you have followed the setup instructions, run the tests with RSpec:
`$ rspec                    ## runs the entire test suite`
`$ rspec spec/file.rb       ## runs a specific test file`
`$ rspec -e 'Test name'     ## runs a specific test`

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

_At this point I envisaged an interface that gives the user the option to: add new parcels to a batch or return the cost output of the batch. Which gives rise to two more classes._
6. A Compiler class: instances of which generate the objects that need to be printed as outputs; and
7. A Controller class: instances of which will create all the instances of other classes and make them interact logically.

_While completing this task I found that it would be useful to have another class._
9. A Sizer class: instances of which will have a method that takes a parcel object and return the appropriate size based on the dimensions of the parcel.

### Task 1 Challenges
I took my time with this task (it took me about 6 hours in total), mostly because I had made it more difficult by adding in unnecessary features. I've also assumed that I will need to make changes to my code base in later challenges so I wrote SOLID code to make that process as easy as possible.
I initially wrote 10 classes, 91 tests and 383 lines of code with 100% coverage. I've since refactored this to 7 classes, 41 tests, and 270 lines of code with 100% test coverage.
So aside from the volume of 'learning' work I did for this task, the toughest part was mocking the calculator and sizer classes when building the compiler.  I came to a good solution but it did take some time. You can see how I solved this by looking at the doubles in the compiler.spec and helper.rb files.

### Task 2
_The second task is to add in some functionality that allows for the choice of using a 'speedy' service.  Choosing this option will mean an extra line item will be added to the bill which will be for the total amount again._
To do this I simply:
- refactored the get_quote method in the Controller class to take an optional parameter;
- added in a speedy_output method to the Compiler class which will construct the line item;
- inserted a conditional line of code to the get_quote method that adds the line item in if required; and
- refactored the footer method in the Compiler class to account for the new total.

### Task 2 Challenges
None at all, turned this around in a matter of minutes.  Working with well tested clear code is fun.

### Task 3
_The third task was to add in functionality for an overweight charge on parcel.  Each parcel type has it's own weight limit, all packages are charged the same per kilo if they are over limit._
A little trickier. I needed to add in a new hash that maps to the weight limits, I had to make a call on whether I add the weight limits to my existing Sizer class or if I create a new class for this.  I favour classes with a single purpose so I decided on a new class: Weigher.
So my plan for this was:
- Construct a new Weigher class which will store the weight limits and input into the calculator class;
- Write a method that returns the number of kilos a parcel is over limit;
- Inject a weigher object into my calculator objects;
- Refactor parcel objects so that they now take an optional weight parameter; and
- Refactor the parcel_cost method to add the additional to overweight parcels.

### Task 3 Challenges
I elected to create a new weigher class, after a while I realised that I needed a lot of the info and functions is the sizer class to be available in the weigher class.  So I made Weigher a sub class of Sizer.
