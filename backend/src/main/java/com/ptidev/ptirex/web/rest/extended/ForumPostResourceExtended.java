package com.ptidev.ptirex.web.rest.extended;

import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.domain.enumeration.TagNames;
import com.ptidev.ptirex.service.extended.ForumPostServiceExtended;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import tech.jhipster.web.util.PaginationUtil;

@RestController
@RequestMapping("/api/v1/extended/forum-posts")
public class ForumPostResourceExtended {

    private final ForumPostServiceExtended forumPostServiceExtended;

    public ForumPostResourceExtended(ForumPostServiceExtended forumPostServiceExtended) {
        this.forumPostServiceExtended = forumPostServiceExtended;
    }

    @GetMapping
    public ResponseEntity<List<ForumPost>> searchForumPost(
        @RequestParam(name = "searchTerm", required = false) String searchTerm,
        @RequestParam(name = "tagName", required = false) TagNames tagName,
        @PageableDefault(value = 10) Pageable pageable
    ) {
        Page<ForumPost> page = forumPostServiceExtended.searchForumPost(searchTerm, tagName, pageable);

        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(ServletUriComponentsBuilder.fromCurrentRequest(), page);

        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }
}
