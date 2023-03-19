import React, { Component, useState } from 'react'
import { TextField, Stack, Button, Box, Grid, Typography, Alert } from '@mui/material';
import { Link } from "react-router-dom";


function ResetPassword() {
    console.log("went here borther man douhhhh")
    let [email, setEmail] = useState("");
    let [showAlert, setShowAlert] = useState(false);
    let [confirmPassword, setConfirmPassword] = useState("")

    return (
        <React.Fragment>

            <Box
                sx={{
                    px: 3,
                    py: '100px'
                }}
            >
                {showAlert && 
                    <Alert onClose={() => {setShowAlert(false)}}>We just sent you reset password instructions!</Alert>
                }
                <Typography variant="h4" component="h4" align="center" sx={{pb: 4}}>
                    Reset Password
                </Typography>
                <form
                    onSubmit={(e) => handleSubmit(email, e, setShowAlert)}
                >
                    <Stack spacing={3}>
                        <TextField
                            label="Email Address"
                            name="email"
                            type="email"
                            onChange={(e) => setEmail(e.target.value)}
                        />

                    </Stack>
                    <Button
                        fullWidth
                        size="large"
                        sx={{ mt: 3 }}
                        type="submit"
                        variant="contained"
                    >
                        Send Me A Reset Password Email
                    </Button>
                </form>
            </Box>


        </React.Fragment>
    );
}

//firstName, lastName, password, confirmPassword, e

async function handleSubmit(email, event, setShowAlert) {
    event.preventDefault();
    let loginUrl = (process.env.NODE_ENV == "development" ? process.env.LOGIN_REDIRECT_URL_DEVELOPMENT : process.env.LOGIN_REDIRECT_URL_STAGING)

    let body = {
        login: {
            email: email
        }
    }
    fetch('/logins/password',
        {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body),
        }
      )
    .then((response) => {
        //let result = response.status
       // if (result == 200) {
            console.log("wass success though", response)
            setShowAlert(true)
            //window.location.replace(loginUrl);

            //window.location.href = loginUrl;
        //}

    }).catch((e) => {
        console.log("error", e)
    });
    

}


export default ResetPassword;