package com.ptidev.ptirex.service;

import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.repository.ForumPostRepository;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link ForumPost}.
 */
@Service
@Transactional
public class ForumPostService {

    private final Logger log = LoggerFactory.getLogger(ForumPostService.class);

    private final ForumPostRepository forumPostRepository;

    public ForumPostService(ForumPostRepository forumPostRepository) {
        this.forumPostRepository = forumPostRepository;
    }

    /**
     * Save a forumPost.
     *
     * @param forumPost the entity to save.
     * @return the persisted entity.
     */
    public ForumPost save(ForumPost forumPost) {
        log.debug("Request to save ForumPost : {}", forumPost);
        return forumPostRepository.save(forumPost);
    }

    /**
     * Update a forumPost.
     *
     * @param forumPost the entity to save.
     * @return the persisted entity.
     */
    public ForumPost update(ForumPost forumPost) {
        log.debug("Request to save ForumPost : {}", forumPost);
        return forumPostRepository.save(forumPost);
    }

    /**
     * Partially update a forumPost.
     *
     * @param forumPost the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<ForumPost> partialUpdate(ForumPost forumPost) {
        log.debug("Request to partially update ForumPost : {}", forumPost);

        return forumPostRepository
            .findById(forumPost.getId())
            .map(existingForumPost -> {
                if (forumPost.getTitle() != null) {
                    existingForumPost.setTitle(forumPost.getTitle());
                }
                if (forumPost.getDesription() != null) {
                    existingForumPost.setDesription(forumPost.getDesription());
                }

                return existingForumPost;
            })
            .map(forumPostRepository::save);
    }

    /**
     * Get all the forumPosts.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public Page<ForumPost> findAll(Pageable pageable) {
        log.debug("Request to get all ForumPosts");
        return forumPostRepository.findAll(pageable);
    }

    /**
     * Get one forumPost by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<ForumPost> findOne(Long id) {
        log.debug("Request to get ForumPost : {}", id);
        return forumPostRepository.findById(id);
    }

    /**
     * Delete the forumPost by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        log.debug("Request to delete ForumPost : {}", id);
        forumPostRepository.deleteById(id);
    }
}
