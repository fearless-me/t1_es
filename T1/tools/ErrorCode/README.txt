

ErrorCode生成器

1.在本目录中先修改 ErrorCode.h保存后，运行 ErrorCodeMaker.py即可
2.SVN上传功能需要安装pysvn,请在 Tool/Supported 里面打开安装

如果ErrorCode.h中有错误格式，会有对应行报错提示！请返回修改

如果ErrorCode.h中没有错误格式，会生成C#和Erlang的代码，代码已生成在工程对应路径下，记得上传至SVN哦 ^_^ ^_^

注意ErrorCode.h应该是 UTF-8 无BOM的文件格式，请不要使用windows自带的记事本进行编辑！

______________________________________2017.11.25 Update By Wangshiyu__________________________________________________

ErrorCode.h和ErrorCode.hrl可以通过Python脚本自行提交

客户端文件步骤：

1.使用ExportExcleData_ErrorCodeToExcel，反向导入Excel表
2.打开导表工具，点击导ErrorCode的按钮
3.导表完成后，提交ErrorCode.bt文件和_Locale_text文件即可

！！！！不会生成Cs文件了！！！！