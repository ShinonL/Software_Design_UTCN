import * as React from 'react';
import jwt from 'jwt-decode';

import { useNavigate } from 'react-router-dom';
import DeleteForeverIcon from '@mui/icons-material/DeleteForever';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';
import TextField from '@mui/material/TextField';

import NavBar from '../navbar/NavBar';
import './CartList.css';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import CartItem from './CartItem';
import { formatNumber, logout } from '../../common/utils';

const API_GET_CART = config.customerRoot + 'get-cart-by-username/';
const API_GET_ZONES = config.commonRoot + 'get-zones';
const API_EMPTY_CART = config.customerRoot + 'delete-cart/';
const API_ORDER = config.customerRoot + 'create-order';
const ERROR_TITLE = "Cart Error";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary
}));

function CartList() {
  let navigate = useNavigate();

    const [cartItems, setCartItems] = React.useState([]);
    const [zones, setZones] = React.useState([]);
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [total, setTotal] = React.useState("");
    const [location, setLocation] = React.useState("");
    const [selectedZone, setZone] = React.useState('');

    const user = jwt(localStorage.getItem('token'));

    React.useEffect(() => {
      if(!localStorage.getItem('token') || localStorage.getItem('role') !== 'ROLE_CUSTOMER') {
        logout();
        navigate('/login');
    }
        var  requestOptions = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization' : 'Bearer ' +  localStorage.getItem('token')
            }
        };

        var api = API_GET_CART + user.username;
        
        fetch(api, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);

                setCartItems(response.data);

                var amount = 0;
                cartItems.forEach(cartItem => {
                    amount = amount + cartItem.foodDTO.price * cartItem.quantity;
                });

                setTotal(formatNumber(amount));
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });

            if (zones.length == 0)
        fetch(API_GET_ZONES, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);

                setZones(response.data);
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });
    })

    const handleSubmit = () => {
      const data = {
        username: user.username,
        location: location,
        zoneDTO: {
          id: selectedZone
        }
      };
      
      var  requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization' : 'Bearer ' +  localStorage.getItem('token')
        },
        body: JSON.stringify(data)
    };

    fetch(API_ORDER, requestOptions)
        .then(response => response.json())
        .then(response => {
            if (response.httpStatusCode !== 200)
                throw new Error(response.message);
            
            setLocation('');
            setZone('');
        })
        .catch(err => {
            setOpen(true);
            setError(err.message);
        });
    }

    const handleEmpty = () => {
      var username = user.username;
  
      const requestOptions = {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization' : 'Bearer ' +  localStorage.getItem('token')
        }
      };
  
      fetch(API_EMPTY_CART + username, requestOptions)
        .then(response => response.json())
        .then(response => {
          if (response.httpStatusCode !== 200)
            throw new Error(response.message);
        })
        .catch(err => {
          setOpen(true);
          setError(err.message);
        });
    }

    const handleSelect = (event) => {
      setZone(event.target.value);
    }

    const handleTextField = (event) => {
      event.preventDefault();

      const formData = new FormData(event.currentTarget);
      setLocation(formData.get('location'));
  }

  const getNumberOfItems = (cart) => {
    return cart.map(cartItem => {return cartItem.quantity}).reduce((partialSum, a) => partialSum + a, 0)
  }

  return (
    <div>
       <SimpleError 
          id = "get-zones-error"
          open = {open}
          title = {ERROR_TITLE}
          message = {error}
          handleClose = {() => {
            setOpen(false);
            setError("");
          }}
        />
        
      <NavBar />
      <div className="container">
        <h2>
            Your Cart
        </h2>

        <Grid container spacing={3}>
          <Grid item xs={3.5}>
            <Item>
              <h3>Number of Items: {getNumberOfItems(cartItems)}</h3>
              <h3>Totatl Price: {total}</h3>
            </Item>
          </Grid>
          <Grid item xs={3.5}>
            <Item>
              <FormControl fullWidth size="small">
                <InputLabel id="demo-simple-select-label"> Delivery Zone </InputLabel>
                <Select
                  labelId="demo-simple-select-label"
                  id="demo-simple-select"
                  value={selectedZone}
                  label="Delivery Zone"
                  onChange={handleSelect}
                >
                  {
                    zones.map(zone => <MenuItem value={zone.id} key={zone.id}> {zone.name}, {zone.city}</MenuItem>)
                  }
                </Select>
              </FormControl>
              <Box 
                component="form" 
                noValidate 
                onChange={handleTextField} 
                sx={{marginTop: 2}}>
                <TextField fullWidth  
                    label="Address"
                    id="location"
                    size="small"
                    name="location"
                />
              </Box>
            </Item>
          </Grid>
          <Grid item xs={3.5}>
            <Item>
            <ButtonGroup color="secondary" variant="text" aria-label="medium secondary button group"  disabled={cartItems.length == 0}
              sx={{alignSelf: 'center', marginTop: 3.5, marginBottom: 3.5}}>
              <Button onClick={handleEmpty}> Clear Cart <DeleteForeverIcon sx={{marginLeft: 2}}/> </Button>
              <Button onClick={handleSubmit} >Checkout</Button>
            </ButtonGroup>
            </Item>
          </Grid>
        </Grid>
          
        {cartItems.length > 0 ? (
            <div className="flex-row">
                {cartItems.map((cartItem) => (
                    <CartItem
                        key={cartItem.id}
                        id={cartItem.id}
                        quantity={cartItem.quantity}
                        food={cartItem.foodDTO}
                    />
                ))}
            </div>
        ) : (
          <h3>There are no foods in the cart at the moment.</h3>
        )}
      </div>
    </div>
  );
}

export default CartList;