import { IUser } from 'app/shared/model/user.model';
import { ICompany } from 'app/shared/model/company.model';

export interface IUserExtra {
  id?: number;
  user?: IUser | null;
  company?: ICompany | null;
}

export const defaultValue: Readonly<IUserExtra> = {};
