# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abelov <abelov@student.42london.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/09 20:47:18 by abelov            #+#    #+#              #
#    Updated: 2024/05/09 20:47:19 by abelov           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL = /bin/bash
.SHELLFLAGS = -xc

ProjectName	:= Embed
ProjectDir	:= DE10liteEmbed
QUARTUS_BIN_PATH	:= "~/intelFPGA_lite/18.1/quartus/bin"

all: build compile

compile:
	cc /dev/null

#https://www.intel.com/content/www/us/en/docs/programmable/683432/22-1/tcl_pkg_flow_ver_1-1_cmd_execute_flow.html
build: clean
	@export PATH="$(QUARTUS_BIN_PATH):${PATH}"
	cd $(ProjectDir)
	quartus_sh --tcl_eval load_package flow \; project_open $(ProjectName) \; execute_flow -compile

clean:
	cd $(ProjectDir) && /bin/rm -rf db incremental_db output_files .qsys_edit $(ProjectName).qws

.ONESHELL: build
.PHONY: all build clean
