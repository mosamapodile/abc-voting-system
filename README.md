# WeThinkCode verification code :
WTC-SHT7AV4F

# 🗳️ Decentralized Voting System (ABC Prep Track)

A secure, tamper-proof decentralized voting application built for the **Africa's Blockchain Club (ABC)** technical entry requirements. This repository demonstrates an iterative development workflow, transitioning a basic implementation into a secure smart contract running on a local EVM development environment.

---

## 🎯 Project Goal & Problem Statement

### The Problem
Traditional voting systems rely on centralized databases and authorities. This creates critical vulnerabilities:
* **Single Points of Failure:** Central databases can be altered, hacked, or manipulated by malicious actors.
* **Lack of Transparency:** Voters cannot independently verify that their votes were accurately recorded without compromising privacy.
* **Double Voting:** Preventing individuals from voting multiple times requires heavy administrative overhead.

### The Solution
This project leverages the Ethereum blockchain to build an open, immutable, and algorithmic election portal. By deploying smart contracts, we guarantee:
1. **Unchangeable Records:** Once a vote is cast, it is permanently locked into a block using cryptographic hashes.
2. **Algorithmic Trust:** Open-source rules prevent double-voting automatically through code logic, completely eliminating the need for a central moderator.

---

## 🚀 Development Journey (The Iterations)

This project was built incrementally to mirror production-grade developer workflows. We track progress through explicit Git milestones:

### 🔹 Iteration 1: Simple State Manipulation
* **Objective:** Establish core structural state and basic entry endpoints.
* **Features:** Initialized `uint256` unsigned integer storage values for candidate tracking and built a baseline transaction endpoint.
* **Git Commit Tag:** `Feat: Add basic vote counting logic for Iteration 1`

### 🔹 Iteration 2: Protocol Security & Math Optimizations
* **Objective:** Implement data assertions to eliminate logic flaws and protect state integrity.
* **Features:** Fixed arithmetic bugs, added an account `mapping(address => bool)` checklist, and injected `require` gates to permanently block double-voting attempts.
* **Git Commit Tag:** `Fix: Correct Candidate B math and add double-voting protection using mapping`

### 🔹 Iteration 3: Administration & Governance
* **Objective:** Introduce operational boundaries and structural transparency.
* **Features:** Injected a initialization `constructor` tracking contract ownership (`admin`), and introduced global `view` computational lookups for real-time winner analysis.
* **Git Commit Tag:** `Feat: Add contract constructor, admin tracking, and getWinner function`

---

## 💻 Terminal User Interface (UI) Simulation

Because backend smart contracts are designed to interface seamlessly with frontends or CLI wrappers, this contract outputs clean data streams. Below is a structural flow of how a terminal script or frontend layout interfaces with this protocol:

```text
===================================================
          AFRICA'S BLOCKCHAIN CLUB VOTING          
===================================================
 [1] Vote for Candidate A (Current: 14 Votes)
 [2] Vote for Candidate B (Current: 12 Votes)
 [3] View Live Election Leaderboard
---------------------------------------------------
> Select an option: 1

[SYSTEM]: Processing cryptographic transaction...
[WALLET]: msg.sender -> 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
[STATUS]: Success! Block confirmed.

> Select an option: 3
[RESULT]: "Candidate A is winning!"
===================================================
```

---

## 🛠️ Local Development & How To Run

This project uses **Foundry**, a lightning-fast compilation and testing framework built in Rust.

### Prerequisites (Linux Setup)
Ensure you have the Foundry tool suite initialized on your environment:
```bash
curl -L https://paradigm.xyz | bash
source ~/.bashrc
foundryup
```

### Installation & Initialization
1. Clone this repository to your local directory:
   ```bash
   git clone https://github.com
   cd abc-voting-system
   ```
2. Initialize and download the standard Foundry dependencies:
   ```bash
   forge init --force
   ```

### Compile & Build Contracts
To compile the Solidity codebase down into EVM byte-code, execute the compilation framework:
```bash
forge build
```

### Local Blockchain Deployment Simulation
To launch a localized sandbox Ethereum node on your machine, launch Anvil:
```bash
anvil
```



## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
