
//Simple Read Time-Stamp Counter code runtime profiler 
int main()
{

  unsigned int us, ls, ue, le;
	unsigned int ud, ld;

	__asm{
		rdtsc;
		mov us, edx;
		mov ls, eax;
		}


  /* Enter your code to profile
  for(int i=0;i<10000;i++)
	{
		int x = i + 1;
	}
  */


	__asm{
		rdtsc;
		mov ue, edx;
		mov le, eax;
		}
    
	upperDiff = ue - us;
	lowerDiff = le - ls;
	printf("Start time: 0x%08x%08x\n",us,ls);
	printf("End time: 0x%08x%08x\n",ue,le);
	printf("Profiled code took: 0x%08x%08x cycles to complete\n",ud,ld);
}
