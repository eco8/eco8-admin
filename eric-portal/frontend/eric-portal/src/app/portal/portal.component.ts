import { Component, OnInit } from '@angular/core';
import { FrameworkService } from '../framework/framework.service';
import { InteractiveTip } from '../library/model/component.vo';

type GroupItem = {
  name: string;
  icon?: string;
  id: string;
};

@Component({
  selector: 'app-portal',
  templateUrl: './portal.component.html',
  styleUrls: ['./portal.component.scss'],
})
export class PortalComponent implements OnInit {
  //

  public systemGroup: GroupItem[] = [
    { id: 'mine', name: '我的关注', icon: 'icon-star-o' },
    { id: 'all', name: '所有项目', icon: 'icon-unarchived-item' },
    { id: 'archived', name: '已归档项目', icon: 'icon-archived-item' }, // archived 已归档
    { id: 'unfilled', name: '未归档项目', icon: 'icon-folder-2' }, // unfilled 未归档
  ];
  public myGroups: GroupItem[] = [
    { id: 'axiba-1', name: '分组一', icon: 'icon-star' },
    { id: 'axiba-2', name: '分组二', icon: 'icon-classroom-post-results-large' },
    { id: 'axiba-3', name: '分组三' },
    { id: 'axiba-4', name: '分组四' },
  ];

  public activeTabId: string = 'all';
  public activeGroup: GroupItem = { id: 'all', name: '所有项目', icon: 'icon-unarchived-item' };

  public currentViewId: string = 'kanban';

  public showSortCard: boolean = false;
  public sortType: string = 'name';
  public searchText: string = '';

  public testImg: string =
    'data:image/png;base64,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';

  constructor() {}

  ngOnInit(): void {
    /**
     * 测试全局消息公告
     */
    FrameworkService.setAnnouncement({
      notice: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      period: 5000,
      type: InteractiveTip.success,
    });
    FrameworkService.setAnnouncement({
      notice: 'xwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',
      period: 10000,
      type: InteractiveTip.success,
    });
  }

  public createGroup() {
    console.log('createGroup');
  }

  public changeGroup(group: GroupItem) {
    // console.log('changeGroup: ', group);
    this.activeGroup = group;
  }

  public activeTabChange(tab): void {
    console.log('activeTabChange: ', tab);
  }

  public changeView(view: string) {
    console.log('changeView: ', view);
  }

  public searchProject(evt) {
    console.log('searchProject: ', evt);
  }
}
