package com.ptidev.ptirex.web.rest;

import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.repository.ForumPostRepository;
import com.ptidev.ptirex.service.ForumPostService;
import com.ptidev.ptirex.web.rest.errors.BadRequestAlertException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tech.jhipster.web.util.HeaderUtil;
import tech.jhipster.web.util.PaginationUtil;
import tech.jhipster.web.util.ResponseUtil;

/**
 * REST controller for managing {@link com.ptidev.ptirex.domain.ForumPost}.
 */
@RestController
@RequestMapping("/api")
public class ForumPostResource {

    private final Logger log = LoggerFactory.getLogger(ForumPostResource.class);

    private static final String ENTITY_NAME = "forumPost";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final ForumPostService forumPostService;

    private final ForumPostRepository forumPostRepository;

    public ForumPostResource(ForumPostService forumPostService, ForumPostRepository forumPostRepository) {
        this.forumPostService = forumPostService;
        this.forumPostRepository = forumPostRepository;
    }

    /**
     * {@code POST  /forum-posts} : Create a new forumPost.
     *
     * @param forumPost the forumPost to create.
     * @return the {@link ResponseEntity} with status {@code 201 (Created)} and with body the new forumPost, or with status {@code 400 (Bad Request)} if the forumPost has already an ID.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PostMapping("/forum-posts")
    public ResponseEntity<ForumPost> createForumPost(@RequestBody ForumPost forumPost) throws URISyntaxException {
        log.debug("REST request to save ForumPost : {}", forumPost);
        if (forumPost.getId() != null) {
            throw new BadRequestAlertException("A new forumPost cannot already have an ID", ENTITY_NAME, "idexists");
        }
        ForumPost result = forumPostService.save(forumPost);
        return ResponseEntity
            .created(new URI("/api/forum-posts/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(applicationName, false, ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * {@code PUT  /forum-posts/:id} : Updates an existing forumPost.
     *
     * @param id the id of the forumPost to save.
     * @param forumPost the forumPost to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated forumPost,
     * or with status {@code 400 (Bad Request)} if the forumPost is not valid,
     * or with status {@code 500 (Internal Server Error)} if the forumPost couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PutMapping("/forum-posts/{id}")
    public ResponseEntity<ForumPost> updateForumPost(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody ForumPost forumPost
    ) throws URISyntaxException {
        log.debug("REST request to update ForumPost : {}, {}", id, forumPost);
        if (forumPost.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, forumPost.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!forumPostRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        ForumPost result = forumPostService.update(forumPost);
        return ResponseEntity
            .ok()
            .headers(HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, forumPost.getId().toString()))
            .body(result);
    }

    /**
     * {@code PATCH  /forum-posts/:id} : Partial updates given fields of an existing forumPost, field will ignore if it is null
     *
     * @param id the id of the forumPost to save.
     * @param forumPost the forumPost to update.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the updated forumPost,
     * or with status {@code 400 (Bad Request)} if the forumPost is not valid,
     * or with status {@code 404 (Not Found)} if the forumPost is not found,
     * or with status {@code 500 (Internal Server Error)} if the forumPost couldn't be updated.
     * @throws URISyntaxException if the Location URI syntax is incorrect.
     */
    @PatchMapping(value = "/forum-posts/{id}", consumes = { "application/json", "application/merge-patch+json" })
    public ResponseEntity<ForumPost> partialUpdateForumPost(
        @PathVariable(value = "id", required = false) final Long id,
        @RequestBody ForumPost forumPost
    ) throws URISyntaxException {
        log.debug("REST request to partial update ForumPost partially : {}, {}", id, forumPost);
        if (forumPost.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        if (!Objects.equals(id, forumPost.getId())) {
            throw new BadRequestAlertException("Invalid ID", ENTITY_NAME, "idinvalid");
        }

        if (!forumPostRepository.existsById(id)) {
            throw new BadRequestAlertException("Entity not found", ENTITY_NAME, "idnotfound");
        }

        Optional<ForumPost> result = forumPostService.partialUpdate(forumPost);

        return ResponseUtil.wrapOrNotFound(
            result,
            HeaderUtil.createEntityUpdateAlert(applicationName, false, ENTITY_NAME, forumPost.getId().toString())
        );
    }

    /**
     * {@code GET  /forum-posts} : get all the forumPosts.
     *
     * @param pageable the pagination information.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and the list of forumPosts in body.
     */
    @GetMapping("/forum-posts")
    public ResponseEntity<List<ForumPost>> getAllForumPosts(@org.springdoc.api.annotations.ParameterObject Pageable pageable) {
        log.debug("REST request to get a page of ForumPosts");
        Page<ForumPost> page = forumPostService.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * {@code GET  /forum-posts/:id} : get the "id" forumPost.
     *
     * @param id the id of the forumPost to retrieve.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and with body the forumPost, or with status {@code 404 (Not Found)}.
     */
    @GetMapping("/forum-posts/{id}")
    public ResponseEntity<ForumPost> getForumPost(@PathVariable Long id) {
        log.debug("REST request to get ForumPost : {}", id);
        Optional<ForumPost> forumPost = forumPostService.findOne(id);
        return ResponseUtil.wrapOrNotFound(forumPost);
    }

    /**
     * {@code DELETE  /forum-posts/:id} : delete the "id" forumPost.
     *
     * @param id the id of the forumPost to delete.
     * @return the {@link ResponseEntity} with status {@code 204 (NO_CONTENT)}.
     */
    @DeleteMapping("/forum-posts/{id}")
    public ResponseEntity<Void> deleteForumPost(@PathVariable Long id) {
        log.debug("REST request to delete ForumPost : {}", id);
        forumPostService.delete(id);
        return ResponseEntity
            .noContent()
            .headers(HeaderUtil.createEntityDeletionAlert(applicationName, false, ENTITY_NAME, id.toString()))
            .build();
    }
}
