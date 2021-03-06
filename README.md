# bpq-tests
Project for testing [Brodal-Okasaki Priority Queue](https://github.com/olderor/visualization).

# Table of contents #
[1. Main information](#main-information)  
[2. Tests input format](#tests-input-format)  
[3. Output format](#output-format)  
[4. Result format](#result-format)  
[5. Correct answers](#correct-answers)  
[6. Checker](#checker)  
[7. Lets talk about all kinds of tests](#lets-talk-about-all-kinds-of-tests)  
# Main information #
Input data is available [here](data/tests).  
Bpq data output is available [here](data/bpq%20answers).  
Correct data output is available [here](data/correct%20answers).

There are 50 different tests.  
There are 10 different types of tests.  

Tests are splitted into groups of 10. Each group has different tests sizes.  
&nbsp;0&nbsp;-&nbsp;9&nbsp;&nbsp;- tests with size of 100.  
10-19 - tests with size of 1 000.  
20-29 - tests with size of 10 000.  
30-39 - tests with size of 100 000.  
40-49 - tests with size of 1 000 000.  

## Tests input format ##
Input rules.  

Each test file contains data splitted by newline character (`\n`).  
To retrieve current top element in the queue (without removing it from the queue) we use command `top`.  
To retrieve and remove current top element from the queue we use command `pop`.  
To insert the number to the queue we just type it in the line, for example `42`.  
## Output format ##
Output rules.  

Each output file contains data splitted by newline character (`\n`).  

After each command `top` or `pop` we should add number that was retrieved to the output file.  

If the queue is empty and there is nothing to retrieve, we should return string with `nil` value which means that there is no numbers in the queue.  

Note, that when we use swift implementation it also adds test elapsed time at the end of the file.
## Result format ##
The program produces the [result file](check_result.txt).  

Each line in the file describes the result of the test. The line contains information about the test (index of the test) and result comparing to the correct output (`OK` or `WA`).  

Example: `Test #0 - OK.`.
## Correct answers ##
We can get correct answer to the test in two ways.

The first method is to use [this swift function](checker.swift). This function takes a string parameter - given input - content of the input file. For each line in the content we determine what command it is (either `top`, `pop` or a number to push).  

As an priority queue we are going to take an array that will store our elements.  

If we need to get `top` element we have to sort the array using basic sort function and take the first element (if size of the array is 0 than just return `nil` value).  

If we need to process `pop` command we have to sort the array and take the first element and delete it from the array using basic remove function with a parameter 0 as index to remove.  

To add number to the queue we have just to append new element to the array.  

Whenever we need to take number from the queue, the list of elements will be sorted, so we can easily get minimum number. All operations on the array are standard so this algorithm will be correct.  

We can use this function to get correct answer to the problem immediately after running test on the bpq. But this algorithm is too slow and because swift is slow programming language it can be applied on the test with only small sizes (tests 0-19).

The second method is to use [c++ checker](checker.cpp). This implementation is similar to previous, but instead of using array we can use standard stl priority queue. As you know, this implementation stores elements in the descending order. Since all numbers in the tests are integers, they have to be smaller than max integer value (let it be `INF` value). So each time we have to push/pop/top queue we use this formula `INF - number`, so we will store elements in ascending order and print correct numbers.  

Because `c++` is much faster than `swift` and it has standard priority queue implementation (so this algorithms is faster than previous), I would recomend to use this method on the other tests (20-49).
## Checker ##
After we have answers produced by bpq queue and correct answers, we have to check if they are the same. To do this we use [this function](result%20checker.swift). It opens files with bpq answers and correct answers, checks if they have the same amount of lines and after that compares each line if they are the same.  

To check all answers to the tests we simply call this function and remember the result of testing, after that we create [file like this](check_result.txt) that stores the result of the testing.
# Lets talk about all kinds of tests  

As you already know:  

There are 50 different tests.  

There are 10 different types of tests.  

Tests are splitted into groups of 10. Each group has different tests sizes.  

Now we are going to describe each kind of tests.
0.&nbsp;[ZigZag Test](#test-type-0---zigzag-test)  
1.&nbsp;[Increasing elements Test](#test-type-1---increasing-elements-test)  
2.&nbsp;[Decreasing elements Test](#test-type-2---decreasing-elements-test)  
3.&nbsp;[Zero Test](#test-type-3---zero-test)  
4.&nbsp;[Push-Pop Test](#test-type-4---push-pop-test)  
5.&nbsp;[Top Test](#test-type-5---top-test)  
6.&nbsp;[Push-Pop Increasing Test](#test-type-6---push-pop-increasing-test)  
7.&nbsp;[Push-Pop Random Test](#test-type-7---push-pop-random-test)  
8.&nbsp;[Push Random Test](#test-type-8---push-random-test)  
9.&nbsp;[Random Test](#test-type-9---random-test)  

## Test type #0 - ZigZag Test ##
For each number in range from `0` to `size` we insert the number and after that the number `(size - number - 1)`.  

This test is used for checking if queue can correctly insert numbers, such that each new number changes the sign (`<` or `>`) after each insertation.
Also after each pushing we check the top element in the queue.
  
After whole insertation we pop numbers from the queue to check if they are in the correct order.  

Example test with size 5 will be like this:  

```
0
top  
4  
top
1
top
3
top
2
top
2
top
3
top
1
top
4
top
0
top
pop
pop
pop
pop
pop
pop
pop
pop
pop
pop
```
## Test type #1 - Increasing elements Test ##
We insert each number in range from `0` up to `size`.  

This test is used for checking if queue can correctly insert numbers, such that each new number is bigger than all previous, so it has to be inserted at the end of the queue.
Also after each pushing we check the top element in the queue.
  
After whole insertation we pop numbers from the queue to check if they are in the correct order.  

Example test with size 5 will be like this:  

```
0
top
1
top
2
top
3
top
4
top
pop
pop
pop
pop
pop
```
## Test type #2 - Decreasing elements Test ##
We insert each number in range from `size` down to `1`.  

This test is used for checking if queue can correctly insert numbers, such that each new number is smaller than all previous, so it has to be inserted at the beginning of the queue.
Also after each pushing we check the top element in the queue.
  
After whole insertation we pop numbers from the queue to check if they are in the correct order.  

Example test with size 5 will be like this:  

```
5
top
4
top
3
top
2
top
1
top
pop
pop
pop
pop
pop
```
## Test type #3 - Zero Test ##
We insert 0 in the queue `size` times.  

This test is used for checking if queue can correctly insert numbers that are equal.
Also after each pushing we check the top element in the queue.
  
After whole insertation we pop numbers from the queue to check if they are in the correct order.  

Example test with size 5 will be like this:  

```
0
top
0
top
0
top
0
top
0
top
pop
pop
pop
pop
pop
```
## Test type #4 - Push-Pop Test ##
We insert each number in range from `0` up to `size`. After that we are checking what is the top element in the queue using `top`. And after that we extract that element using command `pop`. Also after popping we use `top` to check if queue is empty.  
 
This test is used for checking if queue can correctly store and extract elements and it doesn't leave any garbage in the queue. By doing this we store one element in the queue and extract it so the queue should be empty.
Example test with size 5 will be like this:  

```
0
top
pop
top
1
top
pop
top
2
top
pop
top
3
top
pop
top
4
top
pop
top
```
## Test type #5 - Top Test ##
At the start we insert the element with the value of 0 in the queue.  

After that we use command `top` `size` times to check what the top element in the queue is. So this is the stress test for command `top`. We check if command `top` doesn't effect on the queue (not removes elements from the queue).
Example test with size 5 will be like this:  

```
0
top
top
top
top
top
```
## Test type #6 - Push-Pop Increasing Test ##
We insert each number in range from `0` up to `size`. After each insertation we check what is the top element in the queue using `top`. And after that we insert one more element in the queue and check using `top`. After that we extract current minimum element using command `pop`.  
 
This test is used for checking if queue can correctly process commands `push` and `pop` combined. After each block of insertation the size of the queue will grow up by 1.
Example test with size 5 will be like this:  

```
0
top
1
top
pop
1
top
2
top
pop
2
top
3
top
pop
3
top
4
top
pop
4
top
5
top
pop
```
## Test type #7 - Push-Pop Random Test ##
This test is similar to Test type #6 - Push-Pop Increasing Test. The difference is that we always insert random numbers, not just in increasing order as we did in the previous test.  
 
This test is used for checking if queue can correctly process commands `push` and `pop` combined. After each block of insertation the size of the queue will grow up by 1.
Example test with size 5 will be like this:  

```
590187326
top
504845711
top
pop
415006667
top
1928352266
top
pop
1415568197
top
1058018009
top
pop
19637288
top
759777238
top
pop
911253618
top
254091985
top
pop
```
## Test type #8 - Push Random Test ##
We insert random elements in the queue `size` times.  

This test is used for checking if queue can correctly insert numbers, such that each new number has different position in the queue.
Also after each pushing we check the top element in the queue.
  
After whole insertation we pop numbers from the queue to check if they are in the correct order.  

Example test with size 5 will be like this:  

```
908691825
top
1321575760
top
1301063493
top
268220437
top
1710261242
top
pop
pop
pop
pop
pop
```
## Test type #9 - Random Test ##
This test is used to simulate working with queue.  

We randomly choose `size` times what we want to do either pushing random element to the queue or extracting minimum number from the queue.  

Also after each pushing and popping we check the top element in the queue.
Example test with size 5 will be like this:  

```
988145989
top
360992912
top
1279486658
top
pop
top
pop
top
```


Thanks to mattgallagher for the Swift Deque implementation.

Created by olderor.  

Copyright © 2017 olderor. All rights reserved.
