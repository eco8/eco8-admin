import { not } from '@angular/compiler/src/output/output_ast';
import { Injectable } from '@angular/core';
import { ReplaySubject } from 'rxjs';
import { InteractiveTip } from '../library/model/component.vo';

export class AnnouncementStruct {
  public notice: string;
  public period?: number = -1;
  public type?: InteractiveTip = InteractiveTip.info;
}

@Injectable({
  providedIn: 'root',
})
export class FrameworkService {
  /**
   * 全局公告
   */
  public static announcement: ReplaySubject<AnnouncementStruct> = new ReplaySubject(1);
  public static announcementList: AnnouncementStruct[] = [];
  public static publicNotice: AnnouncementStruct;
  public static announcementTimer = null;
  public static setAnnouncement(notice: AnnouncementStruct) {
    FrameworkService.announcementList.push(notice);
    if (!FrameworkService.announcementTimer) {
      FrameworkService.announcement.next(FrameworkService.announcementList.shift());
    }
  }

  constructor() {}
}
