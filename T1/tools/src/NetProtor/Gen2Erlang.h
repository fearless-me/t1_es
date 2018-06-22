#pragma once

class CGen2Erlang
{
public:
	CGen2Erlang(UINT ProtoVer);
	virtual ~CGen2Erlang(void);

	void	make(const std::string& outFilePath,const std::vector<SourceGenInfo>& vctSGI);

protected:
	void	makeRecord(FILE* fp,const std::vector<SourceGenInfo>& vctSGI,std::vector<std::string>& vctNetCmdStr, std::string& cmdListStr);
	void	makeRead(FILE* fp,const std::vector<SourceGenInfo>& vctSGI);
	void	makeWrite(FILE* fp,const std::vector<SourceGenInfo>& vctSGI);

private:
	UINT m_ProtoVer;
};

