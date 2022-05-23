import { Component } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { ApiResponeModel } from 'src/app/models/api-response.model';
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
        localStorage.setItem('token', JSON.stringify(res.data));
        location.reload();
      },
      (err) => console.log(err)
    )
  }
}
