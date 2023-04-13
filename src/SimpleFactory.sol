//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@matterlabs/zksync-contracts/l2/system-contracts/Constants.sol";
import "@matterlabs/zksync-contracts/l2/system-contracts/libraries/SystemContractsCaller.sol";

import "./Child.sol";
import "./StepChild.sol";

contract SimpleFactory {
    Child[] public children;
    StepChild[] public stepChildren;
    uint256 disabledCount;

    bytes32 public childBytecodeHash;
    bytes32 public stepChildBytecodeHash;

    event ChildCreated(address childAddress, uint256 data);
    event StepChildCreated(address childAddress);

    constructor(bytes32 _childBytecodeHash, bytes32 _stepChildBytecodeHash) {
        childBytecodeHash = _childBytecodeHash;
        stepChildBytecodeHash = _stepChildBytecodeHash;
    }

    function hello() external pure returns (string memory) {
        return "hello";
    }

    function createChild(uint256 data) external {
        Child child = new Child(data, children.length);
        children.push(child);
        emit ChildCreated(address(child), data);
    }

    function createStepChild() external {
        StepChild stepchild = new StepChild();
        stepChildren.push(stepchild);
        emit StepChildCreated(address(stepchild));
    }

    function createStepChild(bytes32 salt, address owner1, address owner2) external returns (address accountAddress) {
        (bool success, bytes memory returnData) = SystemContractsCaller.systemCallWithReturndata(
            uint32(gasleft()),
            address(DEPLOYER_SYSTEM_CONTRACT),
            uint128(0),
            abi.encodeCall(
                DEPLOYER_SYSTEM_CONTRACT.create2Account,
                (salt, aaBytecodeHash, abi.encode(owner1, owner2), IContractDeployer.AccountAbstractionVersion.Version1)
            )
        );
        require(success, "Deployment failed");

        (accountAddress) = abi.decode(returnData, (address));
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
}
