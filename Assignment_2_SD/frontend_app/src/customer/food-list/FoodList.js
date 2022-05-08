import * as React from 'react';

import Divider from '@mui/material/Divider';
import { useLocation, useNavigate } from 'react-router-dom';

import NavBar from '../navbar/NavBar';
import './FoodList.css';
import config from '../../config.json'
import SimpleError from '../../error/SimpleError';
import FoodItem from './food-item/FoodItem';
import { logout } from '../../common/utils';

const ERROR_TITLE = "Foods Error";

function FoodList() {
    let location = useLocation();
    let navigate = useNavigate();

    const [open, setOpen] = React.useState(false);
    const [error, setError] = React.useState("");

    React.useEffect(() => {
        if (localStorage.getItem('user') == null || localStorage.getItem('role') !== 'ROLE_CUSTOMER') {
            logout();
            navigate('/login');
            return;
        }
    });

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
        <h2>
            Available Foods for Delivery
        </h2>
        <Divider />
          
        {location.state.foods.length ? (
            <div>
                <h3>Breakfast</h3>
                <Divider />
                <div className="flex-row">
                    {location.state.foods.filter((food) => 
                        food.category == 'BREAKFAST'
                    ).map((food) => (
                        <FoodItem
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Lunch</h3>
                <Divider />
                <div className="flex-row">
                    {location.state.foods.filter((food) => 
                        food.category == 'LUNCH'
                    ).map((food) => (
                        <FoodItem
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Dessert</h3>
                <Divider />
                <div className="flex-row">
                    {location.state.foods.filter((food) => 
                        food.category == 'DESSERT'
                    ).map((food) => (
                        <FoodItem
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Beverages</h3>
                <Divider />
                <div className="flex-row">
                    {location.state.foods.filter((food) =>
                        food.category == 'BEVERAGES'
                    ).map((food) => (
                        <FoodItem
                            key={food.id}
                            id={food.id}
                            name={food.name}
                            description={food.description}
                            price={food.price}
                            restaurantName={food.restaurantName}
                        />
                    ))}
                </div>

                <h3>Dinner</h3>
                <Divider />
                <div className="flex-row">
                    {location.state.foods.filter((food) =>
                        food.category == 'DINNER'
                    ).map((food) => (
                        <FoodItem
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
          <h3>There are no foods available at the moment.</h3>
        )}
      </div>
    </div>
  );
}

export default FoodList;