package com.woime.iboss.control.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Chen Yujian on 2017/2/14 15:39.
 */
@Controller
@RequestMapping("control")
public class ControlController {

    @RequestMapping("workOrder")
    public String workJob() {
        return "control/work-order";
    }

}
