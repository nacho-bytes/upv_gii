def char_freq(s:str):
    s = s.lower().replace(" ", "")
    d = dict()
    for x in s:
        d[x] = d.get(x, 0) + 1
    return d


if __name__ == "__main__":
    print(char_freq("The quick brown fox jumps over the lazy dog"))