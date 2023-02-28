// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore {

    mapping (address => uint) public balances;

    function deposite() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount);
        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to sent Ether");
        balances[msg.sender] -= _amount;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}