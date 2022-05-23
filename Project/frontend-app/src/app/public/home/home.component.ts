import { Component, OnInit } from '@angular/core';
import { FacilityModel } from 'src/app/models/facility.model';
import { PublicService } from '../public.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  facilities: FacilityModel[] = [];

  constructor(private publicService: PublicService) { }

  ngOnInit(): void {
    this.publicService.findFacilities().subscribe(
      (res) => {
        res.data.forEach((element: FacilityModel) => {
          this.facilities.push(element);
        });
      }
    )
  }

}
