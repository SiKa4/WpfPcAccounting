using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using WpfPcAccounting.Code;
using WpfPcAccounting.Model;

namespace WpfPcAccounting.Pages
{
    /// <summary>
    /// Логика взаимодействия для TypePage.xaml
    /// </summary>
    public partial class TypePage : Page
    {
        public TypePage()
        {
            InitializeComponent();
            ListType.ItemsSource = DBConnection.DB.Type_PC.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(txtType.Text != string.Empty)
            {
                Type_PC newType = new Type_PC()
                {
                     Name_type = txtType.Text
                };
                DBConnection.DB.Type_PC.Add(newType);
                DBConnection.DB.SaveChanges();
                ListType.ItemsSource = DBConnection.DB.Type_PC.ToList();
                txtType.Text = string.Empty;
            }
        }
    }
}
