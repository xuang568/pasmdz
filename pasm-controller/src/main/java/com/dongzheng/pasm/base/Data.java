package com.dongzheng.pasm.base;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Getter
@Setter
public class Data implements Serializable {

    private String result;
}
