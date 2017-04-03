package com.woime.iboss.lemon.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woime.iboss.core.page.Page;

@Controller
@RequestMapping("hello")
public class HelloController {

    @RequestMapping
    public @ResponseBody String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        return "hello";
    }

}
