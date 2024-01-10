pragma solidity >=0.4.22 <=0.8.17;

contract GridMaker {
    // Function to create a 2D integer grid with the specified number of rows, columns, and initial value
    function make2DIntGrid(
        uint256 rows,
        uint256 cols,
        int256 value
    ) public pure returns (int256[][] memory) {
        // Initialize a dynamic array to store the 2D grid
        int256[][] memory array = new int256[][](rows);

        // Loop through each row
        for (uint256 row = 0; row < rows; row++) {
            // Initialize a nested array for each row
            int256[] memory nestedArray = new int256[](cols);

            // Loop through each column
            for (uint256 col = 0; col < cols; col++) {
                // Set the initial value for each element in the nested array
                nestedArray[col] = value;
            }

            // Assign the nested array to the corresponding row in the 2D grid
            array[row] = nestedArray;
        }

        // Return the 2D grid
        return array;
    }

    // Function to create a 2D address grid with the specified number of rows and columns
    function make2DAddressGrid(uint256 rows, uint256 cols)
        public
        view
        returns (address[][] memory)
    {
        // Initialize a dynamic array to store the 2D grid
        address[][] memory array = new address[][](rows);

        // Loop through each row
        for (uint256 row = 0; row < rows; row++) {
            // Initialize a nested array for each row
            address[] memory nestedArray = new address[](cols);

            // Loop through each column
            for (uint256 col = 0; col < cols; col++) {
                // Set the value for each element in the nested array to the sender's address
                nestedArray[col] = msg.sender;
            }

            // Assign the nested array to the corresponding row in the 2D grid
            array[row] = nestedArray;
        }

        // Return the 2D grid
        return array;
    }
}
