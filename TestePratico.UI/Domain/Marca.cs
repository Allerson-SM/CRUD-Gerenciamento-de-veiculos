using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestePratico.UI.Domain
{
    public class Marca
    {
        public int Id { get; set; }
        public string NomeMarca { get; set; }

        public Marca(string nomeMarca)
        {
            NomeMarca = nomeMarca;
        }
    }
}