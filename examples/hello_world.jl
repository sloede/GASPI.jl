using GASPI

gaspi_proc_init(GASPI_BLOCK)

rank = Ref{gaspi_rank_t}()
num = Ref{gaspi_rank_t}()

gaspi_proc_rank(rank)
gaspi_proc_num(num)

println("Hello from rank $(rank[]) of $(num[])")

gaspi_proc_term(GASPI_BLOCK)
