<%@ Page Title="Marcas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarcaUI.aspx.cs" Inherits="TestePratico.UI.MarcaUI" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="col-md-4 col-md-offset-4">
                                <h1>Marcas
                                </h1>
                            </div>
                            <center>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1">
                                            <div class="form-group">
                                                <asp:Label Text="Marca" runat="server" />
                                                <asp:TextBox ID="txtMarca" runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Marca" />
                                                <span id="marcaMsg"></span>
                                            </div>

                                            <asp:Button Text="Cadastrar" ID="btnCadastrar" CssClass="btn btn-primary" Width="90px" runat="server" OnClick="btnCadastrar_Click" />
                                            <asp:Button Text="Excluir" ID="btnExcluir" CssClass="btn btn-danger" Width="90px" runat="server" OnClick="btnExcluir_Click" />
                                            <asp:Button Text="Atualizar" ID="btnAtualizar" CssClass="btn btn-warning" Width="90px" runat="server" OnClick="btnAtualizar_Click" />
                                            <br />
                                            <br />
                                            <asp:Label ID="lblMsg" runat="server" Enabled="False" Visible="False" CssClass="text-danger"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-1">
                                            <asp:GridView ID="gvMarcas" runat="server" AutoGenerateColumns="False" DataKeyNames="MarcaId" DataSourceID="MarcasDb" CssClass="table-condensed" CellSpacing="1" Width="270px" Height="101px" OnSelectedIndexChanged="gvMarcas_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" />
                                                    <asp:BoundField DataField="MarcaId" HeaderText="Id" SortExpression="MarcaId" InsertVisible="False" ReadOnly="True" />
                                                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                                </Columns>
                                                <FooterStyle HorizontalAlign="Center" Width="200px" />
                                                <PagerStyle HorizontalAlign="Right" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="MarcasDb" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [Marcas]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </center>
                        </header>
                    </section>
                </div>
            </div>
        </section>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#MainContent_txtMarca").keyup(function () {
                if (validaMarca()) {
                    $("#MainContent_txtMarca").css("border", "2px solid green");
                    $("#marcaMsg").html("<p class='text-success'>Marca válida</p>");
                } else {
                    $("#MainContent_txtMarca").css("border", "2px solid red");
                    $("#marcaMsg").html("<p class='text-danger'>Marca inválida</p>");
                }
            });
        });

        function validaMarca() {
            var marca = $("#MainContent_txtMarca").val();
            var reg = /^[a-zA-Z\s]*$/
            if (reg.test(marca)) {
                return true;
            }
            else {
                return false;
            }

        }
    </script>
</asp:Content>

