import { Component } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { JwtHelperService } from "@auth0/angular-jwt";

import { UserModel } from 'src/app/models/user.model';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  username: FormControl;
  password: FormControl;

  constructor(private authService: AuthService) {
    this.username = new FormControl('', Validators.required);
    this.password = new FormControl('', Validators.required);
  }

  onLogin() {
    const user: UserModel = {
      username: this.username.value,
      password: this.password.value
    }
     
    this.authService.login(user).subscribe(
      (res) => {
        localStorage.setItem('token', res.data);

        const helper = new JwtHelperService();
        var token = helper.decodeToken(res.data);
        localStorage.setItem('role', token.role[0].authority);
        localStorage.setItem('username', token.username);
        location.reload();
      },
      (err) => console.log(err)
    )
  }
}
