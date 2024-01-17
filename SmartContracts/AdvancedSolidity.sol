pragma solidity >=0.4.22 <=0.8.17;

contract AdvancedCounter {
    mapping(address => mapping(string => int256)) counters;
    mapping(address => mapping(string => bool)) counterIdexists;
    mapping(address => uint256) numCountersCreated;
    
    function counterExists(string memory id) internal view returns(bool){
        return counterIdexists[msg.sender][id];
    }
    
    function createCounter(string memory id, int256 value) public {
            // Write your code here
        require(
            numCountersCreated[msg.sender] !=3,
            "max counters reached"
        );
        require(!counterExists(id),"a counter with this id already exists");
        counters[msg.sender][id]= value;
        numCountersCreated[msg.sender]++;
        counterIdexists[msg.sender][id]= true;
    }

    function deleteCounter(string memory id) public {
        // Write your code here
        require(counterExists(id),"doesnt exist");
        delete counters[msg.sender][id];
        numCountersCreated[msg.sender]--;
        counterIdexists[msg.sender][id] = false;
    }

    function incrementCounter(string memory id) public {
        // Write your code here
        require(counterExists(id),"this counter doesnt  exist");
        counters[msg.sender][id]++;
    }

    function decrementCounter(string memory id) public {
        // Write your code here
        require(counterExists(id),"this counter doesnt  exist");
        counters[msg.sender][id]--;
    }

    function getCount(string memory id) public view returns (int256) {
        // Write your code here
        require(counterExists(id),"this counter doesnt  exist");
        return counters[msg.sender][id];
    }
}
