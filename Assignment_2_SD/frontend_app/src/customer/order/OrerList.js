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
import { useNavigate } from 'react-router-dom';

import SimpleError from '../../error/SimpleError';
import NavBar from '../navbar/NavBar';
import config from '../../config.json';
import { formatNumber, logout } from '../../common/utils';
import CartItem from '../cart/CartItem';
import { Chip, Divider } from '@mui/material';
import './OrderList.css';

const ERROR_TITLE = "Orders Error";
const API_GET_ORDERS = config.customerRoot + 'get-orders-by-user/'

const Item = styled(Paper)(({ theme }) => ({
    backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
    ...theme.typography.div,
    padding: theme.spacing(1),
    textAlign: 'center',
    color: theme.palette.text.secondary
  }));

export default function OrderList() {
    let navigate = useNavigate();
    
  const [expanded, setExpanded] = React.useState(false);
  const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [orders, setOrders] = React.useState([]);

  const handleChange = (panel) => (event, isExpanded) => {
    setExpanded(isExpanded ? panel : false);
  };

  React.useEffect(() => {
    if (localStorage.getItem('user') == null || localStorage.getItem('role') !== 'ROLE_CUSTOMER') {
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

    fetch(API_GET_ORDERS + localStorage.getItem('user'), requestOptions)
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
      <h2>My Orders</h2>
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
