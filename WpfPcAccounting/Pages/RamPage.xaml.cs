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
    /// Логика взаимодействия для RamPage.xaml
    /// </summary>
    public partial class RamPage : Page
    {
        public RamPage()
        {
            InitializeComponent();
            ListRAM.ItemsSource = DBConnection.DB.RAM.ToList();
            ComboBoxTypeRam.ItemsSource = DBConnection.DB.Type_RAM.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && txtFrenquency.Text != String.Empty && ComboBoxTypeRam.SelectedItem != null)
            {
                RAM newRam = new RAM()
                {
                     Serial_name = txtName.Text,
                     Type_RAM = (Type_RAM)ComboBoxTypeRam.SelectedItem,
                     Frequency = txtFrenquency.Text
                };
                DBConnection.DB.RAM.Add(newRam);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                txtFrenquency.Text = String.Empty;
                ComboBoxTypeRam.SelectedItem = null;
                ListRAM.ItemsSource = DBConnection.DB.RAM.ToList();
            }
        }
    }
}
