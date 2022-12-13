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
    /// Логика взаимодействия для MotherboardPage.xaml
    /// </summary>
    public partial class MotherboardPage : Page
    {
        public MotherboardPage()
        {
            InitializeComponent();
            ComboBoxSoket.ItemsSource = DBConnection.DB.Socket.ToList();
            ListMather.ItemsSource = DBConnection.DB.Motherboard.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && ComboBoxSoket.SelectedItem != null)
            {
                Motherboard newMother = new Motherboard()
                {
                    Serial_name = txtName.Text,
                    Socket = (Socket)ComboBoxSoket.SelectedItem
                };
                DBConnection.DB.Motherboard.Add(newMother);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                ComboBoxSoket.SelectedItem = null;
                ListMather.ItemsSource = DBConnection.DB.Motherboard.ToList();
            }
        }
    }
}
