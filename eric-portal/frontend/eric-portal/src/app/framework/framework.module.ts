import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FrameworkComponent } from './framework.component';
import { HeaderModule } from '../library/components/header/header.module';
import { AlertModule, ButtonModule } from 'ng-devui';

@NgModule({
  declarations: [FrameworkComponent],
  exports: [FrameworkComponent],
  imports: [CommonModule, HeaderModule, AlertModule, ButtonModule],
})
export class FrameworkModule {}
