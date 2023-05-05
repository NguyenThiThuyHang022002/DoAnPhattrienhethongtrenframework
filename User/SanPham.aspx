<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="TanVietMy.User.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" Width="100%" Height="200px" GridLines="Both">
        <ItemTemplate>
            <div style="text-align:center">
            <asp:Label ID="TenSPLabel" runat="server"  Text='<%# Eval("TenSP") %>' />
            <br />
            &nbsp;<asp:Image ID="Image1" runat="server" Width="150px" Height="150px" ImageUrl='<%# Eval("HinhAnh") %>' />
            <br />
            <asp:Label ID="GiaLabel0" runat="server" Text='<%# Eval("Gia", "{0:0,000 vnđ}") %>' />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ChiTietSanPham.aspx?MaSP=" + Eval("MaSP") %>' Text="Xem" CssClass="btn btn-dark"></asp:HyperLink>
            <br />
                </div>
        </ItemTemplate>
    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT * FROM [SanPham]"></asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SanPhamSQL" runat="server" ConnectionString="<%$ ConnectionStrings:TanVietMyConnectionString %>" SelectCommand="SELECT [TenSP], [Gia], [HinhAnh] FROM [SanPham]"></asp:SqlDataSource>

</asp:Content>
