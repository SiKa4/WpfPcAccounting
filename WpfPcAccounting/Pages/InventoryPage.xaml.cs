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
using WpfPcAccounting.Windows;

namespace WpfPcAccounting.Pages
{
    /// <summary>
    /// Логика взаимодействия для InventoryPage.xaml
    /// </summary>
    public partial class InventoryPage : Page
    {
        Inventory inventory;
        Frame MainFrame;
        public InventoryPage(Frame MainFrame)
        {
            InitializeComponent();
            this.MainFrame = MainFrame;
            inventory = new Inventory()
            {
                CreateAt = DateTime.Now
            };
            ComboFindKode.ItemsSource = DBConnection.DB.Barcode.ToList();
            DBConnection.DB.Inventory.Add(inventory);
            DBConnection.DB.SaveChanges();
        }

        private void ComboFindKode_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0)) e.Handled = true;
        }

        private void BtnAddInventory_Click(object sender, RoutedEventArgs e)
        {
            if (ComboFindKode.Text != "" && ComboFindKode.Text.Length == 13)
            {
                var temp = Convert.ToInt64(ComboFindKode.Text);
                PC pc = DBConnection.DB.PC.Where(x => x.Barcode.Barcode_Value == temp).FirstOrDefault();
                if (pc != null)
                {
                    Barcode_Inventory searchBarcodeInventory = DBConnection.DB.Barcode_Inventory.Where(x => x.id_Inventory == inventory.id_Inventory 
                        && x.id_Barcode == pc.Barcode.id_Barcode).FirstOrDefault();
                    if(searchBarcodeInventory == null)
                    {
                        Barcode_Inventory inventory_Barcode = new Barcode_Inventory()
                        {
                            Barcode = pc.Barcode,
                            Inventory = inventory,
                            Count = 1
                        };
                        DBConnection.DB.Barcode_Inventory.Add(inventory_Barcode);
                    }
                    else
                    {
                        searchBarcodeInventory.Count += 1;
                    }
                    DBConnection.DB.SaveChanges();
                    ComboFindKode.Text = string.Empty;
                    ListPC.ItemsSource = DBConnection.DB.Barcode_Inventory.Where(x => x.id_Inventory == inventory.id_Inventory).ToList();
                }
                else MessageBox.Show("Компьютер не найден!", "Ошибка!!!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else MessageBox.Show("Некорректный формат данных!", "Ошибка!!!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void BtnFinishInventory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.NavigationService.Navigate(new ListAddedPC());
        }
    }
}
