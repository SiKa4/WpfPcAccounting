using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using WpfPcAccounting.Code;
using WpfPcAccounting.Model;
using WpfPcAccounting.Windows;

namespace WpfPcAccounting.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListAddedPC.xaml
    /// </summary>
    public partial class ListAddedPC : Page
    {
        public ListAddedPC()
        {
            InitializeComponent();
            ListPC.ItemsSource = DBConnection.DB.PC.ToList();
        }

        private void ListPC_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            PC temp = (PC)ListPC.SelectedItem;
            if(temp != null)
            {
                DeleteAndAddPCWindow win = new DeleteAndAddPCWindow(temp);
                win.ShowDialog();
            }
            else MessageBox.Show("Выберите интересующий компьютер!", "Ошибка!", MessageBoxButton.OK);
            ListPC.ItemsSource = DBConnection.DB.PC.ToList();
        }
    }
}
