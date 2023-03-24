String getLocation(entrada){
  int index = entrada.indexOf("/");
  if(index != null && index != -1){
    index++;
    return entrada.substring(index);
  }
  return "NOT";
}