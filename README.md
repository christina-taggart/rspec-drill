# Rspec Drill Bank Account 
 
##Learning Competencies
- What to test: We test behavior not implementation
- How to unit test with Rspec
##Summary 

 A bank account provides a useful example for discussing object-oriented design because the needs for security and privacy are imminent and obvious.  A bank account should not reveal certain things about itself so easily, like the account number, for example.

In this challenge, you will write the examples needed to thoroughly test the public interface of the `Account` class.

The public interface of the class represents its **contract** with the rest of the application: each public method is agreeing to provide some behavior and/or return value given the right inputs and state.

The purpose of a good test suite is to ensure that the contract is honored.

## Objectives

### Go through the source code

Read the code under the source directory until you understand the code.

### Identify the contract

There are 6 public instance methods for the `Account` class:

1. `initialize`
2. `transactions`
3. `balance`
4. `account_number`
5. `deposit!`
6. `withdraw!`

Before you actually implement any specs, go through each of these methods and answer the following questions (you can use your answers to write pending examples, if you'd like):

- What are the valid inputs, if any, for this method?
- What constitutes expected return values?
- What constitutes unexpected return values?
- Does the method cause changes to the state of the program?
- What defines a [happy path](http://en.wikipedia.org/wiki/Happy_path) scenario?  What about a sad path?

### Write your examples

After you have identified the behavior for each element of the interface, go write the necessary specs to exercise the contract.

Remember to ensure that your spec is actually testing what you want by ensuring that it fails when the corresponding code is commented out.  If it passes even when the code it is supposedly testing is commented out, then it is a broken test.

For a quick reference of the RSpec API, check out the [cheat sheet](http://cheat.errtheblog.com/s/rspec). 

###Release 0 

##Optimize Your Learning 

##Resources
