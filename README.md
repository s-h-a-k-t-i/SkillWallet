# SkillWallet: Skill verification on Ethereum blockchain

# Installation
<ul>
    <li>Install METAMASK and METAMASK Legacy web3 extensions for Chrome or Firefox </li>
    <li>Get Ethereum testnet faucet in Avalanche or Rinkeby or Ropsten or any testnet </li>
    <li>Download this Repository</li>
    <li>Deploy smart contract "<b>SkillWallet.sol</b>" (solidity compiler version 8.0)  which is under the folder "SmartContract" into testnet (using remix online compiler https://remix.ethereum.org/) and copy your contract address</li>
    <li>Paste your contract in <b>ContractAddress</b> variable at line no. 20 in app.js file</li>
    <li>And then copy your contract ABI.json code from remix online compiler which you can find below the compile button</li>
    <li>Paste your ABI code into abi.ejs file which you can find under the SkillWallet/web/views folder and then delete the first two lines i.e. 
        <ul>
            <li>[</li>
            <li>{</li>
        </ul>
        and then save it
    <li>run npm install</li>
    <li>run node app.js</li>
    <li>open http://localhost:3000 in your browser</li>
</ul>
