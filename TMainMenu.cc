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
#include "DBaseControls.h"

/**
 * @brief This is an internal used class for store the information's of
 *        each menu item.
 */
class TCustomMenuItem of Object
  with (this)
    Parent   = 0
    CallBack = class::onCallBack
    Name     = ""
    Tag      = 123
  endwith
  
  this.Control = 0
  
  /**
   * @brief This member function is used as post-Constructor.
   */
  function Create()
    local nElement
	 nElement = this.Parent.Items.Items.Size + 1
	 this.Control = new PushButton(this.Parent)
	 this.Control.Text = this.Name
  return this
  
  /**
   * @brief This member function is used to remove the objects used with this
	*        class to clean the memory that was allocated before.
   */
  function Destroy()
  return
  
  function onCallBack()
    ? "caller call"
  return
endclass

/**
 * @brief This is the public class for handle menu items of any type:
 *        main menu and/or popup menu.
 */
class TMenuItem(cParent) of Object  
  /**
   * @brief This variable stores the items for a menu.
	*        All entries will point to the TMenuItem class
   */
  this.Items  = new Array()
  this.Parent = cParent
  
  /**
   * @brief  This function clears all menu items from the given menu array
	* @param  Nothing
	* @return Nothing
	* @author Jens Kallup
	* @dince  Library Version 1.0.0
   */
  function Clear()
    nDeleted = 0
    // Loop through array backwards
    for nElement = this.Items.Size to 1 step -1
      this.Items.delete( nElement )
		nDeleted++
	 endfor
	 if nDeleted > 0
	   // Discards false elements
      this.Items.Size := this.Items.Size - nDeleted
    endif
  return
  
  /**
   * @brief  This member function add a single one menu item to the list of
	*         existing menu item(s).
	* @param  itemName - a string
	* @return itemNode - a pointer to the item
   */
  function Add(itemName, CallBack)
    local item, len
	 item = new TCustomMenuItem()
	 item.Parent   = this.Parent
	 item.CallBack = CallBack
	 item.Name     = itemName
	 item.Tag      = 4711
	 this.Items.Add(item.Create())
  return item
  
endclass

/**
 * @brief This class is for the Application main menubar. It will be placed
 *        on top of the form.
 *        With the poperty "Position" you can specified where the menubar
 *        will be appear: 0 - top; else: 1 - bottom.
 */
class TMainMenu(cParent) of Container(cParent) custom
  
  this.Items    = new TMenuItem(this)
  this.Position = MainMenuTop
  
  /**
   * @brief This is the constructor code for the class TMainMenu
   */
  with (this)
    ? "TMainMenu: init"	 
	 BorderStyle = 8  // modal
	 left        = 0
	 Height      = MainMenuHeight
	 Width       = cParent.Width
	 colorNormal = "0x80ffff/B+"
    top         = 0
  endwith
  
  /**
   * @brief This member function is used as post-Constructor
   */
  function Create()
    local idx, iLeft, iTop, iGap
	 local btn
  	 ? this.Items.Add("File").Tag
	 ? this.Items.Add("Help").Tag
	 iGap  = 10
	 iLeft = iGap
	 iTop  = 4
	 for idx = 1 to this.Items.Items.Size
	   btn = this.Items.Items[idx].Control
		btn.Width = 50
		btn.Left  = ileft
		btn.Top   = iTop
		iLeft    += btn.Width + iGap
	 endfor
  return this
  
  /**
   * @brief This member function is used to remove the objects used with this
	*        class to clean the memory that was allocated before.
   */
  function Destroy()
  return
  
  /**
   * @brief This member function is used to update the menubar appearences:
	*        position, size, ...
   */
  function Invalidate()
    if (this.Position == MainMenuTop)
	   this.top   = 0
		this.Width = this.parent.Width
	 else
	   this.top   = this.parent.Height - this.Height
		this.Width = this.parent.Width
	 endif
  return
  
endclass
