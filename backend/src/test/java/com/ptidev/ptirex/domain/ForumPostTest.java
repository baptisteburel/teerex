package com.ptidev.ptirex.domain;

import static org.assertj.core.api.Assertions.assertThat;

import com.ptidev.ptirex.web.rest.TestUtil;
import org.junit.jupiter.api.Test;

class ForumPostTest {

    @Test
    void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(ForumPost.class);
        ForumPost forumPost1 = new ForumPost();
        forumPost1.setId(1L);
        ForumPost forumPost2 = new ForumPost();
        forumPost2.setId(forumPost1.getId());
        assertThat(forumPost1).isEqualTo(forumPost2);
        forumPost2.setId(2L);
        assertThat(forumPost1).isNotEqualTo(forumPost2);
        forumPost1.setId(null);
        assertThat(forumPost1).isNotEqualTo(forumPost2);
    }
}
