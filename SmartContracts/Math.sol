pragma solidity >=0.4.22 <=0.8.17;

contract MathUtils {
    // Function to round down to the nearest multiple of 10
    function floor(int256 value) public pure returns (int256) {
        int256 remainder = value % 10;
        return value - remainder;
    }

    // Function to round up to the nearest multiple of 10
    function ceil(int256 value) public pure returns (int256) {
        int256 remainder = value % 10;

        if (remainder > 0) {
            return value + (10 - remainder);
        } else if (remainder == 0) {
            return value;
        }

        return value - remainder;
    }

    // Function to calculate the average of an array of values
    function average(int256[] memory values, bool down)
        public
        pure
        returns (int256)
    {
        if (values.length == 0) {
            return 0;
        }

        int256 count;
        for (uint256 i = 0; i < values.length; i++) {
            count += values[i];
        }

        // Calculate the average and round either up or down based on the 'down' parameter
        int256 average = count / int256(values.length);
        return down ? floor(average) : ceil(average);
    }
}
