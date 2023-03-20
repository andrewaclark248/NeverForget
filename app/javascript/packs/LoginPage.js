import React, { Component } from 'react'
import LoginLayout from '../components/LoginLayout'
import LoginForm from '../components/LoginForm'
import ReactDOM from "react-dom";
import { theme } from '../components/CustomStyle'
import { ThemeProvider, createTheme } from "@mui/material/styles";


function LoginPage() {

    return (
        <React.Fragment>
            <ThemeProvider theme={theme} >
                <LoginLayout>
                    <LoginForm />
                </LoginLayout>
            </ThemeProvider>

        </React.Fragment>

    )

}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<LoginPage />);
