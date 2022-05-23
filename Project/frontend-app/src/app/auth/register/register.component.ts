import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { UserModel } from 'src/app/models/user.model';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})

export class RegisterComponent implements OnInit {
  username: FormControl;
  password: FormControl;
  firstName: FormControl;
  lastName: FormControl;
  phoneNumber: FormControl;
  email: FormControl;

  constructor(private authService: AuthService) {
    this.username = new FormControl('', Validators.required);
    this.password = new FormControl('', Validators.required);
    this.firstName = new FormControl('', Validators.required);
    this.lastName = new FormControl('', Validators.required);
    this.phoneNumber = new FormControl('', Validators.required);
    this.email = new FormControl('', Validators.required);
  }

  ngOnInit() {
  }

  onRegister() {
    const user: UserModel = {
      username : this.username.value,
      password : this.password.value,
      firstName : this.firstName.value,
      lastName : this.lastName .value,
      phoneNumber : this.phoneNumber.value,
      email : this.email.value,
      role: 'ROLE_CUSTOMER'
    }

    this.authService.register(user).subscribe(
        (res) => {
          sessionStorage.setItem('username', this.username.value);
          sessionStorage.setItem('password', this.password.value);
        }, 
        (err) => console.log(err)
      );
  }
}