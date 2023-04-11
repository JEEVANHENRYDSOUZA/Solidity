pragma solidity >=0.4.22 <=0.8.17;

contract RestrictedCount {
    // Write your code here

    address owner;
    int256 count;
    constructor(){
        owner=msg.sender;
    }
    modifier OwnerOnly{

        require(msg.sender == owner,"this function should be only called by the owner");
        _;

    }

    function getCount() public view OwnerOnly returns(int){
        return  count;
    }


    modifier addCheck(int256 value){
            require(count+value <=100 );
            require(count+value >= -100 );
            _;
    }

  modifier subtractCheck(int256 value){
            require(count-value <=100 );
            require(count-value >= -100 );
            _;
    }





    function add(int value) public addCheck(value){

        count+=value;



    }

    function subtract(int value) public subtractCheck(value){
            count-=value;

    }

}
