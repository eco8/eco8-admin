import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

class LoginForm {
  username: string;
  password: string;
}
@Component({
  selector: 'e-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  //
  public loginForm: LoginForm = new LoginForm();

  constructor(private router: Router) {}

  ngOnInit(): void {}

  public remeberUsername(bool: boolean) {
    console.log('remeberUsername: ', bool);
  }

  public login() {
    this.router.navigate(['/home']);
  }
}
