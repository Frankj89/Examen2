using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Examen2.CLASES;

namespace Examen2
{
    public partial class Equipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        protected void LlenarGrid() 
        {

            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM EQUIPO"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();
                        }
                    }
                }
            }


        }

        public void alertas(String texto) 
        
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseEquipo.Agregar(ttipo.Text, tmodelo.Text);

            if (resultado > 0)
            {
                alertas("Equipo ha sido agregado con exito");
                ttipo.Text = string.Empty;
                tmodelo.Text = string.Empty;
                

                LlenarGrid();
            }
            else
            {
                alertas("Error al agregar el equipo");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseEquipo.Borrar(int.Parse(tid.Text));

            if (resultado > 0)
            {
                alertas("Equipo ha sido borrado con exito");
                tid.Text = string.Empty;


                LlenarGrid();
            }
            else
            {
                alertas("Error al borrar el equipo");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseEquipo.Modificar(int.Parse(tid.Text), ttipo.Text, tmodelo.Text);

            if (resultado > 0)
            {
                alertas("Equipo ha sido modificado con exito");
                tid.Text = string.Empty;


                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar el equipo");

            }
        }

        protected void Button4_Click(object sender, EventArgs e) 
        {
            int resultado = CLASES.ClaseEquipo.Consultar(int.Parse(tid.Text));

            if (resultado > 0)
            {
                alertas("Usuario ha sido modificado con exito");
                tid.Text = string.Empty;


                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar el usuario");

            }
        }


    }
}