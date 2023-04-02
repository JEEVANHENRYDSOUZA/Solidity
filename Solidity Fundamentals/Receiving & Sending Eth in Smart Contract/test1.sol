pragma solidity >=0.4.22 <=0.8.17;

contract Richest {
    // Write your code here
            address richest;
            uint256 mostSent;

            //create a maping of address to eth

            mapping(address=>uint256) pendingWithdrawls;
            function becomeRichest() external payable returns(bool){
                    if(msg.value<=mostSent){
                        return false;
                    }
                    // else this becomes the richest person 
                    pendingWithdrawls[richest]+=mostSent;
                    //updating the value on receving eth
                    richest=msg.sender;//hence updating the richest address to current sender address
                    mostSent=msg.value; // updating the most sent value to the current value
                    return true;
            }



            function withdraw() external { 
                    /// protect against re-entrance. attack
                    // sending the eth

                    uint256 amount = pendingWithdrawls[msg.sender];
                    //find the amount sent by the sneder
                    pendingWithdrawls[msg.sender]=0;//re-entrace
                     (bool sent, )=payable(msg.sender).call{value:amount}("");
                    require(sent);

            }



            function getRichest() public view returns(address) {
                    return richest;

            }



}
