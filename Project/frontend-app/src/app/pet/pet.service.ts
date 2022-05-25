import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiResponeModel } from '../models/api-response.model';
import { PetModel } from '../models/pet.model';

@Injectable({
  providedIn: 'root'
})
export class PetService {
  private public_url = 'http://localhost:8080/api/veterinae/public';
  private employee_url = 'http://localhost:8080/api/veterinae/employee'
  private customer_url = 'http://localhost:8080/api/veterinae/customer'
  private common_url = 'http://localhost:8080/api/veterinae/common'
  private find_by_username = 'find-pet';
  private find_types = 'find-pet-types';
  private create_pet = 'create-pet'
  private find_type_by_id = 'find-pet-type'

  constructor(protected httpClient: HttpClient) {}

  public findPetsByUsername(): Observable<ApiResponeModel> {
    var username = localStorage.getItem('username');
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));
    
    return this.httpClient
      .get<ApiResponeModel>(`${this.customer_url}/${this.find_by_username}/${username}`, {headers: headers})
  }

  public findPetTypes(): Observable<ApiResponeModel> {
    return this.httpClient
      .get<ApiResponeModel>(`${this.public_url}/${this.find_types}`)
  }

  public save(pet: PetModel): Observable<ApiResponeModel> {
    let headers = new HttpHeaders().set('Authorization', 'Bearer ' + localStorage.getItem('token'));

    return this.httpClient
      .post<ApiResponeModel>(`${this.common_url}/${this.create_pet}`, pet, {headers: headers})
  }

  public findPetTypeById(id: string): Observable<ApiResponeModel> {
    return this.httpClient
      .get<ApiResponeModel>(`${this.public_url}/${this.find_type_by_id}/${id}`)
  }
}
