// SPDX-License-Identifier: MIT 
pragma solidity 0.8.19;

contract Aluguel {

    // variável que serve para armazenar quem é o dono do contrato
    address private owner;
    // enumeração para definir os dois tipos de usuário: o locador e o locatário
    enum TipoUsuario {locador, locatario}

    // mapeamento que mapeia cada tipo de usuário onde a chave é um endereço da carteira de algum usuário
    mapping(address => TipoUsuario) private usuarios;
    // constructor definido para iniciar quando o contrato for iniciado
    constructor(){
        // atribuindo o dono do contrato a variável owner
        owner = msg.sender;
    }

    // estrutura para armazenar informações do contrato
    struct InformacoesApartamento {
        uint256 valorAluguel; // valor do aluguel
        address locador; // endereço da carteira do locador do imóvel
        bool validacaoTransacao; // validação do aluguel
    }
    
    //evento que emite se uma nova solicitação foi registrada
    event NovaSolicatacaoRegistrada(uint256 valorAluguel, bool validacaoTransacao);

    // arrays para armazenar todos os pedidos de aluguel
    InformacoesApartamento[] public alugueis;

    function registrarUsuario(address _usuario, TipoUsuario _tipoUsuario) public {
        // condição para que apenas o owner do contrato possa registrar usuários dentro do contrato
        require(msg.sender == owner, "Somente o proprietario pode registrar usuarios");
        usuarios[_usuario] = _tipoUsuario; // Atribui o tipo de usuário ao endereço fornecido.
    }

    // funçao que registra o pedido de um aluguel e retorna um valor bool, se o pedido foi registrado ou não
    function solicitar_aluguel(uint256 _valorAluguel, TipoUsuario _usuarios, bool _validacaoTransacao) public returns (bool) {
        InformacoesApartamento memory novaSolicitacao = InformacoesApartamento({
            valorAluguel: _valorAluguel;
            validacaoTransacao: false;// define a solicitação como não aceita ainda depois de cadastrada
        });

        solicitacoes.push(novaSolicitacao);
        //emissão do evento de que uma nova solicitação foi registrada
        emit NovaSolicitacaoRegistrada(_valorAluguel, false);
    }

    function aceitar_aluguel(uint256 valorAluguel, TipoUsuario usuarios, bool validacaoTransacao) public {
        // condição que apenas os locador podem executar essa função
        require(usuarios[msg.sender] == TipoUsuario.locador, "Somente locadores podem validar transacoes");
        // Itera sobre as solicitações e marca a solicitação correspondente como validada.
        for (uint i = 0; i < solicitacoes.length; i++) {
            if (
                solicitacoes[i].valorAluguel == _valorAluguel;
            ) {
                transacoes[i].validada = true;
                emit NovaTransacaoRegistrada(_valorAluguel, true);
                break;
            }
        }
    }

}