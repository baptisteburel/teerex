import React from 'react';
import { Switch } from 'react-router-dom';
import ErrorBoundaryRoute from 'app/shared/error/error-boundary-route';

import Company from './company';
import Tag from './tag';
import UserExtra from './user-extra';
import ForumPost from './forum-post';
/* jhipster-needle-add-route-import - JHipster will add routes here */

export default ({ match }) => {
  return (
    <div>
      <Switch>
        {/* prettier-ignore */}
        <ErrorBoundaryRoute path={`${match.url}company`} component={Company} />
        <ErrorBoundaryRoute path={`${match.url}tag`} component={Tag} />
        <ErrorBoundaryRoute path={`${match.url}user-extra`} component={UserExtra} />
        <ErrorBoundaryRoute path={`${match.url}forum-post`} component={ForumPost} />
        {/* jhipster-needle-add-route-path - JHipster will add routes here */}
      </Switch>
    </div>
  );
};
