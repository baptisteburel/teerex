package com.ptidev.ptirex.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * A Company.
 */
@Entity
@Table(name = "company")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Company implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sequenceGenerator")
    @SequenceGenerator(name = "sequenceGenerator")
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "mail_contact")
    private String mailContact;

    @Column(name = "numero_contact")
    private String numeroContact;

    @Column(name = "url_site_vitrine")
    private String urlSiteVitrine;

    @OneToMany(mappedBy = "company")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "company", "tag" }, allowSetters = true)
    private Set<ForumPost> forumPosts = new HashSet<>();

    @OneToMany(mappedBy = "company")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JsonIgnoreProperties(value = { "user", "company" }, allowSetters = true)
    private Set<UserExtra> userExtras = new HashSet<>();

    // jhipster-needle-entity-add-field - JHipster will add fields here

    public Long getId() {
        return this.id;
    }

    public Company id(Long id) {
        this.setId(id);
        return this;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public Company name(String name) {
        this.setName(name);
        return this;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public Company description(String description) {
        this.setDescription(description);
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMailContact() {
        return this.mailContact;
    }

    public Company mailContact(String mailContact) {
        this.setMailContact(mailContact);
        return this;
    }

    public void setMailContact(String mailContact) {
        this.mailContact = mailContact;
    }

    public String getNumeroContact() {
        return this.numeroContact;
    }

    public Company numeroContact(String numeroContact) {
        this.setNumeroContact(numeroContact);
        return this;
    }

    public void setNumeroContact(String numeroContact) {
        this.numeroContact = numeroContact;
    }

    public String getUrlSiteVitrine() {
        return this.urlSiteVitrine;
    }

    public Company urlSiteVitrine(String urlSiteVitrine) {
        this.setUrlSiteVitrine(urlSiteVitrine);
        return this;
    }

    public void setUrlSiteVitrine(String urlSiteVitrine) {
        this.urlSiteVitrine = urlSiteVitrine;
    }

    public Set<ForumPost> getForumPosts() {
        return this.forumPosts;
    }

    public void setForumPosts(Set<ForumPost> forumPosts) {
        if (this.forumPosts != null) {
            this.forumPosts.forEach(i -> i.setCompany(null));
        }
        if (forumPosts != null) {
            forumPosts.forEach(i -> i.setCompany(this));
        }
        this.forumPosts = forumPosts;
    }

    public Company forumPosts(Set<ForumPost> forumPosts) {
        this.setForumPosts(forumPosts);
        return this;
    }

    public Company addForumPost(ForumPost forumPost) {
        this.forumPosts.add(forumPost);
        forumPost.setCompany(this);
        return this;
    }

    public Company removeForumPost(ForumPost forumPost) {
        this.forumPosts.remove(forumPost);
        forumPost.setCompany(null);
        return this;
    }

    public Set<UserExtra> getUserExtras() {
        return this.userExtras;
    }

    public void setUserExtras(Set<UserExtra> userExtras) {
        if (this.userExtras != null) {
            this.userExtras.forEach(i -> i.setCompany(null));
        }
        if (userExtras != null) {
            userExtras.forEach(i -> i.setCompany(this));
        }
        this.userExtras = userExtras;
    }

    public Company userExtras(Set<UserExtra> userExtras) {
        this.setUserExtras(userExtras);
        return this;
    }

    public Company addUserExtra(UserExtra userExtra) {
        this.userExtras.add(userExtra);
        userExtra.setCompany(this);
        return this;
    }

    public Company removeUserExtra(UserExtra userExtra) {
        this.userExtras.remove(userExtra);
        userExtra.setCompany(null);
        return this;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Company)) {
            return false;
        }
        return id != null && id.equals(((Company) o).id);
    }

    @Override
    public int hashCode() {
        // see https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
        return getClass().hashCode();
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "Company{" +
            "id=" + getId() +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            ", mailContact='" + getMailContact() + "'" +
            ", numeroContact='" + getNumeroContact() + "'" +
            ", urlSiteVitrine='" + getUrlSiteVitrine() + "'" +
            "}";
    }
}
