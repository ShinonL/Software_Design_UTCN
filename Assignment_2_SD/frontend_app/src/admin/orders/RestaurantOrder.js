import * as React from 'react';
import Accordion from '@mui/material/Accordion';
import AccordionDetails from '@mui/material/AccordionDetails';
import AccordionSummary from '@mui/material/AccordionSummary';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import { useLocation, useNavigate } from 'react-router-dom';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';

import SimpleError from '../../error/SimpleError';
import AdminNavBar from '../nav-bar/AdminNavBar';
import config from '../../config.json';
import { formatNumber, logout } from '../../common/utils';
import CartItem from '../../customer/cart/CartItem';
import { ButtonGroup, Chip, Divider, Button } from '@mui/material';
import './RestaurantOrder.css';

const ERROR_TITLE = "Orders Error";
const API_GET_ORDERS = config.adminRoot + 'get-orders/'
const API_FILTER_ORDERS = config.adminRoot + 'filter-order-by-status/'
const API_CHANGE_STATUS = config.adminRoot + 'change-order-status'

const Item = styled(Paper)(({ theme }) => ({
    backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
    ...theme.typography.div,
    padding: theme.spacing(1),
    textAlign: 'center',
    color: theme.palette.text.secondary
  }));

export default function RestaurantOrder() {
    let location = useLocation();
    let navigate = useNavigate();
    
  const [expanded, setExpanded] = React.useState(false);
  const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [orders, setOrders] = React.useState([]);
    const [status, setStatus] = React.useState("");

  const handleChange = (panel) => (event, isExpanded) => {
    setExpanded(isExpanded ? panel : false);
  };

  React.useEffect(() => {
    if(!localStorage.getItem('token') || localStorage.getItem('role') !== 'ROLE_ADMINISTRATOR') {
        logout();
        navigate('/login');
      }

      var requestOptions;
        var api;
        if (status === "") {
            api = API_GET_ORDERS;
        } else {
            api = API_FILTER_ORDERS + status + '/';
        }

        var requestOptions = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization' : 'Bearer ' + localStorage.getItem('token')
            }
        };

    fetch(api + location.state.restaurantId, requestOptions)
        .then(response => response.json())
        .then(response => {
            if (response.httpStatusCode !== 200)
                throw new Error(response.message);
            setOrders(response.data);
        })
        .catch(err => {
            setOpen(true);
            setError(err.message);
        });
})

const handleChangeStatus = (orderId, toDecline) => {
    const data = {
        id: orderId,
        toDecline: toDecline
    }

    var requestOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization' : 'Bearer ' +  localStorage.getItem('token')
        }, 
        body: JSON.stringify(data)
    };

    fetch(API_CHANGE_STATUS, requestOptions)
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

const getStyle = (orderState) => {
    switch (orderState) {
        case 'PENDING': return {
            backgroundColor: '#fc8217',
            color: 'white'
        };
        case 'DECLINED': return {
            backgroundColor: '#fc2617',
            color: 'white'
        };
        case 'ACCEPTED': return {
            backgroundColor: '#179dfc',
            color: 'white'
        };
        case 'IN_DELIVERY': return {
            backgroundColor: '#fcde17',
            color: 'white'
        };
        case 'DELIVERED': return {
            backgroundColor: '#29bf00',
            color: 'white'
        };
        default: return {
            backgroundColor: '#7d7d7d',
            color: 'white'
        };
    }
    
}

const handleSelect = (event) => {
    setStatus(event.target.value);
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
        
      <AdminNavBar />
      <div className="container">
      <h2>My Orders</h2>
      <FormControl fullWidth size="small">
            <InputLabel id="demo-simple-select-label"> Delivery Zone </InputLabel>
                <Select
                    labelId="demo-simple-select-label"
                    id="demo-simple-select"
                    value={status}
                    label="Delivery Zone"
                    onChange={handleSelect}
                >
                     <MenuItem value={""} key=""> No Filter </MenuItem>
                     <MenuItem value={"PENDING"} key="PENDING"> PENDING </MenuItem>
                     <MenuItem value={"ACCEPTED"} key="ACCEPTED"> ACCEPTED </MenuItem>
                     <MenuItem value={"DECLINED"} key="DECLINED"> DECLINED </MenuItem>
                     <MenuItem value={"IN_DELIVERY"} key="IN_DELIVERY"> IN_DELIVERY </MenuItem>
                     <MenuItem value={"DELIVERED"} key="DELIVERED"> DELIVERED </MenuItem>
                </Select>
        </FormControl>
      <Divider/>

      { orders.map((order, index) =>
            <Accordion key={index} expanded={expanded === index} onChange={handleChange(index)} sx={{backgroundColor: '#f0f0f0'}}>
            <AccordionSummary
              expandIcon={<ExpandMoreIcon />}
              aria-controls="panel1bh-content"
              id="panel1bh-header"
            >
              <Typography variant='div' sx={{ width: '33%', flexShrink: 0, marginLeft: 5 }}>
                <Chip label={order.orderState} style={getStyle(order.orderState)}></Chip>
              </Typography>
              <Typography sx={{ color: 'text.secondary' }}>Order Number: {order.id}</Typography>
            </AccordionSummary>
            <AccordionDetails>
              <Typography variant='div'>
                <Box sx={{ flexGrow: 1 }}>
                    <Grid container spacing={2}>
                        {
                            order.orderState === "PENDING" ?
                            (
                                <Grid item xs={12}>
                                    <Item>
                                    <ButtonGroup color="secondary" variant="text" aria-label="medium secondary button group" 
                                        sx={{alignSelf: 'center'}}>
                                        <Button onClick={() => handleChangeStatus(order.id, false)}> Accept </Button>
                                        <Button onClick={() => handleChangeStatus(order.id, true)}> Decline </Button>
                                    </ButtonGroup>
                                    </Item>
                                </Grid>
                            ) : (
                                <Grid item xs={12}>
                                    <Item>
                                    <Button onClick={() => handleChangeStatus(order.id, false)}> Change Status </Button>
                                    </Item>
                                </Grid>
                            )
                        }
                        <Grid item xs={4}>
                        <Item><b>Total:</b> {formatNumber(order.total)}</Item>
                        </Grid>
                        <Grid item xs={8}>
                        <Item><b>Delivery Address:</b> {order.location}, {order.zoneDTO.name}, {order.zoneDTO.city}</Item>
                        </Grid>
                    </Grid>
                </Box>
                <div className="flex-row">
                    {order.orderDetailsDTO.map(detail =>     
                        <CartItem
                            key={detail.id}
                            id={detail.id}
                            quantity={detail.quantity}
                            food={detail.foodDTO}
                        />
                    )}
                </div>
              </Typography>
            </AccordionDetails>
          </Accordion>
      )}
      </div>
    </div>
  );
}
