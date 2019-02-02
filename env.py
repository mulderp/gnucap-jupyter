import gnucap

def fetch_results(nodes):
    w = gnucap.CKT_BASE_find_wave(nodes)

    xs=[]; ys = []
    for x, y in w:
        xs.append(x)
        ys.append(y)
        
    return (xs, ys)