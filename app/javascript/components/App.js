import React, { Component } from 'react'
import Box from '@mui/material/Box';
import Drawer from '@mui/material/Drawer';
import CssBaseline from '@mui/material/CssBaseline';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import List from '@mui/material/List';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import InboxIcon from '@mui/icons-material/MoveToInbox';
import MailIcon from '@mui/icons-material/Mail';
import { makeStyles } from "@material-ui/core/styles";
import { ThemeProvider, createTheme } from "@mui/material/styles";
import { theme } from './CustomStyle'

const drawerWidth = 240;


function App(props) {
    let linkUrl = {
      Dashboard: "/dashboard",
      Passwords: "/user_passwords",
      Profile: "/profiles"
    }

    let myLink = {
      color: '#fff',
      ':visited': {
         color: 'purple'
      }
    }



    return(
      <ThemeProvider theme={theme} >
        <Box sx={{ display: 'flex' }}>
          <CssBaseline />
          <AppBar
            sx={{ 
              height: "64px", 
              backgroundColor: "#bad000d"
            }}
          >
            <Toolbar>
              <Typography variant="h6" noWrap component="div" sx={{ fontWeight: 'bold' }}>
                SafeLogins
              </Typography>
            </Toolbar>
          </AppBar>
          <Drawer
            sx={{
              width: drawerWidth,
              flexShrink: 0,
              '& .MuiDrawer-paper': {
                width: drawerWidth,
                boxSizing: 'border-box',
                mt: "64px",
                backgroundColor: '#111211',
                color: "#F1F2F1"
              },
            }}
            variant="permanent"
            anchor="left"
            mode="dark"
          >
            <List>
              {['Dashboard', 'Passwords', 'Keys', 'Profile'].map((text, index) => (
                <ListItem key={text} disablePadding>
                  <ListItemButton 
                      href={linkUrl[text]} 
                      sx={{ 
                        '&:hover': {
                          backgroundColor: '#262726'
                        }
                      }} 
                    >
                    <ListItemIcon >
                      {index % 2 === 0 ? <InboxIcon  style={{ color: "white" }} /> : <MailIcon style={{ color: "white" }} />}
                    </ListItemIcon>
                    <ListItemText primary={text}  />
                  </ListItemButton>
                </ListItem>
              ))}
            </List>

            <Box sx={{ bottom: 0, position: "fixed", width: drawerWidth}}>
              <Divider />
              <List>
                {['Contact Us'].map((text, index) => (
                  <ListItem key={text} disablePadding>
                    <ListItemButton>
                      <ListItemIcon>
                        {index % 2 === 0 ? <InboxIcon /> : <MailIcon />}
                      </ListItemIcon>
                      <ListItemText primary={text} />
                    </ListItemButton>
                  </ListItem>
                ))}
              </List>
            </Box>

          </Drawer>

        </Box>
      </ThemeProvider>


    );
  
}


export default App
