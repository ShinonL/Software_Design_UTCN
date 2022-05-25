import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FacilityModel } from 'src/app/models/facility.model';
import { FacilityService } from '../facility.service';

@Component({
  selector: 'app-facility',
  templateUrl: './facility.component.html',
  styleUrls: ['./facility.component.scss']
})
export class FacilityComponent implements OnInit {
  facility!: FacilityModel

  constructor(private facilityService: FacilityService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    let id = this.route.snapshot.params.id;

    this.facilityService.findFacilityById(id).subscribe(
      (res) => {
        this.facility = res.data
      }
    )
  }

  
}
