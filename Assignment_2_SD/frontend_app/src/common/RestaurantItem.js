import React from "react";
import { useNavigate } from "react-router-dom";

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import { CardActionArea } from '@mui/material';

function RestaurantItem(props) {
  let navigate = useNavigate();

  const handleClick = (event) => {
    event.preventDefault();
    if (props.isAdmin) {
      navigate('/admin/restaurants/' + props.name, { 
        state: {
          restaurantId: props.id,
          foods: props.foods,
          restaurantName: props.name
        }
      })
      return;
    }

    navigate('/restaurants/' + props.name, { 
      state: {
        restaurantId: props.id,
        foods: props.foods
      }
    })
  }

  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
      <CardActionArea onClick={handleClick}>
        <CardMedia
          component="img"
          height="140"
          image="https://source.unsplash.com/300x300/?restaurant"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="div">
            {props.name}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            {props.location}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}

export default RestaurantItem;