<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<aside class="social-sidebar sidebar-full">
    <div class="social-sidebar-content">
        <div class="scrollable">
            <div>
                <div class="user">
                    <img  id="avatar" class="avatar" width="25" height="25" src=<%: ViewData["Avatar"] %> alt="Julio Marquez"/>
                    <span data-toggle="dropdown"><%: ViewData["name"] %></span>
                </div>
                <div class="navigation-sidebar">
                    <i class="switch-sidebar-icon icon-chevron-left"></i>
                    <i class="switch-sidebar-full icon-chevron-right"></i>
                    <span>我的菜单</span>
                </div>
            </div>
            <section class="menu">
                <div class="accordion" id="accordion2">
                    <div class="accordion-group active">
                        <div class="accordion-heading">
                            <a class="accordion-toggle opened" href="/Home/Index">
                                <img src="../assets/img/icons/stuttgart-icon-pack/32x32/home.png" alt="工作台"/>
                                <span>工作台</span><span class="badge">9</span> 
                            </a>
                        </div>
                    </div>
                    <div class="accordion-group ">
                        <div class="accordion-heading">
                            <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#basicSetting">
                            <img src="../assets/img/icons/stuttgart-icon-pack/32x32/database.png" alt="基础设置"/>
                            <span>基础设置</span><span class="arrow"></span> </a>
                        </div>
                        <ul id="basicSetting" class="accordion-body collapse nav nav-list collapse ">
                            <li><a href="javascript:redirect('BasicSetting/Department.aspx')">部门</a></li>
                            <li><a href="javascript:redirect('BasicSetting/Role.aspx')">角色</a></li>
                            <li><a href="javascript:redirect('BasicSetting/User.aspx')">用户</a></li>
                            <li><a href="javascript:redirect('BasicSetting/Province.aspx')">省份</a></li>
                            <li><a href="javascript:redirect('BasicSetting/City.aspx')">地市</a></li>
                            <li><a href="javascript:redirect('BasicSetting/Area.aspx')">区县</a></li>
                            <li><a href="javascript:redirect('BasicSetting/elements.html')">demo</a></li>
                        </ul> 
                    </div>
                </div>
            </section>
        </div>
    </div>
</aside>