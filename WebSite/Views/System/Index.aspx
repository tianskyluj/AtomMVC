﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

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
                            <div style="margin-bottom:10px">
                                <button id="btn_addModel" class="btn btn-primary" >
                                    添加
                                </button>
                                <button id="btn_isExpand" class="btn btn-primary" data-bind="click:isExpand">
                                    收起
                                </button>
                            </div>
                            <div class="tree">
                                <ul>
                                    <% foreach (var item in (this.ViewData["SystemModel"] as IList<Domain.SystemModel>).Where(f => f.ParentId == new Guid()).OrderBy(f => f.OrderIndex))
                                       { %>
                                    <li><span class="badge badge-success"><i class="icon-calendar"></i>
                                        <%= item.Name %></span>
                                        <ul>
                                            <% foreach (var childrenItem in (this.ViewData["SystemModel"] as IList<Domain.SystemModel>).Where(f => f.ParentId == item.ID).OrderBy(f => f.OrderIndex))
                                               {  %>
                                            <li><span><i class="icon-minus-sign"></i>
                                                <%= childrenItem.Name%>&nbsp;URL:<%= childrenItem.Url%></span> </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <% } %>
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
