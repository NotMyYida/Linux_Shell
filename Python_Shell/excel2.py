import xlwt
import re
workbook = xlwt.Workbook(encoding='utf-8',style_compression=0)

sheet = workbook.add_sheet('sheet1',cell_overwrite_ok=True)
sheet.write(0,0, 'NAME') # 0 行 0 列
sheet.write(0,1,'Strings')
sheet.write(0,2,'Strings-Es')
sheet.write(0,3,'Strings-Pt')

# txt1 = '中文名字'
# sheet.write(0,1,txt1)
# txt2 = '马克瓦多'
# sheet.write(1,1,txt2)

f = open('string.xml','r')
row = 0
while 1:
    row = row + 1
    str = f.readline()
    # <string (.*)>(.*)</string>
    matchObj = re.match(r'<string (.*)>(.*)</string>',str,re.M|re.I)
    if not matchObj is None :
        print("%s   %s"%(matchObj.group(1),matchObj.group(2)))
        sheet.write(row,0,matchObj.group(1))
        sheet.write(row,1,matchObj.group(2))
    # print(matchObj)
    # print("%s   %s  %s"%(matchObj.group(1),matchObj.group(2),type(matchObj)))
    if not str:
        break


workbook.save('test2.xlsx')

