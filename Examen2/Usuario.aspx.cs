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
    public partial class Usuario : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM USUARIO"))
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
            int resultado = CLASES.ClaseUsuario.Agregar(tnombre.Text, tcorreo.Text, ttelefono.Text);

            if (resultado > 0)
            {
                alertas("Usuario ha sido agregado con exito");
                tnombre.Text = string.Empty;
                tcorreo.Text = string.Empty;
                ttelefono.Text = string.Empty;

                LlenarGrid();
            }
            else
            {
                alertas("Error al agregar el usuario");

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseUsuario.Borrar(int.Parse(tid.Text));
            
            if (resultado > 0)
            {
                alertas("Usuario ha sido borrado con exito");
                tid.Text = string.Empty;
                

                LlenarGrid();
            }
            else
            {
                alertas("Error al borrar el usuario");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseUsuario.Modificar(int.Parse(tid.Text), tnombre.Text, tcorreo.Text,ttelefono.Text);

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

        protected void Button4_Click(object sender, EventArgs e)
        {
            int resultado = CLASES.ClaseUsuario.Consultar(int.Parse(tid.Text));

            if (resultado > 0)
            {
                
                tid.Text = string.Empty;


                
            }
            else
            {
                alertas("Error al consultar el usuario");

            }
        }
    }
}