<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<!-- 用户确认框 -->
<aside id="confirm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 id="myModalLabel">Modal Heading</h3>
    </div>
    <div class="modal-body">
        One fine body…
    </div>
    <div class="modal-footer">
        <button class="btn btn-danger" data-dismiss="modal">Close</button>
        <button class="btn btn-primary">Save changes</button>
    </div>
</aside>

<!-- 成功提示 -->
<aside id="success" class="modal hide fade success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h3 id="H1">操作成功</h3>
</div>
<div class="modal-body">
<span id="successMessage" class="successMessage"></span>
</div>
<div class="modal-footer">
<button class="btn btn-primary" data-dismiss="modal">确定</button>
</div>
</aside>

<!-- 错误提示 -->
<aside id="error" class="modal top hide fade error" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-body">
<p><span id="errorMessage" class="errorMessage"></span></p>
</div>
<div class="modal-footer">
<button class="btn btn-danger btn-large" data-dismiss="modal">Close</button>
</div>
</aside>

<script type="text/javascript">
    function showSuccess(msg) {

        $(".successMessage").html(msg);
        $(".success").modal("show");
    }

    //  操作失败提示
    function showError(msg) {
        $(".errorMessage").html(msg);
        $(".error").modal("show");
    }
</script>