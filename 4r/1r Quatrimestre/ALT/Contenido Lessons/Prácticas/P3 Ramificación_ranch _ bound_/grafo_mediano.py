ejemplo_mediano = """
FORMAT 10 43
e 0 4 84637
e 0 3 113623
e 0 6 115689
e 0 8 28989
e 0 1 92751
e 1 3 39631
e 1 7 44708
e 1 6 26841
e 2 3 69204
e 2 5 92466
e 2 4 80275
e 3 0 102668
e 3 9 852
e 3 6 17788
e 3 1 40001
e 3 4 22637
e 3 5 34081
e 4 1 11291
e 4 5 30120
e 4 2 63483
e 5 6 16878
e 5 1 29329
e 5 7 68026
e 5 4 26577
e 5 0 92391
e 5 2 92195
e 6 4 12293
e 6 7 59774
e 6 5 16209
e 7 3 79204
e 7 2 126610
e 7 9 76392
e 7 8 91416
e 7 1 57764
e 7 0 71665
e 8 2 95620
e 8 9 132896
e 8 3 110810
e 8 1 95677
e 8 4 94689
e 9 4 26070
e 9 2 78506
e 9 1 40074
"""
        
def prueba_mediana():
    g = load_dimacs_graph(ejemplo_mediano)
    for nombre,clase in repertorio_cotas:
        print(f'----- checking {nombre} -----')
        tspi = clase(g)
        fx,x,stats = tspi.solve()
        print(fx,x,stats)
"""

Resultado esperado:

----- checking Cota1I -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.007502101012505591, 'iterations': 2412, 'gen_states': 3433, 'podas_opt': 893, 'maxA': 810}
----- checking Cota1E -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.007346215017605573, 'iterations': 2412, 'gen_states': 3433, 'podas_opt': 893, 'maxA': 810, 'podas_expl': 0, 'cost_expl': 624}
----- checking Cota4I -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.0009044689941219985, 'iterations': 296, 'gen_states': 550, 'podas_opt': 244, 'maxA': 79}
----- checking Cota4E -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.0008927200105972588, 'iterations': 296, 'gen_states': 550, 'podas_opt': 244, 'maxA': 76, 'podas_expl': 3, 'cost_expl': 29}
----- checking Cota5I -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.001111065997974947, 'iterations': 39, 'gen_states': 104, 'podas_opt': 16, 'maxA': 51}
----- checking Cota5E -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.001058299996657297, 'iterations': 39, 'gen_states': 104, 'podas_opt': 16, 'maxA': 51, 'podas_expl': 49, 'cost_expl': 49}
----- checking Cota6I -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.0026222199958283454, 'iterations': 726, 'gen_states': 1494, 'podas_opt': 334, 'maxA': 596}
----- checking Cota6E -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.002575466991402209, 'iterations': 726, 'gen_states': 1494, 'podas_opt': 334, 'maxA': 596, 'podas_expl': 423, 'cost_expl': 595}
----- checking Cota7I -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.011785646987846121, 'iterations': 639, 'gen_states': 1421, 'podas_opt': 571, 'maxA': 326}
----- checking Cota7E -----
414767 [0, 8, 2, 3, 9, 4, 1, 6, 5, 7, 0] {'time': 0.012186281004687771, 'iterations': 639, 'gen_states': 1421, 'podas_opt': 571, 'maxA': 326, 'podas_expl': 200, 'cost_expl': 325}


"""
