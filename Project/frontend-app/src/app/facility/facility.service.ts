import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';
import { FacilityModel } from '../models/facility.model';

@Injectable({
  providedIn: 'root'
})
export class FacilityService {
  private public_url = 'http://localhost:8080/api/veterinae/public';
  private employee_url = 'http://localhost:8080/api/veterinae/employee'
  private find_all = 'find-facilities';
  private find_by_id = 'find-facility';
  private create = 'create-facility';

  constructor(protected httpClient: HttpClient) {}

  public findFacilities(): Observable<ApiResponeModel> {
    return this.httpClient
      .get<ApiResponeModel>(`${this.public_url}/${this.find_all}`)
  }

  public findFacilityById(id: string): Observable<ApiResponeModel> {
    return this.httpClient
      .get<ApiResponeModel>(`${this.public_url}/${this.find_by_id}/${id}`)
  }

  public save(facility: FacilityModel): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));

    return this.httpClient
      .post<ApiResponeModel>(`${this.employee_url}/${this.create}`, facility, {headers: headers})
  }
}
