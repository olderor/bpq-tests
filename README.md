# bpq-tests
Project for testing Brodal-Okasaki Priority Queue.</br></br>

Input data is available [here](data/tests).</br>
There are 50 different tests.</br>
There are 10 different types of tests.</br>
<p>Tests are splitted into groups of 10. Each group has different tests sizes.
<ul>
<li>&nbsp;0&nbsp;-&nbsp;9&nbsp;&nbsp;- tests with size of `100`.</li>
<li>10-19 - tests with size of `1 000`.</li>
<li>20-29 - tests with size of `10 000`.</li>
<li>30-39 - tests with size of `100 000`.</li>
<li>40-49 - tests with size of `1 000 000`.</li>
</ul></p></br>
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
3.&nbsp;[Zero Test](#test-type-3---zero-test)</br>
4.&nbsp;[Push-Pop Test](#test-type-4---push-pop-test)</br>
5.&nbsp;[Top Test](#test-type-5---top-test)</br>
6.&nbsp;[Push-Pop Increasing Test](#test-type-6---push-pop-increasing-test)</br>
7.&nbsp;[Push-Pop Random Test](#test-type-7---push-pop-random-test)</br>
8.&nbsp;[Push Random Test](#test-type-8---push-random-test)</br>
9.&nbsp;[Random Test](#test-type-9---random-test)</br>
## Test type #0 - ZigZag Test ##
For each number in range from `0` to `size` we insert the number and after that the number `(size - number - 1)`.</br>
This test is used for checking if queue can correctly insert numbers, such that each new number changes the sign (`<` or `>`) after each insertation.
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
This test is used for checking if queue can correctly insert numbers, such that each new number is bigger than all previous, so it has to be inserted at the end of the queue.
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
This test is used for checking if queue can correctly insert numbers, such that each new number is smaller than all previous, so it has to be inserted at the beginning of the queue.
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
## Test type #4 - Push-Pop Test ##
We insert each number in range from `0` up to `size`. After that we are checking what is the top element in the queue using `top`. And after that we extract that element using command `pop`. Also after popping we use `top` to check if queue is empty.</br> 
This test is used for checking if queue can correctly store and extract elements and it doesn't leave any garbage in the queue. By doing this we store one element in the queue and extract it so the queue should be empty.
Example test with size 5 will be like this:</br>
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
At the start we insert the element with the value of 0 in the queue.</br>
After that we use command `top` `size` times to check what the top element in the queue is. So this is the stress test for command `top`. We check if command `top` doesn't effect on the queue (not removes elements from the queue).
Example test with size 5 will be like this:</br>
```
0
top
top
top
top
top
```
## Test type #6 - Push-Pop Increasing Test ##
We insert each number in range from `0` up to `size`. After each insertation we check what is the top element in the queue using `top`. And after that we insert one more element in the queue and check using `top`. After that we extract current minimum element using command `pop`.</br> 
This test is used for checking if queue can correctly process commands `push` and `pop` combined. After each block of insertation the size of the queue will grow up by 1.
Example test with size 5 will be like this:</br>
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
This test is similar to Test type #6 - Push-Pop Increasing Test. The difference is that we always insert random numbers, not just in increasing order as we did in the previous test.</br> 
This test is used for checking if queue can correctly process commands `push` and `pop` combined. After each block of insertation the size of the queue will grow up by 1.
Example test with size 5 will be like this:</br>
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
We insert random elements in the queue `size` times.</br>
This test is used for checking if queue can correctly insert numbers, such that each new number has different position in the queue.
Also after each pushing we check the top element in the queue.
</br>After whole insertation we pop numbers from the queue to check if they are in the correct order.</br>
Example test with size 5 will be like this:</br>
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
This test is used to simulate working with queue.</br>
We randomly choose `size` times what we want to do either pushing random element to the queue or extracting minimum number from the queue.</br>
Also after each pushing and popping we check the top element in the queue.
Example test with size 5 will be like this:</br>
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
