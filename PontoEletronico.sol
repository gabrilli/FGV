pragma solidity 0.5.9;

contract PontoEletronico {
    
    
address Empresa;


struct BancoDados {
    
    uint256 codigofuncionario;
    uint256 Time;
    }

BancoDados [] ListaA;

event Novaentrada (uint256 codigofuncionario, uint256 Time);
 
 
function Entrada (uint256 codigofuncionario) public  {
   
    uint256 Time=now;

BancoDados memory Temp = BancoDados (codigofuncionario, Time);

ListaA.push(Temp);

emit Novaentrada (codigofuncionario, Time);
 
}
 

    
}

