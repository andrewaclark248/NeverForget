import React, { Component, useState } from 'react'

import { TextField, Stack, Button, Box } from '@mui/material';



function LoginForm() {
    let [email, setEmail] = useState("");
    let [password, setPassword] = useState("");
    return (
        <React.Fragment>
            <Box
                sx={{
                    px: 3,
                    py: '300px'
                }}
            >
                <form
                    onSubmit={(e) => handleSubmit(email, password, e)}
                >
                    <Stack spacing={3}>
                    <TextField
                        label="Email Address"
                        name="email"
                        type="email"
                        onChange={(e) => setEmail(e.target.value)}
                    />
                    <TextField
                        label="Password"
                        name="password"
                        type="password"
                        onChange={(e) => setPassword(e.target.value)}
                    />
                    </Stack>
                    <Button
                        fullWidth
                        size="large"
                        sx={{ mt: 3 }}
                        type="submit"
                        variant="contained"
                    >
                    Continue
                    </Button>
                </form>           
            </Box>


        </React.Fragment>
    );
}

async function handleSubmit(email, password, event) {
    console.log("email = " + email)
    console.log("password = " + password)
    console.log("event = ", event)
    event.preventDefault();


    let loginUrl = (process.env.NODE_ENV == "development" ? process.env.LOGIN_REDIRECT_URL_DEVELOPMENT : process.env.LOGIN_REDIRECT_URL_STAGING)

    let body = {
        login: {
            email: email,
            password: password
        }
    }
    fetch('/logins/sign_in',
        {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body),
        }
      )
    .then((response) => {
        let result = response.status
        if (result == 200) {
            console.log("wass success though", loginUrl)
            window.location.replace(loginUrl);

            //window.location.href = loginUrl;
        }

    }).catch((e) => {
        console.log("error", e)
    });
    

}

export default LoginForm;