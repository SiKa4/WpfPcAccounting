using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using WpfPcAccounting.Code;
using WpfPcAccounting.Model;

namespace WpfPcAccounting.Windows
{
    /// <summary>
    /// Логика взаимодействия для DeleteAndAddPCWindow.xaml
    /// </summary>
    public partial class DeleteAndAddPCWindow : Window
    {
        bool fill;
        bool moreStorage = false;
        PC pc;
        public DeleteAndAddPCWindow(bool fill)
        {
            InitializeComponent();
            this.fill = fill;
            onFill();
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        public DeleteAndAddPCWindow(PC pc)
        {
            InitializeComponent();
            this.fill = true;
            this.pc = pc;
            onFill();
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        void Timer_Tick(object sender, EventArgs e)
        {
            CheckSave();
        }

        public void onFill()
        {
            if(fill)
            {
                ComboBoxSocket.ItemsSource = DBConnection.DB.Socket.ToList();
                ComboBoxSocket.SelectedItem = pc.CPU.Socket;
                txtKode.Text = pc.Barcode.Barcode_Value.ToString();
                txtKode.IsEnabled = false;
                txtName.Text = pc.Serial_name;
                ComboBoxGPU.ItemsSource = DBConnection.DB.GPU.ToList();
                ComboBoxGPU.SelectedItem = pc.GPU;
                ComboBoxPower.ItemsSource = DBConnection.DB.Power_Supply.ToList();
                ComboBoxPower.SelectedItem = pc.Power_Supply;
                ComboBoxRAM.ItemsSource = DBConnection.DB.RAM.ToList();
                ComboBoxRAM.SelectedItem = pc.RAM;
                NumValue = pc.Quantity_RAM;
                ComboBoxStorage.ItemsSource = DBConnection.DB.Storage.ToList();
                ComboBoxTypePC.ItemsSource = DBConnection.DB.Type_PC.ToList();
                ComboBoxTypePC.SelectedItem = pc.Type_PC;

                var temp = pc.PC_Storage.ToList();
                if(temp.Count > 1)
                {
                    moreStorage = true;
                    ListStorage.Visibility = Visibility.Visible;
                    foreach(var i in temp)
                    {
                        ListStorage.Items.Add(DBConnection.DB.Storage.Where(x => x.id_Storage == i.id_Storage).FirstOrDefault());
                    }
                }
                else
                {
                    ComboBoxStorage.ItemsSource = DBConnection.DB.Storage.ToList();
                    ComboBoxStorage.SelectedItem = temp.FirstOrDefault().Storage;
                }
                onFillComboSocket(true);
            }
            else
            {
                ComboBoxGPU.ItemsSource = DBConnection.DB.GPU.ToList();
                ComboBoxPower.ItemsSource = DBConnection.DB.Power_Supply.ToList();
                ComboBoxRAM.ItemsSource = DBConnection.DB.RAM.ToList();
                ComboBoxSocket.ItemsSource = DBConnection.DB.Socket.ToList();
                ComboBoxStorage.ItemsSource = DBConnection.DB.Storage.ToList();
                ComboBoxTypePC.ItemsSource = DBConnection.DB.Type_PC.ToList();
                onFillComboSocket(false);
            }
        }

        public void onFillComboSocket(bool isTrue)
        {
            ComboBoxMatherboard.IsEnabled = isTrue;
            ComboBoxCooler.IsEnabled = isTrue;
            ComboBoxCPU.IsEnabled = isTrue;
        }

        private void ComboBoxSocket_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Model.Socket temp = (Model.Socket)ComboBoxSocket.SelectedItem;
            onFillComboSocket(true);
            ComboBoxCooler.ItemsSource = DBConnection.DB.Cooler_CPU.Where(x => x.id_Socket == temp.id_Socket).ToList();
            ComboBoxCPU.ItemsSource = DBConnection.DB.CPU.Where(x => x.id_Socket == temp.id_Socket).ToList();
            ComboBoxMatherboard.ItemsSource = DBConnection.DB.Motherboard.Where(x => x.id_Socket == temp.id_Socket).ToList();
            if(pc != null)
            {
                ComboBoxCooler.SelectedItem = pc.Cooler_CPU;
                ComboBoxCPU.SelectedItem = pc.CPU;
                ComboBoxMatherboard.SelectedItem = pc.Motherboard;
            }
        }

        //-------------numerik
        private int _numValue = 1;

        public int NumValue
        {
            get { return _numValue; }
            set
            {
                _numValue = value;
                txtNum.Text = value.ToString();
            }
        }

        private void cmdUp_Click(object sender, RoutedEventArgs e)
        {
            NumValue++;
        }

        private void cmdDown_Click(object sender, RoutedEventArgs e)
        {
            if (_numValue != 1)
            {
                NumValue--;
            }
        }
        ///////////-----------------
        private void BtnAddStorage_Click(object sender, RoutedEventArgs e)
        {
            moreStorage = true;
            ListStorage.Visibility = Visibility.Visible;
            Storage temp = (Storage)ComboBoxStorage.SelectedItem;
            if (temp != null)
            {
                ListStorage.Items.Add(temp);
            }
        }

        private bool CheckSave()
        {
            if (ComboBoxCooler.SelectedItem != null && ComboBoxCPU.SelectedItem != null &&
                ComboBoxGPU.SelectedItem != null && ComboBoxMatherboard.SelectedItem != null &&
                ComboBoxPower.SelectedItem != null && ComboBoxRAM.SelectedItem != null &&
                ComboBoxSocket.SelectedItem != null && ComboBoxStorage.SelectedItem != null &&
                ComboBoxTypePC.SelectedItem != null && txtKode.Text.Length == 13 && txtName.Text != string.Empty)
            {
                BtnSave.IsEnabled = true;
                return true;
            }
            else BtnSave.IsEnabled = false;
            return false;
        }

        private void ListStorage_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Storage temp = (Storage)ListStorage.SelectedItem;
            if (temp != null) ListStorage.Items.Remove(temp);
            if (ListStorage.Items.Count == 0)
            {
                ListStorage.Visibility = Visibility.Hidden;
                moreStorage = false;
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if(CheckSave() && fill == false)
            {
                Barcode barcode = new Barcode()
                {
                     Barcode_Value = Convert.ToInt64(txtKode.Text)
                };

                PC newPC = new PC()
                {
                    id_PC = barcode.id_Barcode,
                    CPU = (CPU)ComboBoxCPU.SelectedItem,
                    GPU = (GPU)ComboBoxGPU.SelectedItem,
                    Motherboard = (Motherboard)ComboBoxMatherboard.SelectedItem,
                    RAM = (RAM)ComboBoxRAM.SelectedItem,
                    Power_Supply = (Power_Supply)ComboBoxPower.SelectedItem,
                    Type_PC = (Type_PC)ComboBoxTypePC.SelectedItem,
                    Cooler_CPU = (Cooler_CPU)ComboBoxCooler.SelectedItem,
                    Quantity_RAM = _numValue,
                    Serial_name = txtName.Text
                };
                DBConnection.DB.Barcode.Add(barcode);
                DBConnection.DB.PC.Add(newPC);
                DBConnection.DB.SaveChanges();
                if (!moreStorage) 
                {
                    PC_Storage newPCStorage = new PC_Storage();
                    newPCStorage.id_Storage = ((Storage)ComboBoxStorage.SelectedItem).id_Storage;
                    newPCStorage.id_PC = newPC.id_PC;
                    DBConnection.DB.PC_Storage.Add(newPCStorage);
                }
                else
                {
                    foreach(var i in ListStorage.Items)
                    {
                        PC_Storage newPCStorage = new PC_Storage()
                        {
                            id_PC = newPC.id_PC,
                            id_Storage = ((Storage)i).id_Storage
                        };
                        DBConnection.DB.PC_Storage.Add(newPCStorage);
                    }
                }
                DBConnection.DB.SaveChanges();
            }
            else if(CheckSave() && fill == true)
            {
                pc.CPU = (CPU)ComboBoxCPU.SelectedItem;
                pc.GPU = (GPU)ComboBoxGPU.SelectedItem;
                pc.Motherboard = (Motherboard)ComboBoxMatherboard.SelectedItem;
                pc.RAM = (RAM)ComboBoxRAM.SelectedItem;
                pc.Power_Supply = (Power_Supply)ComboBoxPower.SelectedItem;
                pc.Type_PC = (Type_PC)ComboBoxTypePC.SelectedItem;
                pc.Cooler_CPU = (Cooler_CPU)ComboBoxCooler.SelectedItem;
                pc.Quantity_RAM = _numValue;
                pc.Serial_name = txtName.Text;

                var temp = DBConnection.DB.PC_Storage.Where(x => x.id_PC == pc.id_PC).ToList();
                foreach(var i in temp)
                {
                    DBConnection.DB.PC_Storage.Remove(i);
                }

                if (!moreStorage)
                {
                    PC_Storage newPCStorage = new PC_Storage();
                    newPCStorage.id_Storage = ((Storage)ComboBoxStorage.SelectedItem).id_Storage;
                    newPCStorage.id_PC = pc.id_PC;
                    DBConnection.DB.PC_Storage.Add(newPCStorage);
                }
                else
                {
                    foreach (var i in ListStorage.Items)
                    {
                        PC_Storage newPCStorage = new PC_Storage()
                        {
                            id_PC = pc.id_PC,
                            id_Storage = ((Storage)i).id_Storage
                        };
                        DBConnection.DB.PC_Storage.Add(newPCStorage);
                    }
                }
                DBConnection.DB.SaveChanges();
            }
            this.Close();
        }

        private void txtKode_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }
    }
}
