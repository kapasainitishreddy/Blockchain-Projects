pragma solidity >=0.4.22 <=0.8.17;

library Array {
    function indexOf(int256[] memory numbers, int256 target) public pure returns (int256) {
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] == target) {
                return int256(i);
            }
        }
        return -1;
    }

   function count(int256[] memory numbers, int256 target) public pure returns (int256) {
    int256 counts;
    for (uint256 i = 0; i < numbers.length; i++) {
        if (numbers[i] == target) {
            counts++;
        }
    }
    return counts;
}



    function sum(int256[] memory numbers) public pure returns (int256) {
        int256 sums;
        for (uint256 i = 0; i < numbers.length; i++) {
            sums += numbers[i];
        }
        return sums;
    }
}
