using System;
using System.Web.UI;
using TestePratico.UI.Dao;
using TestePratico.UI.Domain;

namespace TestePratico.UI
{
    public partial class MarcaUI : System.Web.UI.Page
    {
        DaoMarca _dao;

        public void CarregarDados()
        {
            if (Page.IsPostBack)
            {
                gvMarcas.DataBind();
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnAtualizar.Enabled = false;
            btnExcluir.Enabled = false;
        }

        public void LimparDados()
        {
            txtMarca.Text = "";
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtMarca.Text))
                {
                    lblMsg.Enabled = true;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Favor preencher o campo!";
                }
                else
                {
                    Marca marca = new Marca(txtMarca.Text);

                    _dao = new DaoMarca();
                    _dao.CadastrarMarca(marca);
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
                int idSelecionado = Convert.ToInt32(gvMarcas.SelectedRow.Cells[1].Text);
                _dao = new DaoMarca();
                _dao.DeletarMarca(idSelecionado);
                CarregarDados();
                LimparDados();
            }
            catch (Exception)
            {
                lblMsg.Enabled = true;
                lblMsg.Visible = true;
                lblMsg.Text = "Favor exluir todos os veículos vinculados!";
            }
        }

        protected void gvMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMarca.Text = gvMarcas.SelectedRow.Cells[2].Text;
            btnAtualizar.Enabled = true;
            btnExcluir.Enabled = true;
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtMarca.Text))
                {
                    lblMsg.Enabled = true;
                    lblMsg.Visible = true;
                    lblMsg.Text = "Favor preencher o campo!";
                }
                else
                {
                    Marca marca = new Marca(txtMarca.Text);
                    int idSelecionado = Convert.ToInt32(gvMarcas.SelectedRow.Cells[1].Text);
                    _dao = new DaoMarca();
                    _dao.AtualizarVeiculo(marca, idSelecionado);
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
                lblMsg.Text = "Favor selecionar uma marca!";
            }



        }
    }
}