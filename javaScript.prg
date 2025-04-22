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
#define crlf chr(13)+chr(10)
clear

load dll kernel32

extern stdcall CLONG GetCurrentProcessId( CVOID ) kernel32
plusHandle = ltrim(str(GetCurrentProcessID()))

sc = new OleAutoClient("MSScriptControl.ScriptControl")
sc.language = "JScript"
sc.UseSafeSubset = false

proc = 'NOTEPAD.EXE'

str  = "function getProcesses() {"                       + crlf
str += "  var e = new Enumerator(GetObject('winmgmts:').InstancesOf('Win32_Process'));" + crlf
str += "  var msg = 'Processes';"                        + crlf
str += "  for (;!e.atEnd();e.moveNext()) {"              + crlf
str += "    var p = e.item();"                           + crlf
str += "    var procname = (p.Name) ? p.Name.toLowerCase() : 'unknown';" + crlf
str += "    var handle = (p.Handle) ? p.Handle : 'N/A';" + crlf 
str += "    msg += p.Name + '     ' + p.Handle;"         + crlf
str += "    if (handle != "    + plusHandle + ") {"      + crlf
str += "      if (procname == '" + lower(proc) + "') {"  + crlf
str += "        msg += '  found.';"                      + crlf
str += "      }"                                         + crlf
str += "    }"                                           + crlf
str += "    msg += '\n';"                                + crlf
str += "  }"                                             + crlf
str += "  return msg;"                                   + crlf
str += "}"

sc.AddCode(str)
result = sc.Run("getProcesses")

? result

release object sc
sc = NULL

release dll kernel32
