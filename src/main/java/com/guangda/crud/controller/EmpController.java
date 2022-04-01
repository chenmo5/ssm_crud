package com.guangda.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guangda.crud.bean.Emp;
import com.guangda.crud.bean.Msg;
import com.guangda.crud.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD请求
 */
@Controller
public class EmpController {

    @Autowired
    EmpService empService;

    /**
     * 单个批量二合一
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer>del_ids=new ArrayList<>();
            String[] str_ids=ids.split("-");
            //组装id的集合
            for (String string:str_ids){
                del_ids.add(Integer.parseInt(string));
            }
            empService.deleteBatch(del_ids);
        }else{
            Integer id=Integer.parseInt(ids);
            empService.deleteEmp(id);

        }
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value="/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Emp emp){
        empService.updateEmp(emp);
        return Msg.success();
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Emp emp=empService.getEmp(id);
        return Msg.success().add("emp",emp);
    }

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuser(@RequestParam("empName") String empName){
        //先判断用户名是否合法的表达式
        String regName="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if(!empName.matches(regName)){
            return Msg.fail().add("va_msg","用户名必须为2-5个中文或6-16个数字或英文的组合");
        }

        //数据库用户名重复校验
        boolean b = empService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用！");
        }
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saceEmp(@Valid Emp emp, BindingResult result){
        if (result.hasErrors()){
            //校验失败
            Map<String,Object>map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            empService.saveEmp(emp);
            return Msg.success();
        }

    }

    /**
     * 导入jackson包
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){

        //这不是一个分页查询
        //引入PageHelper分页插件
        PageHelper.startPage(pn,5);
        List<Emp> emps=empService.getAll();
        //使用pageInfo查询包装后的结果
        PageInfo page=new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);
    }


    /**
     * 查询员工数据（分页查询)
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            Model model){

        //这不是一个分页查询
        //引入PageHelper分页插件
        PageHelper.startPage(pn,5);
        List<Emp> emps=empService.getAll();
        //使用pageInfo查询包装后的结果
        PageInfo page=new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }


}
