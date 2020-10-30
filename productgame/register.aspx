<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="productgame.Stylesheet.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Stylesheet/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="./Stylesheet/css/register.css" />
    <link rel="stylesheet" href="./Stylesheet/css/font-awesome.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/flaticons.css" />
	<link rel="stylesheet" href="./Stylesheet/css/slicknav.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/owl.carousel.min.css" />
	<link rel="stylesheet" href="./Stylesheet/css/animate.css" />
	<link rel="stylesheet" href="./Stylesheet/css/styles.css" />
    <link rel="stylesheet" href="./Stylesheet/css/common.css">
    <script src="./Stylesheet/js/register.js" type="text/javascript"></script>
    <title>resgister</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="preloder">
			<div class="loader"></div>
		</div>
        <div class="container">
          <div class="d-flex justify-content-center">
            <div class="card-main">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6 col-lg-6" id = "col-1">
                  <div class="content-name">
                    <h2>
                      Tạo tài khoản
                    </h2>
                  </div>
                  <p>
                    Tạo tài khoản để theo dõi đơn hàng, lưu danh sách sản phẩm yêu thích, nhận nhiều ưu đãi hấp dẫn.
                  </p>              
                </div>            
            
                <div class="col-md-6 offset-col-sm-6 col-xs-6 col-lg-6" id = "col-2" >
                  <ul class="nav nav-tabs">
                    <li class="tab-login">
                      <a class="nav-link" href="./Login.aspx" id="pane_login">Đăng nhập</a>
                    </li>
                    <li class="tab-login-active">
                      <a class="nav-link active" href="./Register.aspx">Đăng ký</a>
                    </li>
                  </ul>
                  <div class="tab_login">
                    <br>
                    <div class="form-group login-container">
                      <label for="input-fullname-register">Họ và tên</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_fullname" runat="server" class="form-control input-popup-login" placeholder="Họ và tên" type="text"></asp:TextBox>
                      </div>
                    </div>

                    <div class="form-group login-container">
                      <label for="input-username-register">Tên người dùng</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_username" runat="server" class="form-control input-popup-login" placeholder="Tên người dùng" type="text"></asp:TextBox>
                      </div>
                    </div>

                    <div class="form-group login-container">
                      <label for="input-email-register">Địa chỉ email</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_email" runat="server" class="form-control input-popup-login"  placeholder="Địa chỉ Email" type="email"></asp:TextBox>
                      </div>
                    </div>

                    <div class="form-group login-container">
                      <label for="input-telephone-register">Số điện thoại</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_numberphone" runat="server" class="form-control input-popup-login" placeholder="Số điện thoại" type="text" ></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group login-container">
                      <label for="input-password-register">Mật khẩu</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_password" runat="server" class="form-control input-popup-login" placeholder="Mật khẩu" type="text"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group login-container">
                      <label for="input-confirm-password">Nhập lại mật khẩu</label>
                      <div class="input-group">
                        <asp:TextBox ID="txt_repassword" runat="server" class="form-control input-popup-login" placeholder="Nhập lại mật khẩu" type="password" ></asp:TextBox>
                      </div>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <asp:CheckBox ID="CheckBox1" runat="server" />
                      <label>Tôi đã đọc và đồng ý với 
                        <a class="fancybox" href="" alt="Điều khoản dịch vụ">Điều khoản dịch vụ</a>                                                     
                      </label>
                    </div>
                    <br>
                    
                    <asp:Panel ID="Panel1" runat="server" class="btn btn-aqua-bg" >
                        <asp:Button ID="Button1" runat="server" class="btn-submit-info" Text="Đăng Ký" type="button" style="width : 100% ; height : 100%" OnClick="Button1_Click1" OnClientClick="main()"/>
                    </asp:Panel>
                </div>
              </div>
            </div>
          </div>
        </div>
    </form>
    <script src="./Stylesheet/js/jquery-3.5.1.min.js"></script>
	<script src="./Stylesheet/js/bootstrap.min.js"></script>
    <script src="./Stylesheet/js/jquery.slicknav.min.js"></script>
	<script src="./Stylesheet/js/owl.carousel.min.js"></script>
	<script src="./Stylesheet/js/jquery.nicescroll.min.js"></script>
	<script src="./Stylesheet/js/jquery.zoom.min.js"></script>
	<script src="./Stylesheet/js/jquery-ui.min.js"></script>
	<script src="./Stylesheet/js/main.js"></script>
</body>
</html>
