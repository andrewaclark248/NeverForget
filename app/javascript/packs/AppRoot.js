import React, { Component } from 'react'
import ReactDOM from "react-dom";
import { theme } from '../components/CustomStyle'
import { ThemeProvider, createTheme } from "@mui/material/styles";
import App from '../components/App'


function AppRoot() {
    return (
        <React.Fragment>
            <ThemeProvider theme={theme} >
                <App />
            </ThemeProvider>

        </React.Fragment>

    )

}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<AppRoot />);
