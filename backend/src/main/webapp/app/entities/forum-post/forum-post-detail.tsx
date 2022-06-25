import React, { useEffect } from 'react';
import { Link, RouteComponentProps } from 'react-router-dom';
import { Button, Row, Col } from 'reactstrap';
import {} from 'react-jhipster';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { APP_DATE_FORMAT, APP_LOCAL_DATE_FORMAT } from 'app/config/constants';
import { useAppDispatch, useAppSelector } from 'app/config/store';

import { getEntity } from './forum-post.reducer';

export const ForumPostDetail = (props: RouteComponentProps<{ id: string }>) => {
  const dispatch = useAppDispatch();

  useEffect(() => {
    dispatch(getEntity(props.match.params.id));
  }, []);

  const forumPostEntity = useAppSelector(state => state.forumPost.entity);
  return (
    <Row>
      <Col md="8">
        <h2 data-cy="forumPostDetailsHeading">ForumPost</h2>
        <dl className="jh-entity-details">
          <dt>
            <span id="id">ID</span>
          </dt>
          <dd>{forumPostEntity.id}</dd>
          <dt>
            <span id="title">Title</span>
          </dt>
          <dd>{forumPostEntity.title}</dd>
          <dt>
            <span id="desription">Desription</span>
          </dt>
          <dd>{forumPostEntity.desription}</dd>
          <dt>Company</dt>
          <dd>{forumPostEntity.company ? forumPostEntity.company.id : ''}</dd>
          <dt>Tag</dt>
          <dd>{forumPostEntity.tag ? forumPostEntity.tag.id : ''}</dd>
        </dl>
        <Button tag={Link} to="/forum-post" replace color="info" data-cy="entityDetailsBackButton">
          <FontAwesomeIcon icon="arrow-left" /> <span className="d-none d-md-inline">Back</span>
        </Button>
        &nbsp;
        <Button tag={Link} to={`/forum-post/${forumPostEntity.id}/edit`} replace color="primary">
          <FontAwesomeIcon icon="pencil-alt" /> <span className="d-none d-md-inline">Edit</span>
        </Button>
      </Col>
    </Row>
  );
};

export default ForumPostDetail;
