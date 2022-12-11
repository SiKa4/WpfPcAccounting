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
    /// Логика взаимодействия для GpuPage.xaml
    /// </summary>
    public partial class GpuPage : Page
    {
        public GpuPage()
        {
            InitializeComponent();
            ListGPU.ItemsSource = DBConnection.DB.GPU.ToList();
            ComboBoxType.ItemsSource = DBConnection.DB.Type_Video_Memory.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty && txtMemory.Text != String.Empty && ComboBoxType.SelectedItem != null)
            {
                GPU newGpu = new GPU()
                {
                     Serial_name = txtName.Text,
                      Type_Video_Memory = (Type_Video_Memory)ComboBoxType.SelectedItem,
                       Video_memory = int.Parse(txtMemory.Text)
                };
                DBConnection.DB.GPU.Add(newGpu);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                txtMemory.Text = String.Empty;
                ComboBoxType.SelectedItem = null;
                ListGPU.ItemsSource = DBConnection.DB.GPU.ToList();
            }
        }

        private void txtMemory_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }
    }
}
