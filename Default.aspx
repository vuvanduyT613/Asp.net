<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 110px;
        }
        td{
            vertical-align:top;
            margin:5xp;
            padding:5px;
            font-family:Tahoma;
            font-size:12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    
            
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" rowspan="4">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/anh1.jpg" Width="110px" />
                </td>
                <td>
                    <strong>Tên:</strong>
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text='Pizza 1'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Giá:
                    <asp:Label ID="Label2" runat="server" Text='10'></asp:Label>$
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="default.aspx?action=add&amp;id=1&amp;name=Pizza1&amp;price=10">Add To Cart</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

    
            
    
    </div>
       
    
            
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" rowspan="4">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/anh2.jpg" Width="110px" />
                </td>
                <td>
                    <strong>Tên:</strong>
                    <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text='Pizza 2'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Giá:
                    <asp:Label ID="Label4" runat="server" Text='13'></asp:Label>$
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="default.aspx?action=add&amp;id=2&amp;name=Pizza2&amp;price=13">Add To Cart</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>

    
            
    
        <p>
            &nbsp;</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" EnableModelValidation="True" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="100%">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Mã Sản Phẩm">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Tên Sản Phẩm">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Số Lượng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="Price" HeaderText="Giá Tiền">
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Chức Năng">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">Update</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" OnClientClick="return confirm(&quot;Are u sure ?&quot;)">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>

    
            
    
    </form>
</body>
</html>
