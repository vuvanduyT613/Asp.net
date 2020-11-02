<%@ Page Title="" Language="C#" MasterPageFile="~/sitemain.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="productgame.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cart</title>
    <link  rel="stylesheet" href="./Stylesheet/css/cart.css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="hero-section" style="margin-top : 170px">
       <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <p><%# Eval("ProductID") %></p>
                        <div class="row" style="border : 1px solid #d9d9d9">  
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="space-row">
                                    <img src='<%#"./Stylesheet/img/"+ Eval("ImageSource") %>' />
                                </div>
                            </div>
                    
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="space-row">
                                    <asp:LinkButton ID="LinkButton1" runat="server">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'  ></asp:Label>
                                    </asp:LinkButton>
                                    <div class="text-wrap">
                                        <div class="text">Trạng thái :</div>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status") %>' CssClass="label1"></asp:Label>
                                    </div>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="delete">Xóa</asp:LinkButton>
                                </div>
                            </div>
                    
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="space-row">
                                    <div class="price">
                                        <%# Eval("Prince") %>
                                    </div>
                                </div>
                            </div>
                    
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="space-row">
                                    <div class="qlr">
                                        <a class="BtnMinus"></a>
                                        <input class="form-control" id="input-quantity" type="text" value="1"/>
                                        <a class="BtnPlus"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6" style="border : 1px solid #d9d9d9; margin-top:10px; background-color: #eee">
                        <div class="row">
                            <div class="head-bill">
                                THÔNG TIN THANH TOÁN
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="content-bill">
                                <div class="bill-price-text">
                                    Thành tiền sản phẩm
                                </div>
                                 <div class="bill-price">
                                    20$
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="content-bill">
                                <div class="bill-price-text-red">
                                    TỔNG TIỀN
                                </div>
                                 <div class="bill-price-red">
                                    20$
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="content-bill">
                                <button type="button" class="btn btn-green-bg">Mua Ngay</button>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="row">
                    <div class="form-button">
                        <button type="button" class="btn btn-none-bg">Tiếp tục mua hàng</button>
                        <button type="button" class="btn btn-blue-bg">Thanh toán</button>
                    </div>
                </div>
            </div>
        </div>
    </section>  
</asp:Content>
