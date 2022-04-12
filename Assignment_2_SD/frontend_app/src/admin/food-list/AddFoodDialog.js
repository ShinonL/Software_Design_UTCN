import { Dialog } from '@mui/material';
import * as React from 'react';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import { Box, DialogContent, DialogTitle, TextField, Button } from '@mui/material';

const API_CREATE = config.apiRoot + 'food/createFood';
const ERROR_TITLE = 'Create Food Error';

const styles = {
    dialogPaper: {
        minHeight: '80vh',
        maxHeight: '80vh',
    },
  };

function AddFoodDialog(props) {
    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");

    let handleSubmit = (event) => {
        // Prevent page reload
        event.preventDefault();

        const formData = new FormData(event.currentTarget);
        const data = {
            name: formData.get('name'), 
            description: formData.get('description'), 
            price: formData.get('price'), 
            category: props.category, 
            restaurantName: props.restaurantName
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
                    props.onCancel();
                  })
                  .catch(err => {
                      setOpen(true);
                      setError(err.message);
                  });
    };

    let dialog = (
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
            <Dialog open={props.isVisible} onClose={props.handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
                PaperProps={{
                    sx: {
                        width: "30%",
                        maxHeight: 600
                    }
                }}
                className="form">
                    <DialogTitle id="alert-dialog-title">
                            Create Food
                    </DialogTitle>
                     <DialogContent>
                        <Box component="form" noValidate onSubmit= {handleSubmit}>
                            <TextField
                                margin="normal"
                                required
                                fullWidth
                                id="name"
                                label="Food Name"
                                name="name"
                            />
                            <TextField
                                margin="normal"
                                required
                                fullWidth
                                id="price"
                                label="Food Price"
                                name="price"
                            />
                            <TextField
                                margin="normal"
                                required
                                fullWidth
                                id="description"
                                label="Description"
                                name="description"
                            />
                            <div className="button-container">
                                <Button type="submit"> Create </Button>
                                <Button onClick={props.onCancel}>Cancel</Button>
                            </div>
                        </Box>
                    </DialogContent>     

                </Dialog>
        </div>);

    if(!props.isVisible)
        dialog=null;
    return ( 
        dialog
     );
}

export default AddFoodDialog;