// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {VotingSystem} from "../contracts/Voting.sol";

contract DeployVoting is Script {
    function run() external {
        vm.startBroadcast();

        new VotingSystem("2026 Student Election", 60);

        vm.stopBroadcast();
    }
}
