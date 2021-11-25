using System;
using System.Web.UI;
using TestePratico.UI.Dao;
using TestePratico.UI.Domain;

namespace TestePratico.UI
{
    public partial class Veiculos : System.Web.UI.Page
    {
        DaoCarro _dao;

        public void LimparDados()
        {
            txtAno.Text = "";
            txtCor.Text = "";
            txtModelo.Text = "";
            ddlMarca.SelectedValue = ddlMarca.Items[0].ToString();
        }
        public void CarregarDados()
        {
            if (Page.IsPostBack)
            {
                gvCarros.DataBind();
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnExcluir.Enabled = false;
            btnAtualizar.Enabled = false;
        }
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtModelo.Text) || string.IsNullOrWhiteSpace(txtAno.Text) || string.IsNullOrWhiteSpace(txtCor.Text))
                {
                    lblMsg.Enabled = true;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Favor preencher todos os campos!";
                }
                else
                {
                    Carro carro = new Carro(txtModelo.Text,
                                            txtAno.Text,
                                            txtCor.Text,
                                            ddlMarca.SelectedValue.ToString());
                    _dao = new DaoCarro();

                    _dao.CadastrarVeiculo(carro);
                    lblMsg.Enabled = false;
                    lblMsg.Visible = false;
                    CarregarDados();
                    LimparDados();
                }
            }
            catch (Exception)
            {
                lblMsg.Enabled = true;
                lblMsg.Visible = true;
                lblMsg.Text = "Não foi possível cadastrar!";
            }

        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                int idSelecionado = Convert.ToInt32(gvCarros.SelectedRow.Cells[1].Text);
                _dao = new DaoCarro();
                _dao.DeletarVeiculo(idSelecionado);
                CarregarDados();
                LimparDados();
            }
            catch (Exception)
            {
                lblMsg.Enabled = true;
                lblMsg.Visible = true;
                lblMsg.Text = "Não foi possível excluir!";
            }

        }

        protected void gvCarros_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtModelo.Text = gvCarros.SelectedRow.Cells[2].Text;
            txtAno.Text = gvCarros.SelectedRow.Cells[3].Text;
            txtCor.Text = gvCarros.SelectedRow.Cells[4].Text;
            ddlMarca.SelectedValue = Convert.ToString(ddlMarca.Items.FindByText(gvCarros.SelectedRow.Cells[5].Text));
            btnExcluir.Enabled = true;
            btnAtualizar.Enabled = true;
            CarregarDados();
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtModelo.Text) || string.IsNullOrWhiteSpace(txtAno.Text) || string.IsNullOrWhiteSpace(txtCor.Text))
                {
                    lblMsg.Enabled = true;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Favor preencher todos os campos!";
                }
                else
                {
                    Carro carro = new Carro(txtModelo.Text,
                                       txtAno.Text,
                                       txtCor.Text,
                                       ddlMarca.SelectedValue.ToString());

                    int idSelecionado = Convert.ToInt32(gvCarros.SelectedRow.Cells[1].Text);

                    _dao = new DaoCarro();
                    _dao.AtualizarVeiculo(carro, idSelecionado);
                    lblMsg.Enabled = false;
                    lblMsg.Visible = false;
                    CarregarDados();
                    LimparDados();
                }
            }
            catch (Exception)
            {
                lblMsg.Enabled = true;
                lblMsg.Visible = true;
                lblMsg.Text = "Não foi possível atualizar!";
            }


        }
    }
}
