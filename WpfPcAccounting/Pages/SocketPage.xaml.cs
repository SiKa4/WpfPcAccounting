using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
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
using Socket = WpfPcAccounting.Model.Socket;

namespace WpfPcAccounting.Pages
{
    /// <summary>
    /// Логика взаимодействия для SocketPage.xaml
    /// </summary>
    public partial class SocketPage : Page
    {
        public SocketPage()
        {
            InitializeComponent();
            ListSocket.ItemsSource = DBConnection.DB.Socket.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtName.Text != String.Empty)
            {
                Socket newSocket = new Socket()
                {
                      Socket_name = txtName.Text
                };
                DBConnection.DB.Socket.Add(newSocket);
                DBConnection.DB.SaveChanges();
                txtName.Text = String.Empty;
                ListSocket.ItemsSource = DBConnection.DB.Socket.ToList();
            }
        }
    }
}
