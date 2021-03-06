<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/26
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />

    <!--  <link rel="stylesheet" href="font/css/font-awesome.min.css" />-->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");

    </script><script src="assets/layer/layer.js" type="text/javascript" ></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <title>航班动态信息</title>
</head>
<style>
    .add_menber  li{width:33%;}
    .add_menber li .label_name, .member_content li .label_name{ width:100px !important;}
</style>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">

            <form id="search_form" action="">
                <div class="search_style">
                    <ul class="search_content clearfix">
                        <li>
                            <label class="l_f">航班号：</label>
                            <input name="" id="flightNo" type="text"  class="text_add" placeholder="输入航班号"  style=" width:190px"/>
                        </li>
                        <li>
                            <label class="l_f">机号：</label>
                            <input name="" id="no" type="text"  class="text_add" placeholder="输入机号"  style=" width:190px"/>
                        </li>
                        <li>
                            <label class="l_f">时间：</label>
                            <input  id="planTakeTime" type="date" class="inline laydate-icon" id="start" style=" margin-left:10px;">
                        </li>
                        <li>
                            <button type="button" class="btn_search" onclick="search_flight()"><i class="icon-search"  ></i>查询</button>
                        </li>
                    </ul>
                </div>
                <div class="search_style">
                    <ul class="search_content clearfix">
                        <li>
                            <label class="l_f">所有航班：</label>
                            <select id="isFirst" name="" style=" width:110px">
                                <option value="否">---所有---</option>
                                <option value="是">始发航班</option>
                            </select>
                        </li>
                        <li>
                            <label class="l_f">进出港：</label>
                            <select id="inOut" name="" style=" width:110px">
                                <option value="所有">---所有---</option>
                                <option value="进">进港</option>
                                <option value="出">出港</option>
                            </select>
                        </li>
                        <li>
                            <label class="l_f">航空公司：</label>
                            <select id="airlineId"  name="" style=" width:110px">
                                <option VALUE="0">---航空公司---</option>
                            </select>
                        </li>
                        <li>
                            <label class="l_f">国内/外航班：</label>
                            <select id="nature" name="" style=" width:110px">
                                <option value="所有">---所有---</option>
                                <option>国内航班</option>
                                <option>国外航班</option>
                            </select>
                        </li>
                        <li>
                            <label class="l_f">航班状态：</label>
                            <select id="flightStatus" name="" style=" width:110px">
                                <option value="所有">---所有---</option>
                                <option>延误</option>
                                <option>正常</option>
                                <option>取消</option>
                            </select>
                        </li>
                    </ul>
                </div>
            </form>
            <!---->

            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th ><label>
                            <input type="checkbox" class="ace">
                            <span class="lbl"></span></label></th>
                        <th >航空公司二字码</th>
                        <th >航班</th>
                        <th >任务性质</th>
                        <th >进出港</th>
                        <th >机号</th>
                        <th >机型</th>
                        <th >航班性质</th>
                        <th >起飞机场</th>
                        <th >计划起飞时间</th>
                        <th >计划落地时间</th>
                        <th >降落机场</th>
                        <th >航班状态</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>

                    <tbody id="context">
                    <!--航班动态信息-->
                    <c:forEach items="${flightRecordList}" var="flightRecord">
                        <tr>
                            <td><label>
                                <input type="checkbox" class="ace">
                                <span class="lbl"></span></label></td>
                            <td>${flightRecord.airCode}</td>
                            <td> ${flightRecord.flightNo}</td>
                            <td>${flightRecord.flightMission}</td>
                            <td>${flightRecord.inOut}</td>
                            <td>${flightRecord.no}</td>
                            <td class="text-l">${flightRecord.attribute}</td>
                            <td>${flightRecord.nature}</td>
                            <td>${flightRecord.airportStart}</td>
                            <td>${flightRecord.planTakeTime}</td>
                            <td>${flightRecord.planLandTime}</td>
                            <td>${flightRecord.airportEnd}</td>
                            <td class="td-status"><span class="label label-success radius">${flightRecord.flightStatus}</span></td>
                            <td class="td-manage"><a title="编辑" onclick="member_edit('550')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>  </td>
                        </tr>
                    </c:forEach>
                    </tbody>


                </table>

                <!--分页-->
                <div style=" float:right; margin-right:20px;">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
                            <li class="active" ><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</div>
<!--修改图层-->
<form id="add_menber_form">
    <div class="add_menber" id="add_menber_style" style="display:none; width:900px !important;">
        <ul class=" page-content">
            <li >
                <label class="label_name">成人数量：</label>
                <span class="add_name">
      <input value="" name="成人数量" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">儿童数量：</label>
                <span class="add_name">
      <input name="儿童数量" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">婴儿数量：</label>
                <span class="add_name">
      <input name="婴儿数量" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">计划起飞时间：</label>
                <span class="add_name">
      <input name="计划起飞时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">实际起飞时间：</label>
                <span class="add_name">
      <input name="实际起飞时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">行李件数：</label>
                <span class="add_name">
      <input name="行李件数" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">货邮重量：</label>
                <span class="add_name">
      <input name="货邮重量" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">撒轮挡时间：</label>
                <span class="add_name">
      <input name="撒轮挡时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">计划落地时间：</label>
                <span class="add_name">
      <input name="计划落地时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">航班号：</label>
                <span class="add_name">
      <input name="航班号" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">机位：</label>
                <span class="add_name">
      <input name="机位" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">实际落地时间：</label>
                <span class="add_name">
      <input name="实际落地时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">挡轮挡时间：</label>
                <span class="add_name">
      <input name="挡轮挡时间" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">执行日期：</label>
                <span class="add_name">
      <input name="执行日期" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">登机口：</label>
                <span class="add_name">
      <input name="登机口" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">二字码：</label>
                <span class="add_name">
      <input name="航空公司二字码" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">行李转盘：</label>
                <span class="add_name">
      <input name="行李转盘" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">航空公司：</label>
                <span class="add_name">
      <input name="航空公司" type="text"  class="text_add" readonly="readonly" value="江西南昌航空公司  "/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">起飞机场：</label>
                <span class="add_name">
      <input name="起飞机场" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">机号：</label>
                <span class="add_name">
      <input name="机号" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">机型：</label>
                <span class="add_name">
      <input name="机型" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">备降机场：</label>
                <span class="add_name">
      <input name="备降机场" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">关联航班ID：</label>
                <span class="add_name">
      <input name="关联航班ID" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">航站楼：</label>
                <span class="add_name">
      <input name="航站楼" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">航班代理：</label>
                <span class="add_name">
      <input name="航班代理" type="text"  class="text_add"/>
      </span>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">是否始发航班：</label>
                <select name="" style=" width:156px; margin-left:10px;">
                    <option>始发航班</option>
                    <option>非始发航班</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">航班状态：</label>
                <select name="" style=" width:156px; margin-left:10px;">
                    <option>延误</option>
                    <option>正常</option>
                    <option>取消</option>
                    <option>备降</option>
                    <option>返航</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">国内/外航班：</label>
                <select name="" style=" width:156px ; margin-left:10px;">
                    <option>国内航班</option>
                    <option>国外航班</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">不正常原因：</label>
                <select name="" style=" width:156px; margin-left:10px;">
                    <option>无</option>
                    <option>天气</option>
                    <option>飞机</option>
                    <option>乘客</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">进/出港：</label>
                <select name="" style=" width:156px; margin-left:10px;">
                    <option>进港</option>
                    <option>出港</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
            <li>
                <label class="label_name">任务性质：</label>
                <select name="" style=" width:156px; margin-left:10px;">
                    <option>退航</option>
                    <option>正班</option>
                    <option>补班</option>
                    <option>专机</option>
                    <option>转场</option>
                    <option>训练</option>
                </select>
                <div class="prompt r_f"></div>
            </li>
        </ul>
    </div>
</form>
</body>
</html>
<script src="js/jquery-1.7.2.min.js"></script>
<script >
    /*查询*/
    function search_flight(){
        $.ajax({
            type:"post",
            url:"/getFlightRecordByCondition.do",
            data:{flightNo:$('#flightNo').val(),no:$('#no').val(),planTakeTime:$('#planTakeTime').val(),isFirst:$('#isFirst').val(),inOut:$('#inOut').val(),airlineId:$('#airlineId').val(),nature:$('#nature').val(),flightStatus:$('#flightStatus').val()},
            success: function(data){
                var jsonObectData = JSON.parse(data);
                console.log(jsonObectData);
                var html="";
                $.each(jsonObectData, function(commentIndex, comment){
                    html +=' <tr>\n' +
                        '<td><label>\n' +
                        '<input type="checkbox" class="ace">\n' +
                        '<span class="lbl"></span></label></td>\n' +
                        '<td>'+comment.airCode+'</td>\n' +
                        '<td>'+comment.flightNo+'</td>\n' +
                        ' <td>'+comment.task+'</td>\n' +
                        '<td>'+comment.inOut+'</td>\n' +
                        '<td>'+comment.no+'</td>\n' +
                        '<td class="text-l">'+comment.attribute+'</td>\n' +
                        '<td>'+comment.nature+'</td>\n' +
                        '<td>'+comment.airportStart+'</td>\n' +
                        '<td>'+comment.planTakeTime+'</td>\n' +
                        '<td>'+comment.planLandTime+'</td>\n' +
                        '<td>'+comment.airportEnd+'</td>\n' +
                        '<td class="td-status"><span class="label label-success radius">'+comment.flightStatus+'</span></td>\n' +
                        '<td class="td-manage"><a title="编辑" onclick="member_edit(\'550\')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>  </td>\n' +
                        '</tr>';
                });
                $('#context').html(html);
            }
        });
    }


    //获得航空公司基础数据
    function getAirCompanyBasicData(){
        $.ajax({
            type:"post",
            url:"/getAirCompanyBasicData.do",
            success: function(data){
                var jsonObectData = JSON.parse(data);
                var html="<option VALUE='0'>--航空公司--</option>";
                $.each(jsonObectData, function(commentIndex, comment){
                    html+="<option VALUE='"+comment.id+"'>"+comment.name+"</option>";
                });
                $('#airlineId').html(html);
            }
        });
    }


    //初始化数据
    window.onload =function() {
        $.ajax({
            type:"post",
            url:"/getFlightRecord.do",
            success: function(data){
                var jsonObectData = JSON.parse(data);
                var html="";
                $.each(jsonObectData, function(commentIndex, comment){
                    html +=' <tr>\n' +
                        '<td><label>\n' +
                        '<input type="checkbox" class="ace">\n' +
                        '<span class="lbl"></span></label></td>\n' +
                        '<td>'+comment.airCode+'</td>\n' +
                        '<td>'+comment.flightNo+'</td>\n' +
                        ' <td>'+comment.task+'</td>\n' +
                        '<td>'+comment.inOut+'</td>\n' +
                        '<td>'+comment.no+'</td>\n' +
                        '<td class="text-l">'+comment.attribute+'</td>\n' +
                        '<td>'+comment.nature+'</td>\n' +
                        '<td>'+comment.airportStart+'</td>\n' +
                        '<td>'+comment.planTakeTime+'</td>\n' +
                        '<td>'+comment.planLandTime+'</td>\n' +
                        '<td>'+comment.airportEnd+'</td>\n' +
                        '<td class="td-status"><span class="label label-success radius">'+comment.flightStatus+'</span></td>\n' +
                        '<td class="td-manage"><a title="编辑" onclick="member_edit(\'550\')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>  </td>\n' +
                        '</tr>';
                });
                $('#context').html(html);
            }
        });
        getAirCompanyBasicData();
    }

    /*-编辑*/
    function member_edit(id){
        layer.open({
            type: 1,
            title: '修改航班动态信息',
            maxmin: true,
            shadeClose:false, //点击遮罩关闭层
            area : ['920px' , ''],
            content:$('#add_menber_style'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".add_menber input[type$='text']").each(function(n){
                    if($(this).val()=="")
                    {

                        layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                            title: '提示框',
                            icon:0,
                        });
                        num++;
                        return false;
                    }
                });
                if(num>0){  return false;}
                else{
                    $("#add_menber_form").submit();
                    layer.alert('编辑成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    layer.close(index);
                }
            }
        });

    }


    /*-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }


</script>
