require('dotenv').config()

import React from 'react'
import ReactDOM from "react-dom";
import Login from './../components/Login'
import { ThemeProvider, createTheme } from "@mui/material/styles";

const theme = createTheme({
    palette: {
      primary: {
        main: "#d32f2f"
      },
      secondary: {
        main: "#0288d1"
      }
    }
  });

function LoginRoot() {
    return(
        <div>
            <ThemeProvider theme={theme}>
                <Login/>
            </ThemeProvider>

        </div>

    );
}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<LoginRoot />);
