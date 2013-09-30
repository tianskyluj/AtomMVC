﻿$(function () {
    function globalViewModel() {
        this.companyName = ko.observable($('#companyName_edit').val());

        this.isProvince = ko.observable($('#isProvince_edit').val() == 'True');

        this.isCity = ko.observable($('#isCity_edit').val() == 'True');

        this.isRegion = ko.observable($('#isRegion_edit').val() == 'True');

        this.isDepartment = ko.observable($('#isDepartment_edit').val() == 'True');

        this.modelName = ko.observable($('#modelName_edit').val());
        this.modelUrl = ko.observable($('#modelUrl_edit').val());
        this.modelIsEnable = ko.observable($('#modelIsEnable_edit').val() == 'True');

        // 点击更改按钮
        this.change = function () {
            if (this.companyName().trim() == "") {
                showError("请输入公司名称……");
                return false;
            }
            $.post(
                    '/System/UpdateGolbal',
                    {
                        "id": '0',
                        "companyName": this.companyName(),
                        "isProvince": this.isProvince(),
                        "isCity": this.isCity(),
                        "isRegion": this.isRegion(),
                        "isDepartment": this.isDepartment()
                    },
                    function (result) { if (result == "1") { showSuccess("操作成功"); } else { showError("修改全局设置出错，请稍后再试或者联系系统管理员") } }
            );
        };

        // 模块树结构展开收起
        this.isExpand = function () {
            var parentModel = $('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse this branch');
            parentModel.each(function () {
                var children = $(this).parent('li.parent_li').find(' > ul > li');
                if (children.is(':visible')) {
                    children.hide('fast');
                    $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
                }
                else {
                    children.show('fast');
                    $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                }
                //e.stopPropagation();
            });
            if ($('#btn_isExpand').html() == "展开")
                $('#btn_isExpand').html("收起");
            else
                $('#btn_isExpand').html("展开")
        }

        // 添加系统模块
        this.addModel = function () {
            $("#modelAddAndUpdateTitle").html("添加");
            $("#addAndUpdateModel").modal("show");
        }

        // 修改系统模块
        this.updateModel = function () {
            $("#modelAddAndUpdateTitle").html("修改");
            $("#addAndUpdateModel").modal("show");
        }

        // 删除系统模块
        this.deleteModel = function () {
            if (confirm("确定删除该模块?")) {

            }
        }

        // 父节点下拉列表变化时兄弟节点下拉列表做相应变化
        $('#parentModel').change(function () {
            parentModelChanged();
        });
    }

    parentModelChanged();

    // 注册模型
    ko.cleanNode(document.body);
    ko.applyBindings(new globalViewModel(), document.body);
});

function parentModelChanged() {
    var sibling = $('.opt_siblingModel');
    var parentId = $('#parentModel').val();
    var hideSibling = $('.opt_siblingModel[parentid!="' + parentId + '"]');

    sibling.each(function () {
        if ($(this).parent().is("span")) {
            $(this).unwrap();
        }
    });

    hideSibling.each(function () {
        $(this).wrap("<span style='display:none'></span>");
    });
}

//var profileModel = {
//    first: ko.observable("Bob"),
//    last: ko.observable("Smith")
//};

//var shellModel = {
//    header: ko.observable("Administration"),
//    sections: ["profile", "settings", "notifications"],
//    selectedSection: ko.observable()
//};

////the overall view model
//var viewModel = {
//    shell: shellModel,
//    profile: profileModel
//};

//ko.applyBindings(viewModel);