require("@nomiclabs/hardhat-waffle");
require("dotenv").config({ path: ".env" });

module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      // .env file was giving trouble so used absolute values
      url: "https://eth-rinkeby.alchemyapi.io/v2/xRV8KavFTBAX-LdnhgMUPRwzqqrz5lzj",
      accounts: [
        "97704492cf1782ea10d482c3916b996674f7016a7d914de6daa9a09a2662a45d",
      ],
    },
  },
};
