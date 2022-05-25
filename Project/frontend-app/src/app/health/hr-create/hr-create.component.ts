import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { HealthReferenceModel } from 'src/app/models/health-reference.model';
import { HealthService } from '../health.service';

@Component({
  selector: 'app-hr-create',
  templateUrl: './hr-create.component.html',
  styleUrls: ['./hr-create.component.scss']
})
export class HRCreateComponent  {
  title: FormControl;
  text: FormControl;

  constructor(private hhrService: HealthService,
    @Inject(MAT_DIALOG_DATA) public data: { id: string }) {
    this.title = new FormControl('', Validators.required);
    this.text = new FormControl('', Validators.required);
  }


  onLogin() {
    var hr: HealthReferenceModel = {
      petTypeId: this.data.id,
      title: this.title.value,
      text: this.text.value
    }

    this.hhrService.save(hr).subscribe(
      (res) => location.reload()
    )
  }
}
