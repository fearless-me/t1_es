#coding=utf-8

'''
Created on 2014-3-3

@author: Administrator
'''

import codecs

class Reader(object):
    '''
            检查官
    '''

    def __init__(self, filepath):
        '''
        Constructor
        '''
        self._read_rule_list = []       # 读取规则
        self._read_error_list = []      # 错误行记录列表
        self._check_dict = dict()       # 记录的行， 供查重
        self._check_error_list = []     # 查重记录的行
        
        self._filepath = filepath
        
    def addReadRule(self, startwith, Fun):
        """
        @param : startwith 每行开始字符串
        @type  : string()

        @param : Fun 以此字符串开始的行执行的函数
        @type  : function() 函数参数为string和文件句柄，返回值必须为文件句柄
        """
        self._read_rule_list.append((startwith, Fun))
        
    def hasReadError(self):
        return (False if self._read_error_list == [] else True)
    
    def getReadError(self):
        return self._read_error_list
    
    def _readFile(self):
        fileHandler = open(self._filepath, 'U')         # 支持 '\n' 和 '\r\n' 换行
        try:
            self._line_num = 0
            self._read(fileHandler)                     # 读取文件的每行，并通过 Fun 函数判断           
        except Exception, e:
            self._read_error_list.append("异常记录行[%s]: %s\n" % (self._line_num, e))
        finally:
            fileHandler.close()
            
    def _read(self, fileHandler):
        self._line_num = self._line_num + 1
        print self._line_num
        line = fileHandler.readline()
        if not line:
            return
        line = line.strip()
        lineError = True
        for (flag, Fun) in self._read_rule_list:         # 遍历读取规则
            if line.startswith(flag):
                fileHandler = Fun(line, fileHandler)           # 通过 自己的规则处理文件
                lineError = False
                break
        if lineError == True:                                  # 没有规则处理，则记录在案
            self._read_error_list.append("未作处理行[%s]: %s\n" % (self._line_num, line))
        
        self._read(fileHandler)            
        
    def hasCheckError(self):
        return (False if self._check_error_list == [] else True)

    def getCheckError(self):
        return self._check_error_list

    def check(self, check_text):
        pass
        
    def run(self):
        self._readFile() 
        
        
class Writer(object):
    """
            写手  (写文件基类)
    """

    def __init__(self, filepath, bodyList = []):
        self._filepath = filepath
        self._body_list = bodyList
        self._write_rule_list = []
        self._write_error_list = []

    def hasWriteError(self):
        return (False if self._write_error_list == [] else True)
    
    def getWriteError(self):
        return self._write_error_list

    def writeText(self, text, fileHandler):
        """
                        写入一些不规则文本， 一般在文件开头或结尾
        """
        for line in text:
            fileHandler.write("%s\n" % line)
        return fileHandler

    def write(self):
        f = open(self._filepath, 'wb')
        try:
            pass
            f.write(codecs.BOM_UTF8)
        except Exception,e:
            print e
        finally:
            f.close()
            
        fileHandler = open(self._filepath, "a")
        
        try:
            self.run(fileHandler)
        except Exception, e:
            raise e
        finally:
            fileHandler.close()
            
            
            
    def run(self, fileHandler):
        pass

    def addWriteRules(self, commentFlag, Fun):
        """
        @param : startwith 每行开始字符串
        @type  : string()

        @param : Fun 以此字符串开始的行执行的函数
        @type  : function() 函数参数为string和文件句柄，返回值必须为文件句柄
        """
        self._write_rule_list.append((commentFlag, Fun))    
            
            
    