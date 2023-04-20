//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Greeter {
    string private greeting;
    string private greeting2;
    string private greeting3;

    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
