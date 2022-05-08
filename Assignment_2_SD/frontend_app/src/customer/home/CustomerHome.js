import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useNavigate } from 'react-router-dom';

import NavBar from '../navbar/NavBar';
import './CustomerHome.css';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import ZoneItem from './ZoneItem';
import  { logout } from  '../../common/utils';

const API_GET_ZONES = config.commonRoot + 'get-zones';
const ERROR_TITLE = "Delivey Zones Error";

function CustomerHome() {
  let navigate = useNavigate();

  const [zones, setZones] = React.useState([]);
  const [open, setOpen] = React.useState(false);
  const [error, setError] = React.useState("");

  React.useEffect(() => {
    if (localStorage.getItem('user') == null || localStorage.getItem('role') !== 'ROLE_CUSTOMER') {
      logout();
      navigate('/login');
      return;
    }

    const requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };

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
        <h2>Available Delivery Zones</h2>
        <Divider />
          
        {zones.length ? (
          <div className="flex-row">
            {zones.map((zone) => (
              <ZoneItem
                key={zone.id}
                id={zone.id}
                name={zone.name}
                city={zone.city}
              />
            ))}
          </div>
        ) : (
          <h3>There are no delivery zones available at the moment.</h3>
        )}
      </div>
    </div>
  );
}

export default CustomerHome;