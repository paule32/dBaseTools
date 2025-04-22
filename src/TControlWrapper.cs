// ---------------------------------------------------------------------------------------
// Copyright(c) 2025 Jens Kallup
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files(the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify,
// merge, publish, distribute, sublicense, and /or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following
// conditions :
// 
// The above copyright notice and this permission notice shall be included in all copies
// or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// ---------------------------------------------------------------------------------------
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Forms;
using System;

namespace DBaseButtonOCX
{
    [ComVisible(true)]
    [Guid("bd0ce482-85a3-4e13-a0f2-55f7a531c3d7")]
    [ProgId("DBase.TControlWrapper")]
    [ClassInterface(ClassInterfaceType.None)]
    public class TControlWrapper : UserControl, ITControlWrapper
    {
        [DllImport("user32.dll", SetLastError = true)]
        static extern IntPtr SetParent(IntPtr hWndChild, IntPtr hWndNewParent);
        private Button button;

        public TControlWrapper()
        {
            this.Width = 200;
            this.Height = 100;

            this.button = new Button();
            this.button.Text = "Klick mich";
            this.button.Dock = DockStyle.Fill;
            this.button.Width = 100;
            this.button.Height = 42;
            this.button.Left = 100;
            this.button.Top = 20;
            this.button.Click += new System.EventHandler(this.button_Click);
            this.Controls.Add(button);
        }

        // Wichtig: COM-kompatible Properties
        public new int Left
        {
            get { return base.Left; }
            set { base.Left = value; }
        }

        public new int Top
        {
            get { return base.Top; }
            set { base.Top = value; }
        }

        public new int Width
        {
            get { return base.Width; }
            set { base.Width = value; }
        }

        public new int Height
        {
            get { return base.Height; }
            set { base.Height = value; }
        }
        public void ShowInParent(int parentHwnd)
        {
            // Erstelle Handle, falls noch nicht erzeugt
            this.CreateControl();

            // Setze das neue Parent-Fenster
            SetParent(this.Handle, new IntPtr(parentHwnd));
        }

        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // TControlWrapper
            // 
            this.Name = "TControlWrapper";
            this.Size = new System.Drawing.Size(128, 57);
            this.ResumeLayout(false);

        }

        private void button_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Button clicked!");
        }
    }
}
