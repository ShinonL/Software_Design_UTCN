import React from "react";

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import CardActions from '@mui/material/CardActions';
import Typography from '@mui/material/Typography';
import Chip from '@mui/material/Chip';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import OptionError from "../../../error/OptionError";
import './FoodItem.css'

const API_ADD_TO_CART = 'http://localhost:8080/api/foodpanda/cart/addToCart';
const API_EMPTY_CART = 'http://localhost:8080/api/foodpanda/cart/emptyCart/';
const ERROR_TITLE = "Add to Cart Error";

function FoodItem(props) {
  const [quantity, setQuantity] = React.useState(0);
  const [open, setOpen] = React.useState(false);
  const [error, setError] = React.useState("");

  const handleClick = (event) => {
    event.preventDefault();
    const data = {
        username: localStorage.getItem('user'),
        foodDTO: {
            id: props.id,
            restaurantName: props.restaurantName
        },
        quantity: 1
    };

    const requestOptions = {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      },
      body: JSON.stringify(data)
    };

    fetch(API_ADD_TO_CART, requestOptions)
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

  const handleEmpty = () => {
    var username = localStorage.getItem('user');

    const requestOptions = {
      method: 'DELETE',
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
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
  
  const handleIncrement = () => {
    setQuantity(quantity + 1 );
  };

  const handleDecrement = () => {
    setQuantity(quantity - 1 );
  };

  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
      <OptionError 
        id = "login-error"
        open = {open}
        title = {ERROR_TITLE}
        message = {error}
        handleClose = {() => {
            setOpen(false);
            setError("");
            setQuantity(0);
        }}
        handleEmpty={handleEmpty}
      />
        <CardMedia
          component="img"
          height="140"
          image="https://source.unsplash.com/300x300/?restaurant"
        />
        <CardContent>
        <Typography gutterBottom variant="h5" component="div">
            {props.name}
        </Typography>
        <Typography variant="span" color="text.secondary">
            {props.description}
        </Typography>
      </CardContent>
      <CardActions sx={{marginBottom: 3}}>
        <Stack spacing={1} alignItems="center">
          <Stack direction="row" spacing={1}>
            <Chip label={props.price + ' €'} color="primary" sx={{paddingLeft: 5, paddingRight: 5, marginLeft: 3}} />
          </Stack>
        </Stack>
        <Button size="small" onClick={handleClick} variant="outlined" className="cart-button">Add To Cart</Button>
        <ButtonGroup size="small" aria-label="small outlined button group" >
          <Button onClick={handleIncrement}>+</Button>
          <Button disabled>{quantity}</Button>
          <Button onClick={handleDecrement} disabled={quantity == 0}>-</Button>
        </ButtonGroup>
      </CardActions>
    </Card>
  );
}

export default FoodItem;