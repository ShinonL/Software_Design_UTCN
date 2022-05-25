import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppointmentListCustomerComponent } from './appointment/appointment-list-customer/appointment-list-customer.component';
import { AppointmentListEmpComponent } from './appointment/appointment-list-emp/appointment-list-emp.component';
import { FacilityListComponent } from './facility/facility-list/facility-list.component';
import { FacilityComponent } from './facility/facility/facility.component';
import { HealhTypeComponent } from './health/healh-type/healh-type.component';
import { HealthListComponent } from './health/health-list/health-list.component';
import { PetListComponent } from './pet/pet-list/pet-list.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: FacilityListComponent },
  { path: 'service/:id', component: FacilityComponent },
  { path: 'pets', component: PetListComponent },
  { path: 'health-reference/:id', component: HealhTypeComponent },
  { path: 'health-references', component: HealthListComponent },
  { path: 'my-appointments', component: AppointmentListCustomerComponent},
  { path: 'appointments/:id', component: AppointmentListEmpComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
