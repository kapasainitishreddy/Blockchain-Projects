pragma solidity >=0.4.22 <=0.8.17;

contract Item {
    string name;
    uint256 price;
    constructor(string memory _name, uint _price) {
        name= _name;
        price = _price;
    }
    function getName() public view returns(string memory){
        return name;
    }

    function getPrice() public virtual view returns(uint){
        return price;
    }
    
    // Write your code here
}

contract TaxedItem is Item{
    // Write your code here
    uint256 tax;
    constructor(string memory name,uint price,uint _tax) Item(name,price){
        tax = _tax ;
    }
    function getPrice() public override view returns(uint){
        return price+tax;
    }
}
