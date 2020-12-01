import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LoginRoutingModule } from './login-routing.module';
import { LoginComponent } from './login.component';
import { FormsModule } from '@angular/forms';
import { ButtonModule, CheckBoxModule, TextInputModule } from 'ng-devui';

@NgModule({
  declarations: [LoginComponent],
  imports: [CommonModule, LoginRoutingModule, FormsModule, CheckBoxModule, ButtonModule, TextInputModule],
})
export class LoginModule {}
