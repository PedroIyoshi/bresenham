class Bresenham{
  boolean md;
  int p, f, i, ix, iy, size = 3;
  color c = color(0, 0, 0);
  int[] x = new int[3];
  int[] y = new int[3];
  int[] d = new int[2];
  Bresenham(int x, int y){
    this.x[1] = x;
    this.y[1] = y;
  }
  
  void setWeight(int n){
    this.size = n; 
  }
  
  void setColor(color c){
    this.c = c;
  }
  
  void setValues(int x2, int y2){
    this.x[2] = x2;
    this.y[2] = y2;
    this.d[ix] = this.x[2] - this.x[1];
    this.d[iy] = this.y[2] - this.y[1];
    this.md = max(this.d[ix], this.d[iy]) == this.d[ix];
    if(this.md){
      this.ix = 0;
      this.iy = 1;
      this.f = max(this.x[1], this.x[2]);
    }else{
      this.ix = 1;
      this.iy = 0;
      this.f = max(this.y[1], this.y[2]);
    }
    this.p = 2 * this.d[iy] - this.d[ix];
    if(this.f == this.x[1])this.i = 2;
    else this.i = 1;
    this.x[0] = this.x[this.i];
    this.y[0] = this.y[this.i]; 
  }
  
  private void calcP(){
    if(this.p < 0) this.p += 2 * this.d[1]; 
    else{
      this.p += 2 * (this.d[1] - this.d[0]);
      if(this.md) this.y[0]++;
      else this.x[0]++;
    }
  }
  
  void show(){
    strokeWeight(0);
    while((this.x[0] < this.f && this.md) || (!this.md && this.y[0] < this.f)){
      calcP();
      if(this.md) this.x[0]++;
      else this.y[0]++;
      fill(c);
      square(this.x[0], this.y[0], size);
    }
  }
}
