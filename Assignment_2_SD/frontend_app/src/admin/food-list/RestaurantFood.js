import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useLocation, useNavigate } from 'react-router-dom';

import AdminNavBar from '../nav-bar/AdminNavBar';
import './RestaurantFood.css';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import { logout } from '../../common/utils';
import Food from './Food';
import { Button } from '@mui/material';
import AddFoodDialog from './AddFoodDialog';

const API_GET_FOODS = config.adminRoot + 'get-foods/';
const ERROR_TITLE = "Food Error";
export const PlusCircleIcon = ({width}) => <svg width={width}  fill="currentColor" viewBox="0 0 20 20"><path d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clipRule="evenodd" fillRule="evenodd"></path></svg>

function RestaurantFood() {
    let location = useLocation();
    let navigate = useNavigate();

    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");
    const [isAddFoodDialogOpen, setIsAddFoodDialogOpen] = React.useState(false);
    const [category, setCategory] = React.useState("");
    const [foods, setFoods] = React.useState([]);

    const seeOrders = () => {
        navigate('/admin/restaurant-orders', { 
            state: {
                restaurantId: location.state.restaurantId
            }
        })
    };

    React.useEffect(() => {
        if(!localStorage.getItem('token') || localStorage.getItem('role') !== 'ROLE_ADMINISTRATOR') {
            logout();
            navigate('/login');
        }

        var requestOptions = {
            method: 'GET',
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization' : 'Bearer ' +  localStorage.getItem('token')
            }
          };
      
          fetch(API_GET_FOODS + location.state.restaurantId, requestOptions)
              .then(response => response.json())
              .then(response => {
                  if (response.httpStatusCode !== 200)
                      throw new Error(response.message);
      
                  setFoods(response.data);
              })
              .catch(err => {
                  setOpen(true);
                  setError(err.message);
              });
    });

    const addFood = (cat) => {
        setCategory(cat);
        setIsAddFoodDialogOpen(true);
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

        <AddFoodDialog 
            restaurantId = {location.state.restaurantId}
            isVisible = {isAddFoodDialogOpen} 
            category = {category}
            restaurantName = {location.state.restaurantName}
            onSave = {(obj)=>{
                console.log(obj);}}
            onCancel = {()=>{
                setIsAddFoodDialogOpen(false);
                setCategory("");
            }}>
        </AddFoodDialog>
        
      <AdminNavBar />
      <div className="container">
        <h2>
            Available Foods
        </h2>
        <Button 
            onClick={seeOrders}
            className="btn btn-primary btn-sm mr-2 mb-1">
            Restaurant Orders
        </Button>
        <Divider />
          
        {foods.length ? (
            <div>
                <h3>Breakfast 
                    <Button 
                        onClick={() => addFood('BREAKFAST')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
                <div className="flex-row">
                    {foods.filter((food) => 
                        food.category == 'BREAKFAST'
                    ).map((food) => (
                        <Food
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Lunch 
                    <Button 
                        onClick={() => addFood('LUNCH')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
                <div className="flex-row">
                    {foods.filter((food) => 
                        food.category == 'LUNCH'
                    ).map((food) => (
                        <Food
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Dessert 
                    <Button 
                        onClick={() => addFood('DESSERT')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
                <div className="flex-row">
                    {foods.filter((food) => 
                        food.category == 'DESSERT'
                    ).map((food) => (
                        <Food
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Beverages 
                    <Button 
                        onClick={() => addFood('BEVERAGES')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
                <div className="flex-row">
                    {foods.filter((food) =>
                        food.category == 'BEVERAGES'
                    ).map((food) => (
                        <Food
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Dinner 
                    <Button 
                        onClick={() => addFood('DINNER')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
                <div className="flex-row">
                    {foods.filter((food) =>
                        food.category == 'DINNER'
                    ).map((food) => (
                        <Food
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>
            </div>
        ) : (
        <div>
          <h3>There are no foods available at the moment.</h3>
          
                <h3>Breakfast 
                    <Button 
                        onClick={() => addFood('BREAKFAST')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />

                <h3>Lunch 
                    <Button 
                        onClick={() => addFood('LUNCH')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />

                <h3>Dessert 
                    <Button 
                        onClick={() => addFood('DESSERT')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />

                <h3>Beverages 
                    <Button 
                        onClick={() => addFood('BEVERAGES')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />

                <h3>Dinner 
                    <Button 
                        onClick={() => addFood('DINNER')}
                        className="btn btn-primary btn-sm mr-2 mb-1">
                        <PlusCircleIcon width={"20px"}/>
                    </Button>
                </h3>
                <Divider />
            </div>
        )}
      </div>
    </div>
  );
}

export default RestaurantFood;