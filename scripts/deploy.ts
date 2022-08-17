import { ethers } from "hardhat";

async function main() {

  //nodeDeployed: 0x5FbDB2315678afecb367f032d93F642f64180aa3
  //Testnet deployed: 0xB994cA5c3f21E0904e0A2f49524C0F19D588ED09

  const swapT = await ethers.getContractFactory("swapToken");
  const swaptoken = await swapT.deploy();

  await swaptoken.deployed();

  console.log(`contrac deployed to ${swaptoken.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
