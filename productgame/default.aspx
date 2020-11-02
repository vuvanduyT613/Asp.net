<%@ Page Title="" Language="C#" MasterPageFile="~/sitemain.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="productgame._default" MaintainScrollPositionOnPostback="true"%>
<%@ MasterType VirtualPath="~/sitemain.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>home</title>
	<link rel="stylesheet" href="./Stylesheet/css/defaults.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<!-- Hero section -->
	<section class="hero-section" style="margin-top : 100px">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="./Stylesheet/img/pes-2021.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-8 text-white">
							<span>TRÒ CHƠI MỚI</span>
							<h2>Pes 2021</h2>
							<p>eFootball Pro Evolution Soccer 2020 là một trò chơi điện tử mô phỏng bóng đá được phát triển bởi PES Productions và được Konami phát hành cho Microsoft Windows, PlayStation 4, Xbox One, Android và iOS.</p>
							<asp:LinkButton ID="LinkButton4" runat="server" CssClass="site-btn sb-line" CommandArgument="1">KHÁM PHÁ</asp:LinkButton>
							<asp:LinkButton ID="LinkButton3" runat="server" CssClass="site-btn sb-white" CommandArgument="1">THÊM VÀO GIỎ</asp:LinkButton>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>CHỈ</span>
						<h2>10$</h2>
						<p>MUA NGAY</p>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="./Stylesheet/img/bg-2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-8 text-white">
							<span>TRÒ CHƠI MỚI</span>
							<h2>Fortnite</h2>
							<p>Fortnite đưa người chơi đến bối cảnh Trái Đất hiện đại, với sự xuất hiện đột ngột của một cơn bão trên toàn thế giới làm 98% dân số thế giới biến mất, và các sinh vật giống zombie tấn công số người còn sót lại. </p>
							<asp:LinkButton ID="LinkButton5" runat="server" CssClass="site-btn sb-line" CommandArgument="2">KHÁM PHÁ</asp:LinkButton>
							<asp:LinkButton ID="LinkButton6" runat="server" CssClass="site-btn sb-white" CommandArgument="2">THÊM VÀO GIỎ</asp:LinkButton>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>CHỈ</span>
						<h2>20$</h2>
						<p>MUA NGAY</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="slide-num-holder" id="snh-1"></div>
		</div>
	</section>

	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>SẢN PHẨM</h2>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row" >
			<asp:DataList ID="DataList1" runat="server"  RepeatColumns="4" HorizontalAlign="left">
				<ItemTemplate>
					<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
						<div class="product-item">
							<div class="pi-pic">
								<asp:Image ID="Image1" runat="server" Width="100%" Height="180px" ImageUrl='<%# "./Stylesheet/img/"+ Eval("ImageSource") %>'/>
								<div class="pi-links">
									<asp:LinkButton ID="LinkButton1" runat="server" class="add-card" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("ProductID") %>'><i class="flaticon-bag"></i><span>THÊM VÀO GIỎ</span></asp:LinkButton>								
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="wishlist-btn" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ProductID") %>'><i class="flaticon-info"></i></asp:LinkButton>
								</div>
							</div>
							<div class="pi-text">
								<h6><%# Eval("Prince") + "$" %></h6>
								<p><%# Eval("ProductName") %></p>
							</div>
						</div>
						<br />
					</div>
				</ItemTemplate>
			</asp:DataList>
		</div>
	</div>
    
	<section class="banner-section">
		<div class="container">
			<div class="banner set-bg" data-setbg="./Stylesheet/img/banner-bg.jpg">
				<div class="tag-new">NEW</div>
				<span>New Software</span>
				<h2>FireFox</h2>
				<a href="#" class="site-btn">SHOP NOW</a>
			</div>
		</div>
	</section>
</asp:Content>
