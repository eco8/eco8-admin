import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { NavItem } from './header.vo';

@Component({
  selector: 'e-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  //
  public navs: NavItem[] = [
    {
      title: '用户管理',
      url: '/user',
    },
    {
      title: '博客',
      url: '/blog',
    },
  ];
  public currentUrl: string = '';

  constructor(private router: Router) {
    this.router.events.subscribe(e => {
      if (e instanceof NavigationEnd) {
        this.currentUrl = e.url;
      }
    });
  }

  ngOnInit(): void {}
}
