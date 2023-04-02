pragma solidity >=0.4.22 <=0.8.17;

contract Voting {
    // Write your code here

        // keeping a track of person 
            mapping(address=>bool) voted;
            /// which vote has how many number of countts
            mapping(uint8=>uint8)votes;

            uint8 currentWinner;
            uint8 mostVotes;

            function getVotes(uint8 number)public view returns(uint8){

                     require(number <= 5 && number >= 1, "number not in range 1-5");
                    return votes[number];

                    /// the function call should fail based on a condition
                    /// use requires




            }



            function vote (uint8 number)public{

                    ///function call should fail

        require(!voted[msg.sender], "address has already voted");
        require(number <= 5 && number >= 1, "number not in range 1-5");

        voted[msg.sender] = true;
        votes[number]++;

        if (votes[number] >= mostVotes) {
            currentWinner = number;
            mostVotes = votes[number];
        }

            }


                function getCurrentWinner()public view returns(uint8 ){
                        if(currentWinner == 0){
                            return 1;
                        }


                return currentWinner;

                }



}
// require will raise and error if condition mentioned inside require is false and will reverse back the state 
// revert is the alternative to require
// assert condition should always be true 
