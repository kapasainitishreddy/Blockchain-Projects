pragma solidity >=0.4.22 <=0.8.17;

contract FizzBuzz {
    // Variable to keep track of the count
    uint256 public count;

    // Events to signal Fizz, Buzz, and FizzBuzz occurrences
    event Fizz(address sender, uint indexed count);
    event Buzz(address sender, uint indexed count);
    event FizzAndBuzz(address sender, uint indexed count);

    // Function to increment the count and emit events based on FizzBuzz conditions
    function increment() public {
        // Increment the count
        count++;

        // Check if the count is divisible by 3 and/or 5
        bool divisibleBy3 = count % 3 == 0;
        bool divisibleBy5 = count % 5 == 0;

        // Emit corresponding events based on FizzBuzz conditions
        if (divisibleBy3 && divisibleBy5) {
            emit FizzAndBuzz(msg.sender, count);
        } else if (divisibleBy3) {
            emit Fizz(msg.sender, count);
        } else if (divisibleBy5) {
            emit Buzz(msg.sender, count);
        }
    }
}
