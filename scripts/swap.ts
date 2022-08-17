import { ethers } from "hardhat";

async function main() {
  //swap two token(ethers and bamtokens => DEGTOKEN)
  //
  //check balance of signer before swap
  //get bal of contract before
  //deposit/swap
  //get bal of cintract after
  //check balance after swap.
  const BAMTOKENADDRESS = "0xdAC17F958D2ee523a2206206994597C13D831ec7";
  const DEGTOKENADDRESS = "0x6B175474E89094C44Da98b954EedeAC495271d0F";
  const contractAddr = "0xB994cA5c3f21E0904e0A2f49524C0F19D588ED09";

//   const [owner] = await ethers.getSigners();

  

  const dev = await ethers.getContractAt("IswapToken", contractAddr);

  const contBalance = await dev.checkContractBalance();
  console.log("Contract Balance before------", contBalance)

  const _value = ethers.utils.parseEther("10");


//   let getBalance = await dev.getBalance(owner);
//   console.log("user bal before -----", getBalance);

  //DEposit/Swap
  const deposit = await dev.deposit(_value, DEGTOKENADDRESS);
  console.log("deposit-----", deposit)

    //Get coontract Balance
  console.log("Contract Balance After------", contBalance)

  //Get User Balance
//   console.log("user bal after -----", getBalance );

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});