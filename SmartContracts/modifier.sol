pragma solidity >=0.4.22 <=0.8.17;

contract OnlyOwner {
    address public owner;
    uint8 public value;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _; // Continue executing the function if the requirement is met
    }

    constructor() {
        owner = msg.sender;
    }

    function add(uint8 number) public onlyOwner {
        value += number;
    }

    function subtract(uint8 number) public onlyOwner {
        value -= number;
    }

    function get() public view onlyOwner returns (uint8) {
        return value;
    }
}
