import React from "react";

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import Chip from '@mui/material/Chip';
import Stack from '@mui/material/Stack';
import { formatNumber } from '../../common/utils';

function CartItem(props) {
  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardMedia
          component="img"
          height="140"
          image="https://source.unsplash.com/600x600/?food"
        />
        <CardContent>
        <Typography gutterBottom variant="h5" component="div">
            {props.food.name}
        </Typography>
        <Typography variant="span" color="text.secondary">
            {props.food.description}
        </Typography>
        <Stack spacing={1} alignItems="center" marginTop={3}>
          <Stack direction="row" spacing={1}>
            <Chip label={formatNumber(props.food.price)} color="primary" sx={{paddingLeft: 5, paddingRight: 5}} />
            <Chip label={"Qty: " + props.quantity} color="primary" sx={{paddingLeft: 5, paddingRight: 5}} />
          </Stack>
        </Stack>
      </CardContent>
    </Card>
  );
}

export default CartItem;