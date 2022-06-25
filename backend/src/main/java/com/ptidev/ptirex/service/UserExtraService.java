package com.ptidev.ptirex.service;

import com.ptidev.ptirex.domain.UserExtra;
import com.ptidev.ptirex.repository.UserExtraRepository;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link UserExtra}.
 */
@Service
@Transactional
public class UserExtraService {

    private final Logger log = LoggerFactory.getLogger(UserExtraService.class);

    private final UserExtraRepository userExtraRepository;

    public UserExtraService(UserExtraRepository userExtraRepository) {
        this.userExtraRepository = userExtraRepository;
    }

    /**
     * Save a userExtra.
     *
     * @param userExtra the entity to save.
     * @return the persisted entity.
     */
    public UserExtra save(UserExtra userExtra) {
        log.debug("Request to save UserExtra : {}", userExtra);
        return userExtraRepository.save(userExtra);
    }

    /**
     * Update a userExtra.
     *
     * @param userExtra the entity to save.
     * @return the persisted entity.
     */
    public UserExtra update(UserExtra userExtra) {
        log.debug("Request to save UserExtra : {}", userExtra);
        return userExtraRepository.save(userExtra);
    }

    /**
     * Partially update a userExtra.
     *
     * @param userExtra the entity to update partially.
     * @return the persisted entity.
     */
    public Optional<UserExtra> partialUpdate(UserExtra userExtra) {
        log.debug("Request to partially update UserExtra : {}", userExtra);

        return userExtraRepository
            .findById(userExtra.getId())
            .map(existingUserExtra -> {
                return existingUserExtra;
            })
            .map(userExtraRepository::save);
    }

    /**
     * Get all the userExtras.
     *
     * @return the list of entities.
     */
    @Transactional(readOnly = true)
    public List<UserExtra> findAll() {
        log.debug("Request to get all UserExtras");
        return userExtraRepository.findAll();
    }

    /**
     * Get one userExtra by id.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    @Transactional(readOnly = true)
    public Optional<UserExtra> findOne(Long id) {
        log.debug("Request to get UserExtra : {}", id);
        return userExtraRepository.findById(id);
    }

    /**
     * Delete the userExtra by id.
     *
     * @param id the id of the entity.
     */
    public void delete(Long id) {
        log.debug("Request to delete UserExtra : {}", id);
        userExtraRepository.deleteById(id);
    }
}
