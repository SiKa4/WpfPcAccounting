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
    /// Логика взаимодействия для StoragePage.xaml
    /// </summary>
    public partial class StoragePage : Page
    {
        public StoragePage()
        {
            InitializeComponent();
            ListStorage.ItemsSource = DBConnection.DB.Storage.ToList();
            ComboBoxTypeStorage.ItemsSource = DBConnection.DB.Type_Storage.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && txtAmount.Text != String.Empty 
                && ComboBoxTypeStorage.SelectedItem != null)
            {
                Storage newStorage = new Storage()
                {
                    Amount = int.Parse(txtAmount.Text),
                    Serial_name = txtName.Text,
                    Type_Storage = (Type_Storage)ComboBoxTypeStorage.SelectedItem
                };
                DBConnection.DB.Storage.Add(newStorage);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                txtAmount.Text = String.Empty;
                ComboBoxTypeStorage.SelectedItem = null;
                ListStorage.ItemsSource = DBConnection.DB.Storage.ToList();
            }
        }

        private void txtAmount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }
    }
}
