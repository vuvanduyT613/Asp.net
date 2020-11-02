<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotten.aspx.cs" Inherits="productgame.forgotten" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Stylesheet/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="./Stylesheet/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Stylesheet/icon-fonts/css/all.css"/>
    <link rel="stylesheet" href="./Stylesheet/css/forgotten.css" />
    <link rel="stylesheet" href="./Stylesheet/css/font-awesome.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/flaticons.css" />
	<link rel="stylesheet" href="./Stylesheet/css/slicknav.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/owl.carousel.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/animate.css" />
    <link rel="stylesheet" href="./Stylesheet/css/style.css" />
    <link rel="stylesheet" href="./Stylesheet/css/common.css">
    <title>Forgotten</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="preloder">
			<div class="loader"></div>
		</div>
        <div class="container">
          <div class="d-flex justify-content-center h-100" >
            <div class="card-main">
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
                    <div class="text-line-though">
                        <span>Đặt lại mật khẩu</span>
                    </div>
                    <br />
                    <hr />
                    <div class="navigation clearfix" >
                      <span id ="span-left">
                          <i class="fas fa-angle-left" style ="color:#21beff"></i>
                          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/home.aspx">Quay về trang chủ</asp:HyperLink>
                      </span>
                      <span id ="span-right">
                          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/login.aspx">Đăng nhập</asp:HyperLink>
                          <i class="fas fa-angle-right" style ="color:#21beff"></i>
                      </span>
                  </div>
                  <div class="tab_login">
                    <br>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Label ID="Label1" runat="server" style="color : red ; font-weight : bold" ></asp:Label>
                    </asp:Panel>
                    <div></div> 
                    <div class="form-group login-container">
                      <div class="input-group">
                        <asp:TextBox ID="txt_email" runat="server" class="form-control input-popup-login" type="email" placeholder="Nhập địa chỉ Email"></asp:TextBox>
                      </div>
                    </div>
                    <asp:Panel ID="Panel2" runat="server" class="btn btn-aqua-bg">
                        <asp:Button ID="Button1" runat="server" class="btn-submit-info" Text="Tiếp tục" />
                    </asp:Panel>
                    <br>
                    <asp:Panel ID="Panel3" runat="server" class="btn btn-aqua">
                            <asp:Button ID="Button2" runat="server" class="btn-submit-info-1" Text="Đăng ký tài khoản mới" OnClick="Button2_Click"/>
                    </asp:Panel>
                </div>
              </div>
            </div>
        </div>
    </form>
    <script src="./Stylesheet/js/jquery-3.5.1.min.js"></script>
	<script src="./Stylesheet/js/bootstrap.min.js"></script>
    <script src="./Stylesheet/icon-fonts/js/all.js"></script>
    <script src="./Stylesheet/js/jquery.slicknav.min.js"></script>
	<script src="./Stylesheet/js/owl.carousel.min.js"></script>
	<script src="./Stylesheet/js/jquery.nicescroll.min.js"></script>
	<script src="./Stylesheet/js/jquery.zoom.min.js"></script>
	<script src="./Stylesheet/js/jquery-ui.min.js"></script>
	<script src="./Stylesheet/js/main.js"></script>
</body>
</html>
