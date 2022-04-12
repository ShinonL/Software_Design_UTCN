import React from "react";

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import Chip from '@mui/material/Chip';
import Stack from '@mui/material/Stack';
import { formatNumber } from '../../common/utils';

function Food(props) {
  return (
    <Card sx={{ minWidth: 345, marginRight: 10, marginTop: 5 }}>
        <CardMedia
          component="img"
          height="140"
          image="https://source.unsplash.com/300x300/?food"
        />
        <CardContent>
        <Typography gutterBottom variant="h5" component="div">
            {props.name}
        </Typography>
        <Typography variant="span" color="text.secondary">
            {props.description}
        </Typography>
        <Stack spacing={1} alignItems="center" marginTop={3}>
          <Stack direction="row" spacing={1}>
            <Chip label={formatNumber(props.price)} color="primary" sx={{paddingLeft: 5, paddingRight: 5}} />
          </Stack>
        </Stack>
      </CardContent>
    </Card>
  );
}

export default Food;