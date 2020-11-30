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
  // 全局公告
  public static announcement: ReplaySubject<AnnouncementStruct> = new ReplaySubject(1);
  public static setAnnouncement(notice: AnnouncementStruct) {
    FrameworkService.announcement.next(notice);
  }

  constructor() {}
}
