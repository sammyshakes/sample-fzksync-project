//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Child {
    uint data;
    bool public isEnabled;
    uint public index;

    constructor(uint _data, uint _index) {
        data = _data;
        isEnabled = true;
        index = _index;
    }

    function disable() external {
        isEnabled = false;
    }
}
