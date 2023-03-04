package org.example.model;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@ToString
public class Country {
    private Integer id;
    private String name;
}
