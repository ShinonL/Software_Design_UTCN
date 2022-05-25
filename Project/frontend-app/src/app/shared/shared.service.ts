import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SharedService {

  constructor() { }

  isLoggedIn() {
    return localStorage.getItem('token') != null
  }

  logout() {
    localStorage.clear()
    location.reload()
  }

  isCustomer() {
    return localStorage.getItem('role') == 'ROLE_CUSTOMER'
  }

  isEmployee() {
    return localStorage.getItem('role') == 'ROLE_EMPLOYEE'
  }
}
