<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <div class="row-fluid">
        <div class="span12">
            <h3 class="page-title">
                收件箱
            </h3>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="social-box">
                <div class="header">
                    <div class="btn-group hidden-phone">
                        <a class="btn btn-primary" id="add-row-province" href="#"><i class="icon-plus"></i>添加
                        </a><a class="btn btn-danger disabled" href="#" id="delete-row-province"><i class="icon-trash">
                        </i>批量删除 </a>
                        <input style="visibility: hidden" id="provinceID" />
                        <input style="visibility: hidden" id="provinceCheckedNum" value="0" />
                        <span style="visibility: hidden" id="provinceIdd"></span>
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
                        id="inboxTable">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" class="toggle-checkboxes" />
                                </th>
                                <th>
                                    操作
                                </th>
                                <th>
                                    标题
                                </th>
                                <th>
                                    发件人
                                </th>
                                <th>
                                    发送时间
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (var item in (this.ViewData["EmailReceiveUserRelation"] as IEnumerable<Domain.EmailReceiveUserRelation>).OrderBy(f => f.Email.SendTime))
                               { %>
                            <tr class="gradeX">
                                <td>
                                    <input type="checkbox" class="checkbox" value='<%= item.ID%>' />
                                </td>
                                <td>
                                    <a class="btn btn-success btn-mini modify" href="#" value='<%= item.ID%>'><i class="icon-edit">
                                    </i>修改 </a><a class="btn btn-danger btn-mini delete" href="#" value='<%= item.ID%>'>
                                        <i class="icon-delete"></i>删除 </a>
                                </td>
                                <td>
                                    <%= item.Email.Title%>
                                </td>
                                 <td>
                                    <%= item.Email.SendUser.Name%>
                                </td>
                                <td>
                                    <%= item.Email.SendTime%>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../../Scripts/Email/Inbox.js"></script>
</html>
