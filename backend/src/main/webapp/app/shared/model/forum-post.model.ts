import { ICompany } from 'app/shared/model/company.model';
import { ITag } from 'app/shared/model/tag.model';

export interface IForumPost {
  id?: number;
  title?: string | null;
  desription?: string | null;
  company?: ICompany | null;
  tag?: ITag | null;
}

export const defaultValue: Readonly<IForumPost> = {};
