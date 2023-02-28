const hre = require("hardhat");

async function main() {


  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const myToken = await MyToken.deploy("My Token", "MTK", 18, 100);

  await myToken.deployed();

  console.log(
    `myToken deployed to ${myToken.address}`
  );
}

// 

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
