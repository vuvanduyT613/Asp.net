<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="productgame.stylesheet.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Stylesheet/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="./Stylesheet/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Stylesheet/icon-fonts/css/all.css"/>
    <link rel="stylesheet" href="./Stylesheet/css/font-awesome.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/flaticons.css" />
	<link rel="stylesheet" href="./Stylesheet/css/slicknav.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/owl.carousel.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/animate.css" />
    <link rel="stylesheet" href="./Stylesheet/css/logins.css" />
    <link rel="stylesheet" href="./Stylesheet/css/style.css" />

    <link rel="stylesheet" href="./Stylesheet/css/common.css">
    <title>Login</title>
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
                
                <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6" id = "col-1">
                  <div class="content-name">
                    <h2>
                      Đăng nhập
                    </h2>
                  </div>
                  <p>
                    Đăng nhập để theo dõi đơn hàng, lưu danh sách sản phẩm yêu thích, nhận nhiều ưu đãi hấp dẫn.
                  </p>              
                </div>            
               
                <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6" id = "col-2">
                  <ul class="nav nav-tabs">
                    <li class="tab-login-active">
                      <asp:HyperLink ID="HyperLink3" runat="server" class="nav-link active" NavigateUrl="~/Login.aspx">Đăng nhập</asp:HyperLink>
                    </li>
                    <li class="tab-login">
                      <asp:HyperLink ID="HyperLink4" runat="server" class="nav-link" NavigateUrl="~/Register.aspx">Đăng ký</asp:HyperLink>
                    </li>
                  </ul>
               
                  <div class="tab_login">
                    <br>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:Label ID="Label1" runat="server" style="color : red ; font-weight : bold" ></asp:Label>
                    </asp:Panel>
                    <div></div>
                    <div class="form-group login-container">
                      <asp:Label ID="Label2" runat="server" Text="Địa chỉ email"></asp:Label>
                                 
                      <div class="input-group">
                        <asp:TextBox ID="txt_email" runat="server" class="form-control input-popup-login" type="email" placeholder="Nhập địa chỉ Email"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group login-container">
                      <label for="">Mật khẩu</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_pass" runat="server" class="form-control input-popup-login" type="password" placeholder="Mật khẩu" ></asp:TextBox>
                      </div>
                    </div>
                    <div class="container-check">
                        <div class="left-check">
                            <asp:CheckBox ID="checkbox" runat="server" />
                            <p>Ghi nhớ tài khoản</p>
                        </div>
                        <div class="right-check">
                            <p class="text-left"><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/forgotten.aspx">Bạn quên mật khẩu?</asp:HyperLink></p>
                        </div>
                    </div>
                    <div></div>
                    
              
                    <asp:Panel ID="Panel2" runat="server" class="btn btn-aqua-bg">
                        <asp:Button ID="Button1" runat="server"  class="btn-submit-info" Text="Đăng nhập" OnClick="btn_dangnhap_Click1" style="width:100% ; height:100%"/>
                    </asp:Panel>
                    <hr>

                    <div class="other-login">
                      <p style="text-align:center">Hoặc đăng nhập</p>
                      <div class="list-login">
                        <asp:LinkButton ID="LinkButton1" runat="server"  class="login-fplus btn btn-info" OnClick="LinkButton1_Click">
                            <span>
                            <i class="fab fa-facebook-f" style="font-size: 25px"></i>
                            </span>
                            Đăng nhập bằng Facebook
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" class="login-gplus btn btn-danger" OnClick="LinkButton2_Click">
                            <span>
                            <i class="fab fa-google-plus-g" style="font-size: 25px"></i>
                            </span>
                            Đăng nhập bằng Google
                        </asp:LinkButton>
                      </div>
                    </div>
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
