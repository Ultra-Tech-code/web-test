require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
import "@nomiclabs/hardhat-ethers";
require("dotenv").config({ path: ".env" });


const ALCHEMY_ROPSTEN_API_KEY_URL = process.env.ALCHEMY_ROPSTEN_API_KEY_URL;
const ALCHEMY_RINKEBY_API_KEY_URL = process.env.ALCHEMY_RINKEBY_API_KEY_URL;
//contract address key
const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;
//beneficial address key
const ACCOUNT_PRIVATE_KEY2 = process.env.ACCOUNT_PRIVATE_KEY2;
//beneficial address key
const ACCOUNT_PRIVATE_KEY3 = process.env.ACCOUNT_PRIVATE_KEY3;

module.exports = {
  solidity: "0.8.9",
  networks: {
    forking:{
      url: ALCHEMY_ROPSTEN_API_KEY_URL,
    },
    ropsten: {
      url: ALCHEMY_ROPSTEN_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY3]
    },
    rinkeby: {
      url: ALCHEMY_RINKEBY_API_KEY_URL,
      accounts: [ACCOUNT_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: "F6M1GHRFJAESSIJ3W5CQG9MTXR8UFZ3MRZ"
  }
};