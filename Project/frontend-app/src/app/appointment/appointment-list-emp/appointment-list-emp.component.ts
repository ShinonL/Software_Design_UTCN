import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppointmentModel } from 'src/app/models/appointment.model';
import { PetModel } from 'src/app/models/pet.model';
import { PetService } from 'src/app/pet/pet.service';
import { AppointmentService } from '../appointment.service';

@Component({
  selector: 'app-appointment-list-emp',
  templateUrl: './appointment-list-emp.component.html',
  styleUrls: ['./appointment-list-emp.component.scss']
})
export class AppointmentListEmpComponent implements OnInit {
  apps: AppointmentModel[] = []
  
  constructor(
    private appService: AppointmentService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit(): void {
    if (localStorage.getItem('role') != 'ROLE_EMPLOYEE') {
      this.router.navigateByUrl('/home')
    }

    let id = this.route.snapshot.params.id;
    this.appService.findAppsByFacility(id).subscribe(
      (res) => {
        res.data.forEach((element: AppointmentModel) => {
          this.apps.push(element);
        });
      }
    )

    console.log(this.apps)
  }

  isPending(app: AppointmentModel) {
    return app.appointmentState === 'PENDING'
  }

  onC(app: AppointmentModel) {
    this.appService.change(app).subscribe(
      (res) => {
        location.reload()
      }
    )
  }

  onD(app: AppointmentModel) {
    app.toDecline = true
    this.appService.change(app).subscribe(
      (res) => {
        location.reload()
      }
    )
  }
}
