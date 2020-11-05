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
                        <div class="row" style="border : 1px solid #d9d9d9;">  
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="space-row">
                                    <img src='<%#"./Stylesheet/img/"+ Eval("ImageSource") %>' />
                                </div>
                            </div>
                    
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="space-row">
                                    <asp:LinkButton ID="LinkButton1" runat="server">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    </asp:LinkButton>
                                    <div class="text-wrap">
                                        <div class="text">Trạng thái :</div>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Status") %>' CssClass="label1"></asp:Label>
                                    </div>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="delete" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ProductID") %>'>Xóa</asp:LinkButton>
                                </div>
                            </div>
                    
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="space-row">
                                    <asp:Panel ID="Panel1" runat="server" CssClass="price" CommandArgument='<%# Eval("ProductID") %>'>
                                        <%# Eval("Prince") %>
                                    </asp:Panel>
                                </div>
                            </div>
                    
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <div class="space-row">
                                    <div class="qlr">
                                        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="BtnMinus" OnClick="LinkButton5_Click" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Eval("NewColumn") %>' Width="50px" Height="26px" style="text-align:center"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="BtnPlus" OnClick="LinkButton6_Click" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
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
                                <asp:Label ID="lbl_prince" runat="server" Text="Label" CssClass="bill-price"></asp:Label>  
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="content-bill">
                                <div class="bill-price-text-red">
                                    TỔNG TIỀN
                                </div>
                                <asp:Label ID="lbl_prince_red" runat="server" Text="Label" CssClass="bill-price-red"></asp:Label>
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
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-none-bg" OnClick="LinkButton3_Click">Tiếp tục mua hàng</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-blue-bg" OnClick="LinkButton4_Click">Thanh toán</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>  
</asp:Content>
