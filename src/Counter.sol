// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Counter {
    uint256 public number;

    uint256 public number2;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
