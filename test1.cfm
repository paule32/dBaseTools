class test1CForm of FORM custom
   with (this)
      height = 16.0
      left = 19.0
      top = 11.3182
      width = 71.2857
      text = ""
   endwith

   this.TREEVIEW1 = new TREEVIEW(this)
   with (this.TREEVIEW1)
      height = 9.5
      left = 1.0
      top = 0.5
      width = 31.0
      colorNormal = "WindowText/0xffff80"
      fontSize = 14.0
      indent = 19
      imageSize = 16
   endwith

   this.TREEVIEW1.TREEITEM1 = new TREEITEM(this.TREEVIEW1)
   with (this.TREEVIEW1.TREEITEM1)
      text = "TREEITEM1"
      expanded = true
   endwith

   this.TREEVIEW1.TREEITEM1.TREEITEM1 = new TREEITEM(this.TREEVIEW1.TREEITEM1)
   with (this.TREEVIEW1.TREEITEM1.TREEITEM1)
      text = "TREEITEM1"
   endwith

   this.TREEVIEW1.TREEITEM1.TREEITEM2 = new TREEITEM(this.TREEVIEW1.TREEITEM1)
   with (this.TREEVIEW1.TREEITEM1.TREEITEM2)
      text = "TREEITEM2"
      bold = true
      checked = true
      image = "resource #51"
      selectedImage = "resource #2"
   endwith

   this.TREEVIEW1.TREEITEM2 = new TREEITEM(this.TREEVIEW1)
   with (this.TREEVIEW1.TREEITEM2)
      text = "TREEITEM2"
   endwith

   this.ACTIVEX1 = new ACTIVEX(this)
   with (this.ACTIVEX1)
      height = 5.5
      left = 34.0
      top = 2.0
      width = 28.0
      borderStyle = 6	// Schattiert
   endwith


endclass

