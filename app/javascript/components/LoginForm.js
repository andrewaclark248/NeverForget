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
                    onSubmit={() => handleSubmit(email, password)}
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

function handleSubmit(email, password) {
    console.log("email = " + email)
    console.log("password = " + password)


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
    .then(response => console.log("response", response));
    

}

export default LoginForm;