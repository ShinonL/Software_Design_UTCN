import * as React from 'react';

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Container from '@mui/material/Container';
import Avatar from '@mui/material/Avatar';
import { Link, useNavigate } from 'react-router-dom';
import Switch from '@mui/material/Switch';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormGroup from '@mui/material/FormGroup';

import logo from '../../resources/logo.png'
import './NavBar.css'
import '../../common/utils'
import { logout } from '../../common/utils';

const ResponsiveAppBar = () => {
    let navigate = useNavigate();

    const handleChange = (event) => {
        logout();
        navigate('/login');
      };

    return (
        <AppBar position="static">
        <Container maxWidth="xl">
            <Toolbar>
                <img
                    src = {logo}
                    style={{ maxWidth: 75, maxHeight: 75, paddingTop: 5, paddingBottom: 5, paddingRight: 100}}
                />

                <Box className={'navlinks'}>
                    <Link to='/home' className={'link'}>
                        Restaurants
                    </Link>
                    <Link to='/cart' className={'link'}>
                        My Shopping Cart
                    </Link>
                    <Link to='/my-orders' className={'link'}>
                        My Order History
                    </Link>
                </Box>

                <FormGroup>
                    <FormControlLabel
                        control={
                            <Switch
                                checked={localStorage.getItem('role') === 'ROLE_CUSTOMER'}
                                onChange={handleChange}
                                aria-label="login switch"
                                color='secondary'
                            />
                        }
                        label='Logout'
                    />
                </FormGroup>

                <Box sx={{ flexGrow: 0 }}>
                    <Avatar
                        src="https://source.unsplash.com/50x50/?profile" 
                        sx={{minHeight: 50, minWidth: 50}} 
                    />
                </Box>
            </Toolbar>
        </Container>
    </AppBar>
  );
};
export default ResponsiveAppBar;
