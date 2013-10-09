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
                                                <input id="companyName_edit" type="text" class="input-xlarge" placeholder="填写公司名称"
                                                    value='<%:ViewData["companyName"]%>' data-bind="value:companyName" />
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
                            <div style="margin-bottom: 10px">
                                <button id="btn_addModel" class="btn btn-primary" data-bind="click:addModel">
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
                                    <li>
                                        <span class="badge badge-success"><i class="icon-calendar"></i><span><%= item.Name %></span>&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                        <a href="#" class="btn btn-mini modifyModel"><i class="icon-edit modifyModel"></i>修改 </a>&nbsp; 
                                        <a href="#" class="btn btn-mini deleteModel"><i class="icon-trash deleteModel"></i>删除 </a>
                                        <ul>
                                            <% foreach (var childrenItem in (this.ViewData["SystemModel"] as IList<Domain.SystemModel>).Where(f => f.ParentId == item.ID).OrderBy(f => f.OrderIndex))
                                               {  %>
                                            <li>
                                                <span><i class="icon-minus-sign"></i><span><%= childrenItem.Name%></span>&nbsp;URL:<%= childrenItem.Url%>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <a href="#" class="btn btn-mini modifyModel"><i class="icon-edit modifyModel"></i>修改 </a>&nbsp; 
                                                <a href="#" class="btn btn-mini deleteModel"><i class="icon-trash deleteModel"></i>删除 </a>
                                            </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="province">
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="social-box">
                                        <div class="header">
                                            <div class="btn-group hidden-phone">
                                                <a class="btn btn-primary" id="add-row-province" href="#"><i class="icon-plus"></i>添加 </a>
                                                <a class="btn btn-danger disabled" href="#" id="delete-row-province"><i class="icon-trash"></i>批量删除 </a>
                                                <input style="visibility:hidden" id="provinceID"  />
                                                <input style="visibility:hidden" id="provinceCheckedNum" value="0" />
                                                <span style="visibility:hidden" id="provinceIdd"></span>
                                            </div>
                                            <div class="tools">
                                                <a class="btn btn-success btn-advanced" id="btn-advanced" href="javascript:void(0)"
                                                    data-toggle="collapse" data-target="#advanced-search"><i class="icon-filter"></i>
                                                    高级查询 </a>
                                                <div class="btn-group">
                                                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                                                        <i class="icon-cog"></i>
                                                    </button>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li><a href="#">打印</a></li>
                                                        <li><a href="#">保存至PDF</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#">导出EXCEL</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="body">
                                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"
                                                id="provinceListTable">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <input type="checkbox" class="toggle-checkboxes" />
                                                        </th>
                                                        <th>
                                                            操作
                                                        </th>
                                                        <th>
                                                            省份
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% foreach (var item in (this.ViewData["Province"] as IList<Domain.Province>).OrderBy(f => f.ProvinceName))
                                                       { %>
                                                    <tr class="gradeX">
                                                        <td>
                                                            <input type="checkbox" class="checkbox" value='<%= item.ID%>'/>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-mini modify" href="#" value='<%= item.ID%>'><i class="icon-edit"></i>修改 </a>
                                                            <a class="btn btn-danger btn-mini delete" href="#" value='<%= item.ID%>'><i class="icon-delete"></i>删除 </a>
                                                        </td>
                                                        <td>
                                                            <%= item.ProvinceName%>
                                                            
                                                        </td>
                                                    </tr>
                                                     <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    <!-- 系统模块添加修改弹出框 -->
    <aside id="addAndUpdateModel" class="modal hide fade" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3 id="H1"><span id="modelAddAndUpdateTitle">添加</span></h3>
        </div>
        <div class="modal-body">
            <div class="control-group">
                <label class="control-label">
                    模块名称</label>
                <div class="controls">
                     <input id="modelName_edit" type="text" class="input-xlarge" placeholder="填写模块名称"
                       data-bind="value:modelName" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">
                    访问地址</label>
                <div class="controls">
                    <input id="modelUrl_edit" type="text" class="input-xlarge" placeholder="填写访问地址"
                       data-bind="value:modelUrl" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">
                    上级模块</label>
                <div class="controls">
                    <select id="parentModel" class="span3" placeholder="填写访问地址">
                        <option value='<%:ViewData["NullGuid"]%>'>根目录</option>
                        <% foreach (var item in (this.ViewData["SystemModel"] as IList<Domain.SystemModel>).Where(f => f.ParentId == new Guid()).OrderBy(f => f.OrderIndex))
                           { %>
                        <option value="<%= item.ID %>"><%= item.Name %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">
                    左兄弟模块(排序在选择模块之后)</label>
                <div class="controls">
                    <select id="ddl_siblingModel" class="span3" placeholder="填写访问地址">
                        <% foreach (var item in (this.ViewData["SystemModel"] as IList<Domain.SystemModel>).OrderBy(f => f.OrderIndex))
                           { %>
                        <option class="opt_siblingModel" value="<%= item.ID %>" parentid="<%= item.ParentId %>"><%= item.Name %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">
                    是否启用</label>
                <div class="controls">
                    <input id="modelIsEnable_edit" type="checkbox" checked="checked"  />
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-danger" data-dismiss="modal">关闭</button>
            <a class="btn btn-primary" id="saveModel"  data-bind="click:saveModel">保存</a>
        </div>
    </aside>
    <!-- 省份添加修改弹出框 -->
    <aside id="addAndUpdateProvince" class="modal hide fade" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3 id="provinceAddOrUpdateTitle"><span id="Span1">添加</span></h3>
        </div>
        <div class="modal-body">
            <div class="control-group">
                <label class="control-label">
                    省份</label>
                <div class="controls">
                     <input id="provinceName_edit" type="text" class="input-xlarge" placeholder="填写省份" />
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-danger" data-dismiss="modal">关闭</button>
            <a class="btn btn-primary" id="saveProvince">保存</a>
        </div>
    </aside>
    <div style="visibility: hidden">
        <input data-bind="value:companyName" />
    </div>
</body>
<script src="../../Scripts/System/Index.js"></script>
<script src="../../Scripts/System/Province.js"></script>
<script src="../../assets/js/bootstrap-tree.js"></script>
</html>
