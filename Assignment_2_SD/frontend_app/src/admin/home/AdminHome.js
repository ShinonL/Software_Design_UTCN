import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useLocation, useNavigate } from 'react-router-dom';
import Button from '@mui/material/Button';

import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';

import AdminNavBar from '../nav-bar/AdminNavBar';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import RestaurantItem from '../../common/RestaurantItem';
import './AdminHome.css';
import { logout } from '../../common/utils';

const API_GET_RESTAURANTS = config.adminRoot + 'get-restaurants-by-username/';
const ERROR_TITLE = "Restaurants Error";

function AdminHome() {
  let navigate = useNavigate();
  const [restaurants, setRestaurants] = React.useState([]);
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");

  React.useEffect(() => {
    if (localStorage.getItem('user') == null || localStorage.getItem('role') !== 'ROLE_ADMINISTRATOR') {
        logout();
        navigate('/login');
        return;
    }

    var requestOptions = {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    };

    fetch(API_GET_RESTAURANTS + localStorage.getItem('user'), requestOptions)
        .then(response => response.json())
        .then(response => {
            if (response.httpStatusCode !== 200)
                throw new Error(response.message);

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
        
      <AdminNavBar />
      <div className="container">
        <h2>
           My Restaurants
        </h2>
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
                isAdmin={true}
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

export default AdminHome;