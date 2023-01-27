echo python3 SAR_Indexer.py corpora/2015 index2015.bin
for distance in levenshtein_o damerau_r damerau_i
do
    for threshold in 1 2 3
    do
        echo referenciasSAR/resul_${distance}_${threshold}.txt
        python3 SAR_Searcher.py index2015.bin -L referenciasSAR/queries.txt -C -t $threshold -d $distance > referenciasSAR/resul_${distance}_${threshold}.txt
    done
done
