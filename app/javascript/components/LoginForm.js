import React, { Component } from 'react'

import { TextField, Stack, Button, Box } from '@mui/material';



function LoginForm() {
    return (
        <React.Fragment>
            <Box
                sx={{
                    px: 3,
                    py: '300px'
                }}
            >
                <form
                    noValidate
                    onSubmit={() => console.log("some text")}
                >
                    <Stack spacing={3}>
                    <TextField
                        label="Email Address"
                        name="email"
                        type="email"
                    />
                    <TextField
                        label="Password"
                        name="password"
                        type="password"
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

export default LoginForm;