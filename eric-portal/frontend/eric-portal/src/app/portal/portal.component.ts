import { Component, OnInit } from '@angular/core';
import { FrameworkService } from '../framework/framework.service';
import { InteractiveTip } from '../library/model/component.vo';

@Component({
  selector: 'app-portal',
  templateUrl: './portal.component.html',
  styleUrls: ['./portal.component.scss'],
})
export class PortalComponent implements OnInit {
  constructor() {}

  ngOnInit(): void {
    /**
     * 测试全局消息公告
     */
    FrameworkService.setAnnouncement({
      notice: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      period: 15000,
      type: InteractiveTip.success,
    });
    FrameworkService.setAnnouncement({
      notice: 'xwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',
      period: 10000,
      type: InteractiveTip.success,
    });
  }
}
