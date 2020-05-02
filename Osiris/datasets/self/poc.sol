pragma solidity ^0.4.0;
contract POC {
    function add_overflow() returns (uint256 _overflow) {
        uint256 max = 2**256 - 1;
        return max + 1;
    }
    function sub_underflow() returns (uint256 _underflow) {
        uint256 min = 0;
        return min - 1;
    }
    function mul_overflow() returns (uint256 _overflow) {
        uint256 max = 2**255;
        return max * 2;
    }
}
