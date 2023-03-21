import React, { Component } from 'react'
import App from '../components/App'
import Passwords from '../components/Passwords'
import ReactDOM from "react-dom";
import { theme } from '../components/CustomStyle'
import { ThemeProvider, createTheme } from "@mui/material/styles";


function PasswordsRoot() {

    return (
        <React.Fragment>
            <ThemeProvider theme={theme} >
                <Passwords />
            </ThemeProvider>

        </React.Fragment>

    )

}


export default PasswordsRoot;