import React, { Component } from 'react'
import App from './App'
import Passwords from './Passwords'
import ReactDOM from "react-dom";
import { theme } from './CustomStyle'
import { ThemeProvider, createTheme } from "@mui/material/styles";


function PasswordsRoot() {

    return (
        <React.Fragment>
            <ThemeProvider theme={theme} >
                <App>
                    <Passwords />
                </App>
            </ThemeProvider>
        </React.Fragment>

    )

}


export default PasswordsRoot;