import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
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

  constructor(private activatedRoute: ActivatedRoute, private router: Router) {
    this.router.events.subscribe(e => {
      console.log('===============\n', e);
      if (e instanceof NavigationEnd) {
        this.currentUrl = e.url;
      }
    });
  }

  ngOnInit(): void {
    console.log('this.activatedRoute.snapshot: ', this.activatedRoute.snapshot);
  }
}
