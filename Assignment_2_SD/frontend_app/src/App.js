import './App.css';

import {BrowserRouter as Router, Routes, Route, Navigate} from 'react-router-dom';
import Login from './login/Login';
import Register from './customer/register/Register';
import AdminHome from './admin/home/AdminHome';
import CustomerHome from './customer/home/CustomerHome';
import RestaurantList from './customer/restaurant-list/RestaurantList';
import FoodList from './customer/food-list/FoodList';
import CartList from './customer/cart/CartList';
import OrderList from './customer/order/OrderList';
import NotFound from './not-found/NotFound';
import CreateRestaurant from './admin/create-restaurant/CreateRestaurant'
import RestaurantFood from './admin/food-list/RestaurantFood';
import RestaurantOrder from './admin/orders/RestaurantOrder';

function App() {
  return (
    <Router> 
      <Routes>
        <Route path='/' exact element={<Navigate replace to='/login'/>}/>
        <Route path='/login' element={<Login />}/>
        <Route path='/register' element={<Register />}/>
        <Route path='/home' element={<CustomerHome />}/>
        <Route path='/restaurants/:city/:name' element={<RestaurantList />}/>
        <Route path='/restaurants/:name' element={<FoodList />}/>
        <Route path='/cart' element={<CartList />}/>
        <Route path='/my-orders' element={<OrderList />}/>
        <Route path='/admin/home' element={<AdminHome />}/>
        <Route path='/admin/create-restaurant' element={<CreateRestaurant />}/>
        <Route path='/admin/restaurants/:name' element={<RestaurantFood />}/>
        <Route path='/admin/restaurant-orders' element={<RestaurantOrder />}/>
        <Route path='*' element={<NotFound />}/>
      </Routes>
    </Router>
  );
}

export default App;
