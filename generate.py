"""
解析自定义的数据格式，生成sql插入语言
"""

import sys
import string
import random
import fileinput
import re
from string import Template


def gen_rand(output_type=0, len=5):
    "随机生成固定长度的字符串或者数字"
    # 0 -> str, 1 -> int
    output_type=output_type.lower()
    if output_type == 0 or output_type == 'str':
        return ''.join([random.sample(string.ascii_letters+string.digits, 1)[0] for i in range(len)])
    elif output_type == 1 or output_type == 'int':
        return ''.join([random.sample(string.digits, 1)[0] for i in range(len)])
    elif output_type == 'byte':
        return ''.join([random.sample('01', 1)[0] for i in range(len)])
    else:
        raise TypeError('只能输入0或1')


def gen_sub_func(a):
    're.sub 调用 函数'
    return gen_rand(a[1], int(a[2]))


def gen_pro(input_item):
    "处理标记文本"
    return re.sub(r"{(\w+),(\d+)}", gen_sub_func, input_item)


file = [sys.argv[1] if len(sys.argv) > 1 else input('请输入文件路径')]
del_set = set([' ', ''])


beginofblock = 1
with open('output.sql', 'w') as outputfile:
    for line in fileinput.input(file):
        if line.strip() is '':
            beginofblock = 1
            continue
        else:
            line = line.partition('#')[0].strip()  # 支持注释功能，注释不会被计算做空行
            line = [i for i in line.strip().split(' ') if i not in del_set]
            # print(line)
            if beginofblock:
                if line[0] == 'database':
                    outputfile.write('use '+line[1]+';\n')
                elif line[0] == 'table':
                    tablename, columns = line[1], line[2:]
                    outputfile.write('\n')
                    print()
                else:
                    print('wrong input !!!')
                    exit(1)
            else:
               
                # 如果最后一行满足[*digit]
                sub_columns = line
                times, sub_columns = (int(re.match(
                    r"\*(\d+)$", sub_columns[-1])[1]), sub_columns[:-1]) if re.match(r"\*\d+$", sub_columns[-1]) is not None else (1, sub_columns)

                # test
                # print(sub_columns[-1], re.match(r'\*\d*$', sub_columns[-1]))
                # if times > 1:
                # print(times)
                # test end

                # 多次重复
                for _ in range(times):
                    final_sub_columns = [gen_pro(i) for i in sub_columns]
                    # 生成语句
                    final_sub_columns = [i if i.isdigit() or i[0] ==
                               "'" or i[0] == '"' else "'"+i+"'" for i in final_sub_columns]
                    sql = 'insert into '+tablename + \
                        '('+','.join(columns)+') values(' + \
                          ','.join(final_sub_columns)+');\n'
                    outputfile.write(sql)
                    print(sql,end='')

            beginofblock = 0
