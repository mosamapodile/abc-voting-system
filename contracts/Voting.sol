// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingSystem {
    uint256 public candidateAVotes;
    uint256 public candidateBVotes;

    function vote(uint256 _candidateId) public {
        if (_candidateId == 1) {
            candidateAVotes = candidateAVotes + 1;
        } else if (_candidateId == 2) {
            candidateBVotes = candidateBVotes + 2; // Intentional bug to fix in next commit!
        }
    }
}
