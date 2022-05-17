using GPI2

gaspi_proc_init(GASPI_BLOCK)

rank = Ref{gaspi_rank_t}()
num = Ref{gaspi_rank_t}()

gaspi_proc_rank(rank)
gaspi_proc_num(num)

gaspi_printf("Hello from rank %d of %d\n", rank, num)
# Comment the previous and uncomment the following line if you do not want to use the logger
# println("Hello from rank $(rank[]) of $(num[])")

gaspi_proc_term(GASPI_BLOCK)
