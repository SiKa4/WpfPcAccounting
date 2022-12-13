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
    /// Логика взаимодействия для CoolerPage.xaml
    /// </summary>
    public partial class CoolerPage : Page
    {
        public CoolerPage()
        {
            InitializeComponent();
            ListCooler.ItemsSource = DBConnection.DB.Cooler_CPU.ToList();
            ComboBoxSoket.ItemsSource = DBConnection.DB.Socket.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (txtName.Text != String.Empty && ComboBoxSoket.SelectedItem != null)
            {
                Cooler_CPU newCooler = new Cooler_CPU()
                {
                    Serial_name = txtName.Text,
                    Socket = (Socket)ComboBoxSoket.SelectedItem
                };
                DBConnection.DB.Cooler_CPU.Add(newCooler);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                ComboBoxSoket.SelectedItem = null;
                ListCooler.ItemsSource = DBConnection.DB.Cooler_CPU.ToList();
            }
        }
    }
}
