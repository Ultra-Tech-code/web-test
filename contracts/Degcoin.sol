// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DEGCOIN is ERC20("DEGCOIN", "DEG"){
    address owner;
    constructor () {
        msg.sender == owner;
        _mint(address(this), 10000000e18);
    }
    
    modifier onlyOwner() {
        msg.sender == owner;
        _;
    }
    function transferOut(address addressTo, uint amountTo)external onlyOwner{
        uint balContract = balanceOf(address(this));
        require(balContract >= amountTo, "no enough");
        _transfer(address(this), addressTo, amountTo);
    }

    // uint8 constant _decimals = 18;
    // uint256 constant _totalSupply = 100 * (10**6) * 10**_decimals;  // 100m tokens for distribution
    
    // function mint(uint amount) internal{
    //     _mint(msg.sender, amount);
    // }
}