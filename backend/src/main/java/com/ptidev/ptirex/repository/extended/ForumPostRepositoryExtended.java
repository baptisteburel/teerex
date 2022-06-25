package com.ptidev.ptirex.repository.extended;

import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.domain.enumeration.TagNames;
import com.ptidev.ptirex.repository.ForumPostRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ForumPostRepositoryExtended extends ForumPostRepository {
    @Query(
        "SELECT forumPost FROM ForumPost forumPost " +
        "INNER JOIN Tag tag ON forumPost.tag.id = tag.id " +
        "WHERE ((:tagName IS NULL OR forumPost.tag.tagName = :tagName) " +
        "AND (:searchTerm IS NULL OR lower(forumPost.title) LIKE concat('%', lower(:searchTerm), '%'))) "
    )
    public Page<ForumPost> searchForumPost(Pageable pageable, @Param("searchTerm") String searchterm, @Param("tagName") TagNames tagName);
}
