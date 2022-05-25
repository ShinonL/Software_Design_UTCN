import { Component, OnInit } from '@angular/core';
import { FacilityModel } from 'src/app/models/facility.model';
import { FacilityService } from '../facility.service';
import { faPlusCircle } from '@fortawesome/free-solid-svg-icons';
import { SharedService } from 'src/app/shared/shared.service';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { FacilityCreateComponent } from '../facility-create/facility-create.component';

@Component({
  selector: 'app-facility-list',
  templateUrl: './facility-list.component.html',
  styleUrls: ['./facility-list.component.scss']
})
export class FacilityListComponent implements OnInit {
  faPlusCircle = faPlusCircle;
  facilities: FacilityModel[] = [];

  constructor(
    private router: Router,
    private facilityService: FacilityService, 
    public sharedService: SharedService,
    public dialog: MatDialog
    ) { }

  ngOnInit(): void {
    this.facilityService.findFacilities().subscribe(
      (res) => {
        res.data.forEach((element: FacilityModel) => {
          this.facilities.push(element);
        });
      }
    )
  }

  onReviews(facility: FacilityModel) {
    this.router.navigateByUrl(`/service/${facility.id}`)
  }
  
  openCreate() {
    this.dialog.open(FacilityCreateComponent);
  }

  onApps(id: string) {
    this.router.navigateByUrl(`/appointments/${id}`)
  }
}
