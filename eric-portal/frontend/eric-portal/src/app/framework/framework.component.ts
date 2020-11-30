import { not } from '@angular/compiler/src/output/output_ast';
import { Component, Input, OnInit } from '@angular/core';
import { clear } from 'console';
import { InteractiveTip } from '../library/model/component.vo';
import { FrameworkModule } from './framework.module';
import { AnnouncementStruct, FrameworkService } from './framework.service';

@Component({
  selector: 'app-framework',
  templateUrl: './framework.component.html',
  styleUrls: ['./framework.component.scss'],
})
export class FrameworkComponent implements OnInit {
  /**
   * 页内公告
   */
  private _serviceNotice: AnnouncementStruct = {
    notice: '',
    period: 0,
    type: InteractiveTip.info,
  };
  @Input() set serviceNotice(notice: AnnouncementStruct) {
    this._serviceNotice = notice;

    if (notice.period > 0) {
      if (this.serviceNoticeTimer) {
        clearTimeout(this.serviceNoticeTimer);
        this.serviceNoticeTimer = null;
      }
      this.serviceNoticeTimer = setTimeout(() => {
        this._serviceNotice.period = 0;
      }, notice.period);
    }
  }
  get serviceNotice(): AnnouncementStruct {
    return this._serviceNotice;
  }
  public serviceNoticeTimer = null;

  /**
   * 全局公告
   */
  public publicNotice: AnnouncementStruct = {
    notice: '',
    period: 0,
    type: InteractiveTip.info,
  };
  private globalTimer = null;

  constructor() {
    FrameworkService.announcement.subscribe((res: AnnouncementStruct) => {
      // console.log('全局公告: ', res);
      this.publicNotice = res;

      if (res.period > 0) {
        if (this.globalTimer) {
          clearTimeout(this.globalTimer);
          this.globalTimer = null;
        }
        this.globalTimer = setTimeout(() => {
          this.publicNotice.period = 0;
        }, res.period);
      }
    });
  }

  ngOnInit(): void {
    /**
     * 测试全局消息公告
     */
    // FrameworkService.setAnnouncement({
    //   notice: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    //   period: 3000,
    //   type: InteractiveTip.success,
    // });
  }
}
