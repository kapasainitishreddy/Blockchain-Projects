pragma solidity >=0.4.22 <=0.8.17;

contract FancyShirts {
    // Enumerations for shirt size and color
    enum Size {
        small,
        medium,
        large
    }

    enum Color {
        red,
        green,
        blue
    }

    // Struct representing a shirt
    struct Shirt {
        Size size;
        Color color;
    }

    // Mapping to store shirts for each address
    mapping(address => Shirt[]) shirts;

    // Modifier to check if the sent amount matches the calculated shirt price
    modifier correctAmount(Size size, Color color) {
        // Check if the sent amount matches the calculated shirt price
        require(
            getShirtPrice(size, color) == msg.value,
            "Incorrect amount sent"
        );
        _; // Continue with the function if the check passes
    }

    // Function to calculate the price of a shirt based on size and color
    function getShirtPrice(Size size, Color color) public pure returns (uint256) {
        uint256 price;

        // Calculate the base price based on the shirt size
        if (size == Size.small) {
            price += 10;
        } else if (size == Size.medium) {
            price += 15;
        } else {
            price += 20;
        }

        // Add extra cost for non-red shirts
        if (color != Color.red) {
            price += 5;
        }

        return price;
    }

    // Function to allow users to buy a shirt by sending the correct amount
    function buyShirt(Size size, Color color) public payable correctAmount(size, color) {
        // Create a new shirt with the specified size and color
        Shirt memory shirt = Shirt(size, color);

        // Add the new shirt to the user's collection
        shirts[msg.sender].push(shirt);
    }

    // Function to get the count of shirts with a specific size and color owned by a user
    function getShirts(Size size, Color color) public view returns (uint256) {
        uint256 count;

        // Iterate through the user's shirts and count those matching the specified size and color
        for (uint256 i = 0; i < shirts[msg.sender].length; i++) {
            if (
                shirts[msg.sender][i].size == size &&
                shirts[msg.sender][i].color == color
            ) {
                count++;
            }
        }

        return count; // Return the count of matching shirts
    }
}
