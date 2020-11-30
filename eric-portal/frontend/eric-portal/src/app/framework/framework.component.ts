import { Component, Input, OnInit } from '@angular/core';
import { InteractiveTip } from '../library/model/component.vo';
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

  constructor() {
    FrameworkService.announcement.subscribe((res: AnnouncementStruct) => {
      console.log('FrameworkService.announcement: ', res);
      this.publicNotice = res;

      if (res.period > 0) {
        // if (FrameworkService.announcementTimer) {
        //   clearTimeout(FrameworkService.announcementTimer);
        //   FrameworkService.announcementTimer = null;
        // }
        FrameworkService.announcementTimer = setTimeout(() => {
          this.publicNotice.period = 0;
          FrameworkService.announcementTimer = null;
          if (FrameworkService.announcementList.length > 0) FrameworkService.setAnnouncement(FrameworkService.announcementList.shift());
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

    if (FrameworkService.announcementList.length > 0) {
    }
  }

  private initPublicAnnouncement(ann: AnnouncementStruct) {
    if (FrameworkService.announcementTimer) {
      this.publicNotice = FrameworkService.publicNotice;
    } else {
      this.publicNotice = FrameworkService.announcementList.shift();
      if (this.publicNotice.period > 0) {
        FrameworkService.announcementTimer = setTimeout(() => {
          clearTimeout(FrameworkService.announcementTimer);
          FrameworkService.announcementTimer = null;
        }, this.publicNotice.period);
      } else if (this.publicNotice.period === -1) {
        FrameworkService.announcementTimer = -1;
      }
    }
  }
}
