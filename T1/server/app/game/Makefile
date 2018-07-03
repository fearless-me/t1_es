#配置选项，可以是DEBUG和RELEASE
#后面会添加HIPE相关的编译配置

CONFIG ?= RELEASE

Region ?= chs

#源文件目录
SOURCE_DIR = ./src
SOURCE_DIR += ../deps/dynamic_compile
SOURCE_DIR += ../deps/econfig
SOURCE_DIR += ../deps/eep
SOURCE_DIR += ../deps/fastlog
SOURCE_DIR += ../deps/fly
SOURCE_DIR += ../deps/ranch
SOURCE_DIR += ../deps/recon
SOURCE_DIR += ../deps/pubs
SOURCE_DIR += ../deps/mysql-otp
SOURCE_DIR += ../deps/mysql-otp-poolboy
SOURCE_DIR += ../deps/poolboy

#文件包含目录
INCLUDE_DIR = -I ./include
INCLUDE_DIR += -I ./src/config
INCLUDE_DIR += -I ../deps/pubs/include
INCLUDE_DIR += -I ../deps/pubs/src/net
INCLUDE_DIR += -I ../deps/pubs/src/resource/pack
INCLUDE_DIR += -I ../deps/mysql-otp/include


#需要额外定义的宏
EXT_MICROS := -D'DB_SERVER'

#输出目录
EBIN_DIR := ebin

#以下内容请不要随意修改
ifeq ($(CONFIG),DEBUG)
	FLAGS := +debug_info
else
	FLAGS := -D'RELEASE'
endif

FLAGS += ${EXT_MICROS}
FLAGS += -DRegion="$(Region)"

define walk
$(wildcard $(1)/*.erl) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef

AllFiles = $(call walk, $(SOURCE_DIR))

AllCfgFiles = $(call walk, $(SOURCE_DIR)/config)
AllCfgModFiles = $(call walk, $(SOURCE_DIR)/config/cfg)
SpecRegionCfgFiles = $(call walk, $(SOURCE_DIR)/config/$(Region))

NoCfgFiles = $(filter-out $(AllCfgFiles),$(AllFiles))

NeedAllFiles = $(NoCfgFiles)
NeedAllFiles += $(SpecRegionCfgFiles)
NeedAllFiles += $(AllCfgModFiles)

OBJS = $(patsubst %.erl,%.beam,$(NeedAllFiles))

ERLC = erlc -W $(FLAGS) -o ${EBIN_DIR} $(INCLUDE_DIR)

all: dir compile

clean:
	rm -rf $(EBIN_DIR)

dir:
	mkdir -p $(EBIN_DIR)

compile:${OBJS}

%.beam:%.erl
	${ERLC} $<

