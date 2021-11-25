using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestePratico.UI.Domain
{
    public class Carro
    {
        public int Id { get; set; }
        public string Modelo { get; set; }
        public string Ano { get; set; }
        public string Cor { get; set; }
        public int MarcaId { get; set; }
        public string Marca { get; set; }

        public Carro(string modelo, string ano, string cor, string marca)
        {
            Modelo = modelo;
            Ano = ano;
            Cor = cor;
            Marca = marca;
        }
    }
}