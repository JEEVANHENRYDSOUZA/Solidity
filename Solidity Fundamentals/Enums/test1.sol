pragma solidity >=0.4.22 <=0.8.17;

contract FancyShirts {
    // Write your code here
    enum Size{

        Small,
        Medium,
        Large
    }

    enum Color{
            Red,
            Green,
            Blue

    }

   struct Shirt{
        Size size;
        Color color;

    }

    mapping(address=>Shirt[])shirts;
    // keeping a track of all the shirts the user has 

        function getShirtPrice(Size size, Color color)public view returns(uint256) {

            uint256 price;

        if (size == Size.Small) {
            price += 10;
        } else if (size == Size.Medium) {
            price += 15;
        } else {
            price += 20;
        }

        if (color != Color.Red) {
            price += 5;
        }
        return price;
        }



    modifier priceCheck(Size size, Color color){
           require(
            getShirtPrice(size, color) == msg.value,
            "incorrect amount sent"
        );
        _;


    }

    function buyShirt(Size size, Color color) public payable priceCheck(size,  color){
            // if use has the coorect amount then we need it to add to the closet



            Shirt memory shirt=Shirt(size,color);//creating a new structure
             shirts[msg.sender].push(shirt);





    }

        function getShirts(Size size, Color color) public view returns (uint256) {
        uint256 count;
        for (uint256 idx; idx < shirts[msg.sender].length; idx++) {
            if (

                // my shirts array is a mapping from address to array
                shirts[msg.sender][idx].size == size &&
                shirts[msg.sender][idx].color == color
            ) {
                count++;
            }
        }
        return count;
    }





}
