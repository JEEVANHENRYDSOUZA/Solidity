pragma solidity >=0.4.22 <=0.8.17;

contract Balances {
    // Write your code here
            mapping(address=>uint256) balances;




            fallback() external payable{



                        balances[msg.sender]+=msg.value;
            }


        receive () external payable{
                balances[msg.sender]+=msg.value;



        }




            function getAmountSent(address addr) public view returns(uint256){
                            return balances[addr];


            }



}
