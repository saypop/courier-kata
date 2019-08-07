# FundApps Tech Test

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

After you have followed the setup instructions, launch the REPL:

`$ irb`

From there create a new CourierBot instance:

`$ my_bot = CourierBot.new`

Then you can add a new parcel to your batch:

`$ my_bot.new_parcel(length, height, length, weight)  # where the dimension arguments passed are integers, the weight arguments can be floats`

If you get bored, I wrote a bulk adding script that will add 10, 25, or 50 mixed parcels to the batch:

`$ my_bot.add_ten`

`$ my_bot.add_thirty`

`$ my_bot.add_fifty`

Once you've added a few parcels, you can get your quote:

`$ my_bot.get_quote(speedy: false)  # for normal delivery`

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

I took my time with this task (it took me about 4 hours in total), mostly because I had made it more difficult by adding in unnecessary features. I've also assumed that I will need to make changes to my code base in later challenges so I wrote SOLID code to make that process as easy as possible.
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

I elected to create a new weigher class, after a while I realised that I needed a lot of the info and functions is the sizer class to be available in the weigher class.  Injecting the sizer class into the weigher class didn't make much sense to me, so I made Weigher a sub class of Sizer.
All in all this took me about 30 minutes.

### Task 4

_The fourth task is to add another parcel type called Heavy.  The type is loosely defined as a parcel under 50kgs, charged $50 with an additional $1 for every additional kg_

I assumed that the type that results in a minimum charge should always be used.

At first this looked difficult because the type based on weight is incongruent with the types based on size.  After a bit of thought it seems pretty straight forward though.

The solution is to just:
- refactor parcel_cost to use two new methods: weight_cost and size_cost;
- add some simple logic to the calculator method parcel_cost in order to use the minimum cost;
- update the compiler method parcel output to use the type that results in minimum cost.

### Task 4 Challenges

That was fairly straightforward.  I had to update my mocks to account for allow for the new methods but my existing tests are unchanged.
This took about 40 minutes of coding, I ran into a bug that had me stumped but revealed an issue with my mocks that I'm glad I got to fix.

### Task 5

_The final challenge is to implement a discounting system that rewards people for shipping more parcels._

There is some very specific logic: 3 types of discounts small, medium and mixed.  This could result in a pretty messy embedded loop method so I took some time to model it out first.

Because I am using a compiler I don't have the benefit of having an object that stores the types and cost of all the parcels in a batch.

What I do have is the batch object and a bunch of methods I have used to assign cost and type in the compiler.

Since I'm going to be so reliant on the attribute of the batch object, and I don't want to change it, I will create a new class that copies the list in batch so I can mutate it in there so I don't effect any of the functionality already in place.
To copy the array without risking mutation I'll make a deep copy using the Marshal library in Ruby.
Then I'll mutate the deep copy so that it contains hash objects for each parcel which will store data like type, cost, and discount bucket.  This will help in sorting the parcels and making sure I don't use the same one twice.

To break that down into steps, I need to:

- Create a new class called Discounter;
- By looping through the batch list and using existing method, I'll create a hash that list all the cost entries for 'small', 'medium', and 'other' parcels;
- I'll sort the list of costs for each category and loop through them removing x at a time and tallying the cost of the smallest amount removed;
- Then I'll return the total amount discounted;
- I'll also need to compile the line item.

### Task 5 Challenges

Phew! That was challenging but I like my solution. It wasn't messy like I had thought it could be, I avoided using embedded loops and did things efficiently.  The new class makes a lot of sense to me, it has a few methods that could be merged but ultimately it does a single thing and returns a single variable.

## Notes

There are few things I'm really happy with:

### Test Coverage
100% :) I wrote over 100 tests for this kata, after refactoring there are 52 remaining.  I'm really pleased with that, there are more tests than methods and every aspect of the app is tested.  This meant that making changes later in the app was really straightforward, even though it took longer to get off the ground.

### Architecture
I'm really happy with the way everything fits together in this app, there is definitely room for improvement but I like that functionality is compartmentalised and that it is easy to know which part is doing what... it makes debugging a simple process.

### Semanitcs
Classes and method are named clearly and logically.  This simplifies the process of updating the code base. 

I managed to meet all acceptance criteria but since I was short on time there are definitely a few things I would do to improve this code base.

### UI
If you look through my commits you'll see that I did a bit of work on this but ended up abandoning it for the sake of time. I'd like to skin this so it can run as an interactive app from the command line.

### Data Structure
I like the compiler approach, but there were definitely times where I would have liked to have had access to some tables. It definitely would have made my life easier on the final task. If I had time I would connect this to a database so that batches could be saved and accessed using batch numbers.

### Test Isolation
My mocking and stubbing could have been better.  Towards the end I wrote a few test that don't run in isolation, I would go back and fix these.  That said, the vast majority of my test suite runs in isolation so it would just be a matter of time to get it in better shape.

### Inheritance
I've used some inheritance here with the sizer and weigher classes.  I think with a bit more thought I could extract some more child classes out of the super classes I've created.  In particular I think the discounter class could make a good sub class of the batch class since they both have object attributes.

### Refactoring and Extraction
It's pretty clear to see that the dicounter and calculator classes are longer than the rest.  If I were to put more time into this I'd extract a class out of calculator and reduce the repetition in discounter by making a single method that loops through any discount bucket based on the arguments provided.
