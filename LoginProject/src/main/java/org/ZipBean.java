package org;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ZipBean {
    private String zipcode;
    private String area1;
    private String area2;
    private String area3;
}
