#
#  @date : 2021/07/01
#  @author : lzpro
#!/bin/bash

tar_process(){
  echo "tar"
}

untar_process(){
  ls
  read -e -p "input file name: " f_name
  f_len=${#f_name}
  end=${f_name:f_len-3:3}
  echo $end 
  case $end in
     ".xz")
     end=${f_name:f_len-7:7}
     echo "$end"
     if [ $end == ".tar.xz" ]
     then
      sudo tar -xvJf $f_name
     else
      sudo xz -d $f_name
     fi
     ;;
     ".gz")
     end=${f_name:f_len-7:7}
     echo "$end"
     if [ $end == ".tar.gz" ]
     then
      sudo tar -xzvf $f_name
     else
      sudo bunzip2 $f_name
     fi
     ;;
     "tar") sudo tar -xvf $f_name
     ;;
     "bz2")
     end=${f_name:f_len-7:7}
     echo "$end"
     if [ $end == "tar.bz2" ]
     then 
       sudo tar -xjvf $f_name
     else
       sudo bunzip2 $f_name
     fi
     ;;
     "zip")
       sudo unzip $f_name
     ;;
     "rar")
       sudo unrar x $f_name
     ;;
     *) echo "Unknown type"
     ;;
  esac
  echo "funish"
}

#ls -l
#echo -n "What do you want?(1.tar/2.untar):"
#read re
#if [ $re == "1" ]
#then
#  tar_process
#elif [ $re == "2" ] 
#then
  untar_process
#else
#  echo -n "input error"
#fi

