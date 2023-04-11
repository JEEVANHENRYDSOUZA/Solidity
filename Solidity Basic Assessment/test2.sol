pragma solidity >=0.4.22 <=0.8.17;

contract GreedyBanker {
        uint256 fee = 1000 wei;
        mapping(address=>uint256)balance;
        mapping(address=>uint256)count;



    address owner;
    uint256 feesCollected;

constructor(){
    owner=msg.sender;
}

    receive() external payable {
       uint256 depositFee;
        if (count[msg.sender] >= 1) {
            require(msg.value >= fee, "amount is not enough to cover the fee");
            depositFee = fee;
        }

        balance[msg.sender] += msg.value - depositFee;
        feesCollected += depositFee;
        count[msg.sender]++;



        // Write your code here
    }

    fallback() external payable {
        // Write your code here
        feesCollected += msg.value;

    }

    function withdraw(uint256 amount) external {

        // Write your code here

        require(balance[msg.sender]>=amount,"you dont have sufficient balance");

        balance[msg.sender]-=amount;
        (bool sent,)=payable(msg.sender).call{value:amount}("");
        require(sent,"withdraw failed");
    }

    function collectFees() external {
        // Write your code here
        require(msg.sender == owner, "only the owner can call this function");
        uint256 totalfees=feesCollected;
        feesCollected=0;
        (bool sent, )=payable(owner).call{value: totalfees}("");
        require(sent,"transfer failed");

    }

    function getBalance() public view returns (uint256) {
        // Write your code here

       return  balance[msg.sender];
    }
}
