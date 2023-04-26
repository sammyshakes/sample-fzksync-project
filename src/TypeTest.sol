// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract TypeTest {
    uint256 public number;
    uint16 public number2;
    bytes32 public codeHash;
    bytes public byteArray;
    address public testAddress;
    address[] public testAddresses;
    string public greeting;
    string[] public greetings;
    uint256[] public numbers;

    function setTestAddress(address _testAddress) public {
        testAddress = _testAddress;
    }

    function setTestAddresses(address[] memory _testAddresses) public {
        for (uint256 i; i < _testAddresses.length; i++) {
            //set new greetings
            testAddresses.push(_testAddresses[i]);
        }
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function setNumbers(uint256[] memory _numbers) public {
        for (uint256 i; i < _numbers.length; i++) {
            //set new greetings
            numbers.push(_numbers[i]);
        }
    }

    function setNumber2(uint16 newNumber) public {
        number2 = newNumber;
    }

    function setCodeHash(bytes32 _codeHash) public {
        codeHash = _codeHash;
    }

    function setByteArray(bytes memory _byteArray) public {
        byteArray = _byteArray;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function setGreetings(string[] memory _greetings) public {
        for (uint256 i; i < _greetings.length; i++) {
            //set new greetings
            greetings.push(_greetings[i]);
        }
    }

    function setNumbersAndGreetings(string[] memory _greetings, uint256[] memory _numbers) public {
        require(_greetings.length == _numbers.length, "Mismatch Arrays");
        for (uint256 i; i < _greetings.length; i++) {
            //set new greetings
            greetings.push(_greetings[i]);
            numbers.push(_numbers[i]);
        }
    }

    function increment() public {
        number++;
    }
}
