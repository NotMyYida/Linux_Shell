#!/bin/bash
#author : hqs

function1(){
	for file in `ls`
	do
		if test -f $file
		then
			arr=(${arr[*]} $file)
		fi
	done
	echo ${arr[@]}
}

isSpecifyFileType(){			# 输入两个参数　文件名　和  文件后缀
		if [ $# -gt 2 ];then
			str="$1"
			suffix="$2"
			document="$3"
			#echo ${suffix}　${str} ${document}
			len=${#str}		#文件名的长度
			suffixLen=${#suffix}	#后缀名的长度
			offset=`expr ${len} - ${suffixLen}`
			#echo ${str:${offset}}
			if [ "${str:${offset}}" == "${suffix}" -a ${str} != "classifyFiles.sh" ];then
				if test -e ${document}
				then		# 判断文件是否存在
					`mv ${str} ${document}`
					echo "已移动 ${str} 到 ${document}"
				else
					echo "${document}文件夹不存在"
					`mkdir ${document}`
					`mv ${str} ${document}`
					echo "已移动 ${str} 到 ${document}"
				fi
			fi
		else
			echo '参数个数不正确'			
		fi	
}

functionMain(){
	echo "$1 格式的文件将会被放入　$2"
	for file in `ls`	# 遍历文件
	do
	isSpecifyFileType ${file} $1 $2
	done
}

#isSpecifyFileType "testSH.sh" ".sh"

echo '该脚本用于整理文件'
echo '请输入要归类的文件后缀名　格式:　.XXX　：'
read suffix
echo '请输入移动到的文件夹名(不存在会自动创建)：'
read document

functionMain ${suffix} ${document}



