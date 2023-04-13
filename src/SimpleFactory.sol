//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "../lib/era-system-contracts/contracts/Constants.sol";
import "../lib/era-system-contracts/contracts/libraries/SystemContractsCaller.sol";

import "./Child.sol";
import "./StepChild.sol";

contract SimpleFactory {
    Child[] public children;
    StepChild[] public stepChildren;
    uint256 disabledCount;

    address[] public childAddresses;

    bytes32 public childBytecodeHash;
    bytes32 public stepChildBytecodeHash;
    bytes32 salt = 0x0000;

    event ChildCreated(address childAddress, uint256 data);
    event StepChildCreated(address childAddress);

    constructor(bytes32 _childBytecodeHash, bytes32 _stepChildBytecodeHash) {
        childBytecodeHash = _childBytecodeHash;
        stepChildBytecodeHash = _stepChildBytecodeHash;
    }

    function createStepChild() external returns (address accountAddress) {
        (bool success, bytes memory returnData) = SystemContractsCaller.systemCallWithReturndata(
            uint32(gasleft()),
            address(DEPLOYER_SYSTEM_CONTRACT),
            uint128(0),
            abi.encodeCall(DEPLOYER_SYSTEM_CONTRACT.create, (salt, stepChildBytecodeHash, new bytes(0)))
        );
        require(success, "Deployment failed");

        (accountAddress) = abi.decode(returnData, (address));

        StepChild stepChild = StepChild(accountAddress);
        stepChildren.push(stepChild);

        emit StepChildCreated(accountAddress);
    }

    function createChild(uint256 data) external returns (address accountAddress) {
        (bool success, bytes memory returnData) = SystemContractsCaller.systemCallWithReturndata(
            uint32(gasleft()),
            address(DEPLOYER_SYSTEM_CONTRACT),
            uint128(0),
            abi.encodeCall(
                DEPLOYER_SYSTEM_CONTRACT.create, (salt, childBytecodeHash, abi.encode(data, childAddresses.length))
            )
        );
        require(success, "Deployment failed");

        (accountAddress) = abi.decode(returnData, (address));

        childAddresses.push(accountAddress);

        emit ChildCreated(accountAddress, data);
    }

    function getChildren() external view returns (Child[] memory _children) {
        _children = new Child[](children.length - disabledCount);
        uint256 count;
        for (uint256 i = 0; i < children.length; i++) {
            if (children[i].isEnabled()) {
                _children[count] = children[i];
                count++;
            }
        }
    }

    function disable(Child child) external {
        children[child.index()].disable();
        disabledCount++;
    }

    function newChild(uint256 data) external {
        Child child = new Child(data, children.length);
        children.push(child);
        emit ChildCreated(address(child), data);
    }

    function newStepChild() external {
        StepChild stepChild = new StepChild();
        stepChildren.push(stepChild);
    }

    function hello() external pure returns (string memory) {
        return "hello";
    }
}
