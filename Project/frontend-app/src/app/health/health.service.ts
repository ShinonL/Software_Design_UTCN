import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';
import { FacilityModel } from '../models/facility.model';
import { HealthReferenceModel } from '../models/health-reference.model';

@Injectable({
  providedIn: 'root'
})
export class HealthService {
  private public_url = 'http://localhost:8080/api/veterinae/public';
  private employee_url = 'http://localhost:8080/api/veterinae/employee'
  private find_all = 'find-facilities';
  private find_by_id = 'find-facility';
  private create = 'create-health-reference';

  constructor(protected httpClient: HttpClient) {}

  public save(hr: HealthReferenceModel): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));

    return this.httpClient
      .post<ApiResponeModel>(`${this.employee_url}/${this.create}`, hr, {headers: headers})
  }
}
