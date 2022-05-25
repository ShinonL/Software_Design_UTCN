import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import { AppointmentCreateComponent } from 'src/app/appointment/appointment-create/appointment-create.component';
import { PetModel } from 'src/app/models/pet.model';
import { SharedService } from 'src/app/shared/shared.service';
import { PetCreateComponent } from '../pet-create/pet-create.component';
import { PetService } from '../pet.service';

@Component({
  selector: 'app-pet-list',
  templateUrl: './pet-list.component.html',
  styleUrls: ['./pet-list.component.scss']
})
export class PetListComponent implements OnInit {
  faPlusCircle = faPlusCircle;
  pets: PetModel[] = []
  
  constructor(
    private petService: PetService, 
    public sharedService: SharedService,
    private dialog: MatDialog, 
    private router: Router
  ) { }

  ngOnInit(): void {
    this.petService.findPetsByUsername().subscribe(
      (res) => {
        res.data.forEach((element: PetModel) => {
          this.pets.push(element);
        });
      }
    )
  }

  openCreate() {
    this.dialog.open(PetCreateComponent);
  }

  openHR(id: string) {
    this.router.navigateByUrl(`health-reference/${id}`)
  }

  openApp(id: string) {
    this.dialog.open(AppointmentCreateComponent, {data: {petId: id}});
  }
}
