pragma solidity >=0.4.22 <=0.8.17;

contract AdvancedCounter {

//mapping one will be user address to counter values to numebr

    mapping(address=>mapping(string=>int256))counters;


    /// we need to keep a track of address to the number of counter it has
    mapping(address=>uint256) numCountersCreated;


    mapping(address=>mapping(string=>bool)) counterIdExists;
    // will keep a track of the ids that are being used with respect to that address
    // we cant have two same ids

    function createCounter(string memory id, int256 value) public {
            


            require(numCountersCreated[msg.sender]!= 3,"you have already created the maximum number of counters");
            require(!counterIdExists[msg.sender][id],"a counter with this id already exists");

            counters[msg.sender][id]=value;
            numCountersCreated[msg.sender]++;
            counterIdExists[msg.sender][id]=true;




        
    }

    function deleteCounter(string memory id) public {
        // Write your code here
        require(counterIdExists[msg.sender][id],"this counter does not exist");
        delete counters[msg.sender][id];
        numCountersCreated[msg.sender]--;
        counterIdExists[msg.sender][id]=false;


    }

    function incrementCounter(string memory id) public {
        // Write your code here

        // failing condition if that id is not present then fail

        require(counterIdExists[msg.sender][id],"this counter does not exist");
        counters[msg.sender][id]++;
    }

    function decrementCounter(string memory id) public {
        // Write your code here

        require(counterIdExists[msg.sender][id],"this counter does not exist");
        counters[msg.sender][id]--;
    }

    function getCount(string memory id) public view returns (int256) {
        // Write your code here
          require(counterIdExists[msg.sender][id],"this counter does not exist");
         return counters[msg.sender][id];

    }
}



