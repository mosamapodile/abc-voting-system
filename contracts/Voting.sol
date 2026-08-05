// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingSystem {
    uint256 public candidateAVotes;
    uint256 public candidateBVotes;
    
    // State variable to store the deployer's cryptographic address
    address public admin; 
    mapping(address => bool) public hasVoted;

    // Constructor runs exactly ONCE when the contract is deployed to the network
    constructor() {
        admin = msg.sender; // Sets the creator of the contract as the admin
    }

    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted!");

        if (_candidateId == 1) {
            candidateAVotes++;
        } else if (_candidateId == 2) {
            candidateBVotes++;
        }

        hasVoted[msg.sender] = true;
    }

    // Dynamic computation function to return current election standings
    function getWinner() public view returns (string memory) {
        if (candidateAVotes > candidateBVotes) {
            return "Candidate A is winning!";
        } else if (candidateBVotes > candidateAVotes) {
            return "Candidate B is winning!";
        } else {
            return "It is currently a tie!";
        }
    }
}
