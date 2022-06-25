import React from 'react';
import { Switch } from 'react-router-dom';

import ErrorBoundaryRoute from 'app/shared/error/error-boundary-route';

import ForumPost from './forum-post';
import ForumPostDetail from './forum-post-detail';
import ForumPostUpdate from './forum-post-update';
import ForumPostDeleteDialog from './forum-post-delete-dialog';

const Routes = ({ match }) => (
  <>
    <Switch>
      <ErrorBoundaryRoute exact path={`${match.url}/new`} component={ForumPostUpdate} />
      <ErrorBoundaryRoute exact path={`${match.url}/:id/edit`} component={ForumPostUpdate} />
      <ErrorBoundaryRoute exact path={`${match.url}/:id`} component={ForumPostDetail} />
      <ErrorBoundaryRoute path={match.url} component={ForumPost} />
    </Switch>
    <ErrorBoundaryRoute exact path={`${match.url}/:id/delete`} component={ForumPostDeleteDialog} />
  </>
);

export default Routes;
