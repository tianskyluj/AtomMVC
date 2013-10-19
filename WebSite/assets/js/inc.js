
// 跳转至其他模块
function redirect(url) {
    $('#mainContent').load(url);
}
// 获取多选下拉列表的值的字符串，形如：1，2，3，4 
function getMultiSelectValue (obj){ 
    var select = $(obj);
    var lis = select.parent().find('li');
    var value = '';
    lis.each(function () {
        if ($(this).hasClass('active')) {
            value += $(this).find('input').val() + ',';
        }
    });
    return value;
}

// 返回多选下拉列表的value字符串
function getMulitiSelectValue(obj) {
    var selectValues = '';
    var lis = obj.siblings().find('.active');
    lis.each(function () {
        if ($(this).children().attr('class') != 'multiselect-all') {
            selectValues = selectValues + $(this).find('input').val() + ',';
        }
    });
    return selectValues;
}

// 初始化多选下拉列表
function initMulitiSelect(obj) {
    var lis = obj.siblings().find('.active');
    obj.siblings().find('button').html('请选择<b class="caret"></b>');
    obj.children('option').removeAttr('selected');
    lis.each(function () {
        $(this).removeAttr("class");
        $(this).find('input').prop('checked', false);
    });
}

// 初始化 多选下拉列表 所选都置空
function initMultiSelect(obj) {
    var select = $(obj); 

    var inputs = select.parent().find('input');
    inputs.eq(0).click();
    inputs.eq(0).click();
    return value;
}

// 根据arr数组设置多选下拉列表控件的值
function setMulitiSelectValue(control, arr) {
    initMulitiSelect(control);
    for (x in arr) {
        control.find('option[value="' + arr[x] + '"]').attr('selected', 'selected');
        control.siblings().find('input[value="' + arr[x] + '"]').prop('checked', true);
        control.siblings().find('input[value="' + arr[x] + '"]').parent().parent().parent('li').addClass('active');
    }
    var options = control.find('option[selected="selected"]')
    if (options.length == 0) {
        control.siblings().find('button').html('请选择<b class="caret"></b>');
    }
    else if (options.length > 3) {
        control.siblings().find('button').html(options.length + '  项被选中 <b class="caret"></b>');
    }
    else {
        var selected = '';
        options.each(function () {
            var label = ($(this).attr('label') !== undefined) ? $(this).attr('label') : $(this).text();

            selected += label + ', ';
        });
        control.siblings().find('button').html(selected);
    }
        

}

$(document).ready(function () {
    // 点击无子页面链接
    $('.accordion-toggle').click(function () {
        var accordions = $('.accordion-toggle');
        accordions.each(function () {
            $(this).removeClass('opened');
        });
        $(this).addClass('opened');
        if($(this).parent().parent().find('li').length==0){
            $(this).parent().parent('.accordion-group').addClass('active');
        }
    });
    
    // 点击子页面
    var li = $('.menu').find('li')
    li.click(function(){
        li.each(function(){
            $(this).removeClass('active');
        });
        $(this).addClass('active');
        
        $('.accordion-group').each(function(){
            $(this).removeClass('active');
        });
        
        $(this).parent().parent('.accordion-group').addClass('active');
    });
});