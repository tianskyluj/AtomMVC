<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<header>
    <nav class="navbar navbar-blue navbar-fixed-top social-navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".social-sidebar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" runat="server" href="../Web/index.aspx" id="brand">
            </a>
            <ul class="nav pull-right nav-indicators">
                <li class="dropdown nav-notifications">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="badge">9</span><i class="icon-warning-sign"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-notifications-header">
                            <a tabindex="-1" href="#">您有 <strong>9</strong> 条通知</a>
                        </li>
                        <li class="nav-notification-body text-info">
                            <a href="#">
                            <i class="icon-user"></i> 配置用户权限
                            <small class="pull-right"> 刚刚</small>
                            </a>
                        </li>
                        <li class="nav-notifications-footer">
                            <a tabindex="-1" href="#">查看全部消息
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown nav-tasks">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="badge">13</span>
                        <i class="icon-tasks"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-taks-header">
                            <a tabindex="-1" href="#">您有 <strong>13</strong> 认为没有完成</a>
                        </li>
                        <li>
                            <a>
                                <strong>Windows PC</strong><span class="pull-right">30%</span>
                                <div>
                                    <div class="progress progress-danger active">
                                    </div> 
                                    <div class="bar" style="width: 30%;">
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a>
                                <strong>Mac</strong><span class="pull-right">40%</span>
                                <div class="progress progress-info active">
                                    <div class="bar" style="width: 40%;"></div>
                                </div>
                            </a>
                        </li>
                        <li class="nav-taks-footer">
                            <a tabindex="-1" href="#">查看所有任务
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown nav-messages">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="badge">8</span>
                    <i class="icon-envelope-alt"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-messages-header">
                            <a tabindex="-1" href="#">您有 <strong>8</strong> 封邮件</a>
                        </li>
                        <li class="nav-message-body">
                            <a>
                                <img src="../assets/img/avatars/user-55x55.png" alt="User"/>
                                <div>
                                    <small class="pull-right">刚刚</small>
                                    <strong>lan</strong>
                                </div>
                                <div>
                                    装修
                                </div>
                            </a>
                        </li>
                        <li class="nav-messages-footer">
                            <a tabindex="-1" href="#">View all messages
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="divider-vertical"></li>
                <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-caret-down"></i></a>
                                        <ul class="dropdown-menu">
            <li><a href="javascript:redirect('/Account/Index')"><i class="icon-user"></i> 个人资料</a></li>
            <% if ((bool)ViewData["visible"]) { %>
                <li><a href="javascript:redirect('/System/Index')"><i class="icon-cogs"></i> 系统设置</a></li>
            <% } %>
            <li> <a  id="loginOut" href="/Home/LoginOut"><i class="icon-off"></i> 登出</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="icon-info-sign"></i> 帮助</a></li>
            </ul>
                </li>
            </ul>
        </div>
    </div>
    </nav> 
</header>
