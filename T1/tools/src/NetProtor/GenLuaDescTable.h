#ifndef __GenLuaDescTable_H__
#define __GenLuaDescTable_H__
#include <string>
#include <vector>
#include <stdio.h>

struct SourceGenInfo;
struct MetaInfo;

class CGenLuaDescTable
{
public:
	CGenLuaDescTable(const std::string& outFilePath, const std::vector<SourceGenInfo>& msgsInfo);

	~CGenLuaDescTable();
    static int version;
private:

	void Generate(const std::string& outFilePath,const std::vector<SourceGenInfo>& msgsInfo);
	void GenerateSubTable(const MetaInfo& meta, std::string st_name, int level, FILE* fp);
    void GenerateSubTable1(const MetaInfo& meta, std::string st_name, int level, int index, FILE* fp);
};



#endif
