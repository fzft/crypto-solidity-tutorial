// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnsafeDeletegatecall {
    address public owner;
    Lib public lib;

    constructor(Lib _lib) {
        owner = msg.sender;
        lib = Lib(_lib);
    }


    // receive() external payable {
    //     address(lib).delegatecall(msg.data);
    // }
        
}

contract Lib {
    address public owner;

    function foo() public {
        owner = msg.sender;
    }
}