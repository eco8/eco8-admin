import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MemoryMasterRoutingModule } from './memory-master-routing.module';
import { MemoryMasterComponent } from './memory-master.component';


@NgModule({
  declarations: [MemoryMasterComponent],
  imports: [
    CommonModule,
    MemoryMasterRoutingModule
  ]
})
export class MemoryMasterModule { }
