pragma solidity ^0.4.0;

contract Tentol {
    uint[] Somedata;
    function set(uint[] a) public {
        Somedata = a;
    }
    function get(uint[] a) public returns (uint[]) {
        return Somedata;
    }
}
