import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HeaderComponent } from './header.component';
import { RouterModule } from '@angular/router';
import { AvatarModule } from 'ng-devui';

@NgModule({
  declarations: [HeaderComponent],
  exports: [HeaderComponent],
  imports: [CommonModule, RouterModule, AvatarModule],
})
export class HeaderModule {}
