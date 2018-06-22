#include "Parser.h"
#include "Gen2Erlang.h"

using namespace std;

static const char* ReadMsgFunName[] =
{
	nullptr,											//EFDT_unknown,
	"read_bool",						//EFDT_bool,
	"read_int8",						//EFDT_int8,
	"read_uint8",					//EFDT_uint8,
	"read_int16",					//EFDT_int16,
	"read_uint16",					//EFDT_uint16,
	"read_int32",						//EFDT_int32,
	"read_uint32",						//EFDT_uint32,
	"read_int64",					//EFDT_int64,
	"read_uint64",					//EFDT_uint64,
	"read_float",					//EFDT_float,
	"read_double",					//EFDT_double,
	"read_string",					//EFDT_string,
	nullptr,											//EFDT_custom,
	""
};

static const char* WriteMsgFunName[] =
{
	nullptr,											//EFDT_unknown,
	"write_bool",					//EFDT_bool,
	"write_int8",					//EFDT_int8,
	"write_uint8",					//EFDT_uint8,
	"write_int16",					//EFDT_int16,
	"write_uint16",				//EFDT_uint16,
	"write_int32",						//EFDT_int32,
	"write_uint32",					//EFDT_uint32,
	"write_int64",					//EFDT_int64,
	"write_uint64",				//EFDT_uint64,
	"write_float",					//EFDT_float,
	"write_double",			  //EFDT_double,
	"write_string",				//EFDT_string,
	nullptr,											//EFDT_custom,
	""
};

const std::string& replace_all(std::string&   str, const   std::string&   old_value, const   std::string&   new_value)
{
	std::string::size_type   pos(0);
	while (true) {
		if ((pos = str.find(old_value, pos)) != string::npos)
		{
			str.replace(pos, old_value.length(), new_value);
			pos += new_value.length();
		}
		else
			break;
	}
	return  str;
}

const std::string& makeErlangComment(const std::string& comm, const std::string& typeName = "")
{
	static std::string ess; // warning!!!
	ess = "%% ";
	ess += typeName;
	ess += comm;
	ess = replace_all(ess, "\n", "\n%% ");
	ess += "\n";
	return ess;
}


CGen2Erlang::CGen2Erlang(UINT ProtoVer) : m_ProtoVer(ProtoVer)
{
}


CGen2Erlang::~CGen2Erlang(void)
{
}

void CGen2Erlang::make(const std::string& outFilePath,const std::vector<SourceGenInfo>& vctSGI)
{
	string outPath;
	string filePath;
	vector<string> vctNetCmdStr;
	string cmdListStr;

	if ( outFilePath.empty() )
	{
		filePath = StringUtil::standardisePath( outPath );
	}
	else
	{
		filePath = StringUtil::standardisePath( outFilePath );
	}

	string OutputPath = outFilePath;;
	string fileName = OutputPath + "netmsg.erl";
	FILE* fp = fopen( fileName.c_str(), "r" );
	if(fp)
		fclose(fp);
	else
	{
		OutputPath = outFilePath;
		fileName = OutputPath + "netmsg.erl";
		fp = fopen( fileName.c_str(), "r" );
		if(nullptr == fp)
			OutputPath = outFilePath;
	}
	fileName = OutputPath + "netmsg.hrl";
	fp = fopen( fileName.c_str(), "w" );
	if(fp)
	{
		const char FileHead[] = "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n" \
			"-ifndef(netmsg).\n"\
			"-define(netmsg,1).\n\n";

		char ProtoVer[] = "-define(ProtoVersion,%u).\n\n";

		const char FileTail[] = "-endif. %%NetmsgRecords\n";

		fwrite(FileHead,sizeof(FileHead) - 1,1,fp);
		char Buffer[1024];
		int Len = sprintf_s(Buffer,ProtoVer,m_ProtoVer);
		fwrite(Buffer,Len,1,fp);
		makeRecord(fp,vctSGI,vctNetCmdStr, cmdListStr);
		fwrite(FileTail,sizeof(FileTail) - 1,1,fp);

		fclose(fp);
	}

	fileName = OutputPath + "netmsg.erl";
	fp = fopen(fileName.c_str(),"w");
	if(fp)
	{
		const char FileHead[] = "%%% This File Is AUTO GENERATED, Don't Modify it MANUALLY!!!\n" \
			"-module(netmsg).\n\n"\
			"-compile(nowarn_unused_vars).\n\n"\
			"-include(\"netmsg.hrl\").\n"\
			"-include(\"type.hrl\").\n"\
			"-import(binary_lib, [\n"\
			"\tread_int64/1,\n"\
			"\tread_int32/1,\n"\
			"\tread_int16/1,\n"\
			"\tread_int8/1,\n"\
			"\tread_uint64/1,\n"\
			"\tread_uint32/1,\n"\
			"\tread_uint16/1,\n"\
			"\tread_uint8/1,\n"\
			"\tread_bool/1,\n"\
			"\tread_float/1,\n"\
			"\tread_double/1,\n"\
			"\tread_string/1,\n"\
			"\tread_array/2,\n"\
			"\twrite_int64/1,\n"\
			"\twrite_int32/1,\n"\
			"\twrite_int16/1,\n"\
			"\twrite_int8/1,\n"\
			"\twrite_uint64/1,\n"\
			"\twrite_uint32/1,\n"\
			"\twrite_uint16/1,\n"\
			"\twrite_uint8/1,\n"\
			"\twrite_bool/1,\n"\
			"\twrite_float/1,\n"\
			"\twrite_double/1,\n"\
			"\twrite_string/1,\n"\
			"\twrite_array/2\n]).\n\n"\

			"-export([decode/2, encode/1, name/1, cmd_list/0]).\n\n";

		fwrite(FileHead,sizeof(FileHead) - 1,1,fp);
		makeRead(fp,vctSGI);
		makeWrite(fp, vctSGI);


		string split = "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
		auto Size = vctNetCmdStr.size();
		if (Size > 0)
		{
			fwrite(split.c_str(), split.size(), 1, fp);
			int n = strlen(";\n");
			for (auto i = 0ul; i < Size; ++i)
			{
				const string& str = vctNetCmdStr[i];
				fwrite(str.c_str(), str.size(), 1, fp);
				fwrite(";\n", n, 1, fp);
			}
		}

		const char* Str = "name(MsgID) -> \"ErrorNetMsg_\" ++ erlang:integer_to_list(MsgID).\n\n";
		fwrite(Str, strlen(Str), 1, fp);

		fwrite(split.c_str(), split.size(), 1, fp);
		fwrite(cmdListStr.c_str(), cmdListStr.size(), 1, fp);

		fclose(fp);
	}
}


void CGen2Erlang::makeRecord(FILE* fp, const std::vector<SourceGenInfo>& vctSGI, vector<string>& vctNetCmdStr, string& cmdListStr)
{
	string Record;
	string CmdStr;
	char Buffer[1024];
	char CmdBuffer[1024];
	cmdListStr = "cmd_list()->\n\t[\n";


	auto lastFileIter = (--vctSGI.end());
	for (auto it = vctSGI.begin(); it != vctSGI.end(); it++)
	{
		const SourceGenInfo& SGI = *it;
		auto isFirst = true;
		for (auto iter = SGI.meta.cachedMsgDefine.begin(); iter != SGI.meta.cachedMsgDefine.end(); ++iter)
		{
			const MsgDefine& Info = iter->second;
			const char* InfoName = Info.name.c_str();
			auto isLastField = iter == (--SGI.meta.cachedMsgDefine.end());
			if (Info.type != MT_None)
			{
				sprintf_s(Buffer, "%s-define(%s,%d).\n", makeErlangComment(Info.comment).c_str(), InfoName, Info.msgId);
				Record += Buffer;

				sprintf_s(CmdBuffer, "name(?%s) -> \"%s\"", InfoName, InfoName);

				
				if (isFirst) {
					isFirst = false;
					cmdListStr.append("\t\t?").append(InfoName).append("\n");
				}
				else {
					cmdListStr.append("\t\t,?").append(InfoName).append("\n");
				}
				vctNetCmdStr.push_back(CmdBuffer);
			}

			sprintf_s(Buffer, "-record(pk_%s,{", InfoName);
			Record += Buffer;

			size_t size = Info.fields.size();
			for (size_t i = 0; i < size; ++i)
			{
				const Field& field = Info.fields[i];
				string fname = field.name;
				char* p = (char*)fname.data();
				if (p && p[0] >= 'A' && p[0] <= 'Z')
					p[0] += 'a' - 'A';
				const char* defaulVal = defautValue(field.type, field.kind);
				std:string defaulValFor = "";
				if (defaulVal != NULL) {
					defaulValFor = " = ";
					defaulValFor += defaulVal;
				}
				if (i == size - 1)
					sprintf_s(Buffer, "\n\t%s\t%s%s", 
						makeErlangComment(field.comment, field.typeName).c_str(), fname.c_str(), defaulValFor.c_str());
				else
					sprintf_s(Buffer, "\n\t%s\t%s%s,", 
						makeErlangComment(field.comment, field.typeName).c_str(), fname.c_str(), defaulValFor.c_str());

				Record += Buffer;
			}

			Record += "\n}).\n\n";
		}
	}
	cmdListStr.append("\n\t].");
	fwrite(Record.c_str(), Record.size(), 1, fp);
}

void CGen2Erlang::makeRead(FILE* fp,const std::vector<SourceGenInfo>& vctSGI)
{
	string PrivateFun;
	string PublicFun;

	char Buffer[1024];
	for(auto it = vctSGI.begin(); it != vctSGI.end(); it++)
	{
		const SourceGenInfo& SGI = *it;
		// һ������
		for (auto iter = SGI.meta.cachedMsgDefine.begin(); iter != SGI.meta.cachedMsgDefine.end(); ++iter)
		{
			const MsgDefine& Info = iter->second;

			const char* pNameSpace = SGI.nameSpace.c_str();
			const char* pName = Info.name.c_str();

			bool bPublicFun = true;
			printf("read %s\n",pName);
			if(0 == Info.type)
			{
				sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\n"\
					"-spec decode_%s(Bin0) -> { #pk_%s{},LeftBin }\n\twhen Bin0 :: binary(), LeftBin :: binary().\n"\
					"decode_%s(Bin0) ->\n",
					pNameSpace,pName,
					pName,pName,
					pName);
				bPublicFun = false;
			}
			else if(Info.type & MT_ClientToServer)
				sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\ndecode(?%s,Bin0) ->\n",pNameSpace,pName,pName);
			else
				sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\ndecode(?%s,Bin0) ->\n",pNameSpace,pName,pName);

			if(bPublicFun)
				PublicFun += Buffer;
			else
				PrivateFun += Buffer;

			// �����е������ֶ�
			const size_t size = Info.fields.size();
			for (size_t i = 0; i < size; ++i)
			{
				const Field& fd = Info.fields[i];
				if(fd.type == FCT_Array)
				{
					if(fd.fdtype == EFDT_custom)
					{
						sprintf_s(Buffer,"\t{ V_%s, Bin%d } = read_array(Bin%d, fun(X) -> decode_%s( X ) end),\n",fd.name.c_str(),i + 1,i,fd.originalTypeName.c_str());
					}
					else
					{
						const char* pFunName = ReadMsgFunName[fd.fdtype];
						assert(pFunName);
						sprintf_s(Buffer,"\t{ V_%s, Bin%d } = read_array(Bin%d, fun(X) -> %s( X ) end),\n",fd.name.c_str(),i + 1,i,pFunName);
					}
				}
				else
				{
					const char* pFunName = ReadMsgFunName[fd.fdtype];
					if(nullptr == pFunName)
					{
						if(EFDT_custom == fd.fdtype)
						{
							sprintf_s(Buffer,"\t{ V_%s, Bin%d } = decode_%s( Bin%d ),\n",fd.name.c_str(),i + 1,fd.originalTypeName.c_str(),i);
						}
						else
						{
							printf("Error Filed Type[%s][%d]",fd.originalTypeName.c_str(),fd.fdtype);
							system("pause");
							break;
						}
					}
					else
					{
						sprintf_s(Buffer,"\t{ V_%s, Bin%d } = %s( Bin%d ),\n",fd.name.c_str(),i + 1,pFunName,i);
					}
				}

				if(bPublicFun)
					PublicFun += Buffer;
				else
					PrivateFun += Buffer;
			}

			sprintf_s(Buffer,"\t{ #pk_%s {\n",pName);
			if(bPublicFun)
				PublicFun += Buffer;
			else
				PrivateFun += Buffer;

			// ���ֶ����ݸ�ֵ����¼
			for (size_t i = 0; i < size; ++i)
			{
				const Field& fd = Info.fields[i];
				const char* p = fd.name.c_str();
				if(i == size - 1)
					sprintf_s(Buffer,"\t\t%s = V_%s",p,p);
				else
					sprintf_s(Buffer,"\t\t%s = V_%s,\n",p,p);

				if(bPublicFun)
					PublicFun += Buffer;
				else
					PrivateFun += Buffer;
			}
			
			if(bPublicFun)
			{
				sprintf_s(Buffer,"\n\t\t},\n\tBin%d };\n\n",size);
				PublicFun += Buffer;
			}
			else
			{
				sprintf_s(Buffer,"\n\t\t},\n\tBin%d }.\n\n",size);
				PrivateFun += Buffer;
			}
		}
	}

	int pos = PublicFun.rfind(";",PublicFun.size());
	if(pos > 0)
		PublicFun[pos] = '.';

	fwrite(PublicFun.c_str(),PublicFun.size(),1,fp);
	fwrite(PrivateFun.c_str(),PrivateFun.size(),1,fp);
}

void CGen2Erlang::makeWrite(FILE* fp,const std::vector<SourceGenInfo>& vctSGI)
{
	string PrivateFun;
	string PublicFun;

	char Buffer[1024];
	for(auto it = vctSGI.begin(); it != vctSGI.end(); it++)
	{
		const SourceGenInfo& SGI = *it;
		// һ������
		for (auto iter = SGI.meta.cachedMsgDefine.begin(); iter != SGI.meta.cachedMsgDefine.end(); ++iter)
		{
			const MsgDefine& Info = iter->second;

			bool bPublicFun = true;
			const size_t size = Info.fields.size();

			if(0 == Info.type)
			{
				if(0 == size)
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode_%s( #pk_%s{} ) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str(),Info.name.c_str());
				else
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode_%s( #pk_%s{} = P ) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str(),Info.name.c_str());
				bPublicFun = false;
			}
			else if(Info.type & MT_ClientToServer)
			{	if(0 == size)
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode(#pk_%s{}) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str());
				else
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode(#pk_%s{} = P) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str());
			}
			else
			{
				if(0 == size)
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode(#pk_%s{}) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str());
				else
					sprintf_s(Buffer,"%%GENERATED from file:%s.h => %s\nencode(#pk_%s{} = P) ->\n",SGI.nameSpace.c_str(),Info.name.c_str(),Info.name.c_str());
			}

			if(bPublicFun)
				PublicFun += Buffer;
			else
				PrivateFun += Buffer;

			// �����е������ֶ�
			for (size_t i = 0; i < size; ++i)
			{
				const Field& fd = Info.fields[i];
				const char* fdName = fd.name.c_str();
				if(fd.type == FCT_Array)
				{
					if(fd.fdtype == EFDT_custom)
						sprintf_s(Buffer,"\tBin_%s = write_array(P#pk_%s.%s, fun(X) -> encode_%s( X ) end),\n",fdName,Info.name.c_str(),fdName,fd.originalTypeName.c_str());
					else
					{
						const char* pFunName = WriteMsgFunName[fd.fdtype];
						assert(pFunName);
						sprintf_s(Buffer,"\tBin_%s = write_array(P#pk_%s.%s, fun(X) -> %s( X ) end),\n",fdName,Info.name.c_str(),fdName,pFunName);
					}
				}
				else
				{
					const char* pFunName = WriteMsgFunName[fd.fdtype];
					if(nullptr == pFunName)
					{
						if(EFDT_custom == fd.fdtype)
						{
							sprintf_s(Buffer,"\tBin_%s = encode_%s( P#pk_%s.%s ),\n",fdName,fd.originalTypeName.c_str(),Info.name.c_str(),fdName);
						}
						else
						{
							printf("Error Filed Type[%s][%d]",fd.originalTypeName.c_str(),fd.fdtype);
							system("pause");
							break;
						}
					}
					else
					{
						sprintf_s(Buffer,"\tBin_%s = %s( P#pk_%s.%s ),\n",fdName,pFunName,Info.name.c_str(),fdName);
					}
				}

				if(bPublicFun)
					PublicFun += Buffer;
				else
					PrivateFun += Buffer;
			}

			if(bPublicFun)
			{
				if(size > 0)
					sprintf_s(Buffer,"\t[\n\t\t<<?%s:?U16>>,\n",Info.name.c_str());
				else
					sprintf_s(Buffer,"\t[\n\t\t<<?%s:?U16>>\n",Info.name.c_str());
				PublicFun += Buffer;
			}
			else
			{
				sprintf_s(Buffer,"\t[\n");
				PrivateFun += Buffer;
			}

			for (size_t i = 0; i < size; ++i)
			{
				const Field& fd = Info.fields[i];
				const char* p = fd.name.c_str();
				if(i == size - 1)
					sprintf_s(Buffer,"\t\tBin_%s",p);
				else
					sprintf_s(Buffer,"\t\tBin_%s,\n",p);
			
				if(bPublicFun)
					PublicFun += Buffer;
				else
					PrivateFun += Buffer;
			}

			if(bPublicFun)
			{
				sprintf_s(Buffer,"\n\t];\n\n");
				PublicFun += Buffer;
			}
			else
			{
				sprintf_s(Buffer,"\t\n].\n\n");
				PrivateFun += Buffer;
			}
		}
	}

	sprintf_s(Buffer,"encode(_) -> noMatch.\n\n");
	PublicFun += Buffer;

	fwrite(PublicFun.c_str(),PublicFun.size(),1,fp);
	fwrite(PrivateFun.c_str(),PrivateFun.size(),1,fp);
}
