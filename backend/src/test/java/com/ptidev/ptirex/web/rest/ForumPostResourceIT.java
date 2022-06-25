package com.ptidev.ptirex.web.rest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.ptidev.ptirex.IntegrationTest;
import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.repository.ForumPostRepository;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
import javax.persistence.EntityManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration tests for the {@link ForumPostResource} REST controller.
 */
@IntegrationTest
@AutoConfigureMockMvc
@WithMockUser
class ForumPostResourceIT {

    private static final String DEFAULT_TITLE = "AAAAAAAAAA";
    private static final String UPDATED_TITLE = "BBBBBBBBBB";

    private static final String DEFAULT_DESRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESRIPTION = "BBBBBBBBBB";

    private static final String ENTITY_API_URL = "/api/forum-posts";
    private static final String ENTITY_API_URL_ID = ENTITY_API_URL + "/{id}";

    private static Random random = new Random();
    private static AtomicLong count = new AtomicLong(random.nextInt() + (2 * Integer.MAX_VALUE));

    @Autowired
    private ForumPostRepository forumPostRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc restForumPostMockMvc;

    private ForumPost forumPost;

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ForumPost createEntity(EntityManager em) {
        ForumPost forumPost = new ForumPost().title(DEFAULT_TITLE).desription(DEFAULT_DESRIPTION);
        return forumPost;
    }

    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static ForumPost createUpdatedEntity(EntityManager em) {
        ForumPost forumPost = new ForumPost().title(UPDATED_TITLE).desription(UPDATED_DESRIPTION);
        return forumPost;
    }

    @BeforeEach
    public void initTest() {
        forumPost = createEntity(em);
    }

    @Test
    @Transactional
    void createForumPost() throws Exception {
        int databaseSizeBeforeCreate = forumPostRepository.findAll().size();
        // Create the ForumPost
        restForumPostMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(forumPost)))
            .andExpect(status().isCreated());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeCreate + 1);
        ForumPost testForumPost = forumPostList.get(forumPostList.size() - 1);
        assertThat(testForumPost.getTitle()).isEqualTo(DEFAULT_TITLE);
        assertThat(testForumPost.getDesription()).isEqualTo(DEFAULT_DESRIPTION);
    }

    @Test
    @Transactional
    void createForumPostWithExistingId() throws Exception {
        // Create the ForumPost with an existing ID
        forumPost.setId(1L);

        int databaseSizeBeforeCreate = forumPostRepository.findAll().size();

        // An entity with an existing ID cannot be created, so this API call must fail
        restForumPostMockMvc
            .perform(post(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(forumPost)))
            .andExpect(status().isBadRequest());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    void getAllForumPosts() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        // Get all the forumPostList
        restForumPostMockMvc
            .perform(get(ENTITY_API_URL + "?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(forumPost.getId().intValue())))
            .andExpect(jsonPath("$.[*].title").value(hasItem(DEFAULT_TITLE)))
            .andExpect(jsonPath("$.[*].desription").value(hasItem(DEFAULT_DESRIPTION)));
    }

    @Test
    @Transactional
    void getForumPost() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        // Get the forumPost
        restForumPostMockMvc
            .perform(get(ENTITY_API_URL_ID, forumPost.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.id").value(forumPost.getId().intValue()))
            .andExpect(jsonPath("$.title").value(DEFAULT_TITLE))
            .andExpect(jsonPath("$.desription").value(DEFAULT_DESRIPTION));
    }

    @Test
    @Transactional
    void getNonExistingForumPost() throws Exception {
        // Get the forumPost
        restForumPostMockMvc.perform(get(ENTITY_API_URL_ID, Long.MAX_VALUE)).andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void putNewForumPost() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();

        // Update the forumPost
        ForumPost updatedForumPost = forumPostRepository.findById(forumPost.getId()).get();
        // Disconnect from session so that the updates on updatedForumPost are not directly saved in db
        em.detach(updatedForumPost);
        updatedForumPost.title(UPDATED_TITLE).desription(UPDATED_DESRIPTION);

        restForumPostMockMvc
            .perform(
                put(ENTITY_API_URL_ID, updatedForumPost.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(updatedForumPost))
            )
            .andExpect(status().isOk());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
        ForumPost testForumPost = forumPostList.get(forumPostList.size() - 1);
        assertThat(testForumPost.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testForumPost.getDesription()).isEqualTo(UPDATED_DESRIPTION);
    }

    @Test
    @Transactional
    void putNonExistingForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(
                put(ENTITY_API_URL_ID, forumPost.getId())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(forumPost))
            )
            .andExpect(status().isBadRequest());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithIdMismatchForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(
                put(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType(MediaType.APPLICATION_JSON)
                    .content(TestUtil.convertObjectToJsonBytes(forumPost))
            )
            .andExpect(status().isBadRequest());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void putWithMissingIdPathParamForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(put(ENTITY_API_URL).contentType(MediaType.APPLICATION_JSON).content(TestUtil.convertObjectToJsonBytes(forumPost)))
            .andExpect(status().isMethodNotAllowed());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void partialUpdateForumPostWithPatch() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();

        // Update the forumPost using partial update
        ForumPost partialUpdatedForumPost = new ForumPost();
        partialUpdatedForumPost.setId(forumPost.getId());

        partialUpdatedForumPost.title(UPDATED_TITLE);

        restForumPostMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedForumPost.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedForumPost))
            )
            .andExpect(status().isOk());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
        ForumPost testForumPost = forumPostList.get(forumPostList.size() - 1);
        assertThat(testForumPost.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testForumPost.getDesription()).isEqualTo(DEFAULT_DESRIPTION);
    }

    @Test
    @Transactional
    void fullUpdateForumPostWithPatch() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();

        // Update the forumPost using partial update
        ForumPost partialUpdatedForumPost = new ForumPost();
        partialUpdatedForumPost.setId(forumPost.getId());

        partialUpdatedForumPost.title(UPDATED_TITLE).desription(UPDATED_DESRIPTION);

        restForumPostMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, partialUpdatedForumPost.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(partialUpdatedForumPost))
            )
            .andExpect(status().isOk());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
        ForumPost testForumPost = forumPostList.get(forumPostList.size() - 1);
        assertThat(testForumPost.getTitle()).isEqualTo(UPDATED_TITLE);
        assertThat(testForumPost.getDesription()).isEqualTo(UPDATED_DESRIPTION);
    }

    @Test
    @Transactional
    void patchNonExistingForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, forumPost.getId())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(forumPost))
            )
            .andExpect(status().isBadRequest());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithIdMismatchForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(
                patch(ENTITY_API_URL_ID, count.incrementAndGet())
                    .contentType("application/merge-patch+json")
                    .content(TestUtil.convertObjectToJsonBytes(forumPost))
            )
            .andExpect(status().isBadRequest());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void patchWithMissingIdPathParamForumPost() throws Exception {
        int databaseSizeBeforeUpdate = forumPostRepository.findAll().size();
        forumPost.setId(count.incrementAndGet());

        // If url ID doesn't match entity ID, it will throw BadRequestAlertException
        restForumPostMockMvc
            .perform(
                patch(ENTITY_API_URL).contentType("application/merge-patch+json").content(TestUtil.convertObjectToJsonBytes(forumPost))
            )
            .andExpect(status().isMethodNotAllowed());

        // Validate the ForumPost in the database
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    void deleteForumPost() throws Exception {
        // Initialize the database
        forumPostRepository.saveAndFlush(forumPost);

        int databaseSizeBeforeDelete = forumPostRepository.findAll().size();

        // Delete the forumPost
        restForumPostMockMvc
            .perform(delete(ENTITY_API_URL_ID, forumPost.getId()).accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());

        // Validate the database contains one less item
        List<ForumPost> forumPostList = forumPostRepository.findAll();
        assertThat(forumPostList).hasSize(databaseSizeBeforeDelete - 1);
    }
}
