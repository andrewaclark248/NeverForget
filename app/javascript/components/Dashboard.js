import React from 'react';
import { ThemeProvider, createTheme } from "@mui/material/styles";
import {Box, Typography, Button, Grid, TablePagination } from '@mui/material';
import DarkWeb from './DarkWeb'
import PasswordStrength from './PasswordStrength'
function Dasboard() {

    return (
        <Box sx={{mt: 15, ml: 5, mr: 5}}>
            <Grid
                container
                spacing={2}
            >
                <Grid
                    item
                    xs={12}
                    md={6}
                    lg={6}
                >
                    <DarkWeb />

                


                </Grid>

                <Grid
                    item
                    xs={12}
                    md={6}
                    lg={6}
                >
                    <PasswordStrength />
                </Grid>
            </Grid>
        </Box>

    );
}

export default Dasboard;