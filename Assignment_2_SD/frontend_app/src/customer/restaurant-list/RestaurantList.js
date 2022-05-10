import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useLocation, useNavigate } from 'react-router-dom';
import Button from '@mui/material/Button';

import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import { logout } from '../../common/utils';

import NavBar from '../navbar/NavBar';
import './RestaurantList.css';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import RestaurantItem from '../../common/RestaurantItem';

const API_GET_RESTAURANTS = config.customerRoot + 'get-restaurants-by-zone/';
const API_FILTER_RESTAURANTS = config.customerRoot + 'get-restaurant-by-name/';
const ERROR_TITLE = "Restaurants Error";

function RestaurantList() {
    let location = useLocation();
    let navigate = useNavigate();

    const [restaurants, setRestaurants] = React.useState([]);
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [filterByName, setFilterByName] = React.useState("");

    const handleSubmit = (event) => {
        event.preventDefault();

        const formData = new FormData(event.currentTarget);
        setFilterByName(formData.get('filter'));
    }

    React.useEffect(() => {
      if(!localStorage.getItem('token') || localStorage.getItem('role') !== 'ROLE_CUSTOMER') {
        logout();
        navigate('/login');
      }

        var requestOptions;
        var api;
        if (filterByName === "") {
            requestOptions = {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization' : 'Bearer ' + localStorage.getItem('token')
                }
            };

            api = API_GET_RESTAURANTS;
        } else {
            const data = {
                name: filterByName
            }

            requestOptions = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization' : 'Bearer ' + localStorage.getItem('token')
                },
                body: JSON.stringify({name: filterByName})
            };
            
            api = API_FILTER_RESTAURANTS;
        }

        fetch(api + location.state.zoneId, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode !== 200)
                    throw new Error(response.message);

                    console.log(response.data)
                setRestaurants(response.data);
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });
    })

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
            Available Delivery Restaurants
        </h2>

        <Box 
            component="form" 
            noValidate 
            onChange={handleSubmit} 
            sx={{ marginLeft: 95, marginBottom: 2, mt: 1 }}>
            <TextField
                label="Filter by Restaurant Name"
                id="filter"
                size="small"
                name="filter"
            />
        </Box>
        <Divider />
          
        {restaurants.length ? (
          <div className="flex-row">
            {restaurants.map((restaurant) => (
              <RestaurantItem
                key={restaurant.id}
                id={restaurant.id}
                name={restaurant.name}
                location={restaurant.location}
                foods={restaurant.foods}
                isAdmin={false}
              />
            ))}
          </div>
        ) : (
          <h3>There are no restaurants available at the moment.</h3>
        )}
      </div>
    </div>
  );
}

export default RestaurantList;