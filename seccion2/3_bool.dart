void main(){


  // ? el signo de interrogacion se usa para decirle que esa variable puede tener valores nulos. no se recomienda usar valores nulos en dart
  
  bool? isActive = null;
  
  if(isActive == null){
    print('isActive es null');
  }else{
    print('isActive no null');
  }
  
}