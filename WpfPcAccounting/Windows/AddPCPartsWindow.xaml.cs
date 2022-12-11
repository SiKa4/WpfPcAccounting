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
using System.Windows.Shapes;
using WpfPcAccounting.Pages;

namespace WpfPcAccounting.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddPCPartsWindow.xaml
    /// </summary>
    public partial class AddPCPartsWindow : Window
    {
        public AddPCPartsWindow()
        {
            InitializeComponent();
        }

        private void ButtonsOpenAddParts_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)sender;
            switch(button.Tag)
            {
                case "Type":
                    MainAutiFrame.NavigationService.Navigate(new TypePage());
                    break;
                case "RAM":
                    MainAutiFrame.NavigationService.Navigate(new RamPage());
                    break;
                case "GPU":
                    MainAutiFrame.NavigationService.Navigate(new GpuPage());
                    break;
                case "Socket":

                    break;
                case "Motherboard":

                    break;
                case "CPU":

                    break;
                case "Cooler":

                    break;
                case "Power":

                    break;
                case "Storage":

                    break;
            }
        }
    }
}
