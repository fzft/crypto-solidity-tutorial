// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assembly {


    // function  nativeLoops() public returns (uint _r) {
    //     for (uint i = 0; i < 10; i++) {
    //         _r ++;
    //     }
    // }

    // function asmLoops() public returns(uint _r) {
    //     assembly {
    //         let i := 0;
    //         loop:
    //             i := add(i, 1)
    //             _r := add(_r, 1)
    //             jumpi(loop, lt(i, 10))
    //     };
    // }

    // function addtion(uint _x, uint _y) public pure returns (uint) {
    //     assembly {
    //         let result := add(_x, _y)
    //         mstore(0x0, result)
    //         return(0x0, 32)
    //     }
    // }

    // function nativeConditional(uint _v) public returns (uint) {
    //     if (_v == 1) {
    //         return 2;
    //     } else if (_v == 2) {
    //         return 3;
    //     } else {
    //         return 4;
    //     }
    // }
        
}