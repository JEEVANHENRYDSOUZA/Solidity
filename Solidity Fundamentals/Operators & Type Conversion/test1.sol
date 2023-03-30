pragma solidity >=0.4.22 <=0.8.17;

contract Counter {
    uint256 public count;

    function increment() external {
        count=count+1;
    }

    function decrement() external {
            count=count-1;
    }

    function reset() external {
        // Write your code here
        count = 0;
    }

    function addBy(uint256 value) external {
            count=count+value;
        // Write your code here
    }

    function subtractBy(uint256 value) external {
        // Write your code here
        count=count-value;
    }

    function multiplyBy(uint256 value) external {
        // Write your code here
        count=count*value;
    }

    function getMinutesElapsed() external view returns (uint256) {
        // Write your code here
        return count/uint8(60);
    }
}
