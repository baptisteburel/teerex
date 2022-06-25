import { IForumPost } from 'app/shared/model/forum-post.model';
import { TagNames } from 'app/shared/model/enumerations/tag-names.model';

export interface ITag {
  id?: number;
  tagName?: TagNames | null;
  forumPosts?: IForumPost[] | null;
}

export const defaultValue: Readonly<ITag> = {};
