<%@ Page Title="" Language="C#" MasterPageFile="~/MainChinh.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="TanVietMy.User.DonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container py-5">
        <h2 class="pb-3 border-bottom">Đặt hàng</h2>

            <asp:GridView ID="gvDonHang" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table table-bordered" >
                <Columns>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" ReadOnly="True" />
                    <asp:BoundField DataField="Gia" HeaderText="Đơn giá" ReadOnly="True" DataFormatString="{0:0,000 vnđ}"/>
                    <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                    <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" ReadOnly="True"/>
                </Columns>
                <FooterStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <HeaderStyle BackColor="#212529" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
        

        <div class="row mt-3">
            <div class="col-md-6">
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Số lượng:</strong></div>
                    <div class="col-md-8"><asp:Label ID="lblTongSoLuong" runat="server"></asp:Label></div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Tổng thành tiền:</strong></div>
                    <div class="col-md-8 text-start"><asp:Label ID="lblTongThanhTien" runat="server" ></asp:Label></div>
                    </div>
               <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Họ tên:</strong></div>
                    <div class="col-md-8 text-start"><asp:TextBox ID="txtHoTen" CssClass="form-control"  runat="server" ></asp:TextBox></div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Số điện thoại:</strong></div>
                    <div class="col-md-8 text-start"><asp:TextBox ID="txtSDT" CssClass="form-control"  runat="server" ></asp:TextBox></div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Email:</strong></div>
                    <div class="col-md-8 text-start"><asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server" ></asp:TextBox></div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-4 text-end"><strong>Địa chỉ:</strong></div>
                    <div class="col-md-8 text-start"><asp:TextBox ID="txtDiaChi" CssClass="form-control"  runat="server" ></asp:TextBox></div>
                </div>
                    <div class="row">
                    <div class="col-md-12 text-center">
                    <asp:Button ID="btnDatHang" runat="server" Text="Đặt hàng" CssClass="btn btn-primary" OnClick="btnDatHang_Click"  />
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-secondary" PostBackUrl="~/User/SanPham.aspx"/>
                    </div>
                    </div>
                    </div>
            </div>
        </div>
        
</asp:Content>
