package com.guangda.crud.controller;

import com.guangda.crud.bean.Dept;
import com.guangda.crud.bean.Msg;
import com.guangda.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Dept> list=deptService.getDepts();
        return Msg.success().add("depts",list);
    }
}
