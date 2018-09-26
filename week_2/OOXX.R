ox<-function(qq){
  for(i in 1:3){
    for(j in 1:3){
      at<-((i-1)*3+j)
      if (qq[at]==1){
        cat("O")
      }else if(qq[at]==2){
        cat("X")
      }else{
        cat(' ')
      }
      if((j==3)&&(i!=3) ){
        cat('\n_____\n')
      }else{
        if(j!=3){
          cat('|')
        }
      }
    }
    if(i==3){cat('\n**************\n')}
  }
}

R<-0
qq<-c(0,0,0,0,0,0,0,0,0)

while(R<9){
  cat('Round',R,'\n')
  if(R%%2==0){
    cat("Now is player A's term!")
  }else{
    cat("Now is player B's term!")
  }
  site<-readline('請輸入1~9')
  if (site=='exit'){
    cat('Bye-Bye!!')
    break
  }
  site<-as.integer(site)
  if((site>9)||(site<1)){
    cat('Invalid input! Please re-enter!')
    next
  }
  if(qq[site]!=0){
    cat('This position is already occupied!')
    next
  }
  if(R%%2==0){
    qq[site]<-1
  }else{
    qq[site]<-2
  }
  
  ox(qq)
  
  
  if((qq[1]==qq[2])&&(qq[2]==qq[3])&&(qq[1]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[4]==qq[5])&&(qq[5]==qq[6])&&(qq[4]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[7]==qq[8])&&(qq[8]==qq[9])&&(qq[7]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[1]==qq[4])&&(qq[4]==qq[7])&&(qq[7]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[2]==qq[5])&&(qq[5]==qq[8])&&(qq[8]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[3]==qq[6])&&(qq[6]==qq[9])&&(qq[9]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  if((qq[1]==qq[5])&&(qq[5]==qq[9])&&(qq[9]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
      break
    }else{
      cat('Player B wins!!!')
      break
    }
  }
  if((qq[3]==qq[5])&&(qq[5]==qq[7])&&(qq[7]!=0)){
    if(R%%2==0){
      cat('Player A wins!!!')
    }else{
      cat('Player B wins!!!')
    }
  }
  R<-(R+1)
}

if(R==8){
  cat('End in a draw!!!')
}



