// SPDX-License-Identifier: UNLICENSED 

pragma solidity ^0.8.0;

contract anacSol {

    // definiçõa das variáveis que serão utilizadas no código
    uint public idade;
    address public owner;

    // utilizando o constructor para inicializar a primeira vez que o contrato for criado
    constructor(uint){
        idade = 18;
        // atribuindo msg.sender ao owner para garantir que o dono do contrato seja atribuida a variável
        owner = msg.sender;
    } 

    // função que tem como um parâmetro um valor que é atribuída à idade (como se fosse um input que altera o valor da variável idade)
    function setIdade(uint _valor) public{
        // require que impõe que apenas o dono pode ser executada pelo dono
        require(msg.sender == owner);
        // atribuindo valor à idade
        idade = _valor;
        
    }
 
    // função que retorna o valor da idade
    function getIdade() public view returns(uint) {
        return idade;
        
    }


}