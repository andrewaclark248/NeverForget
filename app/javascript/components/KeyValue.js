import React from 'react';
import { ThemeProvider, createTheme } from "@mui/material/styles";
import {Box, Typography, Button, Grid, TablePagination, CardContent, Card, CardHeader,
    FormControl, InputLabel, Select, MenuItem, TextField } from '@mui/material';
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
                        <Typography variant="h5" sx={{fontWeight: 'bold'}}>
                            New Key
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
                            <tr style={{width: "100%", height: "80px"}} className="safe-card-row">
                                <td className="cell column-label" style={{verticalAlign: "middle"}} >
                                    <span  >
                                    <center>
                                    <Typography variant="h6">Key</Typography>
                                    </center>
                                    </span>

                                </td>
                                <td className="cell column-value" style={{verticalAlign: "middle"}} >
                                    <center>
                                        <FormControl size="small" sx={{width: "60%"}}>
                                            <Select
                                                labelId="demo-simple-select-label"
                                                id="demo-simple-select"
                                            >
                                                <MenuItem value={10}>SSN</MenuItem>
                                                <MenuItem value={20}>Bank PIN Code</MenuItem>
                                                <MenuItem value={30}>WIFI Password</MenuItem>
                                                <MenuItem value={30}>Custom Label (Create your own lable)</MenuItem>
                                            </Select>
                                        </FormControl>
                                    </center>


                                </td>
                            </tr>
                            <tr className="safe-card-row" style={{width: "100%", height: "80px"}} >
                                <td className="cell column-label" style={{verticalAlign: "middle"}}>
                                    <center>
                                    <Typography variant="h6">Value</Typography>
                                    </center>
                                </td>
                                <td className="cell column-value" style={{verticalAlign: "middle"}}>
                                    <center>
                                        <TextField
                                            id="filled-size-small"
                                            defaultValue="Small"
                                            size="small"
                                            sx={{width: "60%"}}
                                        />
                                    </center>

                                </td>
                            </tr>
                            </tbody>

                        </table>


                    </Card>              
                                    

                


                </Grid>

                <Grid
                    item
                    xs={12}
                    md={12}
                    lg={12}
                >
                    <Button variant="contained" fullWidth sx={{fontWeight: "medium"}}>Create Key</Button>

                </Grid>



            </Grid>
        </Box>

    );
}

export default KeyValue;