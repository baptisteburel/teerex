package com.ptidev.ptirex.web.rest.extended;

import com.ptidev.ptirex.domain.enumeration.TagNames;
import java.util.Arrays;
import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/extended/tags")
public class TagResourceExtended {

    public TagResourceExtended() {}

    @GetMapping
    public ResponseEntity<List<TagNames>> getTagNames() {
        return ResponseEntity.ok().body(Arrays.asList(TagNames.values()));
    }
}
