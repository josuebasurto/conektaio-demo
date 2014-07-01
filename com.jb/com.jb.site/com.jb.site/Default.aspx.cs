using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace com.jb.site
{
    public partial class _Default : System.Web.UI.Page
    {
        public string PublicKey
        {
            get {
                string K_PUBLIC_KEY = "PublicKey";
                System.Configuration.Configuration wc = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(null);
                if (wc.AppSettings.Settings.Count > 0)
                {
                    System.Configuration.KeyValueConfigurationElement customSetting =
                        wc.AppSettings.Settings[K_PUBLIC_KEY];
                    if (customSetting == null)
                        throw new Exception("No esta configurada la propiedad " + K_PUBLIC_KEY);
                    return customSetting.Value;
                }
                else
                    throw new Exception("Error al obtener " + K_PUBLIC_KEY);
            }
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}
