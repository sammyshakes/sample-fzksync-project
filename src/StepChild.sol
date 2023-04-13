//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract StepChild {
    bool public isEnabled;

    constructor() {}

    function disable() external {
        isEnabled = false;
    }

    function enable() external {
        isEnabled = true;
    }
}
