<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="GopYAdmin.aspx.cs" Inherits="TanVietMy.Admin.GopYAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <h2 class="pb-3 border-bottom">Góp Ý Khách Hàng</h2>
        
    <asp:GridView ID="gvGopYKH" CssClass="justify-content-center " runat="server" AllowPaging="True" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khách Hàng" SortExpression="TenKH" />
            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="LoaiGY" HeaderText="Loại Góp Ý" SortExpression="LoaiGY" />
            <asp:BoundField DataField="NoiDung" HeaderText="Nội dung" SortExpression="NoiDung" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center"/>
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" CssClass="text-center" VerticalAlign="Middle" HorizontalAlign="Center" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" HorizontalAlign="Center" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
            
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT * FROM [GopY]"></asp:SqlDataSource>
</asp:Content>
