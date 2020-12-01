import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PortalRoutingModule } from './portal-routing.module';
import { PortalComponent } from './portal.component';
import { FrameworkModule } from '../framework/framework.module';
import { AvatarModule, ButtonModule, CardModule, SearchModule, TabsModule } from 'ng-devui';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [PortalComponent],
  imports: [
    CommonModule,
    FormsModule,
    PortalRoutingModule,
    FrameworkModule,
    TabsModule,
    CardModule,
    AvatarModule,
    SearchModule,
    ButtonModule,
  ],
})
export class PortalModule {}
