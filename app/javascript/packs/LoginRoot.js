require('dotenv').config()

import React from 'react'
import ReactDOM from "react-dom";
import Login from './../components/Login'
import { ThemeProvider, createTheme } from "@mui/material/styles";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import LoginForm from './../components/LoginForm'

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
        <React.Fragment>
            <ThemeProvider theme={theme}>

                <BrowserRouter>
                    <Routes>
                        <Route path="/" element={<Login />}>
                            <Route index path="logins" element={<LoginForm />} />
                        </Route>
                    </Routes>
                </BrowserRouter>
            </ThemeProvider>



        </React.Fragment>

    );
}


const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<LoginRoot />);
