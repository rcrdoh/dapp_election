pragma solidity ^0.4.20;

contract Election {
	//Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	// Store accounts that have voted
	mapping(address => bool) public voters;
	//Read/write Candidates
	mapping(uint => Candidate) public candidates;

	//Store Candidates Count
	uint public candidatesCount;

	function addCandidate(string _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function Election () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
		//addCandidate("Candidate 3");
	}
	
	function vote(uint _candidateId) public {
		require(!voters[msg.sender]);
		require(_candidateId > 0 && _candidateId <= candidatesCount);
		voters[msg.sender] = true;
		candidates[_candidateId].voteCount ++;
	}

}