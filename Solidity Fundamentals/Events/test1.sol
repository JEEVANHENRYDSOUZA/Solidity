pragma solidity >=0.4.22 <=0.8.17;

contract EventEmitter {
    // Write your code here
            uint256 currentCount=1;
            event   Called(uint256 count , address sender);
                function count() public {
                        emit   Called(currentCount,msg.sender);
                        currentCount+=1;


                }



}
