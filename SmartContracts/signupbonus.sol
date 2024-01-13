pragma solidity >=0.4.22 <=0.8.17;
    }
    function getBonusRequirement() internal pure virtual returns(uint256){ }
    function deposit() public payable{
        if(!deposited[msg.sender] && msg.value >getBonusRequirement()){
            balances[msg.sender]+=getBonusAmount();
        }
        deposited[msg.sender] = true;
        balances[msg.sender] += msg.value;
    } 

    function withdraw(uint256 amount) public{
        require(balances[msg.sender]>= amount,"invalid");
        balances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value : amount}("");
        require(sent,"failed");
    }
    function getBalance() public view returns(uint256){
        return balances[msg.sender];
    }
}

contract Bank is SignUpBonus {
    // Write your code here
     function getBonusAmount() internal pure override returns(uint256){
         return 150 wei;
    }
    function getBonusRequirement() internal pure override returns(uint256){ 
        return 1000 wei;    
    }
}
