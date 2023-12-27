pragma solidity >=0.4.22 <=0.8.17;

contract Comparison {
    function compare(int256 a, int256 b) public pure returns (int256) {
        return a>b ? int256(1) : (a<b ? int256(-1) : int256(0));
    }
}
