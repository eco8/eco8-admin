import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UserRoutingModule } from './user-routing.module';
import { UserComponent } from './user.component';
import { FrameworkModule } from '../framework/framework.module';

@NgModule({
  declarations: [UserComponent],
  imports: [CommonModule, UserRoutingModule, FrameworkModule],
})
export class UserModule {}
