import React from 'react';
import ReactDOM from 'react-dom/client';
import Saudacao from './componentes/Componente';

const root = ReactDOM.createRoot(document.getElementById('root'));

root.render(<h1><Saudacao tipo="Bom dia" nome="Math"/></h1>)
