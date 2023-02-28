// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MyToken is IERC20, Ownable {
    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 totalSupply_
    ) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
        _totalSupply = totalSupply_;
        _totalSupply = totalSupply_ * 10 ** uint256(decimals_);
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(
        address account
    ) external view override returns (uint256) {
        return _balances[account];
    }

    function transfer(
        address to,
        uint256 amount
    ) external override returns (bool) {
        require(address(0) != to, "ERC20: transfer to the zero address");
        require(
            _balances[msg.sender] >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function allowance(
        address owner,
        address spender
    ) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(
        address spender,
        uint256 amount
    ) external override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external override returns (bool) {
        require(
            _balances[from] >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        require(
            _allowances[from][msg.sender] >= amount,
            "ERC20: transfer amount exceeds allowance"
        );
        _balances[from] -= amount;
        _balances[to] += amount;
        _allowances[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _balances[to] = _balances[to].add(amount);
        _totalSupply = _totalSupply.add(amount);

        emit Transfer(address(0), to, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        require(
            _balances[from] >= amount,
            "ERC20: burn amount exceeds balance"
        );
        _balances[from] = _balances[from].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(from, address(0), amount);
    }
}
