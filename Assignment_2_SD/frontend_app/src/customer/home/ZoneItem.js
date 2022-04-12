import React from "react";
import { useNavigate } from "react-router-dom";

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import { CardActionArea } from '@mui/material';

function ZoneItem(props) {
  let navigate = useNavigate();

  const handleClick = (event) => {
    event.preventDefault();
    navigate('/restaurants/' + props.city + '/' + props.name, { 
      state: {
        zoneId: props.id
      }
    })
  }

  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
      <CardActionArea onClick={handleClick}>
        <CardMedia
          component="img"
          height="140"
          image="https://source.unsplash.com/300x300/?courier"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="div">
            {props.name}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            {props.city}
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}

export default ZoneItem;