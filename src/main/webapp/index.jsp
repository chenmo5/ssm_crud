<%--
  Created by IntelliJ IDEA.
  User: chenmo
  Date: 2022/3/27
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <!-- 员工修改模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_uptdate_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">部门名称</label>
                            <div class="col-sm-4">
                                <%--   提交部门id    --%>
                                <select class="form-control" name="dId" >

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 员工添加模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" name="empEname" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">部门名称</label>
                            <div class="col-sm-4">
                                <%--   提交部门id    --%>
                                <select class="form-control" name="dId" >

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <%--  标题  --%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>

        <%--  按钮  --%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="emp_add_modal">新增</button>
                <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
            </div>
        </div>

        <%--  显示表格数据  --%>
        <div class="row">
            <div class="col-md-12">
                <table>
                    <table class="table table-hover" id="emps_table">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th>id</th>
                                <th>empName</th>
                                <th>gender</th>
                                <th>email</th>
                                <th>deptName</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>



                    </table>

                </table>
            </div>
        </div>

        <%--  显示分页信息  --%>
        <div class="row">
            <div class="col-md-6" id="page_info_area">

            </div>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
    <script type="text/javascript">
        var totalRecord;
        var currentPage;

        //1、页面加载完成以后，直接发送一个ajax，要到分页数据

        $(function (){
            //去首页
            to_page(1)
        })
        function to_page(pn){
            $.ajax({
                url:"${pageContext.request.contextPath}/emps",
                data:"pn="+pn,
                type:"get",
                success:function (result) {
                    // console.log(result);
                    //1、解析并显示员工数据
                    bulid_emps_rable(result);
                    //2、解析并显示分页数据
                    bulid_page_info(result);
                    //3、解析显示分页条
                    bulid_page_nav(result);
                }
            })
        }

        function bulid_emps_rable(result){
            //清空table
            $("#emps_table tbody").empty();
            var emps=result.extend.pageInfo.list;
            $.each(emps,function (index,item) {
                var checkBoxTd=$("<td><input type='checkBox' class='check_item'/></td>")
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empEname);
                var genderTd=$("<td></td>").append(item.gender);
                var emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.dept.deptName);
                /**
                 * <button class="btn btn-primary btn-sm">
                 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                 编辑
                 </button>
                 * @type {*|jQuery}
                 */
                var editBtn= $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑")
                editBtn.attr("edit-id",item.empId);
                /**
                 * <button class="btn btn-danger btn-sm">
                 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                 删除</button>
                 * @type {*|jQuery}
                 */
                var deleteBtn= $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除")
                deleteBtn.attr("delete-id",item.empId);
                var btnTd=$("<td></td>").append(editBtn).append(" ").append(deleteBtn)

                $("<tr></tr>").append(checkBoxTd)
                              .append(empIdTd)
                              .append(empNameTd)
                              .append(genderTd)
                              .append(emailTd)
                              .append(deptNameTd)
                              .append(btnTd)
                              .appendTo("#emps_table tbody");
            })
        }

        //解析显示分页信息
        function bulid_page_info(result){
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总共"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"记录")
            totalRecord=result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
        }

        //解析显示分页条
        function bulid_page_nav(result){
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                //为元素添加点击翻页的事件
                firstPageLi.click(function(){
                    to_page(1);
                });
                prePageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum -1);
                });
            }

            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.extend.pageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else{
                nextPageLi.click(function(){
                    to_page(result.extend.pageInfo.pageNum +1);
                });
                lastPageLi.click(function(){
                    to_page(result.extend.pageInfo.pages);
                });
            }

            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);
            //1,2，3遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function(){
                    to_page(item);
                });
                ul.append(numLi);
            });
            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

        //清空所有样式
        function reset_form(ele) {
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }
        
        //点击新增按钮
        $("#emp_add_modal").click(function () {
            //清除表单数据
            reset_form("#empAddModal form");

            //发送ajax请求，查处部门信息。显示在下拉列表中
            getDepts("#empAddModal select");
            $("#empAddModal").modal({
                backdrop:"static"
            })
        })

        //查出所有部门信息
        function getDepts(ele){
            //清空之前下拉列表的值
            $(ele).empty()
            $.ajax({
                url:"${pageContext.request.contextPath}/depts",
                type: "GET",
                success:function (result) {
                    // console.log(result)
                    //显示部门信息在下拉列表中
                    // $("#empAddModal select")
                    $.each(result.extend.depts,function () {
                        var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo(ele)
                    })
                }
            })
        }
        function validate_add_from(){
            //1、拿到要校验的数据，正则表达式
            var empName=$("#empName_add_input").val();
            var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;

            if (!regName.test(empName)){
                show_validate_msg("#empName_add_input","error","用户名必须为2-5个中文或6-16个数字或英文的组合")

                return false;
            }else{
                show_validate_msg("#empName_add_input","success","");
            }

            //2、校验邮箱信息
            var email=$("#email_add_input").val();
            var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            if (!regEmail.test(email)){
                show_validate_msg("#email_add_input","error","邮箱格式不正确!")
                return false
            }else{
                show_validate_msg("#email_add_input","success","")
            }
            return true
        }

        function show_validate_msg(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg)
            }else if ("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg)
            }
        }


        $("#empName_add_input").change(function () {
            var empName=this.value;
            //发送ajax请求检验用户名是否可用
            $.ajax({
                url:"${pageContext.request.contextPath}/checkuser",
                type:"POST",
                data:"empName="+empName,
                success:function (result) {
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用！")
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg)
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            })
        })

        //保存按钮
        $("#emp_save_btn").click(function () {

            //1、模态框中填写的表单信息提交给服务器并保存
            // if(!validate_add_from()){
            //
            //     return false;
            // }
            //1、判断之前的ajax用户名校验是否成功
            // if($(this).attr("ajax-va")=="error"){
            //     return false;
            // }


            //2、发送ajax请求保存员工
            $.ajax({
                url:"${pageContext.request.contextPath}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    if (result.code==100){
                        //员工保存成功
                        //1、关闭模块框
                        $("#empAddModal").modal("hide");
                        //2、跳到最后一页
                        //发送ajax请求显示最后一页数据
                        to_page(totalRecord);
                    }else{
                        //显示失败信息
                        // console.log(result);
                        // alert(result.extend.errorFiields.email)
                        if (result.extend.errorFields.email !=undefined){
                            //显示员工邮箱错误信息
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email)
                        }

                        if (result.extend.errorFields.empEname !=undefined){
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empEname)
                            //显示员工名字错误信息
                        }
                    }


                }
            })

        })

        //点击编辑按钮
        $(document).on("click",".edit_btn",function () {
            //0、查出员工信息
            //1、查出部门信息，并显示部门列表
            getDepts("#empUpdateModal select")
            getEmp($(this).attr("edit-id"));

            //3、把员工的id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"))
            $("#empUpdateModal").modal({
                baackdrop:"static"
            })
        })
        
        function getEmp(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+id,
                type:"GET",
                success:function (result) {
                    var empData=result.extend.emp;
                    $("#empName_update_static").text(empData.empEname);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            })
        }

        //点击编辑，更新员工信息
        $("#emp_update_btn").click(function () {
            //验证邮箱合法
            //2、校验邮箱信息
            var email=$("#email_update_input").val();
            var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            if (!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱格式不正确!")
                return false
            }else{
                show_validate_msg("#email_update_input","success","")
            }
            //2、发送ajax请求更改员工信息
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                success:function (resulal) {
                    $("#empUpdateModal").modal("hide");
                    to_page(currentPage);
                }
            })
        })

        $(document).on("click",".delete_btn",function () {
            //1、弹出是否确认删除对话框
            var empName=$(this).parents("tr").find("td:eq(2)").text();
            var empId=$(this).attr("delete-id")
            if(confirm("确认删除【"+empName+"】吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/emp/"+empId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg)
                        to_page(currentPage)
                    }
                })
            }
        })

        //全选/全不选
        $("#check_all").click(function (){
            $(".check_item").prop("checked",$(this).prop("checked"));
        })

        //check_item
        $(document).on("click",".check_item",function () {
            //判断当前选择中的元素是否为5个
            var flag=$(".check_item:checked").length==$(".check_item").length;
            $("#check_all").prop("checked",flag)
        })
        
        //点击全部删除就批量删除
        
        $("#emp_delete_all_btn").click(function () {
            var empNames=""
            var del_idstr=""
            $.each($(".check_item:checked"),function () {
                empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
                //组装员工id字符串
                del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            empNames=empNames.substring(0,empNames.length-1);
            del_idstr=del_idstr.substring(0,del_idstr.length-1);
            if (confirm("确认删除【"+empNames+"】吗？")){
                //发送ajax请求
                $.ajax({
                    url:"${pageContext.request.contextPath}/emp/"+del_idstr,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg)
                        to_page(currentPage)
                    }
                })
            }
        })



    </script>

</body>
</html>
