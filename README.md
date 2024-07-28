# JKTToken

JKTToken is a simple ERC20 token contract written in Solidity. It allows for token creation, transfer, minting, and burning functionalities.

## Getting Started

To deploy and interact with the JKTToken contract, you can use tools like Remix or Hardhat with a local blockchain network or Ethereum testnets (Rinkeby, Ropsten, etc.).

### Prerequisites

- **Remix IDE**: For compiling and deploying Solidity contracts. Visit [Remix](https://remix.ethereum.org/) and ensure you have an Ethereum wallet (like MetaMask) set up.
- **Hardhat**: For local development and testing. Visit [Hardhat](https://hardhat.org/) for installation instructions.

### Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/Humbleble/Mint-BurnToken.git
```

### Deployment

1. Open the contract file (JKTToken.sol) in Remix IDE.
2. Compile the contract using the appropriate Solidity compiler version (e.g., ^0.8.0).
3. Deploy the contract, ensuring to set initial parameters (`name`, `symbol`, `decimals`, `initialSupply`).

### Interacting with the Contract

- **Transfer Tokens:** Use the transferTokens function to send tokens from your account to another address.
- **Mint Tokens:** Only the contract owner can mint new tokens using the mintTokens function.
- **Burn Tokens:** Any account can burn (destroy) their own tokens using the burnTokens function.
