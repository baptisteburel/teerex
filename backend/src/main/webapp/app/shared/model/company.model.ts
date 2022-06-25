import { IForumPost } from 'app/shared/model/forum-post.model';
import { IUserExtra } from 'app/shared/model/user-extra.model';

export interface ICompany {
  id?: number;
  name?: string | null;
  description?: string | null;
  mailContact?: string | null;
  numeroContact?: string | null;
  urlSiteVitrine?: string | null;
  forumPosts?: IForumPost[] | null;
  userExtras?: IUserExtra[] | null;
}

export const defaultValue: Readonly<ICompany> = {};
