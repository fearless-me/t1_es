#coding=utf-8
'''
Created on 2014-3-3

Modefied on 2013-7-21

@author: Administrator
'''
from ..base.deps import Reader, Writer

import os
import re
import sys

default_encoding = 'utf-8'

if sys.getdefaultencoding() != default_encoding:
    reload(sys)
    sys.setdefaultencoding(default_encoding)

class MacroReader(Reader):
    '''
            负责宏的查重 和条件检查
    '''
    
    def __init__(self, filepath):
        super(MacroReader, self).__init__(filepath)
        
        self._body_list = []
        self.client_need_list = []
        self.server_need_list = []
        self.default_value_list = []
        
        # 注意规则添加顺序
        self.addReadRule("////", self.ruleFourSlash)
        self.addReadRule("///", self.ruleTripleSlash)
        self.addReadRule("//", self.ruleDoubleSlash)
        self.addReadRule("enum", self.ruleEnum)
        self.addReadRule("{", self.ruleFirstBrace)
        self.addReadRule("}", self.ruleSecondBrace)
        self.addReadRule("", self.ruleSpaceLine)
        
    def getBodyList(self):
        return self._body_list

    def getClientBody(self):
        return self.client_need_list
    
    def getServerNeedList(self):
        return self.server_need_list
    
    def getDefaultValue(self):
        return self.default_value_list
    
    def ruleSharp(self, line, fileHandler):
        """
                        以 "#define"开始的行，表示枚举项
        """
        if line.find("=") > 0 and line.endswith(","):
            macro = line.rstrip(",").strip().split("=")
            if len(macro) == 2:
                macro1 = macro[0].strip()
                macro2 = macro[1].strip()
                if self.check(macro1) and self.check(macro2) and len(macro1) > 0 and len(macro2) > 0:
                    self._body_list.append(("=", macro1, macro2))
                else:
                    self._check_error_list.append("ErrorDefine LINE: %s : %s" % (self._line_num, line))
        elif len(line.split(" ")) == 1 and line.endswith(","):
            macro1 = line.rstrip(",").strip()
            if self.check(macro1):
                num = self.getNearNum()
                self._body_list.append(("=", macro1, str(num+1)))
        else:
            self._check_error_list.append("ErrorDefine LINE: %s : %s" % (self._line_num, line))
        return fileHandler
    
    def ruleFourSlash(self, line, fileHandler):
            """
                            以 "////"开始的行，表示定义文件的注释
            """
            return fileHandler
    
    
    def ruleTripleSlash(self, line, fileHandler):
        """
                        以 "///"开始的行，表示生成文件的注释
        """
        leftline = line.lstrip("///").strip()
        self._body_list.append(("///", leftline, ""))
        return fileHandler
    
    def ruleDoubleSlash(self, line, fileHandler):
        """
                        以 "//"开始的行，表示写入文件的注释
        """
        showinfo = line.lstrip("//").strip()
        leftline = ""
        self._body_list.append(("//", leftline, showinfo))
        
        if showinfo.startswith('(@)') or showinfo.startswith('(*)'):
            IsinsertServer = False;
            if showinfo.startswith('(@)'):
                showinfo = showinfo.lstrip('(@)').strip()
                IsinsertServer = True
            else:
                showinfo = showinfo.lstrip('(*)').strip()
            
            self._line_num = self._line_num + 1
            line = fileHandler.readline().strip()
            

            if line.find("=") > 0 and line.endswith(","):
                macro = line.rstrip(",").strip().split("=")
                if len(macro) == 2:
                    macro1 = macro[0].strip()
                    macro2 = macro[1].strip()
                    if self.filter(macro1) and self.filter(macro2) and len(macro1) > 0 and len(macro2) > 0:
                        self.client_need_list.append((showinfo, macro1, macro2))
                        self.addDefaultValue(macro2, showinfo)
                        if IsinsertServer:
                            self.server_need_list.append((showinfo, macro1, macro2))
                    else:
                        self._check_error_list.append("ErrorDefine LINE: %s : %s" % (self._line_num, line))
            elif len(line.split(" ")) == 1 and line.endswith(","):
                macro1 = line.rstrip(",").strip()
                if self.filter(macro1):
                    num = self.getNearNum()
                    self.client_need_list.append((showinfo, macro1, str(num+1)))
                    self.addDefaultValue(str(num+1), showinfo)
                    if IsinsertServer:
                        self.server_need_list.append((showinfo, macro1, str(num+1)))
            else:
                self._check_error_list.append("ErrorDefine LINE: %s : %s" % (self._line_num, line))
            
            fileHandler = self.ruleSharp(line, fileHandler) 

        return fileHandler
    
    def ruleEnum(self, line, fileHandler):
        """
                        以 "enum"开始的行，表示定义的枚举
        """
#         leftline = line.lstrip("enum").strip()
#         enum = leftline.split(' ')[0].capitalize()
#         self._body_list.append(("enum", enum, ""))
        return fileHandler
    
    def ruleFirstBrace(self, line, fileHandler):
        leftline = line.lstrip("{").strip()
        if len(leftline) == 0:
            self._body_list.append(("{", "", ""))
        else:
            self._read_error_list("NotMatchRules LINE: %s : %s" % (self._line_num, line))
        return fileHandler
    
    def ruleSecondBrace(self, line, fileHandler):
        leftline = line.lstrip("}").strip()
        if leftline == ";":
            self._body_list.append(("}", "", ""))
        else:
            self._read_error_list("NotMatchRules LINE: %s : %s" % (self._line_num, line))
        return fileHandler
    
    def ruleSpaceLine(self, line, fileHandler):
        """
                        空行     ： 跳过
                         错误行：记录在案
        """
        leftline = line.strip()
        if len(leftline) == 0:
			self._body_list.append(("//", "", ""))
        else:
            fileHandler = self.ruleSharp(leftline, fileHandler)
        return fileHandler
    
    def addDefaultValue(self, index, showinfo):
        default_values_list = re.findall(r'(\$[0-9]+)', showinfo)

        if len(default_values_list) > 0:
            default_value = default_values_list[-1]
            digit_value = filter(str.isdigit, default_value)

            self.default_value_list.append((index, digit_value))


    def check(self, check_text):
        if self._check_dict.has_key(check_text):
            self._check_error_list.append("RepeatDefine LINE: %s : %s" % (self._line_num, check_text))
            return False
        else:
            self._check_dict[check_text] = ''
        return True
    
    def filter(self, check_text):
        if self._check_dict.has_key(check_text):
            self._check_error_list.append("RepeatDefine LINE: %s : %s" % (self._line_num, check_text))
            return False
        return True
            
    def getNearNum(self):
        l = len(self._body_list)
        for i in range(l-1, -1, -1):
            (flag, _, num) = self._body_list[i]
            if flag == "=":
                return int(num)
            
        return 0

class HrlWriter(Writer):
    '''
    Erlang 的*.hrl文件写入
    '''
    
    def __init__(self, filepath, body_list = [], server_need_list = [], default_value_list = []):
        
        self.hrl_head = [
                         "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!",
                         "%%% After U use the script, REMEMBER to COMMIT the LATEST files to SVN!!!, 3Q",
                         "",
                         "",
                         "-ifndef(Setting_hrl).",
                         "-define(Setting_hrl, 1).",
                         "",
                         "",
                         "-define(SwitchSettingClose,	false).",
                         "-define(SwitchSettingOpen, 	true).",
						 "",
                         "-define(SettingGetError,	-1).",
                         "",
                         "%% 数值类设置",
                         "-record(valueSet, {",
                         "				   index = 0,",
                         "				   value = 0",
                         "				  }).",
                         "",
                         "",
                         "%% 开关类设置的位数（32位）",
                         "-define(Setting_Switch_BitSize, 32).",
                         ""
                        ]
                        
        self.hrl_tail1 = [
                         "",
                         "%%% ==============================================================",
                         "%%% @doc 玩家能够恢复的设置项的默认值",
                         "%%% ==============================================================",
                         "-define(Setting_Default_Values,",
                         "        ["
                         ]
        
        self.hrl_tail2 = [
                         "",
                         "        ]).",
                         "",
                         "",
                         "%%% ==============================================================",
                         "%%% @doc 服务器需要检测的协议Key",
                         "%%% ==============================================================", 
                         "-define(Setting_Server_Needs,",
                         "        ["
                         ]
        
        self.hrl_tail3 = [
                         "",
                         "        ]).",
                         "",
                         "",
                         "-endif.",
                         "",
                         "% EOF",
                         ""
                         ]
        
        super(HrlWriter, self).__init__(filepath, body_list)

        self._server_need_list = server_need_list
        self._default_value_list = default_value_list
        
        self.addWriteRules("=", self.ruleMacroDefine)
        self.addWriteRules("///", self.ruleFileCommentPlus)
        self.addWriteRules("//", self.ruleComment)
        self.addWriteRules("{", self.ruleFirstBrace)
        self.addWriteRules("}", self.ruleSecondBrace)
    
    def ruleMacroDefine(self, fileHandler, args1, args2):
        text = "-define(Setting_%s, %s).\n" % (args1, args2)
        fileHandler.write(text)
        return fileHandler
    
    def ruleFileCommentPlus(self, fileHandler, args1, args2):
        fileHandler.write("%%%%%% %s\n" % args1)
        return fileHandler
    
    
    def ruleFileComment(self, fileHandler, args1, args2):
        fileHandler.write("%%%% %s\n" % args1)
        return fileHandler
    
    def ruleComment(self, fileHandler, args1, args2):
        #args1 = u"%s" % args1
        #args2 = u"%s" % args2
        if args1 == "" and args2 == "":
            text = "\n"
        else:
            text = ("%%%% %s\n" % (args2)) if args1 == "" else ("%%%% %s %s\n" % (args1, args2))
        #text = "%%%%%s %s\n" % (args1, args2)
        fileHandler.write(text)
        
        return fileHandler
    
    def ruleFirstBrace(self, fileHandler, args1, args2):
        return fileHandler
    
    def ruleSecondBrace(self, fileHandler, args1, args2):
        return fileHandler
            
    def run(self, fileHandler):
        self.writeText(self.hrl_head, fileHandler)
        for (flag, args1, args2) in self._body_list:
            write_error = True
            for (content_flag, Fun) in self._write_rule_list:
                if flag == content_flag:
                    fileHandler = Fun(fileHandler, args1, args2)
                    write_error = False
                    break
            if write_error == True:
                self._write_error_list.append("NotHandleRule: %s %s %s" % (flag, args1, args2))
        self.writeTail(fileHandler)
        
    def writeTail(self, fileHandler):
        self.writeText(self.hrl_tail1, fileHandler)
        
        if len(self._default_value_list) > 0:
            (index, default_value) = self._default_value_list[0]
            fileHandler.write('\t\t {%5s, %s}' % (index, default_value))
            
            for i in range(1, len(self._default_value_list)):
                (index, default_value) = self._default_value_list[i]
                fileHandler.write(',\n\t\t {%5s, %s}' % (index, default_value))
        
        self.writeText(self.hrl_tail2, fileHandler)
        
        if len(self._server_need_list) > 0:
            (comment, macroName, macroValue) = self._server_need_list[0]
            fileHandler.write('\t\t %s' % (macroValue))
        
            for index in range(1, len(self._server_need_list)):
                (comment, macroName, macroValue) = self._server_need_list[index]
                fileHandler.write(',\n\t\t %s' % (macroValue))
        
        self.writeText(self.hrl_tail3, fileHandler)

    def write(self): 
        fileHandler = open(self._filepath, "w")
        
        try:
            self.run(fileHandler)
        except Exception, e:
            raise e
        finally:
            fileHandler.close()


class CsWriter(Writer):
    '''
    C# 的*.cs文件写入
    '''
    def __init__(self, filepath, body_list = []):
        #枚举值
        self.enum_list = {}
        
        self.cs_head = [
                        "// This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!",
                        "// After U use the script, REMEMBER to UPLOAD the NEW files to SVN!!!, 3Q",
                        "",
                        "",
                        "using System;",
                        "using UnityEngine;",
                        "using Network.Messages;",
                        "using System.Collections;",
                        "using System.Collections.Generic;",
                        "",
                        "public partial class GameSettingData : Singleton<GameSettingData>",
                        "{",
						"    // 设置值的位数（32位）",
                        "    private UInt16 Setting_Switch_BitSize = 32;",
                        "",
                        "    public enum GameSettingType : int",
                        "    {"
                        ]
                        
        self.cs_tail1 = [
                        "    }",
                        "",
                        "    // GameSetting Datas",
                        "    public Dictionary<UInt16, UInt32> gameSettingData = new Dictionary<UInt16, UInt32>();",
                        "    public List<UInt16> gameSettingDataList = new List<UInt16>();",
                        "",
                        "}",
                        ""
                        ]


        super(CsWriter, self).__init__(filepath, body_list)


    def run(self, fileHandler):
        #写入文件头
        fileHandler = self.writeText(self.cs_head, fileHandler)
        
        # Setting枚举值写入

        for (showinfo, macroName, macroValue) in self._body_list:
            fileHandler.write('\t\t// %s\n' % showinfo)
            fileHandler.write('\t\t%-32s = %s,\n' % (macroName, macroValue))
            
        fileHandler = self.writeText(self.cs_tail1, fileHandler)

        
        
class PathFinder:
    def __init__(self, in_path = '.', out_path = [".", "."]):
        self.cur_path = os.getcwd()
        self.in_path = os.path.join(self.cur_path, in_path)
        self.in_path = os.path.abspath(self.in_path)
        self.out_path = []
        for path in out_path:
            self.out_path.append(os.path.abspath(os.path.join(self.cur_path, path)))
        
    def find(self):
        if os.path.exists(self.in_path):
            return True
        return False
        
    def getInPath(self):
        return self.in_path
    
    def getOutPath(self):
        return self.out_path






