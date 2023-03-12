import React from 'react'
import ReactDOM from "react-dom";

import Login from './../components/Login'

function LoginRoot() {
    return(
        <div>
            some text
        </div>

    );
}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<LoginRoot />);
