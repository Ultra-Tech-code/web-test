// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Degcoin.sol";
import "./Bamtoken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./IISWAP.sol"

contract TokenSwap {

    //new implemenrtataion of the code.. using OPENZEPPELIN

    //DEGCOIN 
    //BlackAdamToken


    IERC20 token1;
    IERC20 token2;
    event TokenSwapped(string swapped);

    constructor(IERC20 _token1, IERC20 _token2) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    }

    // struct Transaction{
    //     IERC20 token;
    //     uint amountToSend;
    //     uint deadline;
    //     uint amountToReceive;
    // }

    //swap function
    //with my logic, both swappers would have to approve the Swap Contract with openzeppelin "approve" function before a swap can take place.
    function swapToken(
        address owner1,
        address owner2,
        uint256 amount1,
        uint256 amount2
    ) external {
    //here i'm running a check if both swappers have called the ERC20 approve function on my contract 
    //and if the allowance from the approve function is >= to the amount specified
    
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Allowance for token one too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Allowance for token two too low"
        );
        transferToken(token1, owner1, owner2, amount1);
        transferToken(token2, owner2, owner1, amount2);

        emit TokenSwapped("Token swapped");
    }

    function transferToken(
        IERC20 tokenToTransfer,
        address from,
        address to,
        uint256 amount
    ) private {
        bool sent = tokenToTransfer.transferFrom(from, to, amount);
        require(sent, "Sorry swap failed");
    }
}

