<%@ Page Title="" Language="C#" MasterPageFile="~/sitemain.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="productgame.detail"  MaintainScrollPositionOnPostback="true"%>
<%@ MasterType VirtualPath="~/sitemain.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Detail</title>
    <link rel="stylesheet" href="./Stylesheet/css/detailt.css" />
    <link rel="stylesheet" href="./Stylesheet/css/productc.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-section" style="margin-top : 170px">
       <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="row">
                    <ul class="breadcrumb" style="background : none ;">
                        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                            <asp:LinkButton ID="LinkButton1" runat="server" style="color: #7b7b7b;">
                                 <span itemprop="title">
                                    <i class="fa fa-home"></i>
                                </span>
                            </asp:LinkButton>
                        </li>
                        &nbsp;
                        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                            <asp:LinkButton ID="LinkButton2" runat="server">
                                <asp:Label ID="lbl_name" runat="server" Text="Among Us" ></asp:Label>
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <asp:Label ID="llb_name2" runat="server" Text="Label" CssClass="fontSize-title"></asp:Label>
                </div>
                
                <div class="row">
                    <div class ="col-lg-6 col-md-6 col-sm-6">
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                          <div class="carousel-inner" style="height:300px">
                            <div class="carousel-item active">
                               <asp:Image ID="Image1" runat="server"  CssClass="d-block w-100"/>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" src="https://image.thanhnien.vn/1080/uploaded/badiep/2020_10_03/play-au-with-bluestacks-vn-8_eppk.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                              <img class="d-block w-100" src="https://bloganchoi.com/wp-content/uploads/2020/09/among-us-wallpaper.jpg" alt="Third slide">
                            </div>
                          </div>
                          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                          </a>
                        </div>
                    </div>

                    <div class ="col-lg-6 col-md-6 col-sm-6">
                        <div class ="row" style="border : 1px solid #eee">
                            <div class="col-lg-4 col-md-4 col-sm-4" style="display:flex">
                                <div class="sp-info-top-item-icon"><img style="width: 20px;" src="./IconImage/item-icon-1.png"/></div>
                                <div class="text-wrap">
                                    <div class="text">Mã sản phẩm</div>
                                    <asp:Label ID="lbl_msp" runat="server" Text="Label" CssClass="text-1"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4" style="display:flex">
                                <div class="sp-info-top-item-icon"><img style="width: 20px;" src="./IconImage/item-icon-2.png"/></div>
                                <div class="text-wrap">
                                    <div class="text">Tình trạng</div>
                                    <asp:Label ID="lbl_status" runat="server" Text="Label" CssClass="text-1"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4" style="display:flex">
                                <div class="sp-info-top-item-icon"><img style="width: 35px;" src="./IconImage/item-icon-3.png"/></div>
                                <div class="text-wrap">
                                    <div class="text">Link gốc </div>
                                    <p>
                                        <a href="https://store.steampowered.com/app/945360/Among_Us/?snr=1_7_7_151_150_1" target="_blank" rel="nofollow">
                                            Sản phẩm
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="sp-price-text">Giá sản phẩm</div>
                        </div>

                        <div class="row">
                            <div class="price">
                                <asp:Label ID="lbl_price" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                         <hr />
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <label>Số Lượng:</label>
                                <div class="qlr">
                                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="BtnMinus" OnClick="LinkButton5_Click"></asp:LinkButton>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="1" Width="50px" Height="26px" style="text-align:center"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton6" runat="server" CssClass="BtnPlus" OnClick="LinkButton6_Click"></asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-9 col-sm-9">
                                <div class="button-main">
                                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-green-bg" OnClick="LinkButton3_Click">Mua Ngay</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-orange-bg" OnClick="LinkButton4_Click"><i class="flaticon-shopping-cart"></i>&nbsp Thêm Vào Giỏ</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <hr />
                        
                    </div>
                </div>
                <div class="row">
                    <div class="ct-title">Chi tiết sản phẩm</div>
                </div>
                <div class="row">
                     <div class="ct">
                         <asp:Label ID="lbl_description" runat="server" Text="Label"></asp:Label>
                     </div>
                </div>
            </div>
            
        </div>
	</section>
</asp:Content>
