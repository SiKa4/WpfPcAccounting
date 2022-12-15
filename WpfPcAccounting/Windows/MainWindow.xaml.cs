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
using WpfPcAccounting.Pages;
using WpfPcAccounting.Windows;

namespace WpfPcAccounting
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        bool isInventory = false;
        public MainWindow()
        {
            InitializeComponent();
            MainAutiFrame.NavigationService.Navigate(new ListAddedPC());
            ComboFindKode.ItemsSource = DBConnection.DB.Barcode.ToList();
        }

        private void BtnAddNewPC_Click(object sender, RoutedEventArgs e)
        {
            DeleteAndAddPCWindow win = new DeleteAndAddPCWindow(false);
            win.ShowDialog();
            MainAutiFrame.NavigationService.Navigate(new ListAddedPC());
            ComboFindKode.ItemsSource = DBConnection.DB.Barcode.ToList();
        }

        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            if(ComboFindKode.Text != "" && ComboFindKode.Text.Length == 13)
            {
                var temp = Convert.ToInt64(ComboFindKode.Text);
                PC pc = DBConnection.DB.PC.Where(x => x.Barcode.Barcode_Value == temp).FirstOrDefault();
                if (pc != null)
                {
                    DeleteAndAddPCWindow win = new DeleteAndAddPCWindow(pc);
                    win.ShowDialog();
                    MainAutiFrame.NavigationService.Navigate(new ListAddedPC());
                    ComboFindKode.Text = string.Empty;
                }
                else MessageBox.Show("Компьютер не найден!", "Ошибка!!!", MessageBoxButton.OK, MessageBoxImage.Information);       
            }
            else MessageBox.Show("Некорректный формат данных!", "Ошибка!!!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void ComboFindKode_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }

        private void StartInventory_Click(object sender, RoutedEventArgs e)
        {
            if (isInventory)
            {
                StartInventory.Background = null;
                MainAutiFrame.NavigationService.Navigate(new ListAddedPC());
            }
            else
            {
                StartInventory.Background = Brushes.LightGreen;
                MainAutiFrame.NavigationService.Navigate(new InventoryPage(MainAutiFrame));
            }
            isInventory = !isInventory;
        }
    }
}
