import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';
import { AppointmentModel } from '../models/appointment.model';

@Injectable({
  providedIn: 'root'
})
export class AppointmentService {
  private employee_url = 'http://localhost:8080/api/veterinae/employee';
  private customer_url = 'http://localhost:8080/api/veterinae/customer'
  private ch = 'change-appointment-state';
  private find_by_username = 'find-appointments';
  private create = 'create-appointment';

  constructor(protected httpClient: HttpClient) {}

  public findAppointments(): Observable<ApiResponeModel> {
    var username = localStorage.getItem('username');
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));
    
    return this.httpClient
      .get<ApiResponeModel>(`${this.customer_url}/${this.find_by_username}/${username}`, {headers: headers})
  }

  public findAppsByFacility(id: string): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));
    
    return this.httpClient
      .get<ApiResponeModel>(`${this.employee_url}/${this.find_by_username}/${id}`, {headers: headers})
  }

  public save(appointment: AppointmentModel): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));

    return this.httpClient
      .post<ApiResponeModel>(`${this.customer_url}/${this.create}`, appointment, {headers: headers})
  }

  public change(appointment: AppointmentModel): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));

    return this.httpClient
      .post<ApiResponeModel>(`${this.employee_url}/${this.ch}`, appointment, {headers: headers})
  }
}
