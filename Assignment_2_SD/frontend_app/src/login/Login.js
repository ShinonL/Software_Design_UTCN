import * as React from 'react';
import { useNavigate} from 'react-router-dom';

import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import Link from '@mui/material/Link';
import Paper from '@mui/material/Paper';
import Box from '@mui/material/Box';
import Grid from '@mui/material/Grid';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import { createTheme, ThemeProvider } from '@mui/material/styles';

import config from '../config.json'
import './Login.css'
import SimpleError from '../error/SimpleError';

const theme = createTheme();
const API_LOGIN = config.apiRoot + 'auth/login';
const ERROR_TITLE = "Login Error";

export default function Login() {
    let navigate = useNavigate();
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");

    const handleSubmit = (event) => {
        event.preventDefault();
        const formData = new FormData(event.currentTarget);
        
        const data = {
            username: formData.get('username'),
            password: formData.get('password')
        };

        const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(data)
        };

        fetch(API_LOGIN, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);

                localStorage.setItem('user', response.data.username);
                localStorage.setItem('role', response.data.role);

                if (response.data.role === 'ADMINISTRATOR') 
                    navigate('/admin/home');
                else navigate('/home');
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });
    };

    React.useEffect(() =>{
        if (localStorage.getItem('role') === 'CUSTOMER')
          navigate('/home');
        else if (localStorage.getItem('role') === 'ADMINISTRATOR')
          navigate('/admin/home');
      })

    return (
        <div>
            <SimpleError 
                id = "login-error"
                open = {open}
                title = {ERROR_TITLE}
                message = {error}
                handleClose = {() => {
                    setOpen(false);
                    setError("");
                }}
            />

            <ThemeProvider theme={theme}>
                <Grid container component="main" sx={{ height: '100vh' }}>
                    <CssBaseline />
                    <Grid item xs={false} sm={4} md={7}
                        className="background-photo"
                    />
                    
                    <Grid item xs={12} sm={8} md={5} component={Paper} elevation={6} square>
                        <Box
                            sx={{
                                my: 8,
                                mx: 4,
                                display: 'flex',
                                flexDirection: 'column',
                                alignItems: 'center',
                            }}
                        >
                            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
                                <LockOutlinedIcon />
                            </Avatar>
                            <Typography component="h1" variant="h5">
                                Sign in
                            </Typography>

                            <Box component="form" noValidate onSubmit={handleSubmit} sx={{ mt: 1 }}>
                                <TextField
                                    margin="normal"
                                    required
                                    fullWidth
                                    id="username"
                                    label="Username"
                                    name="username"
                                    autoComplete="username"
                                    autoFocus
                                />
                                <TextField
                                    margin="normal"
                                    required
                                    fullWidth
                                    name="password"
                                    label="Password"
                                    type="password"
                                    id="password"
                                    autoComplete="current-password"
                                />
                                <Button
                                    type="submit"
                                    fullWidth
                                    variant="contained"
                                    sx={{ mt: 3, mb: 2 }}
                                >
                                    Sign In
                                </Button>
                                <Link href="/register" variant="body2">
                                    {"Don't have an account? Sign Up"}
                                </Link>
                            </Box>
                        </Box>
                    </Grid>
                </Grid>
            </ThemeProvider>
        </div>
    );
}