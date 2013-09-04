﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Index</title>
    <link href="/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css" />
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            $('#grid').datagrid({
                title: '用户信息',
                iconCls: 'icon-save',
                nowrap: false,
                striped: true,
                url: '/UserInfo/LoadAllByPage/',
                sortName: 'CreateTime',
                sortOrder: 'desc',
                remoteSort: true,
                fitColumns: true,
                fit: true,
                idField: 'ID',
                frozenColumns: [[
	                { field: 'ID', checkbox: true }
				]],

                columns: [[
                    { field: 'Name', title: '姓名', width: 80 },
                    { field: 'Account', title: '账号', width: 80, align: 'right' },
                    { field: 'IsEnabled', title: '状态', width: 80, align: 'right',
                        formatter: function (value, rec) {
                            return value ? '激活' : '禁用';
                        }
                    },
                    { field: 'CreateTime', title: '建立日期', width: 100,
                        formatter: function (value, rec) {
                            return eval("new " + value.substr(1, value.length - 2)).toLocaleDateString();
                        }
                    }
                ]],
                pagination: true,
                rownumbers: true,
                toolbar: ['-', {
                    id: 'btnSave',
                    text: '添加',
                    iconCls: 'icon-add',
                    handler: function () {
                        window.location.href = "/UserInfo/View/";
                    }
                }, '-', {
                    id: 'btnUpdate',
                    text: '修改',
                    iconCls: 'icon-save',
                    handler: function () {

                        var row = $('#grid').datagrid('getSelected');
                        if (row) {
                            window.location.href = "/UserInfo/View/" + row.ID;
                        }
                        else {
                            $.messager.alert('提示', '请选择要修改的数据');
                            return;
                        }

                    }
                }, '-', {
                    id: 'btnDelete',
                    text: '删除',
                    disabled: false,
                    iconCls: 'icon-cut',
                    handler: function () {

                        var rows = $('#grid').datagrid('getSelections');
                        if (!rows || rows.length == 0) {
                            $.messager.alert('提示', '请选择要删除的数据');
                            return;
                        }
                        var parm;
                        $.each(rows, function (i, n) {
                            if (i == 0) {
                                parm = "idList=" + n.ID;
                            }
                            else {
                                parm += "&idList=" + n.ID;
                            }
                        });
                        $.messager.confirm('提示', '是否删除这些数据?', function (r) {
                            if (!r) {
                                return;
                            }

                            $.ajax({
                                type: "POST",
                                url: "/UserInfo/Delete/",
                                data: parm,
                                success: function (msg) {
                                    if (msg.IsSuccess) {
                                        $.messager.alert('提示', '删除成功！', "info", function () {
                                            $('#grid').datagrid("reload");
                                        });
                                    }
                                },
                                error: function () {
                                    $.messager.alert('错误', '删除失败！', "error");
                                }
                            });
                        });
                    }
                }, '-']
            });


        });
    </script>
</head>
<body class="easyui-layout">
    <div region="center" style="padding: 5px;" border="false">
        <table id="grid">
        </table>
    </div>
</body>
</html>
