import React from 'react';
import { ThemeProvider, createTheme } from "@mui/material/styles";
import {Box, Typography, Button, Grid, TablePagination, CardContent, Card, CardHeader } from '@mui/material';
import "./reactStyles.css"

function KeyValue() {

    const tableStyle = {
        borderCollapse: "collapse", 
        border: "1px solid black"
      };


    return (
        <Box sx={{mt: 5, ml: 5, mr: 5}}>
            <Grid
                container
                spacing={2}
            >

                <Grid
                    item
                    xs={12}
                    md={12}
                    lg={12}
                >
                    <Typography variant="h4" sx={{fontWeight: 'medium'}}>
                        Create a Key
                    </Typography>
                </Grid>



                <Grid
                    item
                    xs={12}
                    md={12}
                    lg={12}
                >



                    <Card sx={{  }} variant="outlined">


                        <table style={{width: "100%", paddingBottom: 0, marginBottom:0}} className="table">

                            <tbody>
                            <tr style={{width: "100%"}} className="safe-card-row">
                                <td className="cell">Emil</td>
                                <td className="cell">Tobias</td>
                            </tr>
                            <tr className="safe-card-row">
                                <td className="cell">16</td>
                                <td className="cell">14</td>
                            </tr>
                            <tr className="safe-card-row">
                                <td className="cell">16</td>
                                <td className="cell">10</td>
                            </tr>
                            </tbody>

                        </table>


                    </Card>              
                                    

                


                </Grid>

            </Grid>
        </Box>

    );
}

export default KeyValue;