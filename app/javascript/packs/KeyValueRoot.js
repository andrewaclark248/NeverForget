import React, { Component } from 'react'
import ReactDOM from "react-dom";
import { theme } from '../components/CustomStyle'
import { ThemeProvider, createTheme } from "@mui/material/styles";
import KeyValue from './../components/KeyValue.js'


function KeyValueRoot() {

    return (
        <React.Fragment>
            <ThemeProvider theme={theme} >
                <KeyValue />
            </ThemeProvider>

        </React.Fragment>

    )

}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<KeyValueRoot />);
