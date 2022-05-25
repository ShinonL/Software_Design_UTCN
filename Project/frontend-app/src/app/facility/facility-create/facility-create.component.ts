import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { FacilityModel } from 'src/app/models/facility.model';
import { FacilityService } from '../facility.service';

@Component({
  selector: 'app-facility-create',
  templateUrl: './facility-create.component.html',
  styleUrls: ['./facility-create.component.scss']
})
export class FacilityCreateComponent implements OnInit {
  name: FormControl;
  description: FormControl;
  price: FormControl;

  constructor(private facilityService: FacilityService) {
    this.name = new FormControl('', Validators.required);
    this.description = new FormControl('', Validators.required);
    this.price = new FormControl('', Validators.required);
  }

  ngOnInit() {
  }

  onSave() {
    const facility: FacilityModel = {
      name : this.name.value,
      description : this.description.value,
      price : this.price.value
    }

    this.facilityService.save(facility).subscribe(
        (res) => {
          location.reload()
        }, 
        (err) => console.log(err)
      );
  }
}
