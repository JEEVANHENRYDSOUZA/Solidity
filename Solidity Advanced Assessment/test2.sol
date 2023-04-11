pragma solidity >=0.4.22 <=0.8.17;

contract Employee {
    // Write your code here
        string firstName;
        string lastName;
        uint hourlyPay;

        
        enum Depratment{
            Gardening,
            Clothing,
            Tools
        
        }

          Depratment deprartment;

        constructor(string memory _firstName, string  memory _lastName, uint _hourlyPay, Depratment _deprartment){
                firstName=_firstName;
                lastName=_lastName;
                hourlyPay=_hourlyPay;
                deprartment=_deprartment;
        }


        function getWeeklyPay (uint hoursWorked) public view returns(uint){
            if(hoursWorked <= 40){
                        return hourlyPay*hoursWorked;
            }
            else{

                uint256 overtimeHours=hoursWorked-40;
                return 40 * hourlyPay + (overtimeHours * 2 * hourlyPay);
            }

            

        }


        function getFirstName () public view returns(string memory){

            return firstName;
        }



}

contract Manager is Employee {
    // Write tour code here

        Employee[] subordinates;
                    
    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Depratment _department
    ) Employee(_firstName, _lastName, _hourlyPay, _department) {} // calling parent constructor for intialization


     function addSubordinate(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Depratment _department
    ) public {
        Employee employee = new Employee(
            _firstName,
            _lastName,
            _hourlyPay,
            _department
        );
        subordinates.push(employee);
    }



    function getSubordinates() public view returns(string[] memory){
         string[] memory names = new string[](subordinates.length);
        for (uint256 idx; idx < subordinates.length; idx++) {
            names[idx] = subordinates[idx].getFirstName();
        }
        return names;
    }

        





}
