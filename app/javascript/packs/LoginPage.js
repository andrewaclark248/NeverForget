import React, { Component } from 'react'
import LoginLayout from '../components/LoginLayout'
import LoginForm from '../components/LoginForm'
import ReactDOM from "react-dom";
import { theme } from '../components/CustomStyle'


function LoginPage() {

    return (
        <React.Fragment>
            <LoginLayout>
                <LoginForm />
            </LoginLayout>
        </React.Fragment>

    )

}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<LoginPage />);
