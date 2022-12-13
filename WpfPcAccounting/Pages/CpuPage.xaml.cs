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
    /// Логика взаимодействия для CpuPage.xaml
    /// </summary>
    public partial class CpuPage : Page
    {
        public CpuPage()
        {
            InitializeComponent();
            ComboBoxSoket.ItemsSource = DBConnection.DB.Socket.ToList();
            ListCpu.ItemsSource = DBConnection.DB.CPU.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && txtFrenquency.Text != String.Empty && txtCores.Text != String.Empty 
                && ComboBoxSoket.SelectedItem != null)
            {
                CPU newCpu = new CPU()
                {
                    Serial_name = txtName.Text,
                    Frequency = txtFrenquency.Text,
                    Cores = int.Parse(txtCores.Text),
                    Socket = (Socket)ComboBoxSoket.SelectedItem
                };
                DBConnection.DB.CPU.Add(newCpu);
                DBConnection.DB.SaveChanges();
                txtCores.Text = String.Empty;
                txtFrenquency.Text = String.Empty;
                txtName.Text = String.Empty;
                ListCpu.ItemsSource = DBConnection.DB.CPU.ToList();
            }
        }

        private void txtCores_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }
    }
}
