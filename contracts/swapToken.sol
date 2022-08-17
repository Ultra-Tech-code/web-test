//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import './Degcoin.sol';

contract swapToken is DEGCOIN{

    struct txndetails{
        uint amount;
        address contAddress;
    }
    //only bamtoken or degtoken is allowed on this platform
    //you can swap eth to bamtoken

    address BAMTOKENADDRESS = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address DEGTOKENADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    mapping(address => txndetails) public transactionDetails;

    function deposit(uint _amount, address _contAddress) external{
         require(_contAddress == DEGTOKENADDRESS, "ONLY BAMTOKEN ALLOWED");
         require(_amount > 0, "amount too small to be swapped");
        txndetails storage td = transactionDetails[msg.sender];
        td.amount = _amount;
        td.contAddress = _contAddress;
        uint AnyTokentoDEGtoken = _amount * 2;
        _mint(msg.sender, AnyTokentoDEGtoken);
        //mint(msg.value);
        // _transfer(msg.sender, address(this), userStake.stakedAmount);
        // payable(msg.sender).transfer(transferable);
    }

    function checkContractBalance() external view returns (uint bal) {
        bal = address(this).balance;
    }














}