// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Greeter.sol";

// import "../interfaces/IContractDeployer.sol";

contract GreeterTest is Test {
    Greeter public greeter;

    // IContractDeployer public cxDeployer;
    // uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    // address contractDeployerAddress = vm.envAddress("CONTRACT_DEPLOYER_ADDRESS");
    // address atlantisAddress = vm.envAddress("ATLANTIS_TESTNET_DEPLOYER");
    address greeterContract = vm.envAddress("DEPLOYED_GREETER");

    function setUp() public {
        // string memory greeting = "Hello PW!";
        // greeter = new Greeter(greeting);

        greeter = Greeter(greeterContract);
        // cxDeployer = IContractDeployer(contractDeployerAddress);
    }

    function testGreet() public {
        string memory greet = greeter.greet();
        console.log(greet);
    }
}
