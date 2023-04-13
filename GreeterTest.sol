// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Greeter.sol";

contract GreeterTest {
    Greeter public greeter;

    constructor(address greeterAddress) {
        greeter = Greeter(greeterAddress);
    }

    function testGreet() public view returns (string memory) {
        string memory greet = greeter.greet();
        return (greet);
    }
}
