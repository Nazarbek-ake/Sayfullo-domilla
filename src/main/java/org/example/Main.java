package org.example;

import org.example.model.Country;

public class Main {
    public static void main(String[] args) {
        Country country = Country.builder()
                .name("uzb")
                .build();
        System.out.println(country);
    }
}
