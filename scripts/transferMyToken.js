
const hre = require("hardhat");

const MyTokenAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
const walletAddress = "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC";

async function main() {

  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const myToken = await MyToken.attach(MyTokenAddress);

//   const amount = hre.ethers.utils.parseEther("100");
//   const tx = await myToken.transfer(walletAddress, amount);
//   console.log("Transfer transaction sent:", tx.hash);

    // balanceOfMyToken = await myToken.balanceOf(MyTokenAddress);
    // console.log("Balance of MyToken:", balanceOfMyToken.toString());
}

// 

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});