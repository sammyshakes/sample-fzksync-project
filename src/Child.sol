//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Child {
    uint256 data;
    bool public isEnabled;
    uint256 public index;

    constructor(uint256 _data, uint256 _index) {
        data = _data;
        isEnabled = true;
        index = _index;
    }

    function disable() external {
        isEnabled = false;
    }

    function enable() external {
        isEnabled = true;
    }
}
