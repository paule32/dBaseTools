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
#define MainMenuTop    0
#define MainMenuBottom 1

class TMainMenu(cParent) of PaintBox(cParent) custom
  
  this.Position = 0  // Top
  
  with (this)
    ? "TMainMenu: init"
	 onSize       := class::MainMenu_onSize
	 BorderStyle  := 8  // modal
	 left         := 0
	 Height       := 32
	 Width        := cParent.Width
	 colorNormal  := "0x80ffff/B+"
	 
	 if (this.Position == MainMenuTop)
	   top := 0
	 else
	   top := cParent.Height - this.Height
	 endif
  endwith
  
  function MainMenu_onSize
    this.Width := cParent.Width
  return
  
endclass
