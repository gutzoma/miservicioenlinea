import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProfileDigitalComponent } from './pages/profile-digital/profile-digital.component';
import { HomeComponent } from './pages/home/home.component';


const routes: Routes = [
  { path:'perfil/:id', component: ProfileDigitalComponent },
  { path:'home', component: HomeComponent },
  {  path:'**', pathMatch:'full', redirectTo:'home' }];

@NgModule({
  imports: [RouterModule.forRoot(routes, {useHash:true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
