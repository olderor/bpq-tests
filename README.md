# bpq-tests
Project for testing Brodal-Okasaki Priority Queue.</br></br>

Input data is available [here](data/tests).</br>
There are 50 different tests.</br>
There are 10 different types of tests.</br>
<p>Tests are splitted into groups of 10. Each group has different tests sizes.</br>
*&nbsp;&nbsp;0&nbsp;-&nbsp;9&nbsp;&nbsp;- tests with size of `100`.</br>
*&nbsp;10-19 - tests with size of `1 000`.</br>
*&nbsp;20-29 - tests with size of `10 000`.</br>
*&nbsp;30-39 - tests with size of `100 000`.</br>
*&nbsp;40-49 - tests with size of `1 000 000`.
</br>
</br>
## Tests format ##
Input rules.</br>
Each test file contains data splitted by newline character (`\n`).</br>
To retrieve current top element in the queue (without removing it from the queue) we use command `top`.</br>
To retrieve and remove current top element from the queue we use command `pop`.</br>
To insert the number to the queue we just type it in the line, for example `42`.</br></br>
# Lets talk about all kind of tests</br>
0.&nbsp;[ZigZag Test](#test-type-0---zigzag-test)</br>
1.&nbsp;[Increasing elements Test](#test-type-1---increasing-elements-test)</br>
2.&nbsp;[Decreasing elements Test](#test-type-2---decreasing-elements-test)</br>
## Test type #0 - ZigZag Test ##
For each number in range from `0` to `size` we insert the number and after that `(size - number - 1)`.</br>
This test is used for checking if queue can correctly insert numbers, such that each new number changes the sign (`<` or `>`) after each insertation
Also after each pushing we check the top element in the queue.
</br>After whole insertation we pop numbers from the queue to check if they are in the correct order.</br>
Example test with size 5 will be like this:</br>
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
We insert each number in range from `0` up to `size`.</br>
This test is used for checking if queue can correctly insert numbers, such that each new number bigger than all previous, so it has to be inserted at the end of the queue.
Also after each pushing we check the top element in the queue.
</br>After whole insertation we pop numbers from the queue to check if they are in the correct order.</br>
Example test with size 5 will be like this:</br>
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
We insert each number in range from `size` down to `1`.</br>
This test is used for checking if queue can correctly insert numbers, such that each new number smaller than all previous, so it has to be inserted at the beginning of the queue.
Also after each pushing we check the top element in the queue.
</br>After whole insertation we pop numbers from the queue to check if they are in the correct order.</br>
Example test with size 5 will be like this:</br>
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
We insert 0 in the queue `size` times.</br>
This test is used for checking if queue can correctly insert numbers that are equal.
Also after each pushing we check the top element in the queue.
</br>After whole insertation we pop numbers from the queue to check if they are in the correct order.</br>
Example test with size 5 will be like this:</br>
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
