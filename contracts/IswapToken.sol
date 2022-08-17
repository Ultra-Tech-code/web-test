// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IswapToken{
    function deposit(uint _amount, address _contAddress) external view;
    function checkContractBalance() external view returns (uint bal);
}