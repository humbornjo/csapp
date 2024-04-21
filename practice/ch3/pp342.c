
struct ACE {
  short v;
  struct ACE *p;
};

short test(struct ACE *ptr) {
  short val = 1;

  if (ptr) {
    val *= ptr->v;
    ptr = ptr->p;
  }

  return val;
}
