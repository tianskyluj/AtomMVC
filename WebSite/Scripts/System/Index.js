$(function () {
    function globalViewModel() {
        this.companyName = ko.observable($('#companyName_edit').val());

        // 点击更改按钮
        this.change = function () {
            if (this.companyName().trim() == "") {
                showError("请输入公司名称……");
                return false;
            }
            $.post(
                    '/System/UpdateGolbal',
                    { "id": '0', "companyName": this.companyName() },
                    function (result) { if (result == "1") { showSuccess("操作成功"); } else { showError("修改全局设置出错，请稍后再试或者联系系统管理员") } }
            );
        };
    }

    // 注册模型
    ko.applyBindings(new globalViewModel());
});