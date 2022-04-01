package com.guangda.crud.service;

import com.guangda.crud.bean.Dept;
import com.guangda.crud.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {

    @Autowired
    DeptMapper deptMapper;

    public List<Dept> getDepts(){
        return deptMapper.selectByExample(null);
    }
}
