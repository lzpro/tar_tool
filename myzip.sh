# author : lzpro
# date   : 2021-07-01
#!/bin/bash
echo "input you zip file"
read -e -p "file/folder name:" f_name
echo "which type do you want to zip: (1.zip/2.rar/3.tar.gz/4.tar.bz2)"
read f_type
f_top=${f_name%.*}
#echo $f_top
case $f_type in
     1)
     end=".zip"
     file=$f_top$end 
     sudo zip -q -r $file $f_name
     ;;
     2)
     end=".rar"
     file=$f_top$end
     sudo rar a $file $f_name 
     ;;
     3)
     end=".tar.gz"
     file=$f_top$end
     sudo tar -zcvf $file $f_name
     ;;
     4)
     end=".tar.bz2"
     file=$f_top$end
     sudo tar -jcvf $file $f_name
     ;;
     *)  echo "input error"
     ;;
esac 
echo "funish"


