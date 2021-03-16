pragma solidity 0.5.7;

contract TokenFgv {
        // Mapeia quantos tokens cada endereço possui
        mapping (address => uint256) public balanceOf;
        
        //Altere essa secao para a sua necessidade
        string public name = "Token - Imersão";
        string public symbol = "FGV";
        uint8 public decimals = 2;
        uint256 public totalSupply = 10 * (uint256(10) ** decimals);
        
        event Transfer (address indexed from, address indexed to, uint256 value);
        
        constructor() public {
            // Inicialmente cede todos os tokens ao criador do contrato.
            balanceOf[msg.sender] = totalSupply;
            emit Transfer(address(0), msg.sender, totalSupply);
        }
        
        function transfer(address to, uint256 value) public returns (bool success) {
            require(balanceOf[msg.sender] >= value);
            
            balanceOf[msg.sender] -= value; //deduct from sender's balanceOf
            balanceOf[to] += value;         //add to recipient's balanceOf
            emit Transfer(msg.sender, to, value);
            return true;
        }
        
        event Approval(address indexed owner, address indexed spender, uint256 value);
        mapping(address => mapping(address => uint256)) public allowance;
        
    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {        
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }        


function tranferFrom(address from, address to, uint256 value)
    public
    returns (bool success)
{
   
    require(value <= balanceOf[from]);
    require(value <= allowance[from][msg.sender]);
    
    balanceOf[from] -= value;
    balanceOf[to] += value;
    allowance[from][msg.sender] -= value;
    emit Transfer (from, to, value);
    return true;
}
}
