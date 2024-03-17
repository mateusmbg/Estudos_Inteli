import React from "react";

export default class Saudacao extends React.Component {

    state = {
        tipo: "Coloque aqui a mensagem inicial",
        nome: "Coloque o nome"
    }

    setTipo(e) {
        this.setStaste({ tipo: e.target.value });
    }

    setNome(e) {
        this.setState({ nome: e.target.value });
    }

    render() {
        const { tipo, nome } = this.state
        return(
            <div>
                <h1>{tipo} {nome}!</h1>
                <hr />
                <input type="text" placeholder="Tipo.." 
                value={tipo} onChange={e => this.setTipo(e)}></input>
                <input type="text" placeholder="Nome.." 
                value={nome} onChange={ e => this.setNome(e)}></input>
            </div>
        )
    }
}
