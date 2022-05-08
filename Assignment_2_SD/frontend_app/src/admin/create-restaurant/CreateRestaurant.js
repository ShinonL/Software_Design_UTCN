import * as React from 'react';
import { useNavigate} from 'react-router-dom';

import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import Link from '@mui/material/Link';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';
import { OutlinedInput } from '@mui/material';

import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import { logout } from '../../common/utils';

const theme = createTheme();
const API_CREATE = config.adminRoot + 'create-restaurant';
const API_GET_ZONES = config.commonRoot + 'get-zones';
const ERROR_TITLE = "Create Restaurant Error";

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;
const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
      width: 250,
    },
  },
};

export default function CreateRestaurant() {
  let navigate = useNavigate();
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [zones, setZones] = React.useState([]);
    const [selectedZone, setZone] = React.useState([]);

    const handleSelect = (event) => {
      const {
        target: { value },
      } = event;
      setZone(
        // On autofill we get a stringified value.
        typeof value === 'string' ? value.split(',') : value,
      );
    };

    React.useEffect(() => {
      if (localStorage.getItem('user') == null) {
        logout();
        navigate('/login');
        return;
      }

      var  requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
      };

      if (zones.length == 0)
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

  const handleSubmit = (event) => {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);

    const data = {
      username: localStorage.getItem('user'),
      name: formData.get('name'),
      location: formData.get('location'),
      zones: selectedZone.map(zone => ({id: zone}))
    };

    const requestOptions = {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      },
      body: JSON.stringify(data)
    };

    fetch(API_CREATE, requestOptions)
            .then(response => response.json())
            .then(response => {
                if (response.httpStatusCode != 200)
                    throw new Error(response.message);

                localStorage.setItem('user', data.username);
                localStorage.setItem('role', 'ROLE_CUSTOMER');

                navigate('/admin/home');
            })
            .catch(err => {
                setOpen(true);
                setError(err.message);
            });
  };

  return (
    <div>
      <SimpleError 
        id = "register-error"
        open = {open}
        title = {ERROR_TITLE}
        message = {error}
        handleClose = {() => {
            setOpen(false);
            setError("");
        }}
      />

      <ThemeProvider theme={theme}>
        <Container component="main" maxWidth="xs">
          <CssBaseline />
          <Box
            sx={{
              marginTop: 8,
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
            }}
          >
            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
              <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
              Create a new Restaurant
            </Typography>
            <Box component="form" noValidate onSubmit={handleSubmit} sx={{ mt: 3 }}>
              <Grid container spacing={2}>
                <Grid item xs={12}>
                  <TextField
                    autoComplete="given-name"
                    name="name"
                    required
                    fullWidth
                    id="name"
                    label="Restaurant Name"
                    autoFocus
                  />
                </Grid>
                <Grid item xs={12}>
                  <TextField
                    required
                    fullWidth
                    id="location"
                    label="Restaurant Address"
                    name="location"
                    autoComplete="location"
                  />
                </Grid>
                <Grid item xs={12}>
                  <FormControl fullWidth size="small">
                    <InputLabel id="demo-simple-select-label"> Delivery Zone </InputLabel>
                    <Select
                      labelId="demo-simple-select-label"
                      id="demo-simple-select"
                      multiple
                      value={selectedZone}
                      label="Delivery Zone"
                      onChange={handleSelect}
                      MenuProps={MenuProps}
                    >
                      {
                        zones.map(zone => <MenuItem value={zone.id} key={zone.id}> {zone.name} {zone.city}</MenuItem>)
                      }
                    </Select>
                  </FormControl>
                </Grid>
              </Grid>
              <Button
                type="submit"
                fullWidth
                variant="contained"
                sx={{ mt: 3, mb: 2 }}
              >
                Sign Up
              </Button>
              <Grid container justifyContent="flex-end">
                <Grid item>
                  <Link href="/login" variant="body2">
                    Already have an account? Sign in
                  </Link>
                </Grid>
              </Grid>
            </Box>
          </Box>
        </Container>
      </ThemeProvider>
    </div>
  );
}