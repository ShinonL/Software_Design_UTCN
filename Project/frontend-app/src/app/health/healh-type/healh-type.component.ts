import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PetTypeModel } from 'src/app/models/pet-type.model';
import { PetService } from 'src/app/pet/pet.service';

@Component({
  selector: 'app-healh-type',
  templateUrl: './healh-type.component.html',
  styleUrls: ['./healh-type.component.scss']
})
export class HealhTypeComponent implements OnInit {
  petType!: PetTypeModel

  constructor(private petService: PetService, private route: ActivatedRoute) { }

  ngOnInit(): void {
    let id = this.route.snapshot.params.id;

    this.petService.findPetTypeById(id).subscribe(
      (res) => {
        this.petType = res.data
      }
    )
  }
}
