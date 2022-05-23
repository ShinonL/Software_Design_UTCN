import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';
import { UserModel } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  url = 'http://localhost:8080/api/veterinae/auth';
  login_endpoint = 'login';
  register_endpoint = 'register';

  constructor(protected httpClient: HttpClient) {}

  public login(user: UserModel): Observable<ApiResponeModel> {
    return this.httpClient
      .post<ApiResponeModel>(`${this.url}/${this.login_endpoint}`, user)
  }

  public register(user: UserModel): Observable<ApiResponeModel> {
    return this.httpClient
      .post<ApiResponeModel>(`${this.url}/${this.register_endpoint}`, user)
  }
}
