import React, { Component } from 'react'
import { Box, Grid, Paper } from '@mui/material';
import SecurityPic from './../../assets/images/security-image.png'
import LoginForm from './LoginForm.js'

function LoginLayout({children}) {
    return(
        <div>
        <Box
            component="main"
            sx={{
            display: 'flex',
            flex: '1 1 auto',
            height: "100vh"
        }}
        >
          <Grid
            container
            sx={{ 
              flex: '1 1 auto',
              height: "100%" 
            }}
          >
            <Grid
              item
              xs={12}
              lg={6}
              sx={{
                backgroundColor: 'background.paper',
              }}
            >
              {children}
            </Grid>
            <Grid
              item
              xs={12}
              lg={6}
              sx={{
                display: 'flex',
                flexDirection: 'column',
                position: 'relative',
                backgroundColor: "black"
              }}
            >

              <img
                alt=""
                src={SecurityPic}
                style={{ height: "100%", width: "100%", objectFit: "contain"}}
              />

            </Grid>

          </Grid>


          

        </Box>
        </div>

    )
}


export default LoginLayout
