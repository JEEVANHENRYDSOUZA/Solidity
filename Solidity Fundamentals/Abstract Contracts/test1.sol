pragma solidity >=0.4.22 <=0.8.17;

abstract contract SignUpBonus {
    // functions which are abstract and are implemented by the child classs
   function getBonusAmount()internal pure virtual returns(uint); 
  function getBonusRequirement()internal pure virtual returns(uint);
    //  parent functions and variables

    mapping(address=>uint256) balances;
    // to keep a track of user and balance
    mapping(address=>bool) deposited; 
    // to keep a track of first deposited value

    function deposit()public payable{
        if (!deposited[msg.sender] && msg.value > getBonusRequirement()) {
            balances[msg.sender] += getBonusAmount();
        }
        deposited[msg.sender] = true;
        balances[msg.sender] += msg.value;


    }
    
    
    
    
    function withdraw(uint amount) public {

         require(balances[msg.sender] >= amount, "invalid amount");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "failed to send");

    }


    function getBalance()public view returns(uint){
        return balances[msg.sender];
    }


}

contract Bank is SignUpBonus {
    // Write your code here
             function getBonusAmount()internal pure override returns(uint){

                 return 150 wei;
             }
        function getBonusRequirement() internal  pure override returns(uint){
            return 1000 wei;
        } 





}
