// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {VotingSystem} from "../src/VotingSystem.sol";

contract DeployVoting is Script {

    function run() public {
        vm.startBroadcast();

        new VotingSystem(
            "2026 Student Election",
            60
        );

        vm.stopBroadcast();
    }
}