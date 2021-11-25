<%@ Page Title="Veiculos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Veiculos.aspx.cs" Inherits="TestePratico.UI.Veiculos" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <section id="main-content">
            <section id="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                <div class="col-md-4 col-md-offset-4">
                                    <h1>Veículos
                                    </h1>
                                </div>
                            </header>
                            <div class="panel-body" id="formulario">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-2">
                                        <div class="form-group">
                                            <asp:Label Text="Modelo" runat="server" />
                                            <asp:TextBox ID="txtModelo" runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Modelo do veículo" />
                                            <span id="modeloMsg"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-md-offset-2">
                                        <div class="form-group">
                                            <asp:Label Text="Ano" runat="server" />
                                            <asp:TextBox ID="txtAno" runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Ano" />
                                            <span id="anoMsg"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-2">
                                        <div class="form-group">
                                            <asp:Label Text="Cor" runat="server" />
                                            <asp:TextBox ID="txtCor" runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Cor" />
                                            <span id="corMsg"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-md-offset-2">
                                        <div class="form-group">
                                            <asp:Label Text="Marca" runat="server" />
                                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control input-sm" DataSourceID="SqlDataSource1" DataTextField="Nome" DataValueField="Nome" />
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT [Nome] FROM [Marcas]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <asp:Button Text="Cadastrar" ID="btnCadastrar" CssClass="btn btn-primary" Width="200px" runat="server" OnClick="btnCadastrar_Click" />
                                        <asp:Button Text="Excluir" ID="btnExcluir" CssClass="btn btn-danger" Width="200px" runat="server" OnClick="btnExcluir_Click" />
                                        <asp:Button Text="Atualizar" ID="btnAtualizar" CssClass="btn btn-warning" Width="200px" runat="server" OnClick="btnAtualizar_Click" />
                                    </div>
                                    <br />
                                    <br />
                                    <asp:Label ID="lblMsg" runat="server" Enabled="False" Visible="False" CssClass="text-danger"></asp:Label>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-1 col-md-offset-2">
                                        <asp:GridView ID="gvCarros" runat="server" AutoGenerateColumns="False" DataKeyNames="CarroId" DataSourceID="CarrosDb" CssClass="table-condensed" CellSpacing="1" Width="800px" OnSelectedIndexChanged="gvCarros_SelectedIndexChanged">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="CarroId" HeaderText="Id" SortExpression="CarroId" />
                                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                                <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano" />
                                                <asp:BoundField DataField="Cor" HeaderText="Cor" SortExpression="Cor" />
                                                <asp:BoundField DataField="Nome" HeaderText="Marca" SortExpression="Marca" />
                                            </Columns>
                                            <FooterStyle HorizontalAlign="Center" Width="200px" />
                                            <PagerStyle HorizontalAlign="Right" />
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="CarrosDb" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="select * from Carros c join Marcas m on c.MarcaId = m.MarcaId;"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
    </center>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#MainContent_txtModelo").keyup(function () {
                if (validaModelo()) {
                    $("#MainContent_txtModelo").css("border", "2px solid green");
                    $("#modeloMsg").html("<p class='text-success'>Modelo válido</p>");
                } else {
                    $("#MainContent_txtModelo").css("border", "2px solid red");
                    $("#modeloMsg").html("<p class='text-danger'>Modelo inválido</p>");
                }
            }),
                $("#MainContent_txtCor").keyup(function () {
                    if (validaCor()) {
                        $("#MainContent_txtCor").css("border", "2px solid green");
                        $("#corMsg").html("<p class='text-success'>Cor válida</p>");
                    } else {
                        $("#MainContent_txtCor").css("border", "2px solid red");
                        $("#corMsg").html("<p class='text-danger'>Cor inválida</p > ");
                    }
                }),
                $("#MainContent_txtAno").keydown(function (er) {

                    var key = er.keyCode;
                    if (!((key == 8) || (key == 9) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
                        er.preventDefault();
                    }


                }),
                $("#MainContent_txtAno").keyup(function () {
                    if (validaNumero()) {
                        $("#MainContent_txtAno").css("border", "2px solid green");
                        $("#anoMsg").html("<p class='text-success'>Ano válido</p>");
                    } else {
                        $("#MainContent_txtAno").css("border", "2px solid red");
                        $("#anoMsg").html("<p class='text-danger'>Ano inválido</p>");
                    }
                });
        });

        function validaModelo() {
            var modelo = $("#MainContent_txtModelo").val();
            var reg = /^[a-zA-Z0-9_.-]*$/i
            if (reg.test(modelo)) {
                return true;
            }
            else {
                return false;
            }

        }

        function validaCor() {
            var cor = $("#MainContent_txtCor").val();
            var reg = /^[a-z]+$/i
            if (reg.test(cor)) {
                return true;
            }
            else {
                return false;
            }

        }

        function validaNumero() {
            var ano = $("#MainContent_txtAno").val();
            var reg = /\d+/g;
            if (reg.test(ano)) {
                return true;
            } else {
                return false;
            }
        }


    </script>
</asp:Content>
