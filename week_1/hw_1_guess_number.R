# 猜數字遊戲
# 基本功能
# 1. 請寫一個由"電腦隨機產生"不同數字的四位數(1A2B遊戲)
# 2. 玩家可"重覆"猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數

# 額外功能：每次玩家輸入完四個數字後，檢查玩家的輸入是否正確(錯誤檢查)
guess<-0
repeat{
  num<-sample(0:9,4)
  if(num[1]!=0)break
}
t<-0
repeat{
  k<-0
  repeat{
    guess<-scan(file='',what=integer(),n=4)
    for (i in guess){
      if ((i>9)||(i<0)){
        print('輸入錯誤請重新輸入')
        break
      }else{k<-(k+1)}
    }
    if(k==4)break
  }
  
  numn<-num
  t<-t+1
  A<-0
  B<-0
  Bx<-0
  for (i in (1:4)){
    for(j in (1:4)){
      if((guess[i]==num[j])&&(i==j)){
        A<-A+1
        guess[i]<-'x'
      }
    }
  }
  for (i in (1:4)){
    if((guess[i]=='x')||(guess[i]=='y'))next
    for(j in (1:4)){
      if(guess[j]=='x')next
      if(guess[i]==numn[j]){
        Bx<-1
        guess[i]<-'y'
        numn[j]<-'y'
        break
      }
    }
    B<-(B+Bx)
    Bx<-0
  }
  cat(A,'A',B,'B','\n',sep='')
  if(A==4)break
}
cat('猜測次數:',t)
guess<-0
#file='',what=integer(),nmax=4
