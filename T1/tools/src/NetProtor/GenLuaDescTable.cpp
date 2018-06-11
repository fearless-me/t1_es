#include "GenLuaDescTable.h"
#include "Parser.h"
using namespace std;

#define VNAME(name) (#name)

int CGenLuaDescTable::version = -1;
CGenLuaDescTable::CGenLuaDescTable(const std::string& outFilePath, const std::vector<SourceGenInfo>& msgsInfo)
{
	Generate(outFilePath, msgsInfo);
}

CGenLuaDescTable::~CGenLuaDescTable()
{

}

string GetEFieldTypeName(EFieldType eType)
{
    string ret = "";
    switch (eType)
    {
    case EFDT_unknown:
        ret = VNAME(EFDT_unknown);
        break;
    case EFDT_bool:
        ret = VNAME(EFDT_bool);
        break;
    case EFDT_int8:
        ret = VNAME(EFDT_int8);
        break;
    case EFDT_uint8:
        ret = VNAME(EFDT_uint8);
        break;
    case EFDT_int16:
        ret = VNAME(EFDT_int16);
        break;
    case EFDT_uint16:
        ret = VNAME(EFDT_uint16);
        break;
    case EFDT_int32:
        ret = VNAME(EFDT_int32);
        break;
    case EFDT_uint32:
        ret = VNAME(EFDT_uint32);
        break;
    case EFDT_int64:
        ret = VNAME(EFDT_int64);
        break;
    case EFDT_uint64:
        ret = VNAME(EFDT_uint64);
        break;
    case EFDT_float:
        ret = VNAME(EFDT_float);
        break;
    case EFDT_double:
        ret = VNAME(EFDT_double);
        break;
    case EFDT_string:
        ret = VNAME(EFDT_string);
        break;
    case EFDT_custom:
        ret = VNAME(EFDT_custom);
        break;
    default:
        break;
    }
    return ret;
}

char GetTypeNameByType(EFieldType eType)
{
    char ret = 'n';
    switch (eType)
    {
    case EFDT_unknown:
        ret = 'n';
        break;
    case EFDT_bool:
        ret = 't';
        break;
    case EFDT_int8:
        ret = 'b';
        break;
    case EFDT_uint8:
        ret = 'B';
        break;
    case EFDT_int16:
        ret = 's';
        break;
    case EFDT_uint16:
        ret = 'S';
        break;
    case EFDT_int32:
        ret = 'i';
        break;
    case EFDT_uint32:
        ret = 'I';
        break;
    case EFDT_int64:
        ret = 'l';
        break;
    case EFDT_uint64:
        ret = 'L';
        break;
    case EFDT_float:
        ret = 'f';
        break;
    case EFDT_double:
        ret = 'd';
        break;
    case EFDT_string:
        ret = 'z';
        break;
    case EFDT_custom:
        ret = 'u';
        break;
    default:
        break;
    }

    return ret;
}

void GetFieldType(const MsgDefine* msg, char* buf)
{
    int count = 0;
    for (size_t i = 0; i < msg->fields.size(); ++i)
    {
        const Field& field = msg->fields[i];
        if(field.type == FCT_Array)
        {
            sprintf(buf, "%s%d", buf, ++count);
        }
        else
        {
            char cType = GetTypeNameByType(field.fdtype);
            sprintf(buf, "%s%c", buf, cType);
        }
        
        if(i == msg->fields.size() - 1)
        {
            sprintf(buf, "%s\",\n", buf);
        }
    }
}

void GetFieldName(const MsgDefine* msg, char* buf)
{
    for (size_t i = 0; i < msg->fields.size(); ++i)
    {
        const Field& field = msg->fields[i];

        if(field.type == FCT_Array)
        {
            sprintf(buf, "%s$%s", buf, field.name.c_str());
        }
        else
        {
            sprintf(buf, "%s%s", buf, field.name.c_str());
        }
        if(i != msg->fields.size() - 1)
        {
            sprintf(buf, "%s,", buf);
        }
        else
        {
            sprintf(buf, "%s,", buf);
        }
    }
}

void WriteToFile(FILE* fp, char* s)
{
    printf("%s", s);
    fwrite(s, sizeof(char), strlen(s), fp);
}

void CGenLuaDescTable::GenerateSubTable1(const MetaInfo& meta, std::string st_name, int level, int index, FILE* fp)
{
    auto mit = meta.cachedMsgDefine.find(st_name);
    const MsgDefine* msg = (mit != meta.cachedMsgDefine.end() ? &(mit->second) : NULL );
    if (fp)
    {
        char buf[512] = {0};
        std::string tab;
        int counter = 0;
        while (counter++ < level)
        {
            tab += "\t";
        }
        //field
        if (msg)
        {
            if(msg->fields.size() == 0)
            {
                return;
            }
            if(level != 1)
            {
                sprintf(buf, "%s[%d] = {\n%s\tfields = \"", tab.c_str(), index, tab.c_str());
                WriteToFile(fp, buf);
            }
            else
            {
                sprintf(buf, "%s\tfields = \"", tab.c_str());
                WriteToFile(fp, buf);
            }
            memset(buf, 0, sizeof(buf));
            GetFieldName(msg, buf);
            GetFieldType(msg, buf);
            WriteToFile(fp, buf);
            int count = 0;
            for (size_t i = 0; i < msg->fields.size(); ++i)
            {
                const Field& field = msg->fields[i];
                if(field.fdtype == EFDT_custom)
                {
                    GenerateSubTable1(meta, field.typeName, level + 1, ++count, fp);
                }
            }
            if(level != 1)
            {
                sprintf(buf, "%s},\n", tab.c_str());
                WriteToFile(fp, buf);
            }
        }
    }
}

void CGenLuaDescTable::GenerateSubTable(const MetaInfo& meta, std::string st_name, int level, FILE* fp)
{
	auto mit = meta.cachedMsgDefine.find(st_name);
	const MsgDefine* msg = (mit != meta.cachedMsgDefine.end() ? &(mit->second) : NULL );
	if (fp)
	{
		char buf[128] = {0};
		std::string tab;
		int counter = 0;
		while (counter++ < level)
		{
			tab += "\t";
		}
		//field
		if (msg)
		{
			for (size_t i = 0; i < msg->fields.size(); ++i)
			{
				const Field& field = msg->fields[i];

				if (field.type == FCT_Array)
				{
					auto submit = meta.cachedMsgDefine.find(field.typeName);
					const MsgDefine* submsg = (submit != meta.cachedMsgDefine.end() ? &(submit->second) : NULL );
					
					if (submsg)
					{
						//printf("%s\t%s = \n%s\t{ \n%s\t\t{\n", tab.c_str(), field.name.c_str(), tab.c_str(), tab.c_str());

						sprintf(buf, "%s\t%s = \n%s\t{ \n%s\t\t{\n", tab.c_str(), field.name.c_str(), tab.c_str(), tab.c_str());
						fwrite(buf, sizeof(char), strlen(buf), fp);

						GenerateSubTable(meta, field.typeName, level + 2, fp);

						//printf("%s\t\t} \n%s\t},\n", tab.c_str(), tab.c_str());

						sprintf(buf, "%s\t\t}, \n%s\t},\n", tab.c_str(), tab.c_str());
						fwrite(buf, sizeof(char), strlen(buf), fp);
					}
					else
					{
						//printf("%s\t%s;\n", tab.c_str(), st_name.c_str());
				
						sprintf(buf, "%s\t%s = {\"%s\"},\n", tab.c_str(), field.name.c_str(), field.typeName.c_str());
						fwrite(buf, sizeof(char), strlen(buf), fp);
					}
				}
                else if(field.fdtype == EFDT_custom)
                {
                    //printf("%s\t%s = \n%s\t{\n", tab.c_str(), field.name.c_str(), tab.c_str());
                    sprintf(buf, "%s\t%s = \n%s\t{\n", tab.c_str(), field.name.c_str(), tab.c_str());
                    fwrite(buf, sizeof(char), strlen(buf), fp);

                    GenerateSubTable(meta, field.typeName, level + 1, fp);

                    //printf("%s\t}\n", tab.c_str());
                    sprintf(buf, "%s\t}\n", tab.c_str());
                    fwrite(buf, sizeof(char), strlen(buf), fp);
                }
				else //field.type == FCT_Scalar
				{
					//printf("%s\t%s\t%s;\n", tab.c_str(), field.typeName.c_str(), field.name.c_str());
				
					sprintf(buf, "%s\t%s = \"%s\",\n", tab.c_str(), field.name.c_str(), field.typeName.c_str());
					fwrite(buf, sizeof(char), strlen(buf), fp);
				}
			}//for
		}
		else
		{
			//printf("%s\t%s;\n", tab.c_str(), st_name.c_str());
				
			sprintf(buf, "%s\t\"%s\",\n", tab.c_str(), st_name.c_str());
			fwrite(buf, sizeof(char), strlen(buf), fp);
		}
	}
}

void CGenLuaDescTable::Generate(const std::string& outFilePath, const std::vector<SourceGenInfo>& msgsInfo)
{
	std::string msg_map_head;
    std::string msg_map_content_head;
	std::string msg_map_content;
	std::string msg_ids_define;
	
	msg_map_head += "--BEGIN refrence file declear\n";
	msg_map_content_head += "--BEGIN table for msgs description\n";
	msg_ids_define += "--BEGIN message id define\n";

	msg_map_content_head += "return\n{\n";

	char buf[1024] = {0};
    sprintf (buf, "\t__VERSION__ = %d,\n", version);
    msg_map_content_head += buf;
	printf ("Start generate lua table ...\n");

	for (auto it = msgsInfo.begin();
		it != msgsInfo.end(); 
		it++)
	{
		const SourceGenInfo& info = *it;

		
		printf ("File name: %s:%s\n", info.nameSpace.c_str(), info.fileName.c_str());

		// out put file
		// format: msg_xxx.lua
		std::string filepath = outFilePath + "MSG_" + info.nameSpace + ".lua";

		FILE* fp = fopen(filepath.c_str(), "w+");

		// save to map
		msg_map_head += "local MSG_" + info.nameSpace + " = require \"Net.MSG_" + info.nameSpace + "\"\n";
		msg_ids_define += "\n\n--Begin " + info.nameSpace + "...\n";
		msg_map_content += "\n\n\t--Begin " + info.nameSpace + "...\n";

		//printf ("return {\n");
		sprintf (buf, "return {\n");
		fwrite(buf, sizeof(char), strlen(buf), fp);
		//loop 
		for (std::map< std::string, MsgDefine >::const_iterator mit = info.meta.cachedMsgDefine.begin();
			mit != info.meta.cachedMsgDefine.end();
			++mit)
		{	
			// one msg
			const MsgDefine& msg = mit->second;
			/*
			printf("{name:\t%s\t", msg.name.c_str());
			printf("type:%d\t", msg.type);
			printf("msgId:%d\t", msg.msgId);
			printf("index:%d}\n", msg.index);
			*/

			// MSG_U2GS_BuyItemAtNpcStoreRequest, U2GS_BuyItemAtNpcStoreRequest
			if (msg.type != MT_None)
			{
				std::string luaID = "\tMSG_" + msg.name;

				msg_ids_define += luaID  + " = " + itoa(msg.msgId, buf, 10) + ",\n";
                string str = buf;
				msg_map_content += "\t[" + str  + "] = MSG_" + info.nameSpace + "." + msg.name + ",\n";

				// tabel
				//printf ("\t%s\n", mit->first.c_str());

				// table name
				sprintf (buf, "\t%s = \n", mit->first.c_str());
				fwrite(buf, sizeof(char), strlen(buf), fp);

				{
					//printf("\t{\n");
					sprintf(buf, "\t{\n");
					fwrite(buf, sizeof(char), strlen(buf), fp);
		
					GenerateSubTable1(info.meta, msg.name, 1, 0, fp);

					//printf("\t};\n\n");
					sprintf(buf, "\t},\n\n");
					fwrite(buf, sizeof(char), strlen(buf), fp);
				}
			}			
			
		} // msg field loop
        //printf ("}\n");
        sprintf (buf, "}\n");
        fwrite(buf, sizeof(char), strlen(buf), fp);
		// finish one msg group.
		fclose(fp);
		msg_ids_define += "--End" + info.nameSpace;
		msg_map_content += "\t--End" + info.nameSpace;
	}

	
	// end
	msg_map_head += "--END refrence file declear\n\n";
    msg_ids_define += "--END message id define\n\n";
	msg_map_content += "\n\r}\n --END table for msgs description\n\n";


    msg_map_head += "\n--BEGIN type define\n";
    string str = "\n--";
    for (int i = EFDT_unknown; i <= EFDT_custom; i++)
    {
        msg_map_head += str + GetTypeNameByType(EFieldType(i)) + " = " + GetEFieldTypeName(EFieldType(i));
    }
    msg_map_head += "\n\n--END type define\n\n";
	// map file
	{
		std::string mappath = outFilePath + "MessageType.lua";
		FILE* fp = fopen(mappath.c_str(), "w");

		fwrite(msg_map_head.c_str(), sizeof(char), msg_map_head.length(), fp);

        fwrite(msg_map_content_head.c_str(), sizeof(char), msg_map_content_head.length(), fp);

		fwrite(msg_ids_define.c_str(), sizeof(char), msg_ids_define.length(), fp);
		
		fwrite(msg_map_content.c_str(), sizeof(char), msg_map_content.length(), fp);

		fclose(fp);
	}

	printf ("End generate lua table.\n");
}