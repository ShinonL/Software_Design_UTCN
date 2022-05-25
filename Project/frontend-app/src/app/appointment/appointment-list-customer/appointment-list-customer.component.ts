import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PetModel } from 'src/app/models/pet.model';
import { PetService } from 'src/app/pet/pet.service';

@Component({
  selector: 'app-appointment-list-customer',
  templateUrl: './appointment-list-customer.component.html',
  styleUrls: ['./appointment-list-customer.component.scss']
})
export class AppointmentListCustomerComponent implements OnInit {
  pets: PetModel[] = []
  
  constructor(
    private petService: PetService,
    private router: Router,
  ) { }

  ngOnInit(): void {
    if (localStorage.getItem('role') != 'ROLE_CUSTOMER') {
      this.router.navigateByUrl('/home')
    }

    this.petService.findPetsByUsername().subscribe(
      (res) => {
        res.data.forEach((element: PetModel) => {
          this.pets.push(element);
        });
      }
    )
  }
}
