import * as React from 'react';
import { styled } from '@mui/material/styles';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import {Box, Typography, Button, Grid} from '@mui/material';
import { ThemeProvider, createTheme } from "@mui/material/styles";
import { theme } from '../components/CustomStyle'



function Passwords() {

    const StyledTableCell = styled(TableCell)(({ theme }) => ({
        [`&.${tableCellClasses.head}`]: {
          backgroundColor: theme.palette.common.black,
          color: theme.palette.common.white,
        },
        [`&.${tableCellClasses.body}`]: {
          fontSize: 14,
        },
      }));
      
    const StyledTableRow = styled(TableRow)(({ theme }) => ({
        '&:nth-of-type(odd)': {
          backgroundColor: theme.palette.action.hover,
        },
        // hide last border
        '&:last-child td, &:last-child th': {
          border: 0,
        },
      }));

      
      const rows = [
        createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
        createData('Ice cream sandwich', 237, 9.0, 37, 4.3),
        createData('Eclair', 262, 16.0, 24, 6.0),
        createData('Cupcake', 305, 3.7, 67, 4.3),
        createData('Gingerbread', 356, 16.0, 49, 3.9),
      ];
      
    //sx={{ width: `calc(100% - ${drawerWidth}px)`, ml: `${drawerWidth}px` }}

    return (
      <ThemeProvider theme={theme} >

      <Box sx={{mt: 15, ml: 5, mr: 5}}>
        <Grid
          container
        >
        <Grid
            item
            xs={12}
            md={6}
            lg={6}
          >
            <Typography variant="h4" noWrap component="div" sx={{ fontWeight: 'bold', mb: 5 }}>
              Passwords
            </Typography>
          </Grid>
          <Grid
            item
            xs={12}
            md={6}
            lg={6}
          >
            <Button fullWidth={true}  variant="contained"><strong>Add Password</strong></Button>

          </Grid>
          <Grid
            item
            xs={12}
            md={12}
            lg={12}
          >

            <TableContainer 
              component={Paper}
            >
              <Table aria-label="customized table">
                <TableHead>
                  <TableRow>
                    <StyledTableCell>Dessert (100g serving)</StyledTableCell>
                    <StyledTableCell align="right">Calories</StyledTableCell>
                    <StyledTableCell align="right">Fat&nbsp;(g)</StyledTableCell>
                    <StyledTableCell align="right">Carbs&nbsp;(g)</StyledTableCell>
                    <StyledTableCell align="right">Protein&nbsp;(g)</StyledTableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {rows.map((row) => (
                    <StyledTableRow key={row.name}>
                      <StyledTableCell component="th" scope="row">
                        {row.name}
                      </StyledTableCell>
                      <StyledTableCell align="right">{row.calories}</StyledTableCell>
                      <StyledTableCell align="right">{row.fat}</StyledTableCell>
                      <StyledTableCell align="right">{row.carbs}</StyledTableCell>
                      <StyledTableCell align="right">{row.protein}</StyledTableCell>
                    </StyledTableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>

          </Grid>
        </Grid>



      </Box>
      </ThemeProvider>


    );

}

      
function createData(name, calories, fat, carbs, protein) {
    return { name, calories, fat, carbs, protein };
  }


export default Passwords;