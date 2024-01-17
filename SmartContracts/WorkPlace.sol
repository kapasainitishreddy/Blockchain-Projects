pragma solidity >=0.4.22 <=0.8.17;

contract Employee {
    // Write your code here
     enum Departments {
        Gardening,
        Clothing,
        Tools
    }
    string firstName;
    string lastName;
    uint256 hourlyPay;
    Departments department;
    
    constructor(
        string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Departments _department
    )
    {
        firstName = _firstName;
        lastName = _lastName;
        hourlyPay = _hourlyPay;
        department = _department;
    }
    
    function getWeeklyPay(uint256 hoursWorked) public view returns(uint256){
        if (hoursWorked <= 40){
            return hourlyPay * hoursWorked;
        }
        uint256 overtimehours = hoursWorked - 40;
        return (2 * hourlyPay * overtimehours) + hourlyPay * 40;
    }
    function getFirstName() public view returns(string memory){
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
        Departments _department
    )Employee(_firstName,_lastName,_hourlyPay,_department){}
    
    function addSubordinate( 
   string memory _firstName,
        string memory _lastName,
        uint256 _hourlyPay,
        Departments _department
    ) public {
        Employee employee = new Employee(
            _firstName,_lastName,_hourlyPay,_department    
        );
        subordinates.push(employee);
    }
    function getSubordinates() public view returns(string[] memory){
        string[] memory names = new string[](subordinates.length);
        for (uint256 i;i<subordinates.length;i++){
            names[i] = subordinates[i].getFirstName();
        }
        return names;
    }
}
