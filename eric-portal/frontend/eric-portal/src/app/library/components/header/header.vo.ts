export class NavItem {
  public title: string;
  public url: string;
}

export enum SexEnum {
  female = 'female',
  male = 'male',
}

export class UserItem {
  public name: string = '';
  public gender: string = SexEnum.male;
}
