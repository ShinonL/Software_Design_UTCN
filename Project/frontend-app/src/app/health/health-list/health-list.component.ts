import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import { HealthReferenceModel } from 'src/app/models/health-reference.model';
import { PetTypeModel } from 'src/app/models/pet-type.model';
import { PetService } from 'src/app/pet/pet.service';
import { SharedService } from 'src/app/shared/shared.service';
import { HealthService } from '../health.service';
import { HRCreateComponent } from '../hr-create/hr-create.component';

@Component({
  selector: 'app-health-list',
  templateUrl: './health-list.component.html',
  styleUrls: ['./health-list.component.scss']
})
export class HealthListComponent implements OnInit {
  faPlusCircle = faPlusCircle;
  petTypes: PetTypeModel[] = [];

  constructor(
    private petService: PetService, 
    public sharedService: SharedService,
    private d: MatDialog
  ) { }

  ngOnInit() {
    this.petService.findPetTypes().subscribe(
      (res) => {
        res.data.forEach((element: PetTypeModel) => {
          this.petTypes.push(element);
        });
      }
    )
  }

  openCreate(id: string) {
   this.d.open(HRCreateComponent, {data: {id: id}})
  }
}
