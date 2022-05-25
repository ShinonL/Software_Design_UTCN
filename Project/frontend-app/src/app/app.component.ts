import { Component } from '@angular/core';

import { MatDialog } from '@angular/material/dialog';
import { LoginComponent } from './auth/login/login.component';
import { RegisterComponent } from './auth/register/register.component';
import { SharedService } from './shared/shared.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'frontend-app';

  constructor(public sharedService: SharedService, public dialog: MatDialog) {}

  openLoginDialog() {
    this.dialog.open(LoginComponent);
  }

  openRegisterDialog() {
    this.dialog.open(RegisterComponent);
  }

  isLoggedIn() {
    return this.sharedService.isLoggedIn();
  }

  onLogout() {
    this.sharedService.logout();
  }
}
