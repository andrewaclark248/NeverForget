import { TextField, Stack, Button , Box, Divider, Typography, Grid, IconButton, Input} from '@mui/material';
import React, { useState } from 'react';
import { ThemeProvider, createTheme } from "@mui/material/styles";
import { theme } from '../components/CustomStyle'
import RemoveCircleIcon from '@mui/icons-material/RemoveCircle';


function NewPassword() {
    let [username, setUsername] = useState("");
    let [password, setPassword] = useState("");
    let [urls, setUrls] = useState([{"name": ""}])
    console.log("urls", urls)

    return (
        <ThemeProvider theme={theme} >
            <Box sx={{mt: 15, ml: 5, mr: 5}}>

                <form
                    onSubmit={(e) => handleSubmit(username, password, urls, e)}
                    style={{width: "100%"}}
                >
                        <Stack spacing={3}>
                        <Button
                            fullWidth
                            size="large"
                            sx={{ mt: 3 }}
                            type="submit"
                            variant="contained"
                        >
                            Create Password
                        </Button>
                        <TextField
                            label="Username"
                            name="username"
                            onChange={(e) => setUsername(e.target.value)}
                            fullWidth
                        />
                        <TextField
                            label="Password"
                            name="password"
                            onChange={(e) => setPassword(e.target.value)}
                        />
                        <Divider />
                        <Grid
                            container
                        >
                            <Grid
                                item
                                xs={6}
                                md={6}
                                lg={6}
                            >
                                <Typography variant="h5" component="h5"  >
                                    Url's
                                </Typography>
                            </Grid>
                            <Grid
                                item
                                xs={6}
                                md={6}
                                lg={6}
                            >

                                <Button
                                    fullWidth
                                    variant="contained"
                                    color="secondary" 
                                    onClick={() => { addUrl(urls, setUrls) }}
                                >
                                    Add URL
                                </Button>
                            </Grid>
                        </Grid>
                        {
                            urls.map((url, index) => {
                                console.log("name = " + url["name"])
                                return (
                                            <div style={{display: "flex" }} key={`password-input-${index+1}`} id={`password-input-${index+1}`}>
                                                <React.Fragment >
                                                    <TextField
                                                        label="Url"
                                                        onChange={(e) => updateUrl(e.target.value, urls, setUrls, index)}
                                                        id={`url-${index}`}
                                                        value={url["name"].length > 0 ? url["name"] : ""}
                                                        name={"url"}
                                                        fullWidth
                                                    /> 
                                                    <IconButton color="secondary" onClick={(e) => {removeUrl(urls, setUrls, index)}}>
                                                        <RemoveCircleIcon sx={{fontSize: "45px"}} />
                                                    </IconButton>

                                                </React.Fragment>


                                            </div>
        
                                        )
                            })
                        }


                        </Stack>

                </form>  

            </Box>

        </ThemeProvider>

    );

}

function updateUrl(urlName, urls, setUrls, index) {
    let values = [...urls];
    values[index]["name"] = urlName
    //let urlObject = urls[index]
   //urlObject["name"] = urlName
    setUrls(values)
}

function removeUrl(urls, setUrls, currentIndex) {
   // let listOfUrls =  urls.splice(index,1)
   //let listOfUrls = urls.filter((url, index) => {
   //     return index != currentIndex
   // })
   urls.splice(currentIndex, 1)
   let newUrls = urls;
   setUrls([...urls])
    //setUrls(listOfUrls);
}

function addUrl(urls, setUrls) {
    //let urlLength = urls.length
    //let key = `url-${urlLength}`
    let newUrl = {name: ""}
    setUrls([...urls, newUrl])
}

async function handleSubmit(username, password, urls, event) {
    console.log("username = " + username)
    console.log("password = " + password)
    console.log("urls", urls)
    event.preventDefault();

    let loginUrl = (process.env.NODE_ENV == "development" ? process.env.LOGIN_REDIRECT_URL_DEVELOPMENT : process.env.LOGIN_REDIRECT_URL_STAGING)

    let body = {
        password: {
            username: username,
            password: password,
            urls: urls
        }
    }
    fetch('/user_passwords',
        {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body),
        }
    )
    .then((response) => {
        let result = response.status
        if (result == 200) {
            console.log("wass success though", loginUrl)
            window.location.replace(loginUrl);
        }

    }).catch((e) => {
        console.log("error", e)
    });
}


export default NewPassword;