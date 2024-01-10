// Solidity version declaration
pragma solidity >=0.4.22 <=0.8.17;

// Richest contract
contract Richest {
    // State variables to track the richest address and the most sent amount
    address public richest; // Address of the richest person
    uint256 public mostsent; // The highest amount sent
    
    // Mapping to track pending withdrawals for each address
    mapping(address => uint256) public pendingwithdrawls; // Pending withdrawals for each address

    // Function that allows a sender to become the richest by sending a higher value
    function becomeRichest() external payable returns (bool) {
        // Check if the sent value is less than or equal to the current highest amount sent
        if (msg.value <= mostsent) {
            return false; // Return false if the sent value is not higher
        }
        
        // Move the previously highest amount to pending withdrawals for the previous richest
        pendingwithdrawls[richest] += mostsent;
        
        // Update the new richest address and the new highest sent amount
        richest = msg.sender;
        mostsent = msg.value;
        
        return true; // Return true to indicate successful update
    }
    
    // Function for a recipient to withdraw their pending amount
    function withdraw() external {
        // Retrieve the pending amount for the caller
        uint256 amount = pendingwithdrawls[msg.sender];
        
        // Reset the pending amount to zero
        pendingwithdrawls[msg.sender] = 0;
        
        // Attempt to send the pending amount to the caller
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        
        // Ensure the transfer was successful
        require(sent, "Failed to send Ether");      
    }    
    
    // Function to get the address of the richest person
    function getRichest() public view returns (address) {
        return richest; // Return the address of the richest person
    }   
}
