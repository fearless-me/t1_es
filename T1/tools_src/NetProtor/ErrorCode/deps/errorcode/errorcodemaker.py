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
        leftline = line.lstrip("//")
        #showinfo = leftline
        if leftline.find('//') > -1:
            showinfo = leftline.split('//')[1].strip()
            leftline = leftline.split('//')[0].strip()
        else:
            showinfo = leftline.strip()
            leftline = ""
            
        if showinfo == "" and leftline == "" :
            return fileHandler
        
        self._body_list.append(("//", leftline, showinfo))
        
        #注释完了必须是枚举值定义
        self._line_num = self._line_num + 1
        line = fileHandler.readline()

        fileHandler = self.ruleSharp(line.strip(), fileHandler)
        
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
            pass
        else:
            fileHandler = self.ruleSharp(leftline, fileHandler)
        return fileHandler
    
    def check(self, check_text):
        if self._check_dict.has_key(check_text):
            self._check_error_list.append("RepeatDefine LINE: %s : %s" % (self._line_num, check_text))
            return False
        else:
            self._check_dict[check_text] = ''
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
    
    def __init__(self, filepath, body_list = []):
        
        self.hrl_head = [
                         "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!",
                         "%%% If you have any questions, please contact to CaiJunJun.",
                         "",
                         "%%% After U use the script, REMEMBER to UPLOAD the NEW files to SVN!!!, 3Q",
                         "",
                         "-author(caijunjun).",
                         "",
                         "",
                         ""
                        ]
        
        self.hrl_tail1 = [
                         "",
                         "-define(ErrorCodeParams,",
                         "        [",
                         ]
                        
        self.hrl_tail2 = [
                         "",
                         "        ]).",
                         "",
                         "%% End Of File!",
                         ""
                         ]
        
        super(HrlWriter, self).__init__(filepath, body_list)
        
        self.addWriteRules("=", self.ruleMacroDefine)
        self.addWriteRules("///", self.ruleFileComment)
        self.addWriteRules("//", self.ruleComment)
        self.addWriteRules("{", self.ruleFirstBrace)
        self.addWriteRules("}", self.ruleSecondBrace)
    
    def ruleMacroDefine(self, fileHandler, args1, args2):
        text = "-define(ErrorCode_%s, %s).\n" % (args1, args2)
        fileHandler.write(text)
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
        
        first = True
        
        for i in range(len(self._body_list)):
            (flag, args1, args2) = self._body_list[i]
            if flag == "//":
                params = re.findall(r'%[iudfsl]', args2)
                real_params = "".join(params)
                real_params = real_params.replace('%', ' ').strip().replace(' ', ',')
                (flag, param_name, num) = self._body_list[i + 1]
                if first:
                    text = "\t\t{%s, [%s]}" % (num, real_params)
                    first = False
                else:
                    text = ",\n\t\t{%s, [%s]}" % (num, real_params)
                fileHandler.write(text)
        
        self.writeText(self.hrl_tail2, fileHandler)

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
        
        self.error_code_head = [
                                "// This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!",
                                "// If you have any questions, please contact to CaiJunJun.",
                                "",
                                "// After U use the script, REMEMBER to UPLOAD the NEW files to SVN!!!, 3Q",
                                "",
                                "",
                                "using System;",
                                "using System.Collections.Generic;",
                                "namespace GameLogic",
                                "{",
                                "",
                                "    public enum ErrorCode",
                                "    {"
                                ]
                        
        self.error_code_tail = [
                                "    }",
                                ""
                                ]
                                
        self.desc_head = [
                            "",
                            "	public partial class ErrorDesc",
                            "	{",
                            "		public class Desc",
                            "		{",
                            "			public string text;",
                            "			public string paramTypes;",
                            "			public DescType enumValue;",
                            "",
                            "			public Desc(string t, string types, DescType value = DescType.Tips )",
                            "			{",
                            "				text = t;",
                            "				paramTypes = types;",
                            "				enumValue = value;",
                            "           }",
                            "       }",
                            "",
                            "       static Dictionary<ErrorCode, Desc> errorDescErrorCode_CHT = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_ENG = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_JPN = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_KOR = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_RUS = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_THA = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_CHS = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_ENU = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_VIE = new Dictionary<ErrorCode, Desc>();",
							"       static Dictionary<ErrorCode, Desc> errorDescErrorCode_VER = new Dictionary<ErrorCode, Desc>();",
                            "",
                            "       static ErrorDesc()",
                            "		{",
							"			InitErrorCode_CHT();",
							"			InitErrorCode_ENG();",
							"			InitErrorCode_JPN();",
							"			InitErrorCode_KOR();",
							"			InitErrorCode_RUS();",
							"			InitErrorCode_THA();",
							"			InitErrorCode_CHS();",
							"			InitErrorCode_ENU();",
							"			InitErrorCode_VIE();",
							"			InitErrorCode_VER();",
							""
                            ]
                            
        self.desc_tail = [
                             "",
                             "		}",
                             "",
                             "		public static Desc GetErrorCodeDesc( ErrorCode code )",
                             "		{",
                             "			Desc desc = null;",
							 "			switch (Database.Localize.language)",
							 "			{",
							 "				case Database.LanguageType.cht: { errorDescErrorCode_CHT.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.eng: { errorDescErrorCode_ENG.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.jpn: { errorDescErrorCode_JPN.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.kor: { errorDescErrorCode_KOR.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.rus: { errorDescErrorCode_RUS.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.tha: { errorDescErrorCode_THA.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.chs: { errorDescErrorCode_CHS.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.enu: { errorDescErrorCode_ENU.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.vietnam: { errorDescErrorCode_VIE.TryGetValue( code, out desc ); } break;",
							 "				case Database.LanguageType.version: { errorDescErrorCode_VER.TryGetValue( code, out desc ); } break;",
                             "			}",							 
                             "			return desc;",
                             "		}",
                             "	}",
                             "}",
                             "//EOF",
                             ""
                            ]
        self.enum_head = [
                            "        }",
                            "",
                            "        public enum DescType",
                            "        {"
                            ]

        
        super(CsWriter, self).__init__(filepath, body_list)
        
        self.addWriteRules("=", self.ruleMacroDefine)
        self.addWriteRules("///", self.ruleComment)
        self.addWriteRules("//", self.ruleComment)
        self.addWriteRules("{", self.ruleFirstBrace)
        self.addWriteRules("}", self.ruleSecondBrace)
        
    def ruleMacroDefine(self,fileHandler, args1, args2):
        fileHandler.write("\t\t%s = %s,\n" % (args1, args2))
        return fileHandler
    
    def ruleFileComment(self, fileHandler, args1, args2):
        fileHandler.write("\t\t// %s\n" % (args1))
        return fileHandler
    
    def ruleComment(self,fileHandler, args1, args2):
        #args1 = unicode(args1, "utf-8")
        #args2 = unicode(args2, "utf-8")
        if args1 == "" and args2 == "":
            text = "\n"
        else:
            text = ("\t\t// %s\n" % (args2)) if args1 == "" else ("\t\t// %s %s\n" % (args1, args2))
        fileHandler.write(text)
        return fileHandler
    
    def ruleFirstBrace(self, fileHandler, args1, args2):
        return fileHandler
    
    def ruleSecondBrace(self, fileHandler, args1, args2):
        return fileHandler
    
    def makeDescString(self, prarm_name, comment_string):
        #prarm_name = unicode(prarm_name, "utf-8")
        #chinese_string = unicode(chinese_string, "utf-8")
        enum_string = re.findall(r'@\([a-zA-Z| ]*\)', comment_string)
        split_string = re.split(r'@\([a-zA-Z| ]*\)', comment_string)
        
        ## 去掉枚举定义后，构建新的注释行（Desc的第一个参数）
        
        comment_string = "".join(split_string)
        comment_string = comment_string.replace("%%", "&&&&")
        
        #构建带有参数个数的注释
        params = re.findall(r'%[iudfsl]', comment_string)
        
        real_params = []
        
        # C#里面的参数
        for i in range(len(params)):
            real_params.append("{%s}" % i)
        splitlist = re.split(r'%[iudfsl]', comment_string)
        
        cs_split_list = []
        cs_split_list.append(splitlist[0])
        for i in range( 1, len(splitlist)):
            cs_split_list.append(real_params[i-1])
            cs_split_list.append(splitlist[i])
            
        comment_string = ''.join(cs_split_list)
        comment_string = comment_string.replace("&&&&", "%")

        ## 参数类型（Desc的第二个参数）
        comment_type_str = "".join(params)
        comment_type_str = comment_type_str.replace("%", " ")
        comment_type_str = comment_type_str.strip()
        comment_type_str = comment_type_str.replace(' ', ',')
        
        ## 枚举值（Desc的第三个参数）
        if len(enum_string) == 0:
            return "\t\t\terrorDesc.Add( ErrorCode.%s, new Desc(\"%s\", \"%s\"));\n" % (prarm_name, comment_string, comment_type_str)
        else:
            enum = re.split(r'[@\(|\)]', enum_string[0])
            
            temp_enum_string = ""
            for i in range(len(enum)):
                enum_value = enum[i].strip()
                if enum_value != "":
                    enum_value = enum_value.capitalize()
                    if len(temp_enum_string) == 0:
                        temp_enum_string = temp_enum_string + "DescType." + enum_value
                    else:
                        temp_enum_string = temp_enum_string + " | DescType." + enum_value
                    
                    if not self.enum_list.has_key(enum_value):
                        self.enum_list[enum_value] = prarm_name
            enum_string = temp_enum_string.strip()
            if enum_string == "":
                return "\t\t\terrorDesc.Add( ErrorCode.%s, new Desc(\"%s\", \"%s\"));\n" % (prarm_name, comment_string, comment_type_str)
            else:
                return "\t\t\terrorDesc.Add( ErrorCode.%s, new Desc(\"%s\", \"%s\", %s));\n" % (prarm_name, comment_string, comment_type_str, enum_string)

    def run(self, fileHandler):
        #写入文件头
        fileHandler = self.writeText(self.error_code_head, fileHandler)
        
        # ErrorCode写入
        for (flag, args1, args2) in self._body_list:
            write_error = True
            for (content_flag, Fun) in self._write_rule_list:
                if flag == content_flag:
                    fileHandler = Fun(fileHandler, args1, args2)
                    write_error = False
                    break
            if write_error == True:
                self._write_error_list.append("NotHandleRule: %s %s %s" % (flag, args1, args2))
        fileHandler = self.writeText(self.error_code_tail, fileHandler)
        
        # 中文转意写入
        fileHandler = self.writeText(self.desc_head, fileHandler)
        #for i in range(0, len(self._body_list)):
        #    (flag, _, args2) = self._body_list[i]
        #    if flag == "//" and args2 != "":
        #        (flag, Cargs1, _) = self._body_list[i+1]
        #        if flag == "=":
        #           desc_string = self.makeDescString(Cargs1, args2)
        #            fileHandler.write(desc_string)
        
        #显示枚举值写入
        self.writeText(self.enum_head, fileHandler)
        fileHandler.write("\t\t\tDefault = 0,")
        if self.enum_list:
            keys = self.enum_list.keys()
            if keys:
                for i in range(len(keys)):
                    fileHandler.write("\n\t\t\t%s = 1 << %s," % (keys[i], i))
        else:
			try:
				fileHandler.write("\n\t\t\t%s = 1 << %s," % ("Tips", 0))
				fileHandler.write("\n\t\t\t%s = 1 << %s," % ("Hide", 1))
				fileHandler.write("\n\t\t\t%s = 1 << %s," % ("Chat", 2))
				fileHandler.write("\n\t\t\t%s = 1 << %s," % ("Msgbox", 3))
				fileHandler.write("\n\t\t\t%s = 1 << %s," % ("Fatal", 4))
			except Exception,e:
				print e
            
        # 写入文件尾
        self.writeText(self.desc_tail, fileHandler)

class CsWriter_Sub(Writer):
    def __init__(self, filepath, body_list = []):
        #枚举值		
        self.enum_list = {}
        
        self.error_code_head = [
                                "// This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!",
                                "// If you have any questions, please contact to CaiJunJun.",
                                "",
                                "// After U use the script, REMEMBER to UPLOAD the NEW files to SVN!!!, 3Q",
                                "",
                                "",
                                "using System;",
                                "using System.Collections.Generic;",
                                "namespace GameLogic",
                                "{",
                                ""
                                ]
        self.desc_head = [
                            "	public partial class ErrorDesc",
                            "	{",
                            "		static void Init" + os.path.split(filepath)[1].split(".")[0] + "()",
                            "		{"
                            ]
							
        self.desc_tail = [
                             "",
                             "       }",
                             "	}",
							 "}",
							 "//EOF"
                            ]
	self.dictName = "errorDesc" + os.path.split(filepath)[1].split(".")[0]
		
        super(CsWriter_Sub, self).__init__(filepath, body_list)
        
        self.addWriteRules("=", self.ruleMacroDefine)
        self.addWriteRules("///", self.ruleComment)
        self.addWriteRules("//", self.ruleComment)
        self.addWriteRules("{", self.ruleFirstBrace)
        self.addWriteRules("}", self.ruleSecondBrace)
        
    def ruleMacroDefine(self,fileHandler, args1, args2):
        fileHandler.write("\t\t%s = %s,\n" % (args1, args2))
        return fileHandler
    
    def ruleFileComment(self, fileHandler, args1, args2):
        fileHandler.write("\t\t// %s\n" % (args1))
        return fileHandler
    
    def ruleComment(self,fileHandler, args1, args2):
        #args1 = unicode(args1, "utf-8")
        #args2 = unicode(args2, "utf-8")
        if args1 == "" and args2 == "":
            text = "\n"
        else:
            text = ("\t\t// %s\n" % (args2)) if args1 == "" else ("\t\t// %s %s\n" % (args1, args2))
        fileHandler.write(text)
        return fileHandler
    
    def ruleFirstBrace(self, fileHandler, args1, args2):
        return fileHandler
    
    def ruleSecondBrace(self, fileHandler, args1, args2):
        return fileHandler
    # 修改为特殊容器
    def makeDescString(self, prarm_name, comment_string):
        #prarm_name = unicode(prarm_name, "utf-8")
        #chinese_string = unicode(chinese_string, "utf-8")
        enum_string = re.findall(r'@\([a-zA-Z| ]*\)', comment_string)
        split_string = re.split(r'@\([a-zA-Z| ]*\)', comment_string)
        
        ## 去掉枚举定义后，构建新的注释行（Desc的第一个参数）
        
        comment_string = "".join(split_string)
        comment_string = comment_string.replace("%%", "&&&&")
        
        #构建带有参数个数的注释
        params = re.findall(r'%[iudfsl]', comment_string)
        
        real_params = []
        
        # C#里面的参数
        for i in range(len(params)):
            real_params.append("{%s}" % i)
        splitlist = re.split(r'%[iudfsl]', comment_string)
        
        cs_split_list = []
        cs_split_list.append(splitlist[0])
        for i in range( 1, len(splitlist)):
            cs_split_list.append(real_params[i-1])
            cs_split_list.append(splitlist[i])
            
        comment_string = ''.join(cs_split_list)
        comment_string = comment_string.replace("&&&&", "%")

        ## 参数类型（Desc的第二个参数）
        comment_type_str = "".join(params)
        comment_type_str = comment_type_str.replace("%", " ")
        comment_type_str = comment_type_str.strip()
        comment_type_str = comment_type_str.replace(' ', ',')
        
        ## 枚举值（Desc的第三个参数）
        if len(enum_string) == 0:
            return "\t\t\t" + self.dictName + ".Add( ErrorCode.%s, new Desc(\"%s\", \"%s\"));\n" % (prarm_name, comment_string, comment_type_str)
        else:
            enum = re.split(r'[@\(|\)]', enum_string[0])
            
            temp_enum_string = ""
            for i in range(len(enum)):
                enum_value = enum[i].strip()
                if enum_value != "":
                    enum_value = enum_value.capitalize()
                    if len(temp_enum_string) == 0:
                        temp_enum_string = temp_enum_string + "DescType." + enum_value
                    else:
                        temp_enum_string = temp_enum_string + " | DescType." + enum_value
                    
                    if not self.enum_list.has_key(enum_value):
                        self.enum_list[enum_value] = prarm_name
            enum_string = temp_enum_string.strip()
            if enum_string == "":
                return "\t\t\t" + self.dictName + ".Add( ErrorCode.%s, new Desc(\"%s\", \"%s\"));\n" % (prarm_name, comment_string, comment_type_str)
            else:
                return "\t\t\t" + self.dictName + ".Add( ErrorCode.%s, new Desc(\"%s\", \"%s\", %s));\n" % (prarm_name, comment_string, comment_type_str, enum_string)

    def run(self, fileHandler):
        #写入文件头
        fileHandler = self.writeText(self.error_code_head, fileHandler)

        # 中文转意写入
        fileHandler = self.writeText(self.desc_head, fileHandler)
        for i in range(0, len(self._body_list)):
            (flag, _, args2) = self._body_list[i]
            if flag == "//" and args2 != "":
                (flag, Cargs1, _) = self._body_list[i+1]
                if flag == "=":
					desc_string = self.makeDescString(Cargs1, args2)
					fileHandler.write(desc_string)
		# 写入文件尾
	fileHandler.write("\n\t\t}")
	fileHandler.write("\n\t}")
	fileHandler.write("\n}")
	fileHandler.write("\n//EOF")
		

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






