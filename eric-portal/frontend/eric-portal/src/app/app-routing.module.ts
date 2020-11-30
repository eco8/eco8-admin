import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PortalModule } from './portal/portal.module';
import { UserModule } from './user/user.module';

const routes: Routes = [];

@NgModule({
  imports: [RouterModule.forRoot(routes), PortalModule, UserModule],
  exports: [RouterModule],
})
export class AppRoutingModule {}
