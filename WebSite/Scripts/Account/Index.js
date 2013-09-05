$(function () {
    function profileViewModel() {
        this.telephone = ko.observable($('#telephone_edit').val());
        this.email = ko.observable($('#email_edit').val());
        this.QQ = ko.observable($('#QQ_edit').val());

        // 点击更改按钮
        this.profileChange = function () {
            $.post(
                    '/Account/UpdateProfile',
                    { "id": $('.userId').val(), "Phone": this.telephone(), "Email": this.email(), "QQ": this.QQ() },
                    function (result) { if (result == "1") { showSuccess("操作成功"); } else { showError("修改个人资料出错，请稍后再试或者联系系统管理员") } }
            );
        };
    }

    // 注册用户模型
    ko.applyBindings(new profileViewModel());
});