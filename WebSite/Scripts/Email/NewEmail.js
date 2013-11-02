$(function () {
    $('#email_edit').wysihtml5({
        "stylesheets": ["/templates/social/assets/js/bootstrap-wysihtml5/lib/css/wysiwyg-color.css"]
    });

    $('#sel_receiveUser').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        buttonWidth: '745px',
        buttonText: function (options, select) {
            if (options.length == 0) {
                return '请选择收件人 <b class="caret"></b>';
            }
            else if (options.length > 5) {
                return options.length + ' 位收件人被选中  <b class="caret"></b>';
            }
            else {
                var selected = '';
                options.each(function () {
                    selected += $(this).text() + ', ';
                });
                return selected.substr(0, selected.length - 2) + ' <b class="caret"></b>';
            }
        }
    });

    // 发送内部邮件
    $('#btn_sendEmail').click(function () {
        if ($('#title_edit').val().trim() == "") {
            showError('请输入邮件标题');
            return false;
        }
        if ($('#sel_receiveUser').val() == null) {
            showError('请选择收件人');
            return false;
        }
        $.post(
                '/Email/SaveEmail',                                               // 修改表格名称
                {
                "Title": $('#title_edit').val().trim(),
                "Content": $('#Content').val(),
                "IsRead": false,
                "IsDeleteFromOutBox": false,
                "receiveUsers": getMulitiSelectValue($('#sel_receiveUser'))
            },
                function (result) { if (result == "1") { showSuccess("操作成功"); } else { showError("出错了，请稍后再试或者联系系统管理员") } }
        );
    });

    // 清空表单
    $('#btn_reset').click(function () {
        $('#form_newEmail')[0].reset();
        initMulitiSelect($('#sel_receiveUser'));
        setMulitiSelectTitle($('#sel_receiveUser'), '请选择收件人 ');
    });
});