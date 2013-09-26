<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <% Html.RenderPartial("HeadControl"); %>
</head>
<body>
    <div class="wraper sidebar-full">
        <form id="form1" runat="server">
        <% Html.RenderPartial("SidebarControl"); %>
        <% Html.RenderPartial("HeaderControl"); %>
        <div id="main">
            <div class="container-fluid" id="mainContent" style="min-height:800px">
                <div class="row-fluid">
                    <div class="span12">
                        <h3 class="page-title">
                            工作台
                        </h3>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span6">
                        <section class="social-box">
                <header class="header">
                    <h4><i class="icon-bar-chart"></i> Visits by location</h4>
                    <div class="tools">
                    </div>
                </header>
                <div class="body">
                <div id="demo-plot" class="plot"></div>
                </div>
                </section>
                    </div>
                    <div class="span6">
                        <section class="social-box">
                    <div class="header">
                        <h4><i class="icon-bar-chart"></i> Server Stats</h4>
                    </div>
                    <div class="body" style="text-align: center;">
                        <div id="g1"></div>
                        <div id="g2"></div>
                        <div id="g3"></div>
                    </div>
                </section>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span6">
                        <section class="social-box">
                <div class="header">
                    <h4><i class="icon-calendar"></i> Calendar</h4>
                </div>
                <div class="body">
                    <div id="demo-calendar1" class="social-box-calendar"></div>
                </div>
                </section>
                    </div>
                </div>
            </div>
            <% Html.RenderPartial("FooterControl"); %>
        </div>
        <% Html.RenderPartial("MessageControl"); %>
        <% Html.RenderPartial("JsIncludeControl"); %>
        </form>
    </div>
</body>
<script src="../../Scripts/Home/Index.js"></script>
</html>
