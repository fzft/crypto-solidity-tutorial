// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IMyToken is IERC20{

    // @dev Mint tokens
    function TokenMint(address _user, uint256 _amount) external;

    // @dev Burn tokens
    function TokenBurn(address _user, uint256 _amount) external;

    
}