def lcs():
    mx = 0
    for i in range(1, 999999):
        cnt = 1
        while i != 1:
            if i % 2 == 0:
                i = i/2
            else:
                i = 3*i + 1
            cnt += 1
        mx = max(cnt, mx)
    print(f"lcs: {mx}")

def pds():
    x = 2**1000
    s = 0
    for i in str(x):
        s += int(i)
    print(f"pds: {s}")



if __name__ == "__main__":
    lcs()
    pds()