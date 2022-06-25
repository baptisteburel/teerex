package com.ptidev.ptirex.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ptidev.ptirex.domain.enumeration.TagNames;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * A Tag.
 */
@Entity
@Table(name = "tag")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Tag implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "tag_name")
    private TagNames tagName;

    @OneToMany(mappedBy = "tag")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "company", "tag" }, allowSetters = true)
    private Set<ForumPost> forumPosts = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public Tag id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public TagNames getTagName() {
        return this.tagName;
    }

    public Tag tagName(TagNames tagName) {
        this.setTagName(tagName);
        return this;
    }

    public void setTagName(TagNames tagName) {
        this.tagName = tagName;
    }

    public Set<ForumPost> getForumPosts() {
        return this.forumPosts;
    }

    public void setForumPosts(Set<ForumPost> forumPosts) {
        if (this.forumPosts != null) {
            this.forumPosts.forEach(i -> i.setTag(null));
        }
        if (forumPosts != null) {
            forumPosts.forEach(i -> i.setTag(this));
        }
        this.forumPosts = forumPosts;
    }

    public Tag forumPosts(Set<ForumPost> forumPosts) {
        this.setForumPosts(forumPosts);
        return this;
    }

    public Tag addForumPost(ForumPost forumPost) {
        this.forumPosts.add(forumPost);
        forumPost.setTag(this);
        return this;
    }

    public Tag removeForumPost(ForumPost forumPost) {
        this.forumPosts.remove(forumPost);
        forumPost.setTag(null);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Tag)) {
            return false;
        }
        return id != null && id.equals(((Tag) o).id);
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "Tag{" +
            "id=" + getId() +
            ", tagName='" + getTagName() + "'" +
            "}";
    }
}
