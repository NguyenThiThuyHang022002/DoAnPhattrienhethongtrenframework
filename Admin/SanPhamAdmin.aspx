<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdmin.Master" AutoEventWireup="true" CodeBehind="SanPhamAdmin.aspx.cs" Inherits="TanVietMy.Admin.SanPhamAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <a class="btn btn-dark" href="../Admin/ThemSP.aspx" runat="server" role="button">Thêm sản phẩm</a>
    </div>
    <asp:GridView ID="GridView1" CssClass="justify-content-center " runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="MaSP" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" >
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" InsertVisible="False" />
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" SortExpression="TenSP" />
            <asp:BoundField DataField="Gia" HeaderText="Đơn giá" SortExpression="Gia" DataFormatString="{0:0,000 vnđ}" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
            <asp:TemplateField HeaderText="Hình ảnh">
                <ItemTemplate>
                    <asp:Image ID="Image6" runat="server" Height="90px" Width="90px" ImageUrl='<%# Eval("HinhAnh") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" SortExpression="MoTa" />
            <asp:BoundField DataField="TenDanhMuc" HeaderText="Tên danh mục" SortExpression="TenDanhMuc" />
            <asp:TemplateField >
                <ItemTemplate>
                <asp:HyperLink ID="HLSua" CssClass="btn btn-dark" runat="server" NavigateUrl='<%# "ChinhSuaSP.aspx?MaSP=" + Eval("MaSP") %>'>Cập nhật</asp:HyperLink>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ButtonType="Button"  >
            <ControlStyle CssClass="btn btn-dark" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" CssClass="text-center" VerticalAlign="Middle" HorizontalAlign="Center" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="White" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BHNT %>" SelectCommand="SELECT SanPham.MaSP, SanPham.TenSP, SanPham.Gia, SanPham.SoLuong, SanPham.HinhAnh, SanPham.MoTa, DanhMucSanPham.TenDanhMuc FROM DanhMucSanPham INNER JOIN SanPham ON DanhMucSanPham.MaDanhMuc = SanPham.MaDanhMuc" DeleteCommand="DELETE FROM SanPham WHERE MaSP = @MaSP">
        <DeleteParameters>
            <asp:Parameter Name="MaSP" />
        </DeleteParameters>
    </asp:SqlDataSource>
   
    
</asp:Content>
