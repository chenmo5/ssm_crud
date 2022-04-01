package com.guangda.crud.service;

import com.guangda.crud.bean.Emp;
import com.guangda.crud.bean.EmpExample;
import com.guangda.crud.dao.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmpService {

    @Autowired
    EmpMapper empMapper;

    public List<Emp> getAll() {

        return empMapper.selectByExampleWithDept(null);
    }

    /**
     * 员工保存方法
     * @param emp
     */
    public void saveEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    /**
     * 检验用户名是否可用
     *
     * @param empName
     * @return true：代表当前姓名可用
     */
    public boolean checkUser(String empName) {
        EmpExample example=new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpEnameEqualTo(empName);
        long count=empMapper.countByExample(example);
        return count==0;
    }

    /**
     * 按照员工id查询员工
     * @param id
     * @return
     */
    public Emp getEmp(Integer id) {
        Emp emp = empMapper.selectByPrimaryKey(id);
        return emp;
    }

    /**
     * 员工更新
     * @param emp
     */
    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    /**
     * 员工删除
     * @param id
     */
    public void deleteEmp(Integer id) {
        empMapper.deleteByPrimaryKey(id);

    }

    public void deleteBatch(List<Integer> ids) {
        EmpExample example=new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        empMapper.deleteByExample(example);
    }

}
