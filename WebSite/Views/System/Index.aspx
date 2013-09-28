<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <div class="row-fluid">
        <div class="span12">
            <h3 class="page-title">
                系统设置
            </h3>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="social-box">
                <div class="body">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab"><i class="icon-globe"></i>全局设置</a></li>
                        <li class=""><a href="#model" data-toggle="tab"><i class="icon-th"></i>模块</a></li>
                        <li class=""><a href="#province" data-toggle="tab"><i class="icon-move"></i>省份</a></li>
                        <li class=""><a href="#city" data-toggle="tab"><i class="icon-move"></i>地市</a></li>
                        <li class=""><a href="#region" data-toggle="tab"><i class="icon-move"></i>区域</a></li>
                        <li class=""><a href="#department" data-toggle="tab"><i class="icon-sitemap"></i>部门</a></li>
                        <li class=""><a href="#role" data-toggle="tab"><i class="icon-group"></i>角色</a></li>
                        <li class=""><a href="#user" data-toggle="tab"><i class="icon-user"></i>用户</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="home">
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="body">
                                        <form action="#" class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label">
                                                公司名称</label>
                                            <div class="controls">
                                                <input id="companyName_edit" class="input-xlarge" placeholder="填写公司名称" value='<%:ViewData["companyName"]%>'
                                                    data-bind="value:companyName" />
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                是否开启省份权限控制</label>
                                            <div class="controls">
                                                <label class="checkbox inline">
                                                    <input id="isProvince_edit" type="checkbox" value='<%:ViewData["isProvince"]%>' data-bind="checked:isProvince" />
                                                </label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                是否开启地市权限控制</label>
                                            <div class="controls">
                                                <label class="checkbox inline">
                                                    <input id="isCity_edit" type="checkbox" value='<%:ViewData["isCity"]%>' data-bind="checked:isCity" />
                                                </label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                是否开启区域权限控制</label>
                                            <div class="controls">
                                                <label class="checkbox inline">
                                                    <input id="isRegion_edit" type="checkbox" value='<%:ViewData["isRegion"]%>' data-bind="checked:isRegion" />
                                                </label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">
                                                是否开启部门权限控制</label>
                                            <div class="controls">
                                                <label class="checkbox inline">
                                                    <input id="isDepartment_edit" type="checkbox" value='<%:ViewData["isDepartment"]%>'
                                                        data-bind="checked:isDepartment" />
                                                </label>
                                            </div>
                                        </div>
                                        <div>
                                            <button id="confirm_globalSetting" class="btn btn-primary" data-bind="click:change">
                                                确认修改
                                            </button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="model">
                            <div class="tree">
                                <ul>
                                    <li><span><i class="icon-calendar"></i>2013, Week 2</span>
                                        <ul>
                                            <li><span class="badge badge-success"><i class="icon-minus-sign"></i>Monday, January
                                                7: 8.00 hours</span>
                                                <ul>
                                                    <li><a href=""><span><i class="icon-time"></i>8.00</span> &ndash; Changed CSS to accomodate...</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><span class="badge badge-success"><i class="icon-minus-sign"></i>Tuesday, January
                                                8: 8.00 hours</span>
                                                <ul>
                                                    <li><span><i class="icon-time"></i>6.00</span> &ndash; <a href="">Altered code...</a>
                                                    </li>
                                                    <li><span><i class="icon-time"></i>2.00</span> &ndash; <a href="">Simplified our approach
                                                        to...</a> </li>
                                                </ul>
                                            </li>
                                            <li><span class="badge badge-warning"><i class="icon-minus-sign"></i>Wednesday, January
                                                9: 6.00 hours</span>
                                                <ul>
                                                    <li><a href=""><span><i class="icon-time"></i>3.00</span> &ndash; Fixed bug caused by...</a>
                                                    </li>
                                                    <li><a href=""><span><i class="icon-time"></i>3.00</span> &ndash; Comitting latest code
                                                        to Git...</a> </li>
                                                </ul>
                                            </li>
                                            <li><span class="badge badge-important"><i class="icon-minus-sign"></i>Wednesday, January
                                                9: 4.00 hours</span>
                                                <ul>
                                                    <li><a href=""><span><i class="icon-time"></i>2.00</span> &ndash; Create component that...</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><span><i class="icon-calendar"></i>2013, Week 3</span>
                                        <ul>
                                            <li><span class="badge badge-success"><i class="icon-minus-sign"></i>Monday, January
                                                14: 8.00 hours</span>
                                                <ul>
                                                    <li><span><i class="icon-time"></i>7.75</span> &ndash; <a href="">Writing documentation...</a>
                                                    </li>
                                                    <li><span><i class="icon-time"></i>0.25</span> &ndash; <a href="">Reverting code back
                                                        to...</a> </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="province">
                        </div>
                        <div class="tab-pane fade " id="city">
                        </div>
                        <div class="tab-pane fade " id="region">
                        </div>
                        <div class="tab-pane fade " id="department">
                        </div>
                        <div class="tab-pane fade " id="role">
                        </div>
                        <div class="tab-pane fade " id="user">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="visibility: hidden">
        <input data-bind="value:companyName" />
    </div>
</body>
<script src="../../Scripts/System/Index.js"></script>
<script src="../../assets/js/bootstrap-tree.js"></script>
</html>
