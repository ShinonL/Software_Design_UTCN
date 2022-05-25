import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './shared/material.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RatingModule } from 'ngx-bootstrap/rating';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

import { AppComponent } from './app.component';
import { LoginComponent } from './auth/login/login.component';
import { RegisterComponent } from './auth/register/register.component';
import { FacilityListComponent } from './facility/facility-list/facility-list.component';

import { AuthService } from './auth/auth.service';
import { FacilityComponent } from './facility/facility/facility.component';
import { FacilityCreateComponent } from './facility/facility-create/facility-create.component';
import { PetListComponent } from './pet/pet-list/pet-list.component';
import { PetCreateComponent } from './pet/pet-create/pet-create.component';
import { HealhTypeComponent } from './health/healh-type/healh-type.component';
import { HealthListComponent } from './health/health-list/health-list.component';
import { AppointmentCreateComponent } from './appointment/appointment-create/appointment-create.component';
import { AppointmentListCustomerComponent } from './appointment/appointment-list-customer/appointment-list-customer.component';
import { HRCreateComponent } from './health/hr-create/hr-create.component';
import { AppointmentListEmpComponent } from './appointment/appointment-list-emp/appointment-list-emp.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent, 
    RegisterComponent,
    FacilityListComponent,
    FacilityComponent,
    FacilityCreateComponent,
    PetListComponent,
    PetCreateComponent,
    HealhTypeComponent,
    HealthListComponent,
    AppointmentCreateComponent,
    AppointmentListCustomerComponent,
    HRCreateComponent,
    AppointmentListEmpComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    FlexLayoutModule,
    FormsModule, ReactiveFormsModule,
    RatingModule,
    FontAwesomeModule
  ],
  providers: [AuthService],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
