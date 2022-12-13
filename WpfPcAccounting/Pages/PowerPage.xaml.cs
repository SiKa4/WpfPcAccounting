using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfPcAccounting.Code;
using WpfPcAccounting.Model;

namespace WpfPcAccounting.Pages
{
    /// <summary>
    /// Логика взаимодействия для PowerPage.xaml
    /// </summary>
    public partial class PowerPage : Page
    {
        public PowerPage()
        {
            InitializeComponent();
            ListPower.ItemsSource = DBConnection.DB.Power_Supply.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && txtPower.Text != string.Empty)
            {
                Power_Supply newPower = new Power_Supply()
                {
                     Serial_name = txtName.Text,
                     Power = int.Parse(txtPower.Text)
                };
                DBConnection.DB.Power_Supply.Add(newPower);
                DBConnection.DB.SaveChanges();
                txtPower.Text = String.Empty;
                txtName.Text = String.Empty;
                ListPower.ItemsSource = DBConnection.DB.Power_Supply.ToList();
            }
        }

        private void txtPower_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }
    }
}
