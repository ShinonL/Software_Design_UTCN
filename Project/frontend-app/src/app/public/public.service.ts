import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';

@Injectable({
  providedIn: 'root'
})
export class PublicService {
  private url = 'http://localhost:8080/api/veterinae/public';
  private facilities_endpoint = 'find-facilities';

  constructor(protected httpClient: HttpClient) {}

  public findFacilities(): Observable<ApiResponeModel> {
    return this.httpClient
      .get<ApiResponeModel>(`${this.url}/${this.facilities_endpoint}`)
  }
}
