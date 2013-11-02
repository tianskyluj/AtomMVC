$(function () {

    $('#apply_edit').wysihtml5({
        "stylesheets": ["/templates/social/assets/js/bootstrap-wysihtml5/lib/css/wysiwyg-color.css"]
    });


    // 发送内部邮件
    $('#btn_sendApply').click(function () {
        if ($('#sel_applyType').val() == '0') {
            showError('请选择申请类型');
            return false;
        }
        if ($('#sel_receiveRole').val() == '0') {
            showError('请选择下级审核角色');
            return false;
        }

        if ($('#apply_edit').val().trim() == '') {
            showError('请输入申请详细内容');
            return false;
        }
        $.post(
                '/Apply/SaveApply',                                               // 修改表格名称
                {
                "Content": $('#apply_edit').val(),
                "role": $('#sel_receiveRole').val(),
                "applyType": $('#sel_applyType').val()
            },
                function (result) { if (result == "1") { showSuccess("操作成功"); } else if (result == '-1') {showError("没有人担任所选角色") } else { showError("出错了，请稍后再试或者联系系统管理员") } }
        );
    });

    // 清空表单
    $('#btn_reset').click(function () {
        $('#form_newTask')[0].reset();
        $('#sel_applyType').val('0');
        $('#sel_receiveRole').val('0');
    });
});