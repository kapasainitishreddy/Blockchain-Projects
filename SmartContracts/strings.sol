pragma solidity >=0.4.22 <=0.8.17;

contract StringGenerator {
    // State variable to store the current string as bytes
    bytes public currentstring;

    // Mapping to keep track of whether each address has added a character
    mapping(address => bool) public hasAddedCharacter;

    // Function to allow an address to add a single character to the string
    function addCharacter(string memory character) public {
        // Ensure the address has not already added a character
        require(!hasAddedCharacter[msg.sender], "Address has already added a character");

        // Ensure the length of the current string is less than 5
        require(currentstring.length < 5, "Already at the maximum length");

        // Convert the input string to bytes
        bytes memory passedstring = bytes(character);

        // Ensure that the input string contains only one character
        require(passedstring.length == 1, "Input should be a single character");

        // Mark the address as having added a character
        hasAddedCharacter[msg.sender] = true;

        // Add the single character to the current string
        currentstring.push(passedstring[0]);
    }

    // Function to retrieve the current string
    function getString() public view returns (string memory) {
        // Convert the bytes to a string and return
        return string(currentstring);
    }
}
