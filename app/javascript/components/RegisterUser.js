import React, { Component, useState } from 'react'
import { TextField, Stack, Button, Box, Grid, Typography } from '@mui/material';


function RegisterUser() {
    console.log("register user compnoent")
    let [firstName, setFirstName] = useState("");
    let [lastName, setLastName] = useState("");
    let [password, setPassword] = useState("");
    let [confirmPassword, setConfirmPassword] = useState("")

    return (
        <React.Fragment>

            <Box
                sx={{
                    px: 3,
                    py: '100px'
                }}
            >
                <Typography variant="h4" component="h4" align="center" sx={{pb: 4}}>
                    Create An Account
                </Typography>
                <form
                    onSubmit={(e) => handleSubmit(firstName, lastName, password, confirmPassword, e)}
                >
                    <Stack spacing={3}>
                        <TextField
                            label="First Name"
                            name="firstName"
                            onChange={(e) => setFirstName(e.target.value)}
                        />
                        <TextField
                            label="Last Name"
                            name="lastName"
                            onChange={(e) => setLastName(e.target.value)}
                        />
                        <TextField
                            label="Email Address"
                            name="email"
                            type="email"
                            onChange={(e) => setEmail(e.target.value)}
                        />
                        <TextField
                            label="Password"
                            name="password"
                            onChange={(e) => setPassword(e.target.value)}
                        />
                         <TextField
                            label="Confirm Password"
                            name="confirm-password"
                            onChange={(e) => setConfirmPassword(e.target.value)}
                        />
                    </Stack>
                    <Button
                        fullWidth
                        size="large"
                        sx={{ mt: 3 }}
                        type="submit"
                        variant="contained"
                    >
                        Create Account
                    </Button>
                </form>
            </Box>

        </React.Fragment>
    );
}

export default RegisterUser;