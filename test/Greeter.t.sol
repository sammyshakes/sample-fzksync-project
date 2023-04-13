// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Greeter.sol";

// import "../interfaces/IContractDeployer.sol";

contract GreeterTest is Test {
    Greeter public greeter;

    address greeterContract = vm.envAddress("DEPLOYED_GREETER");

    function setUp() public {
        string memory greeting = "Hello PW!";
        greeter = new Greeter(greeting);
        // uint256 forkId = vm.createFork("http://localhost:3050");
        // vm.selectFork(forkId);

        // greeter = Greeter(greeterContract);
        // cxDeployer = IContractDeployer(contractDeployerAddress);
    }

    function testGreet() public returns (string memory) {
        string memory greet = greeter.greet();
        // console.log(greet);
        return (greet);
    }
}
