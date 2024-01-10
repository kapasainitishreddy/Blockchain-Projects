pragma solidity >=0.4.22 <=0.8.17;

contract Voting {
    // Mapping to track whether an address has voted
    mapping(address => bool) public voted;

    // Mapping to store the number of votes for each option (1 to 5)
    mapping(uint8 => uint8) public votes;

    // Variables to store the current winner and the number of votes for the current winner
    uint8 public currentWinner;
    uint8 public mostVotes;

    // Function to allow an address to vote for a number (1 to 5)
    function vote(uint8 number) public {
        // Ensure the address hasn't voted before
        require(!voted[msg.sender], "Address has already voted");

        // Ensure the provided number is within the valid range
        require(number <= 5 && number >= 1, "Invalid vote number");

        // Mark the address as voted
        voted[msg.sender] = true;

        // Increment the vote count for the chosen number
        votes[number]++;

        // Check if the current number of votes for the chosen number is greater than or equal to the most votes
        if (votes[number] >= mostVotes) {
            // Update the current winner and the most votes
            currentWinner = number;
            mostVotes = votes[number];
        }
    }

    // Function to get the number of votes for a specific number (1 to 5)
    function getVotes(uint8 number) public view returns (uint8) {
        // Ensure the provided number is within the valid range
        require(number <= 5 && number >= 1, "Invalid vote number");

        // Return the number of votes for the specified option
        return votes[number];
    }

    // Function to get the current winner
    function getCurrentWinner() public view returns (uint8) {
        // Check if there are no votes yet (currentWinner is 0)
        if (currentWinner == 0) {
            // Return the default winner (1) in case of no votes
            return 1;
        }

        // Return the current winner
        return currentWinner;
    }
}
