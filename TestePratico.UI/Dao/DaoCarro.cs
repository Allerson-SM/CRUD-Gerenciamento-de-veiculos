using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using TestePratico.UI.Domain;

namespace TestePratico.UI.Dao
{
    public class DaoCarro : DaoBase
    {
        public void CadastrarVeiculo(Carro carro)
        {
            string cmd = $"Insert into Carros (Modelo, Ano, Cor, MarcaId) values ('{carro.Modelo}', {carro.Ano}, '{carro.Cor}', (Select MarcaId from Marcas where Nome = '{carro.Marca}'))";
            ComandoBd(cmd);
        }

        public void DeletarVeiculo(int carroId)
        {
            string cmd = $"Delete from Carros where CarroId = {carroId}";
            ComandoBd(cmd);
        }

        public void AtualizarVeiculo(Carro carro, int carroId)
        {
            string cmd = $"Update Carros set Modelo = '{carro.Modelo}' , Ano = {carro.Ano}, Cor = '{carro.Cor}', MarcaId = (Select MarcaId from Marcas where Nome = '{carro.Marca}') where CarroId = {carroId}";
            ComandoBd(cmd);
        }
    }
}