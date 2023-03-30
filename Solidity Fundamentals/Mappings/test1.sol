pragma solidity >=0.4.22 <=0.8.17;

contract Inventory {
    // Write your code here
    mapping(uint256=>int256 )quantities;
    function addItem(uint256 itemId, uint256 quantity) public {
        // first we need to create a map
        quantities[itemId]+=int256(quantity);
    }

    function getQuantity(uint256 itemId) public view returns (int256) {


        return quantities[itemId] != 0 ? quantities[itemId]:-1;
    }
}
