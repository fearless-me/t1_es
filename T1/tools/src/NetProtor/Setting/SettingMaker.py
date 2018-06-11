# -*- coding: cp936 -*-

'''
Created on 2014-3-3

@author: Administrator
'''

import os
import sys
import pysvn



try:
	default_encoding = 'utf-8'
	if sys.getdefaultencoding() != default_encoding:
		reload(sys)
		sys.setdefaultencoding(default_encoding)
	svn_home = os.path.join('..', '..', '..')
	_SettingDefinePath = os.path.join(svn_home, 'Tool', 'NetProtor', 'Setting', 'Setting.h')
	_ClientSettingOutPath = os.path.join(svn_home, 'Client', 'Assets', 'Code', 'Game', 'Modules', 'GameSetting', 'GameSettingDataExtend.cs')
	_ServerSettingOutPath = os.path.join(svn_home, 'server', 'gameserver', 'include', 'common', 'setting.hrl')
	from deps.setting.settingmaker import HrlWriter, CsWriter, PathFinder,MacroReader
except Exception,e:
	print e


def work():
	if os.path.isfile(_SettingDefinePath):
		reader = MacroReader(_SettingDefinePath)
		reader.run()
		if reader.hasReadError():
			print '\nReadError:'
			print reader.getReadError()
		elif reader.hasCheckError():
			print '\nCheckError:'
			print reader.getCheckError()
		else:
			hrl_writer = HrlWriter(_ServerSettingOutPath,
									reader.getBodyList(),
									reader.getServerNeedList(),
									reader.getDefaultValue())
			hrl_writer.write()
			if hrl_writer.hasWriteError():
				print hrl_writer.getWriteError()
            
			cs_writer = CsWriter(_ClientSettingOutPath, reader.getClientBody())
			cs_writer.write()
				
			if hrl_writer.hasWriteError:
				print "\nCongratulate to this step!"

	else:
		print "Can't Find 'Setting.h'!\n"



	
if __name__ == "__main__":
	work()
	
	
