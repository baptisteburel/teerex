import company from 'app/entities/company/company.reducer';
import tag from 'app/entities/tag/tag.reducer';
import userExtra from 'app/entities/user-extra/user-extra.reducer';
import forumPost from 'app/entities/forum-post/forum-post.reducer';
/* jhipster-needle-add-reducer-import - JHipster will add reducer here */

const entitiesReducers = {
  company,
  tag,
  userExtra,
  forumPost,
  /* jhipster-needle-add-reducer-combine - JHipster will add reducer here */
};

export default entitiesReducers;
