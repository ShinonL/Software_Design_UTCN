import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { PetTypeModel } from 'src/app/models/pet-type.model';
import { PetModel } from 'src/app/models/pet.model';
import { PetService } from '../pet.service';

@Component({
  selector: 'app-pet-create',
  templateUrl: './pet-create.component.html',
  styleUrls: ['./pet-create.component.scss']
})
export class PetCreateComponent implements OnInit {
  name: FormControl;
  age: FormControl;
  petTypeId: string = '';


  petTypes: PetTypeModel[] = [];

  constructor(private petService: PetService) {
    this.name = new FormControl('', Validators.required);
    this.age = new FormControl('', Validators.required);
  }

  ngOnInit() {
    this.petService.findPetTypes().subscribe(
      (res) => {
        res.data.forEach((element: PetTypeModel) => {
          this.petTypes.push(element);
        });
      }
    )
  }

  onSave() {
    const pet: PetModel = {
      name : this.name.value,
      age : this.age.value,
      petType : {
        id: this.petTypeId
      },
      user: {
        username: localStorage.getItem('username') || ''
      }
    }

    this.petService.save(pet).subscribe(
        (res) => {
          location.reload()
        }, 
        (err) => console.log(err)
      );
  }
}
