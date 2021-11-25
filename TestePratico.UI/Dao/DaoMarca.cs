using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TestePratico.UI.Domain;

namespace TestePratico.UI.Dao
{
    public class DaoMarca : DaoBase
    {
        public void CadastrarMarca(Marca marca)
        {
            string cmd = $"Insert into Marcas (nome) values ('{marca.NomeMarca}')";
            ComandoBd(cmd);
        }

        public void DeletarMarca(int marcaId)
        {
            string cmd = $"Delete from Marcas where MarcaId = {marcaId}";
            ComandoBd(cmd);
        }

        public void AtualizarVeiculo(Marca marca, int marcaId)
        {
            string cmd = $"Update Marcas set Nome = '{marca.NomeMarca}'where MarcaId = {marcaId}";
            ComandoBd(cmd);
        }
    }
}