import React, { Component, useState } from 'react'
import { TextField, Stack, Button, Box, Grid } from '@mui/material';
import { Link } from "react-router-dom";


function ResetPassword() {
    console.log("went here borther man douhhhh")

    return (
        <React.Fragment>

            <Box
                sx={{
                    px: 3,
                    py: '300px'
                }}
            >
                <form
                >
                    <Stack spacing={3}>
                    <TextField
                        label="First Name"
                        name="firstName"
                    />
                    <TextField
                        label="Last Name"
                        name="lastName"
                    />
                    </Stack>
                    <Button
                        fullWidth
                        size="large"
                        sx={{ mt: 3 }}
                        type="submit"
                        variant="contained"
                    >
                        Login
                    </Button>
                </form>   
                <Box sx={{pt: 4}}>
 
                    <span>Some sample text</span>
                </Box>
        
            </Box>


        </React.Fragment>
    );
}

export default ResetPassword;