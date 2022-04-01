package com.guangda.crud.bean;

import javax.validation.constraints.Pattern;

public class Emp {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)"
            ,message = "用户名必须为2-5个中文或6-16个数字或英文的组合")
    private String empEname;

    private String gender;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
                        ,message = "邮箱格式不正确!")
    private String email;

    private Integer dId;

    private Dept dept;

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empEname='" + empEname + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", dept=" + dept +
                '}';
    }

    public Emp(Integer empId, String empEname, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empEname = empEname;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Emp() {
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpEname() {
        return empEname;
    }

    public void setEmpEname(String empEname) {
        this.empEname = empEname == null ? null : empEname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}