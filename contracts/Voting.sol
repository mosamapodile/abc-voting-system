// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingSystem {

    // ==========================
    // ADMIN
    // ==========================

    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can perform this action.");
        _;
    }

    // ==========================
    // ELECTION INFORMATION
    // ==========================

    string public electionName;
    uint256 public votingStart;
    uint256 public votingEnd;

    // ==========================
    // CANDIDATE STRUCTURE
    // ==========================

    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;

    // ==========================
    // VOTER INFORMATION
    // ==========================

    mapping(address => bool) public hasVoted;

    uint256 public totalVotes;

    // ==========================
    // EVENTS
    // ==========================

    event CandidateAdded(
        uint256 candidateId,
        string candidateName
    );

    event VoteCast(
        address voter,
        uint256 candidateId
    );

    event ElectionCreated(
        string electionName,
        uint256 startTime,
        uint256 endTime
    );

    // ==========================
    // CONSTRUCTOR
    // ==========================

    constructor(
        string memory _electionName,
        uint256 _durationMinutes
    ) {
        admin = msg.sender;

        electionName = _electionName;

        votingStart = block.timestamp;

        votingEnd = block.timestamp + (_durationMinutes * 1 minutes);

        emit ElectionCreated(
            electionName,
            votingStart,
            votingEnd
        );
    }

    // ==========================
    // ADD CANDIDATE
    // ==========================

    function addCandidate(
        string memory _name
    ) public onlyAdmin {

        candidates.push(
            Candidate({
                id: candidates.length + 1,
                name: _name,
                voteCount: 0
            })
        );

        emit CandidateAdded(
            candidates.length,
            _name
        );
    }

    // ==========================
    // VOTE
    // ==========================

    function vote(
        uint256 _candidateId
    ) public {

        require(
            block.timestamp >= votingStart,
            "Voting has not started."
        );

        require(
            block.timestamp <= votingEnd,
            "Voting has ended."
        );

        require(
            !hasVoted[msg.sender],
            "You have already voted."
        );

        require(
            _candidateId > 0 &&
            _candidateId <= candidates.length,
            "Invalid candidate."
        );

        hasVoted[msg.sender] = true;

        candidates[_candidateId - 1].voteCount++;

        totalVotes++;

        emit VoteCast(
            msg.sender,
            _candidateId
        );
    }

    // ==========================
    // GET CANDIDATE
    // ==========================

    function getCandidate(
        uint256 _candidateId
    )
        public
        view
        returns (
            uint256 id,
            string memory name,
            uint256 votes
        )
    {
        Candidate memory candidate =
            candidates[_candidateId - 1];

        return (
            candidate.id,
            candidate.name,
            candidate.voteCount
        );
    }

    // ==========================
    // TOTAL CANDIDATES
    // ==========================

    function getCandidateCount()
        public
        view
        returns (uint256)
    {
        return candidates.length;
    }

    // ==========================
    // ELECTION STATUS
    // ==========================

    function electionStatus()
        public
        view
        returns (string memory)
    {
        if (block.timestamp < votingStart) {
            return "Not Started";
        }

        if (
            block.timestamp >= votingStart &&
            block.timestamp <= votingEnd
        ) {
            return "Voting In Progress";
        }

        return "Election Closed";
    }

    // ==========================
    // TIME REMAINING
    // ==========================

    function timeRemaining()
        public
        view
        returns (uint256)
    {
        if (block.timestamp >= votingEnd) {
            return 0;
        }

        return votingEnd - block.timestamp;
    }

    // ==========================
    // WINNER
    // ==========================

    function getWinner()
        public
        view
        returns (
            string memory winnerName,
            uint256 votes
        )
    {
        require(
            candidates.length > 0,
            "No candidates available."
        );

        uint256 winningVotes = 0;
        uint256 winnerIndex = 0;

        for (uint256 i = 0; i < candidates.length; i++) {

            if (
                candidates[i].voteCount >
                winningVotes
            ) {
                winningVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        return (
            candidates[winnerIndex].name,
            candidates[winnerIndex].voteCount
        );
    }

    // ==========================
    // CHECK IF USER VOTED
    // ==========================

    function hasUserVoted(
        address _user
    )
        public
        view
        returns (bool)
    {
        return hasVoted[_user];
    }

    // ==========================
    // GET ALL VOTES
    // ==========================

    function getTotalVotes()
        public
        view
        returns (uint256)
    {
        return totalVotes;
    }
}
