# -*- coding: cp936 -*-

'''
Created on 2014-3-3

@author: Administrator
'''

import os
import sys
import pysvn
sys.setrecursionlimit(1000000)



try:
	default_encoding = 'utf-8'
	_ShowUpload = "True"
	_GenServerOnly = "True"
	if sys.getdefaultencoding() != default_encoding:
		reload(sys)
		sys.setdefaultencoding(default_encoding)
	svn_home = os.path.join('..', '..', '..')
	_ErrorCodeDefinePath = os.path.join(svn_home, 'Tool', 'NetProtor', 'ErrorCode', 'ErrorCode.h')
	#_ClientErrorCodeOutPath = os.path.join(svn_home, 'Client', 'Assets', 'Code', 'Game', 'ErrorCode.cs')
	_ClientErrorCodeOutPath = os.path.join(svn_home, 'Client', 'Assets', 'Plugins', 'Client', 'Game', 'ErrorCode.cs')
	_ClientErrorCodeOutPath_Sub = os.path.join(svn_home, 'Client', 'Assets', 'Plugins', 'Client', 'Game', 'ErrorCode.cs')
	_ServerErrorCodeOutPath = os.path.join(svn_home, 'server', 'gameserver', 'include', 'common', 'errorCode.hrl')
	from deps.errorcode.errorcodemaker import HrlWriter, CsWriter, PathFinder, MacroReader, CsWriter_Sub
except Exception,e:
	print e

def work():
	try:
		if os.path.isfile(_ErrorCodeDefinePath):
			reader = MacroReader(_ErrorCodeDefinePath)
			reader.run()
			if reader.hasReadError():
				print '\nReadError:'
				print reader.getReadError()
			elif reader.hasCheckError():
				print '\nCheckError:'
				print reader.getCheckError()
			else:
				if(_GenServerOnly == "True"):					
					try:
						hrl_writer = HrlWriter(_ServerErrorCodeOutPath, reader.getBodyList())
						hrl_writer.write()
						if hrl_writer.hasWriteError():
							print hrl_writer.getWriteError()
						else:
							updateSVN()
					except Exception as ex:
						print ex
						os.system("pause")
						
				if(_GenServerOnly == "False"):
					try:
						cs_writer = CsWriter(_ClientErrorCodeOutPath, reader.getBodyList())
						cs_writer.write()
						if cs_writer.hasWriteError():
							print cs_writer.getWriteError()
						cs_writer_sub = CsWriter_Sub(_ClientErrorCodeOutPath_Sub, reader.getBodyList())
						cs_writer_sub.write()
					except Exception as e:
						print e
						os.system("pause")
		else:
			print "Can't Find 'ErrorCode.h'!\n" + _ErrorCodeDefinePath
	except Exception as exx:
		print exx
		os.system("pause")
	
def updateSVN():
	print "Congratulations to this step!\n\n"
	if (_ShowUpload == "True") :
		Input = raw_input("Would you like to commit it to SVNServer(Y/N)? :")

		if Input.strip().lower().startswith('y'):
			CommitSver = "TortoiseProc.exe /command:commit  /path:\"%s\" /logmsg:\"--- tools auto commit server's errorcode ---\"" % _ServerErrorCodeOutPath
			os.system(CommitSver)
			
			Commiterrorcode = "TortoiseProc.exe /command:commit  /path:\"%s\" /logmsg:\"--- tools auto commit server's errorcode ---\"" % _ErrorCodeDefinePath
			os.system(Commiterrorcode)
			
			'''svn_client = pysvn.Client()
			
			print 'commit %s' % _ErrorCodeDefinePath
			svn_client.checkin( [_ErrorCodeDefinePath], 'PythonTool: commit ErrorCode for ErrorCode.h' )		
		
			print 'commit %s' % _ServerErrorCodeOutPath
			svn_client.checkin( [_ServerErrorCodeOutPath], 'PythonTool: commit ErrorCode for server' )
			
			print 'commit %s' % _ClientErrorCodeOutPath
			svn_client.checkin( [_ClientErrorCodeOutPath], 'PythonTool: commit ErrorCode for client' )

			print 'commit %s' % _ClientErrorCodeOutPath_Sub
			svn_client.checkin( [_ClientErrorCodeOutPath_Sub], 'PythonTool: commit ErrorCode for client' )
			'''
if __name__ == "__main__":
	print sys.argv;	
	argvLen = len(sys.argv);
	print("\n\n============================================\n\n")
	if(argvLen >= 2):
		_GenServerOnly = "False"
		for i,eachArg in enumerate(sys.argv):
			#print "[%d]=%s"%(i, eachArg);
			if (i == 1) :
				_ErrorCodeDefinePath = os.path.dirname(_ErrorCodeDefinePath) + '/' + eachArg;
				print "input Error Code Path : " + _ErrorCodeDefinePath;
			
			if (i == 2) :
				_ClientErrorCodeOutPath_Sub = os.path.dirname(_ClientErrorCodeOutPath_Sub) + '/' + eachArg;
				
			if (i == 3) :
				_ShowUpload = eachArg;
		work()
	else:
		_GenServerOnly = "True"
		work()
	
	
	
