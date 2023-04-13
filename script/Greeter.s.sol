// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import "../src/Greeter.sol";

contract GreeterScript is Script {
    Greeter public greeter;
    address greeterContract = vm.envAddress("DEPLOYED_GREETER");

    function run() public {
        greeter = Greeter(greeterContract);
        // vm.broadcast();
        string memory greet = greeter.greet();
    }
}
