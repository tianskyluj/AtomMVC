$(function () {
    $('#sel_receiveUser').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        buttonWidth: '231px',
        buttonText: function (options, select) {
            if (options.length == 0) {
                return '请选择指定传阅用户 <b class="caret"></b>';
            }
            else if (options.length > 5) {
                return options.length + ' 位用户被选中  <b class="caret"></b>';
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
    $('#btn_sendPass').click(function () {
        if ($('#title_edit').val().trim() == "") {
            showError('请输入传阅主题');
            return false;
        }
        if ($('#sel_receiveUser').val() == null) {
            showError('请选择传阅用户');
            return false;
        }
        
        $.post(
                '/DocPass/SavePass',                                               // 修改表格名称
                {
                "Title": $('#title_edit').val().trim(),
                "Attachment":"",
                "receiveUsers": getMulitiSelectValue($('#sel_receiveUser'))
            },
                function (result) { if (result == "1") { showSuccess("操作成功"); } else { showError("出错了，请稍后再试或者联系系统管理员") } }
        );
    });

    // 清空表单
    $('#btn_reset').click(function () {
        $('#form_newTask')[0].reset();
        initMulitiSelect($('#sel_receiveUser'));
        setMulitiSelectTitle($('#sel_receiveUser'), '请选择任务接收人 ');
    });
});