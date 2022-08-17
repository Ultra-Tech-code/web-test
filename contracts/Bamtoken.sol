// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BlackAdamToken is ERC20("BlackAdam", "BAM"){

    constructor() {
        _mint(address(this), 10000e18);
    }

    function transferFromContract(address to, uint _amountTodistribute) external {
        uint balance = balanceOf(address(this));
        require(balance >= _amountTodistribute, "money requested is too much");
        _transfer(address(this), to, _amountTodistribute);
    }

    function withdraw(uint _amt) external {
        payable(msg.sender).transfer(_amt);
    }


}