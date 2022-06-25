package com.ptidev.ptirex.service.extended;

import com.ptidev.ptirex.domain.ForumPost;
import com.ptidev.ptirex.domain.enumeration.TagNames;
import com.ptidev.ptirex.repository.extended.ForumPostRepositoryExtended;
import com.ptidev.ptirex.service.ForumPostService;
import javax.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class ForumPostServiceExtended extends ForumPostService {

    private final ForumPostRepositoryExtended forumPostRepositoryExtended;

    public ForumPostServiceExtended(ForumPostRepositoryExtended forumPostRepositoryExtended) {
        super(forumPostRepositoryExtended);
        this.forumPostRepositoryExtended = forumPostRepositoryExtended;
    }

    public Page<ForumPost> searchForumPost(String searchTerm, TagNames tagName, Pageable pageable) {
        return forumPostRepositoryExtended.searchForumPost(pageable, searchTerm, tagName);
    }
}
