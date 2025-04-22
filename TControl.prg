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
clear
public form1
form1 = new myFORM("OLE-Control Example")
form1.Open()

class myForm of FORM
  with (this)
	 metric = 6   // Pixels
	 width  = 300
	 height = 200
  endwith
  
  this.panel = new container(this)
  with (this.panel)
    metric = 6  // Pixels
    width  = this.width
    height = this.height
    top    = 0
    left   = 0
  endwith 
  
  this.panel.pb = new PushButton(this.panel, "click")
  with (this.panel.pb)
    metric  = 6  // Pixels
    width   = 120
	 height  = 64
	 top     = 22
	 left    = 22
	 onClick = class::btnClick
  endwith

  function btnClick()
    local hwnd
    hwnd = form.panel.hwnd

    o = new OLEAutoClient("DBase.TControlWrapper")
//	 o.metric = 6  // Pixels
	 o.Left   := 81
	 o.Top    := 81
	 o.Width  := 120
	 o.Height := 42
    o.ShowInParent(hwnd)
  return

endclass
