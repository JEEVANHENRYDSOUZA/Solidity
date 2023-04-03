pragma solidity >=0.4.22 <=0.8.17;

contract Following {
    // Write your code here
        mapping(address=>address[]) following;
        function follow (address toFollow) public{
                require(following[msg.sender].length < 3 ,"user is already following maximum users");


                require(msg.sender!=toFollow,"you cannot follow yourself");

                following[msg.sender].push(toFollow);
                //dynamic hence push is possible




        }



        function getFollowing(address addr) public view returns(address [] memory){
            return following[addr];



        }

        function clearFollowing() public {

                delete following[msg.sender];

        }

        


}
