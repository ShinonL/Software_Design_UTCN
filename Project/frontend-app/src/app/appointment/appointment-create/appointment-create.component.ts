import { HttpClient } from '@angular/common/http';
import { Component, Inject, Input, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FacilityService } from 'src/app/facility/facility.service';
import { AppointmentModel } from 'src/app/models/appointment.model';
import { FacilityModel } from 'src/app/models/facility.model';
import { IdModel } from 'src/app/models/id.model';
import { AppointmentService } from '../appointment.service';

@Component({
  selector: 'app-appointment-create',
  templateUrl: './appointment-create.component.html',
  styleUrls: ['./appointment-create.component.scss']
})
export class AppointmentCreateComponent implements OnInit {
  @Input()
  petId!: string
  date: FormControl;
  time: FormControl;
  facilities= new FormControl()
  facilitiesList: FacilityModel[] = []
  dateTime!: Date


  startDateFilter = (date: Date | null): boolean => {
    const startDate = date || new Date();
    return startDate >= new Date();
  };

  constructor(
    private appointmentService: AppointmentService,
    private facilityService: FacilityService, 
    @Inject(MAT_DIALOG_DATA) public data: { petId: string }
  ) { 
    this.date = new FormControl('', Validators.required)
    this.time = new FormControl('', Validators.required)
  }

  ngOnInit(): void {
    this.facilityService.findFacilities().subscribe(
      (res) => {
        res.data.forEach((element: FacilityModel) => {
          this.facilitiesList.push(element);
        });
      }
    )
  }

  onSave() {
    this.dateTime = this.date.value;
    this.dateTime.setHours(this.time.value)

    var facs: FacilityModel[] = []
    this.facilities.value.forEach((element: string) => {
      facs.push({id: element})
    });

    const app: AppointmentModel = {
      dateTime : this.dateTime,
      petId: this.data.petId,
      facilities : facs,
      toDecline: false,
      appointmentState: 'PENDING'
    }

    console.log(app)
    this.appointmentService.save(app).subscribe(
        (res) => {
          location.reload()
        }
      );
  }
}
