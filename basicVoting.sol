// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

contract Voting {

    // Define a Candidate struct with three properties: id, name, and voteCount
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Create a mapping of uints to Candidates called 'candidates', which keeps track of all candidates
    mapping(uint => Candidate) public candidates;
    
    // Create a uint called 'candidatecount' to keep track of the total number of candidates
    uint public candidatecount;

    // Create a mapping of addresses to bool called 'citizen' to keep track of who has voted
    mapping(address => bool) public citizen;

    // The constructor function, which is executed when the contract is deployed
    constructor() public {
        // Call the private 'addCandidate' function to add two candidates
        addCandidate("Godlin");
        addCandidate("Hilda");
    }

    // Private function 'addCandidate', which takes in a string '_name'
    function addCandidate(string memory _name) private {
        // Increment the 'candidatecount' by 1
        candidatecount++;
        // Add the new candidate to the 'candidates' mapping with their id, name, and voteCount
        candidates[candidatecount] = Candidate(candidatecount, _name, 0);
    }

    // Public function 'vote', which takes in a uint '_candidateid'
    function vote(uint _candidateid) public {
        // Ensure that the sender has not already voted by checking the 'citizen' mapping
        require(!citizen[msg.sender]);
        
        // Update the 'citizen' mapping to indicate that the sender has voted
        citizen[msg.sender] = true;
        
        // Update the vote count for the specified candidate
        candidates[_candidateid].voteCount++;
    }
}
