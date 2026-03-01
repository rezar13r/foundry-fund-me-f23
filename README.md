# Fund Me

A Foundry project for a crowdfunding contract that accepts ETH and uses a Chainlink ETH/USD price feed to enforce a minimum contribution.

## Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git, with submodules enabled

## Setup

```sh
git clone --recurse-submodules <repository-url>
cd foundry-fund-me-f23
forge build
forge test
```

If the repository was cloned without submodules, initialize them with:

```sh
git submodule update --init --recursive
```

## Networks

The deployment helper uses a local mock feed on local chains and the configured Chainlink ETH/USD feeds on Ethereum mainnet and Sepolia. Deployment to a live network requires an RPC endpoint and a funded deployment account. Keep credentials in local environment variables or a secure wallet; never commit them.

To deploy locally:

```sh
anvil
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url http://127.0.0.1:8545 --broadcast
```

To deploy to Sepolia, provide `SEPOLIA_RPC_URL` and `PRIVATE_KEY` in your local shell, then run:

```sh
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url "$SEPOLIA_RPC_URL" --private-key "$PRIVATE_KEY" --broadcast
```

## Useful commands

```sh
forge fmt
forge test -vvv
forge snapshot
```
