package com.ptidev.ptirex.repository;

import com.ptidev.ptirex.domain.ForumPost;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

/**
 * Spring Data SQL repository for the ForumPost entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ForumPostRepository extends JpaRepository<ForumPost, Long> {}
