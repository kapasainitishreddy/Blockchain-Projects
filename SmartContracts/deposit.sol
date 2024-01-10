pragma solidity >=0.4.22 <=0.8.17;

contract Competitors {
    address public owner; // Address of the contract owner

    address public depositor1; // Address of the first depositor
    address public depositor2; // Address of the second depositor
    address public maxDepositor; // Address of the depositor who deposited the most

    uint256 public depositor1Deposited; // Amount deposited by depositor1
    uint256 public depositor2Deposited; // Amount deposited by depositor2

    bool public withdrew; // Tracks whether the max depositor withdrew their funds

    constructor() {
        owner = msg.sender; // Set the deploying address as the owner
    }

    // Function to deposit 1 Ether and track depositors
    function deposit() external payable {
        require(msg.value == 1 ether, "You can only send exactly 1 ether");
        require(depositor1Deposited + depositor2Deposited < 3 ether, "3 Ethereum has been received, no more deposits are accepted");

        // Assign depositors if they are uninitialized
        if (depositor1 == address(0)) {
            depositor1 = msg.sender;
        } else if (depositor2 == address(0)) {
            depositor2 = msg.sender;
        }

        // Update deposited amount based on the sender
        if (msg.sender == depositor1) {
            depositor1Deposited += msg.value;
        } else if (msg.sender == depositor2) {
            depositor2Deposited += msg.value;
        } else {
            revert("You are not one of the valid depositors.");
        }

        // Determine the maxDepositor if total deposits reach 3 Ether
        if (depositor1Deposited + depositor2Deposited >= 3 ether) {
            if (depositor1Deposited > depositor2Deposited) {
                maxDepositor = depositor1;
            } else {
                maxDepositor = depositor2;
            }
        }
    }

    // Function for the maxDepositor to withdraw 3 Ether
    function withdraw() external {
        require(depositor1Deposited + depositor2Deposited >= 3 ether, "3 ether has not yet been received");
        require(msg.sender == maxDepositor, "You did not deposit the most ether");

        // Transfer 3 Ether to the maxDepositor
        payable(maxDepositor).call{value: 3 ether}("");
        withdrew = true;
    }

    // Function to destroy the contract by the owner after withdrawal
    function destroy() external {
        require(msg.sender == owner, "You are not the owner");
        require(withdrew == true, "Max depositor has not yet withdrawn their funds");

        // Self-destruct the contract and send remaining funds to the owner
        selfdestruct(payable(owner));
    }
}
